var viewer = null;

function ToolBox(p,par,overview,ms2) {

    var that = this;

    this.placeholder = null;
    this.msms = ms2;
    this.overview = overview;
    this._parent = par;
    this.meta = null;

    var __init__ = function(that){
        that.placeholder = $("<div class='tool-box'></div>");

        that.meta = $("<div class='meta'></div>").appendTo(that.placeholder);

        btns = $("<div class='btns'></div>");

        $("<span class='btn'>Zoom out</div>").bind("click",function(event){
            that.overview.zoom_out();
        }).appendTo(btns);

        btns.appendTo(that.placeholder);

        that.placeholder.appendTo(p);
    }(this);


    this.load = function(data) {
        html = "<table>";
        html += "<thead><tr><th>name</th><th>mass</th><th>mz</th><th>intensity</th><th>charge</th><th>status</th><th>url</th></tr></thead>";
        html += "<tbody><tr><td>"+data.name+"</td><td>"+data.mass+"</td><td>"+data.mz+"</td><td>"+data.intensity+"</td><td>"+data.charge+"</td><td>"+data.status+"</td><td><a href='"+data.vurl+"' target='blank'>"+data.vurl+"</a></td></tr></tbody>";
        html += "</table>"
        that.meta.html(html);
    }
};

function MsMsList() {
    var that = this;

    this.data_dic = {}
    this.placeholder = $("<div class='msms_list'></div>");
    this.list = $("<ul></ul>");

    this.appendTo = function(p){
        this.list.appendTo(this.placeholder);
        this.placeholder.appendTo(p);
        this.bind();
    };

    this.setMsMs = function(i){
        i=parseInt(i);
        meta = this.data_dic[i];
        seq = meta.sequence.split('-');
        viewer.msms.set_sequence(seq);
        $(".msms_list li").removeClass("selected");;
        $(".msms_list li[value=\""+i+"\"]").addClass("selected");
    }


    this.setMsMsByPk = function(i){
        for(u in this.data_dic){
            if(this.data_dic[u]["pk"] == i){
                this.setMsMs(u);
                $(".msms_list").animate({
                    scrollTop : $(".msms_list li[value=\""+u+"\"]").offset().top
                },0);
                break;
            }
        }
    }

    this.bind = function(){
        $(this.placeholder).delegate("li","click", function (event) {
            li = $(this);
            i = li.attr("value");
            that.setMsMs(i);
        });
    };

    this.reload = function() {
        var i;
        that.list.html("");
        for(i=0;i<that.data_dic.length;++i){
            data = that.data_dic[i];
            li =  $("<li value='"+i+"' class='"+((i&1)?"odd":"even")+"'>["+data.score.toFixed(3)+"] "+data.sequence_AA+"</li>");
            li.appendTo(that.list);

            if (i==0)
                li.click();
        }
    };
};

getCloser = function(pos_x,serie,delta){
    var j;
    for (j = 0; j < serie.data.length; ++j) {
        if (serie.data[j][0] > pos_x) {
            break;
        }
    }

    var p1 = serie.data[j - 1];
    var p2 = serie.data[j];
    var p = null;

    if(p1 && p2){
        d1 = pos_x - p1[0];
        d2 = p2[0] - pos_x;

        if(d1 < d2){
            p = p1;
        }else{
            p = p2;
        }
    }else if (p1) {
        p = p1;
    } else if (p2) {
        p = p2;
    }

    if(p && Math.abs(pos_x - p[0]) > delta){
        p = null;
    }

    return p;
};

