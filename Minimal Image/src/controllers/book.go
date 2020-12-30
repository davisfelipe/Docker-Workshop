package controllers

import (
  "net/http"

  "github.com/gin-gonic/gin"
  "github.com/rahmanfadhil/gin-bookstore/models"
)

func FindBooks(c *gin.Context) {
  var books []models.Book
  models.DB.Find(&books)

  c.JSON(http.StatusOK, gin.H{"data": books})
}

func Healthcheck(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{"healthcheck": "healthy"})
}
  