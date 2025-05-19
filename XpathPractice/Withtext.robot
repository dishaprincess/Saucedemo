*** Settings ***
Library         SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Library    String
***Code****
<div>
<p>Paragraph one</p>
<h1>Heading 1 </h1>
</div>

***Syntax***
//tagname[text()='Exact Text']
//tagname[contains(text(), 'Partial Text')]
//*[contains(@attribute_name,'attribute_value')] -- Valiad card

***Question**

Q1. Find Paragraph one

//p[text()='Paragraph one']

Q2. Find Heading 1
//h1[text()='Heading 1']

Q3. Find Heading 1 From DIV Tag
//div/h1[text()='Heading 1']

Q4. Find Paragraph From DIV Tag

//div/p[text()='Paragraph one']

## Undersatnding of above xpath Q3 and Q4
//div
What it does: Selects all <div> elements in the document, regardless of their position in the hierarchy.

Why it's used: The double slash // indicates a search for <div> elements anywhere in the document, not just at a specific level.

2. /h1
What it does: From each selected <div>, this selects the <h1> elements that are direct children.

Why it's used: The single slash / specifies that we're looking for <h1> elements that are immediate children of the <div> elements found in the previous step.

3. [text()='Heading 1']
What it does: Filters the <h1> elements to only those whose text content is exactly "Heading 1".

Why it's used: The square brackets [] are used to apply a condition or predicate. Here, it ensures that only <h1> elements with the exact text "Heading 1" are selected

***********************************************************************************************************
Exercise 2 :

***Code***
<h1>Heading 1 </h1>
<h2>Heading 2 </h2>
<h3>Heading 3 </h3>
<h4>Heading 4 </h4>
<h5>Heading 5 </h5>
<h6>Heading 6 </h6>
**** Question **** \

Q1. Find Heading 1
//h1[text() ='Heading 1]
Q2. Find Heading 2
//h2[text() ='Heading 2]
Q3. Find Heading 3
//h3[text() ='Heading 3]
Q4. Find Heading 4
//h4[text() ='Heading 4]
Q5. Find Heading 5
//h5[text() ='Heading 5]
Q6. Find Heading 6
//h5[text() ='Heading 6]
Q7. Find Heading 1 using "Contains() function"

//h1[contanins(text(),'Heading 1')]

Q8. Find Heading 2 using "Contains() function"
//h2[contanins(text(),'Heading 2')]
Q9. Find Heading 3 using "Contains() function"
//h3[Conatains(text(),'Heading 3']
Q10. Find Heading 4 using "Contains() function"
//h4[Conatains(text(),'Heading 4']
Q11. Find Heading 5 using "Contains() function"
//h5[Conatains(text(),'Heading 5']
Q12. Find Heading 6 using "Contains() function"
//h6[Conatains(text(),'Heading 6']
