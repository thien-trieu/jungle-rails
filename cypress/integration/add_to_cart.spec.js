describe('Add to cart', () => {
  beforeEach(() => {
   
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get("article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get("article").should("have.length", 2);
  });

  it("User can click add to cart", () => {
    cy.get(':nth-child(1) > div > .button_to > .btn')
      .click({force: true})

    cy.get(':nth-child(4) > .nav-link').should('contain', 'My Cart (1)')
  });

  it("Cart should contain 1 item", () => {
    cy.get(':nth-child(1) > div > .button_to > .btn')
    .click({force: true})
    cy.get(':nth-child(4) > .nav-link').should('contain', 'My Cart (1)')
  });

  it("Can add multiple items to the cart", () => {
    cy.get(':nth-child(1) > div > .button_to > .btn')
    .click({force: true})
    cy.get(':nth-child(1) > div > .button_to > .btn').click({force: true})

  });
})
