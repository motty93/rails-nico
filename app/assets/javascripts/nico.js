function nicoscreenobj(o) {
  var f = nicoscreenobj.f, i, len, n, prop;
  f.prototype = o;
  n = new f;
  for (i=1, len=arguments.length; i<len; ++i)
    for (prop in arguments[i])
      n[prop] = arguments[i][prop];
  return n;
}
nicoscreenobj.f = function(){};

var r9 = {};
r9.NicoScreen = {
	
	
	
	env : {
		
		color:"white",
		interval:500,
		speed:6500,
		font_size:"24px",
		loop:true,
		
		height:"",
		width:""
		
	},
	
	top_pos:20,
	draw_index:0,
	comments:[],
	
	set:function(o){
		
		this.comments = o.comments;
		
		if(o.base.color){
			this.env.color = o.base.color;
		}
		
		if(o.base.loop){
			this.env.loop = o.base.loop;
		}
		
		if(o.base.interval){
			
			switch(o.base.interval){
				
			case "fast":
				this.env.interval=3000;
				break;
			case "slow":
				this.env.interval=9500;
				break;
				
			}
			
		}
		
		if(o.base.font_size){
			this.env.font_size = o.base.font_size;
		}
		
		if(o.base.speed){
		
			switch(o.base.speed){
			
			case "fast":
				this.env.speed=4000;
				break;
			case "slow":
				this.env.speed=10000;
				break;
				
			}
		
		}
		
	},
	
	start : function(){
	
		var elm = $("#nicoscreen");
		this.elm = elm;
		this.elm.css("position", "relative");
		this.elm.css("border", "solid 1px gray");
		this.elm.css("overflow", "hidden");
		this.elm.bind("selectstart",function(){return false;});
		this.elm.bind("mousedown",function(){return false;});
		
		
		this.env.width = ""+elm.css("width");
		this.env.height = ""+elm.css("height");
		
		this.env.width = this.env.width.replace("px","");
		this.env.height = this.env.height.replace("px","");
		
		//console.log(this.env.width);
	
		var inid = setInterval("nicoscreen.draw(null)", this.env.interval);
		
	},
	
	draw: function(str){
	
		var n = nicoscreen;
		
		var i = n.draw_index;
		var comment_str =  "";
		
		if(str){
			comment_str = str;
			i=parseInt((new Date)/1000);
		}else{
		
			if (n.draw_index >= n.comments.length) {
				if(n.env.loop) n.draw_index = 0;
				return false;
			}
			comment_str = n.comments[i];
			n.draw_index++;
		}
		
		n.top_pos =  Math.floor( Math.random() * parseInt(n.env.height) );
		
		var end_left = (parseInt(n.env.width)) * -1;
		
		var cmid = "cm" + i + "";
		var com_obj = $("<div id='" + cmid + "' style='left:" + n.env.width + "px; position:absolute;top:" + n.top_pos + "px;color:"+n.env.color+";font-size:"+n.env.font_size+";font-weight:bold;text-shadow: black 1px 1px 1px;width:100%;z-index:99999;cursor:default'>" + comment_str + "</div>");
		
		$("#nicoscreen").append(com_obj);
		
		(function(that){
			var tmp_cmid = cmid;
			com_obj.animate({
				left: end_left
			}, {
				duration: n.env.speed,
				complete: function(){
					var elm_id = "#" + tmp_cmid;
					$("#nicoscreen").remove(elm_id);
					that.top_pos = 10;
					
				}
				
			});
		})(this);
		
		
		
		
	},
	
	
	add:function(str){
		this.draw(str);
	}
	
	
};

var nicoscreen = nicoscreenobj(r9.NicoScreen); // ここで宣言しないとnicoscreen.draw is not functionと怒られる
var postBtn = document.getElementById("post-btn");
postBtn.onclick = function() {
  comment = document.getElementById("comment-form").value;
  document.getElementById("comment-form").value = '';
  var obj = {
    "base": {
      color: "white",
      speed: "normal",
      interval: "normal",
      font_size: "20px",
      loop: false
    },
    "comments": [
      comment,
      "もっと評価されるべき",
      "(　・∀・)ｲｲ!!ね",
      "ずっと聞いていたい。。。",
      "888888888888888888888888",
//      "懐かしいなぁ",
      "今日のプレゼン最高だなぁ",
      "ライブ実装できなかったの残念だなぁ",
      "ギター超うまい！！！"
//      "指弾きすばらしいね",
//      "最高です"
    ]
  };
  nicoscreen.set(obj);
  nicoscreen.start();
};

var commentForm = document.getElementById("comment-form");
commentForm.onchange = function() {
  postBtn = document.getElementById("post-btn");
  postBtn.classList.remove('no-action');
};

var nisenicoWindow = document.getElementsByClassName("nise-nico");
window.onload = function () {
  if (nisenicoWindow != null)
  {
    document.getElementById("comment-form").value = '';
  }
};
