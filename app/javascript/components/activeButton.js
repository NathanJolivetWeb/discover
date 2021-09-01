const activeButton = () => {

  function getRoomParams()
  {
      var result = {};
      var tmp = [];
  
      location.search
          .substr (1)
          .split ("&")
          .forEach (function (item)
          {
              tmp = item.split ("=");
              result [tmp[0]] = decodeURIComponent (tmp[1]);
          });
  
      return parseInt(result.room);
  }

  document.getElementById("roadtrip-room-" + getRoomParams()).classList.add("active-button");
};

export { activeButton };