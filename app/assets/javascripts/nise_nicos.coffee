#$ ->
#  $('#post-btn').on 'click', ->
#    nicoscreen = nicoscreenobj(r9.NicoScreen)
#    comment = $('#comment').val()
#    $('#comment').val('')
#    obj = {
#      'base': {
#        color: 'white',
#        speed: 'normal',
#        interval: 'normal',
#        font_size: '30px',
#        loop: true
#      },
#      'comments': [comment]
#    }
#    nicoscreen.set(obj)
#    nicoscreen.start()
#
#  nicoscreenobj = (o) ->
#    f = nicoscreenobj.f
#    i = undefined
#    len = undefined
#    n = undefined
#    prop = undefined
#    f.prototype = o
#    n = new f
#    i = 1
#    len = arguments.length
#    while i < len
#      for prop of arguments[i]
#        n[prop] = arguments[i][prop]
#      ++i
#    n
#
#  nicoscreenobj.f = ->
#
#  r9 = {}
#  r9.NicoScreen =
#    env:
#      color: 'white'
#      interval: 500
#      speed: 6500
#      font_size: '24px'
#      loop: true
#      height: ''
#      width: ''
#    top_pos: 20
#    draw_index: 0
#    comments: []
#    set: (o) ->
#      @comments = o.comments
#      if o.base.color
#        @env.color = o.base.color
#      if o.base.loop
#        @env.loop = o.base.loop
#      if o.base.interval
#        switch o.base.interval
#          when 'fast'
#            @env.interval = 3000
#          when 'slow'
#            @env.interval = 9500
#      if o.base.font_size
#        @env.font_size = o.base.font_size
#      if o.base.speed
#        switch o.base.speed
#          when 'fast'
#            @env.speed = 4000
#          when 'slow'
#            @env.speed = 10000
#    start: ->
#      elm = $('#nicoscreen')
#      @elm = elm
#      @elm.css 'position', 'relative'
#      @elm.css 'border', 'solid 1px gray'
#      @elm.css 'overflow', 'hidden'
#      @elm.bind 'selectstart', ->
#        false
#      @elm.bind 'mousedown', ->
#        false
#      @env.width = '' + elm.css('width')
#      @env.height = '' + elm.css('height')
#      @env.width = @env.width.replace('px', '')
#      @env.height = @env.height.replace('px', '')
#      #console.log(this.env.width);
#      inid = setInterval('nicoscreen.draw(null)', @env.interval)
#    draw: (str) ->
#      n = nicoscreen
#      i = n.draw_index
#      comment_str = ''
#      if str
#        comment_str = str
#        i = parseInt(new Date / 1000)
#      else
#        if n.draw_index >= n.comments.length
#          if n.env.loop
#            n.draw_index = 0
#          return false
#        comment_str = n.comments[i]
#        n.draw_index++
#      n.top_pos = Math.floor(Math.random() * parseInt(n.env.height))
#      end_left = parseInt(n.env.width) * -1
#      cmid = 'cm' + i + ''
#      com_obj = $('<div id=\'' + cmid + '\' style=\'left:' + n.env.width + 'px; position:absolute;top:' + n.top_pos + 'px;color:' + n.env.color + ';font-size:' + n.env.font_size + ';font-weight:bold;text-shadow: black 1px 1px 1px;width:100%;z-index:99999;cursor:default\'>' + comment_str + '</div>')
#      $('#nicoscreen').append com_obj
#      ((that) ->
#        tmp_cmid = cmid
#        com_obj.animate { left: end_left },
#          duration: n.env.speed
#          complete: ->
#            elm_id = '#' + tmp_cmid
#            $('#nicoscreen').remove elm_id
#            that.top_pos = 10
#      ) this
#    add: (str) ->
#      @draw str
