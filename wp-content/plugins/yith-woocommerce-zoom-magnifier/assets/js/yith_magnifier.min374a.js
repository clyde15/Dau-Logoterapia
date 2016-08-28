!function(t,i,e){"use strict";i.fn.imagesLoaded===e&&!function(t,i){var e="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";t.fn.imagesLoaded=function(o){function n(){var i=t(c),e=t(d);h&&(d.length?h.reject(l,i,e):h.resolve(l)),t.isFunction(o)&&o.call(r,l,i,e)}function s(t){a(t.target,"error"===t.type)}function a(i,o){i.src!==e&&-1===t.inArray(i,u)&&(u.push(i),o?d.push(i):c.push(i),t.data(i,"imagesLoaded",{isBroken:o,src:i.src}),m&&h.notifyWith(t(i),[o,l,t(c),t(d)]),l.length===u.length&&(setTimeout(n),l.unbind(".imagesLoaded",s)))}var r=this,h=t.isFunction(t.Deferred)?t.Deferred():0,m=t.isFunction(h.notify),l=r.find("img").add(r.filter("img")),u=[],c=[],d=[];return t.isPlainObject(o)&&t.each(o,function(t,i){"callback"===t?o=i:h&&h[t](i)}),l.length?l.bind("load.imagesLoaded error.imagesLoaded",s).each(function(o,n){var s=n.src,r=t.data(n,"imagesLoaded");return r&&r.src===s?void a(n,r.isBroken):n.complete&&n.naturalWidth!==i?void a(n,0===n.naturalWidth||0===n.naturalHeight):void((n.readyState||n.complete)&&(n.src=e,n.src=s))}):n(),h?h.promise(r):r}}(jQuery),i.yith_magnifier=function(t,e){this.t=e,this.element=i(e),this._init(t)},i.yith_magnifier.defaults={zoomWidth:"auto",zoomHeight:"auto",position:"right",tint:!1,tintOpacity:.5,lensOpacity:.5,softFocus:!1,smoothMove:3,showTitle:!0,titleOpacity:.5,adjustX:0,adjustY:0,phoneBehavior:"inside",loadingLabel:"Loading...",enableSlider:!0,slider:"carouFredSel",sliderOptions:{},onLoad:function(){return!1},onEnter:function(){return!1},onLeave:function(){return!1},onMove:function(){return!1},onClick:function(){return!1},elements:{zoom:i(".yith_magnifier_zoom"),zoomImage:i(".yith_magnifier_zoom img"),gallery:i(".yith_magnifier_gallery li a")}},i.yith_magnifier.prototype={_init:function(t){var e=this;i(document).trigger("yith_magnifier_before_init"),i.each(i.yith_magnifier.defaults.elements,function(t,o){var n=i.yith_magnifier.defaults.elements;n[t]=i(o,e)}),e.options=i.extend(!0,{},i.yith_magnifier.defaults,t),e.isPhone=e._isPhone(),e._loading(),e.element.imagesLoaded(function(){e.options.onLoad(),e._initZoom(),e._initGallery()}),i(document).trigger("yith_magnifier_after_init")},_initGallery:function(){var t=this,e=t.options.elements,o=e.gallery,n=e.zoom,s=e.zoomImage;o.length>0?(o.on("click",function(e){e.preventDefault();var o=i(this);t.destroy(),n.attr("href",this.href),s.attr("src",o.data("small")).attr("srcset",o.data("small")).attr("src-orig",o.data("small")).attr("title","").attr("title",o.attr("title")),i.data(t.t,"yith_magnifier",new i.yith_magnifier(t.options,t.element))}),t.options.enableSlider&&(o.closest("ul").trigger("yith_magnifier_slider_destroy"),o.closest("ul")[t.options.slider](t.options.sliderOptions))):o.on("click",function(t){return t.preventDefault(),!1})},_loading:function(){if(this.options.disableRightClick&&i(document).on("contextmenu",function(){return!1}),this.mouseTrap===e){var t=this.options.elements.zoom.width();this.options.loadingLabel&&i('<div class="yith_magnifier_loading">'+this.options.loadingLabel+"</div>").css({width:t,"text-align":"center",opacity:.5}).appendTo(this.options.elements.zoom.parent())}},_initZoom:function(){var t=this;t.zoom=t.options.elements.zoom,t.zoomImage=t.options.elements.zoomImage,t.zoom.wrap('<div class="yith_magnifier_zoom_wrap"></div>'),t.IMG_zoomImage=new Image,t.IMG_zoomImage.src=t.zoom.attr("href"),t.IMG_smallImage=new Image,t.IMG_smallImage.src=t.zoomImage.attr("src"),i.browser.msie&&8==i.browser.version?i(t.IMG_zoomImage).load(function(){t._initTrap()}):i([t.IMG_zoomImage,t.IMG_smallImage]).imagesLoaded(function(){t._initTrap()})},_initTrap:function(){{var t=this,e=t.IMG_zoomImage;t.IMG_smallImage}t.mx=0,t.my=0,t.controlTimer=0,t.lens=null,t.tint=null,t.softFocus=null,t.zoomDiv=null,t.cw=0,t.ch=0,t.zw=0,t.destU=0,t.destV=0,t.currU=0,t.currV=0,t.mouseTrap=null;var o=t.options.elements.zoom,n=t.options.elements.zoomImage;i(".yith_magnifier_loading").remove(),this.element.find(".yith_magnifier_mousetrap")&&this.element.find(".yith_magnifier_mousetrap").remove(),this.mouseTrap=i('<div class="yith_magnifier_mousetrap" />').css({width:"100%",height:"100%",top:0,left:0}).appendTo(o.parent());var s="ontouchstart"in document.documentElement?!0:!1,a="touchmove mousemove",r="touchend mouseleave",h="touchstart mouseenter",m="touchstart click";this.mouseTrap.on(a,this,function(i){t.options.onMove(),t.mx="undefined"!=typeof i.originalEvent.touches?i.originalEvent.touches[0].pageX:i.pageX,t.my="undefined"!=typeof i.originalEvent.touches?i.originalEvent.touches[0].pageY:i.pageY}).on(r,this,function(){return clearTimeout(t.controlTimer),t.lens&&t.lens.fadeOut(299),t.tint&&t.tint.fadeOut(299),t.softFocus&&t.softFocus.fadeOut(299),t.zoomDiv.fadeOut(300,function(){t._onLeave()}),!1}).on(m,this,function(){t.options.onClick()}).on(h,this,function(a){t.options.onEnter(),s&&a.preventDefault(),t.mx="undefined"!=typeof a.originalEvent.touches?a.originalEvent.touches[0].pageX:a.pageX,t.my="undefined"!=typeof a.originalEvent.touches?a.originalEvent.touches[0].pageY:a.pageY,t.zw=a.data,t.zoomDiv&&(t.zoomDiv.stop(!0,!1),t.zoomDiv.remove());var r=t.options.adjustX,h=t.options.adjustY,m=n.outerWidth(),l=n.outerHeight(),u=t.options.zoomWidth,c=t.options.zoomHeight;"auto"==t.options.zoomWidth&&(u=m),"auto"==t.options.zoomHeight&&(c=l);var d=o.parent();switch(t.options.position){case"top":h-=c;break;case"right":r+=m;break;case"bottom":h+=l;break;case"left":r-=u;break;case"inside":u=m,c=l;break;default:d=i("#"+t.options.position),d.length?(u=d.innerWidth(),c=d.innerHeight()):(d=o,r+=m,h+=l)}t.isPhone&&"inside"==t.options.phoneBehavior&&(u=m,c=l,r=0,h=0),t.zoomDiv=i('<div class="yith_magnifier_zoom_magnifier" />').css({left:r,top:h,width:u,height:c,"background-repeat":"no-repeat",backgroundImage:"url("+e.src+")"}).appendTo(d),n.attr("title")&&t.options.showTitle&&i('<div class="yith_magnifier_title">'+n.attr("title")+"</div>").appendTo(t.zoomDiv),t.isPhone?"disable"!=t.options.phoneBehavior?t.zoomDiv.fadeIn(500):t.lens.fadeOut(299):t.zoomDiv.fadeIn(500),t.lens&&(t.lens.remove(),t.lens=null),t.cw=e.width<=1?n.outerWidth()/e.naturalWidth*t.zoomDiv.width():n.outerWidth()/e.width*t.zoomDiv.width(),t.ch=e.height<=1?n.outerHeight()/e.naturalHeight*t.zoomDiv.height():n.outerHeight()/e.height*t.zoomDiv.height(),t.lens=i('<div class="yith_magnifier_lens" />').css({width:t.cw,height:t.ch}).appendTo(o),t.mouseTrap.css("cursor",t.lens.css("cursor"));var g=!1;t.options.tint&&(t.tint=i("<div />").css({display:"none",position:"absolute",left:0,top:0,width:n.outerWidth(),height:n.outerHeight(),backgroundColor:t.options.tint,opacity:t.options.tintOpacity}).appendTo(o),t.lens.append(i("<img />",{src:n.attr("src")})),g=!0,t.tint.fadeIn(500)),t.options.softFocus&&(t.softFocus=i("<div />").css({position:"absolute",display:"none",top:"1px",left:"1px",width:n.outerWidth(),height:n.outerHeight(),opacity:.5}).appendTo(o),t.softFocus.append(i("<img />",{src:n.attr("src")})),0==t.lens.find("img").length&&t.lens.append(i("<img />",{src:n.attr("src")})),g=!0,t.softFocus.fadeIn(500)),g||t.lens.css("opacity",t.options.lensOpacity),"inside"!==t.options.position&&t.lens.fadeIn(500),t.zw._controlLoop()})},_controlLoop:function(){var t=this;if(this.lens){var i=this.mx-this.zoomImage.offset().left-.5*this.cw>>0,e=this.my-this.zoomImage.offset().top-.5*this.ch>>0;0>i?i=0:i>this.zoomImage.outerWidth()-this.cw&&(i=this.zoomImage.outerWidth()-this.cw),0>e?e=0:e>this.zoomImage.outerHeight()-this.ch&&(e=this.zoomImage.outerHeight()-this.ch),this.lens.css({left:i-2,top:e-1}),this.lens.find("img").css({width:this.zoomImage.outerWidth(),height:this.zoomImage.outerHeight(),marginLeft:-i+"px ",marginTop:-e+"px"}),this.destU=this.IMG_zoomImage.width<=1?i/this.zoomImage.outerWidth()*this.IMG_zoomImage.naturalWidth>>0:i/this.zoomImage.outerWidth()*this.IMG_zoomImage.width>>0,this.destV=this.IMG_zoomImage.height<=1?e/this.zoomImage.outerHeight()*this.IMG_zoomImage.naturalHeight>>0:e/this.zoomImage.outerHeight()*this.IMG_zoomImage.height>>0,this.currU+=(this.destU-this.currU)/this.options.smoothMove,this.currV+=(this.destV-this.currV)/this.options.smoothMove,this.zoomDiv.css("background-position",-(this.currU>>0)+"px "+(-(this.currV>>0)+"px"))}this.controlTimer=setTimeout(function(){t._controlLoop()},30)},_onLeave:function(){this.options.onLeave(),this.zoomDiv&&(this.zoomDiv.remove(),this.zoomDiv=null),this._removeElements()},_removeElements:function(){this.lens&&(this.lens.remove(),this.lens=null),this.tint&&(this.tint.remove(),this.tint=null),this.softFocus&&(this.softFocus.remove(),this.softFocus=null),this.element.find(".yith_magnifier_loading").length>0&&this.element.find(".yith_magnifier_loading").remove()},_isPhone:function(){var t=navigator.userAgent.toLowerCase();return t.match(/iphone/i)||t.match(/ipod/i)||t.match(/android/i)},destroy:function(){this.zoom&&this.zoom.unwrap(),this.mouseTrap&&(this.mouseTrap.unbind(),this.mouseTrap.remove(),this.mouseTrap=null),this.zoomDiv&&(this.zoomDiv.remove(),this.zoomDiv=null),this.options.disableRightClick&&i(document).unbind(),this._removeElements(),this.options.elements.gallery.unbind(),this.element.removeData("yith_magnifier")}},i.fn.yith_magnifier=function(t){if("string"==typeof t){var e=Array.prototype.slice.call(arguments,1);this.each(function(){var o=i.data(this,"yith_magnifier");return o?i.isFunction(o[t])&&"_"!==t.charAt(0)?void o[t].apply(o,e):void i.error("no such method '"+t+"' for yith_magnifier instance"):void i.error("cannot call methods on yith_magnifier prior to initialization; attempted to call method '"+t+"'")})}else this.each(function(){var e=i.data(this,"yith_magnifier");e?i.error("yith_magnifier already istantiated."):i.data(this,"yith_magnifier",new i.yith_magnifier(t,this))});return this}}(window,jQuery);