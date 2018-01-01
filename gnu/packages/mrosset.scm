(define-module (gnu packages mrosset)
  #:use-module ((guix licenses) #:prefix l:)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages bittorrent)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages tls)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python))

(define-public python2-libtorrent
  (package
   (inherit libtorrent-rasterbar)
   (name "python2-libtorrent")
   (build-system python-build-system)
   (arguments `(#:python ,python-2))
   (synopsis "python bindings for libtorrent")))

(define-public deluge
  (package
   (name "deluge")
   (version "1.3.15")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "http://download.deluge-torrent.org/source/deluge-"
           version ".tar.xz"))
     (sha256
      (base32
       "0b7rri4x0wrcj7rjghrnw1kfrsd5i7i6aq85dsg5dg1w1qa0ar59"))))
   (build-system python-build-system)
   (inputs `(("libtorrent-rasterbar" ,libtorrent-rasterbar)))
    (propagated-inputs
    `(("python2-pygtk" ,python2-pygtk)
      ("python2-chardet" ,python2-chardet)
      ("python2-pyopenssl" ,python2-pyopenssl)
      ("python2-libtorrent" ,python2-libtorrent)
      ("python2-twisted" ,python2-twisted)
      ("python2-pyxdg" ,python2-pyxdg)))
   (arguments
    `(#:python ,python-2))
   (home-page "http://deluge-torrent.org/")
   (synopsis  "Deluge is a fully-featured cross-platform ​BitTorrent client.")
   (description
    "Deluge contains the common features to BitTorrent clients such as Protocol Encryption, DHT, Local Peer Discovery (LSD), Peer Exchange (PEX), UPnP, NAT-PMP, Proxy support, Web seeds, global and per-torrent speed limits. As Deluge heavily utilises the ​libtorrent library")
   (license l:gpl3+)))
