
export function displayDataLabelFromValue(dictValueArr,id){
    console.log('dictValueArr',dictValueArr,id);
    for(var i=0; i<dictValueArr.length; i++){
        if(dictValueArr[i].dictValue === id+''){
            return dictValueArr[i].dictLabel
        }
    }
    return "未匹配到值"
}
