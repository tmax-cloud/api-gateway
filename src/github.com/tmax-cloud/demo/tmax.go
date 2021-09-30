package demo

import (
	"context"
	"net/http"
)

// Config holds configuration to passed to the plugin
type Config struct{}

// CreateConfig populates the Config data object
func CreateConfig() *Config {
	return &Config{}
}

// UIDDemo holds the necessary components of a Traefik plugin
type UIDDemo struct {
	next http.Handler
	name string
}

// New instantiates and returns the required components used to handle a HTTP request
func new(ctx context.Context, next http.Handler, config *Config, name string) (http.Handler, error) {
	return &UIDDemo{
		next: next,
		name: name,
	}, nil
}

func (u *UIDDemo) ServeHTTP(rw http.ResponseWriter, req *http.Request) {
	rw.Write([]byte("Hello World ! \n"))
}
