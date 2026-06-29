
<h4 style="color:blue">This AutoHotkey tool is an easier way to input bulk data into Sage</h4>

---

<img width="279" height="380" alt="easySage UI" src="https://github.com/user-attachments/assets/736148f7-1555-46a8-bcc1-8eb53284dbd2" />

**Features:**
* Captures clipboard content whenever clipboard changes

* Shows the captured content in the ui (ignores spaces, dollar signs, commas)

* When using sage, click one of the buttons in the easySage window to paste the text into sage (easySage will keep the previous program active when interacting with it). Use whichever button is needed for the specific type of data entry into sage.

** The *Tab Data* button will paste the content with [Tab] inputs inbetween each value

** The *Down Data* button will paste the content with [Down Arrow] inputs inbetween each value

* The *Tab Data* button will paste the content into the active program

---

> [!NOTE]
> The *Enter Order Data* button is a work in progress.

<br>

&emsp;
<img width="284" height="176" alt="easySage copy example" src="https://github.com/user-attachments/assets/56427021-25e3-4624-a0f3-3f0b0ffb7ab0" />
&emsp;&emsp;
<img width="283" height="385" alt="easySage order UI" src="https://github.com/user-attachments/assets/9dabc28c-8075-4c5a-adf7-955c7ca07ee9" />

<br><br>

* When in the "Order" tab, whatever is captured in the clipboard contents will automatically be parsed to find fields that are used for New Order Entry in sage.
* The fields that are found will be shown below the button.
* Upon pressing the button, the full set of data, starting from "Customer No", will be outputted with [Tab] inputs inbetween (There are 20 fields on the New Order Entry screen, most are not necessary).
