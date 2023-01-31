describe('Product Details', () => {
  beforeEach(() => {
   
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get("article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get("article").should("have.length", 2);
  });

  it("Should navigate to Product Details", () => {
    cy.get(':nth-child(1) > a > img')
      .click()
  });

})