function MsMsViewer() {
    var that = this;

    this.datas = [];
    this.datas_dic = {};
    this.flot = null;
    this.msms_list = new MsMsList();

    this.options = {
        series : {
            color: '#ab0006',
            bars:      {
                show: true,
                fillOpacity: 1,
                lineWidth: 1,
                barWidth: 1,
                isLinePlot: true ,
            },
        },
        xaxis: {
            min : 0
        },
        grid: {
            hoverable: true,
            clickable: true,
            autoHighlight: true,
        },
        /*crosshair: {
            mode: "x"
        },*/
        /*selection: {
            mode: "x"
        }*/
    };

    this.placeholder = $("<div class='viewer_msms'></div>");
    this.sequence = $("<div class='sequence'></div>");

    this.appendTo = function(p){
        this.placeholder.appendTo(p);
        this.bind();

        this.msms_list.appendTo(p);
        this.sequence.appendTo(p);
    };

    this.bind = function(){
        /*this.placeholder.bind("plothover", function (event, pos, item) {
            //console.log("plothover",pos,item);
        });

        this.placeholder.bind("plotclick", function (event, pos, item) {
           //console.log("plotclick",pos,item);
        });

        this.placeholder.bind("plotselected", function (event, ranges) {
            //console.log("plotselected",ranges);
            //$("#selection").text(ranges.xaxis.from.toFixed(1) + " to " + ranges.xaxis.to.toFixed(1));
        });

        this.placeholder.bind("plotunselected", function (event) {
            //console.log("plotunselected");
        });*/
    };


    this.loadfrom = function(url){
        $.ajax({
            type:"POST",
            url:url+"?data=msms",
            data:"",
            success: function(json){
                if(json.status =="ok"){
                    that.data_dic = json.data.rows;
                    that.reload();
                    viewer.plot();

                    that.msms_list.data_dic = json.data.sequences;
                    that.msms_list.reload();
                }
            }
        });
    };


    this.reload = function(){
        that.sequence.html("");
        that.data = [];
        that.data_dic.sort(function(a,b){
            return a.mass-b.mass;
        });


        for(i=0;i<that.data_dic.length;i++){
            obj = that.data_dic[i];
            that.data.push([parseFloat(obj.mass),parseInt(obj.intensity)]);
        }
        
    };

    this.plot = function() {
        this.flot = $.plot(this.placeholder, [{data : this.data}],this.options);
    };


    this.set_sequence = function(seq){
        that.sequence.html("");
        var dataset = that.flot.getData();

        var j,is_peak = true;
        var y = that.flot.offset().top;
        var x;
        //var height = (dataset[0].yaxis.box.height - dataset[0].yaxis.box.padding*2 - 5);
        var i = 0;

        for(j=0;j<seq.length;j+=1) {
            p = seq[j];
            if (is_peak) {
                p = getCloser(parseFloat(p),dataset[0],10);
                x = dataset[0].xaxis.p2c(p[0].toFixed(2)) + that.flot.offset().left;
                h = dataset[0].yaxis.p2c(p[1].toFixed(2));

                $("<div class='peak'></div>").css({
                    "top": y,
                    "left": x,
                    "height" : h+"px"
                }).appendTo(that.sequence);

            }else {
                $("<div class='aa'>"+p+"</div>").css({
                    "top": y + 20*i,
                    "left": x + 3,
                }).appendTo(that.sequence);

                if (++i>=4)
                    i=0;
            }
            is_peak = !is_peak;
        }
    };

    this.setMsMs = function(i){
        this.msms_list.setMsMs(i);
    }

    this.setMsMsByPk = function(i){
        this.msms_list.setMsMsByPk(i);
    }
};

