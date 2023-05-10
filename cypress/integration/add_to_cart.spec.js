describe('# Add to Cart ', () => {
  it("There are products on the page", () => {
    cy.visit('/')
    cy.get(".products article").should("be.visible");
  });
  
  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("There is an empty cart", () => {
    cy.get('.end-0 > .nav-link').contains('My Cart (0)').should('be.visible')
  });

  it("There is an 'Add' button for the first product", () => {
    cy.get(':nth-child(1) > .product-buttons > :nth-child(2)').contains('Add').should('be.visible')
  })

  it("Cart total increments up one when add product is clicked", () => {
    cy.get('.end-0 > .nav-link').contains('My Cart (0)').should('be.visible')
    cy.get(':nth-child(1) > .product-buttons > :nth-child(2)').contains('Add').click({force: true})
    cy.get('.end-0 > .nav-link').contains('My Cart (1)').should('be.visible')
  });
})