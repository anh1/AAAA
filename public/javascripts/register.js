<script type="text/javascript">
var intTextBox=0;

function addElement()
{
intTextBox = intTextBox + 1;
var contentID = document.getElementById('textbox_content');
var newTBDiv = document.createElement('div');
newTBDiv.setAttribute('id','strText'+intTextBox);
newTBDiv.innerHTML =" <input type='text'/><br/>";
contentID.appendChild(newTBDiv);
}

function removeElement()
{
if(intTextBox != 0)
{
var contentID = document.getElementById('textbox_content');
contentID.removeChild(document.getElementById('strText'+intTextBox));
intTextBox = intTextBox-1;
}
}
</script>