function OverView() {
    var that = this;

    this.datas = [];
    this.datas_dic = {};
    this.flot = null;

    this.placeholder = $("<div class='viewer_overview'></div>");
    this.tooltip = $("<div class='viewer_current_peak'></div>");
    this.indicator = $("<div class='viewer_indicator'></div>");

    this.options = {
        series : {
            color: '#ab0006',
            bars:      {
                show: true,
                fillOpacity: 1,
                lineWidth: 1,
                barWidth: 0.5,
                isLinePlot: true ,
            },
        },
        grid: {
            hoverable: true,
            clickable: true,
            autoHighlight: true,
        },
        selection: {
            mode: "x"
        },
        xaxis: {
            min : 0
        }
    };


    this.appendTo = function(p){
        this.tooltip.appendTo(p);
        this.indicator.appendTo(p);
        this.placeholder.appendTo(p);
        this.bind();
    };


    this.loadfrom = function(url){
        $.ajax({
            type:"POST",
            url:url+"?data=overview",
            data:"",
            success: function(json){
                if(json.status =="ok"){
                    that.data_dic = json.data.rows;
                    that.reload();
                    viewer.plot();
                }
            }
        });
    };

    this.reload = function(){
        that.data = [];
        that.data_dic.sort(function(a,b){
            return a.mass-b.mass;
        });

        for(i=0;i<that.data_dic.length;i++){
            obj = that.data_dic[i];
            that.data.push([parseFloat(obj.mass),parseInt(obj.intensity)]);
        }
    };



    this.makeIndicator = function(pos){
        var dataset = that.flot.getData();
        p = getCloser(pos.x,dataset[0],10);
        if(p) {
            x = dataset[0].xaxis.p2c(p[0].toFixed(2)) + that.flot.offset().left;
            y = that.flot.offset().top;
            that.tooltip.css({
                "top": y,
                "left": x,
                "height" : (dataset[0].yaxis.box.height - dataset[0].yaxis.box.padding*2 - 5)+"px",
            }).fadeIn(200);
        }else {
            that.tooltip.hide();
        }
    }
    
    this.setPeakByMass = function(mass){
        var dataset = that.flot.getData();
        var p =null;
        for (j = 0; j < dataset[0].data.length; ++j) {
            if (dataset[0].data[j][0] == mass) {
                p = dataset[0].data[j];
                break;
            }
        }
        if(p){
            that.setPeak(p);
        }else {
            that.indicator.hide();
        }
    }

    this.setPeak = function(p){
        var dataset = that.flot.getData();
        x = dataset[0].xaxis.p2c(p[0].toFixed(2)) + that.flot.offset().left;
        y = that.flot.offset().top;
        that.indicator.css({
            "top": y,
            "left": x,
            "height" : (dataset[0].yaxis.box.height - dataset[0].yaxis.box.padding*2 - 5)+"px",
        }).fadeIn(200);

        var pp = null;
        var i;
        for(i=0;i<that.data.length;++i){
            if(that.data_dic[i].mass == p[0]){
                pp = that.data_dic[i];
                break;
            }
        }
        if(pp) {
            viewer.tool_bar.load(pp);
            viewer.msms.loadfrom(pp.url);
        }
    }

    this.bind = function(){
        this.placeholder.bind("plothover", function (event, pos, item) {
           that.makeIndicator(pos);
        });

        this.placeholder.bind("plotclick", function (event, pos, item) {
            var dataset = that.flot.getData();
            p = getCloser(pos.x,dataset[0],50);
            if(p){
                that.setPeak(p);
            }else {
                that.indicator.hide();
            }
        });

        this.placeholder.bind("plotselected", function (event, ranges) {
            that.options = $.extend(true, {}, that.options, {
                xaxis: {
                    min: ranges.xaxis.from,
                    max: ranges.xaxis.to
                }});
            viewer.plot();
        });

    };

    this.zoom_out = function () {
        that.options = $.extend(true, {}, that.options, {
            xaxis: {
                min: 0,
            max: that.data[that.data.length -1][0],
            }});
        viewer.plot();
    };

    this.plot = function() {
        this.flot = $.plot(this.placeholder, [{data : this.data}],this.options);
    };
};

function Viewer(placeholder,base_url) {

    this.placeholder = $(placeholder);
    this.wrapper = null;

    this.overview = null;
    this.msms = null;
    this.tool_bar = null;
    this.base_url = base_url;

    var __init__ = function(that){
        that.placeholder.html(""); //clean the placeholder

        that.wrapper = $("<div class='wrapper'></div>");

        that.msms = new MsMsViewer();
        that.overview = new OverView();
        that.tool_bar = new ToolBox(that.placeholder,that,that.overview,that.msms);

        that.wrapper.appendTo(that.placeholder);
        that.msms.appendTo(that.wrapper);
        that.overview.appendTo(that.placeholder);

        that.overview.loadfrom(base_url);

    }(this);

    this.plot = function(){
        this.overview.plot();
        this.msms.plot();
    }

    this.setPeakByMass = function(mass){
        this.overview.setPeakByMass(mass);
    }

    this.setMsMs = function(i){
        this.msms.setMsMs(i);
    }

    this.setMsMsByPk = function(i){
        this.msms.setMsMsByPk(i);
    }
}
