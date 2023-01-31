describe('User Login', () => {
  beforeEach(() => {
   
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("User can click on login", () => {
    cy.get('#navbarSupportedContent > :nth-child(2) > :nth-child(2) > .nav-link')
      .click()
  });

  it("User can navigate to login page", () => {
    cy.get('#navbarSupportedContent > :nth-child(2) > :nth-child(2) > .nav-link')
      .click()
  });

  it("User can enter email and password into form and click submit", () => {

    cy.get('#navbarSupportedContent > :nth-child(2) > :nth-child(2) > .nav-link')
      .click()
    cy.get(':nth-child(1) > .form-control').type("testing@testing.com")
    cy.get(':nth-child(2) > .form-control').type("testing123")

    cy.get('form.action-form').submit()
  });


  it("User is redirected to Home Page and cookie created for session", () => {

    cy.get('#navbarSupportedContent > :nth-child(2) > :nth-child(2) > .nav-link')
      .click()
    cy.get(':nth-child(1) > .form-control').type("testing@testing.com")
    cy.get(':nth-child(2) > .form-control').type("testing123")

    cy.get('form.action-form').submit()

    cy.get('#navbarSupportedContent > :nth-child(2) > :nth-child(2) > .nav-link')
      .contains('Logout')

      cy.getCookie("_new_session").should('exist')
  });


})
