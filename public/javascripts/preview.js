

document.getElementsByClass = function(class){   var itemsfound = new Array;   var elements = document.getElementsByTagName('*'); 
for(var i=0;i<elements.length;i++)
{      if(elements[i].className == class 
	{         itemsfound.push(elements[i]);      }   }   return itemsfound;}





function showPreview()
{
   document.getElementsByClass('field')[0].style.backgroundColor = 'blue';
}

