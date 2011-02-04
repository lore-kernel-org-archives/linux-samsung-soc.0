From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: USB: Gadget: COMPOSITE: Debug interface number
Date: Fri, 4 Feb 2011 18:50:27 +0900
Message-ID: <AANLkTimhnJ1dVK8yMz2S7R7r86xYjRSpD=cEx_weh_J1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=0016e6dd8969d59a01049b71cfa6
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-b-yBeKhBN/0LDR7s880joybQ@public.gmane.org, gregkh-l3A5Bk7waGM@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, maulik-l0cyMroinI0@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--0016e6dd8969d59a01049b71cfa6
Content-Type: text/plain; charset=UTF-8

Hi,

The commit 'avoid access beyond array max length' incorrectly
compares w_index with MAX_CONFIG_INTERFACES. Whereas only
lower 8bits of w_index refer to the interface number.
So, use 'intf' rather than 'w_index' for comparison.

Thanks

--0016e6dd8969d59a01049b71cfa6
Content-Type: application/octet-stream; name=patch
Content-Disposition: attachment; filename=patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gjqwyb8r0

RnJvbTogSmFzc2kgQnJhciA8amFzc2kuYnJhckBzYW1zdW5nLmNvbT4KRGF0ZTogRnJpLCA0IEZl
YiAyMDExIDE3OjQ2OjA2ICswOTAwClN1YmplY3Q6IFtQQVRDSF0gVVNCOiBHYWRnZXQ6IENPTVBP
U0lURTogRGVidWcgaW50ZXJmYWNlIG51bWJlcgoKVGhlIGNvbW1pdCAnYXZvaWQgYWNjZXNzIGJl
eW9uZCBhcnJheSBtYXggbGVuZ3RoJyBpbmNvcnJlY3RseQpjb21wYXJlcyB3X2luZGV4IHdpdGgg
TUFYX0NPTkZJR19JTlRFUkZBQ0VTLiBXaGVyZWFzIG9ubHkKbG93ZXIgOGJpdHMgb2Ygd19pbmRl
eCByZWZlciB0byB0aGUgaW50ZXJmYWNlIG51bWJlci4KU28sIHVzZSAnaW50ZicgcmF0aGVyIHRo
YW4gJ3dfaW5kZXgnIGZvciBjb21wYXJpc29uLgoKU2lnbmVkLW9mZi1ieTogSmFzc2kgQnJhciA8
amFzc2kuYnJhckBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJzL3VzYi9nYWRnZXQvY29tcG9zaXRl
LmMgfCAgICAyICstCiAxIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvY29tcG9zaXRlLmMgYi9kcml2
ZXJzL3VzYi9nYWRnZXQvY29tcG9zaXRlLmMKaW5kZXggMWJhNGJlZi4uZTMwZGEyYyAxMDA2NDQK
LS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L2NvbXBvc2l0ZS5jCisrKyBiL2RyaXZlcnMvdXNiL2dh
ZGdldC9jb21wb3NpdGUuYwpAQCAtOTI4LDcgKzkyOCw3IEBAIHVua25vd246CiAJCSAqLwogCQlz
d2l0Y2ggKGN0cmwtPmJSZXF1ZXN0VHlwZSAmIFVTQl9SRUNJUF9NQVNLKSB7CiAJCWNhc2UgVVNC
X1JFQ0lQX0lOVEVSRkFDRToKLQkJCWlmICghY2Rldi0+Y29uZmlnIHx8IHdfaW5kZXggPj0gTUFY
X0NPTkZJR19JTlRFUkZBQ0VTKQorCQkJaWYgKCFjZGV2LT5jb25maWcgfHwgaW50ZiA+PSBNQVhf
Q09ORklHX0lOVEVSRkFDRVMpCiAJCQkJYnJlYWs7CiAJCQlmID0gY2Rldi0+Y29uZmlnLT5pbnRl
cmZhY2VbaW50Zl07CiAJCQlicmVhazsKLS0gCjEuNy4xCgo=
--0016e6dd8969d59a01049b71cfa6--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
