describe('# Product Details ', () => {
  it("There is products on the page", () => {
    cy.visit('/')
    cy.get(".products article").should("be.visible");
  });
  
  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  it("Navigates to product page when clicking on the product", () => {
    cy.get(".products article").first().click();
    cy.url().should('include', '/products/2')
  });
})