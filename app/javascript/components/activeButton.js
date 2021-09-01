const activeButton = () => {

 function getRoomParams(){
    let result = {};
    let tmp = [];

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
    
  if (!isNaN(getRoomParams())) {
    document.getElementById("roadtrip-room-" + getRoomParams()).classList.add("active-button");
  } else {
    return;
  }

};

export { activeButton };