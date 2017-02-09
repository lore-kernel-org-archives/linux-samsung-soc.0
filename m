From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: exynos: Remove the OF graph from DSI
 node for exynos5433 dts
Date: Thu, 09 Feb 2017 08:16:01 +0100
Message-ID: <46ab1e93-c0e3-4fb4-6f22-c8b3b2ac455b@samsung.com>
References: <1486603601-26826-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170209012716epcas1p37a101e6937668ce09309bb636c8b6a52@epcas1p3.samsung.com>
 <1486603601-26826-3-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1486603601-26826-3-git-send-email-hoegeun.kwon@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>, inki.dae@samsung.com, robh+dt@kernel.org, krzk@kernel.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDkuMDIuMjAxNyAwMjoyNiwgSG9lZ2V1biBLd29uIHdyb3RlOgo+IFRoZSBPRiBncmFwaCBp
cyBub3QgbmVlZGVkIGJlY2F1c2UgdGhlIHBhbmVsIGlzIGEgY2hpbGQgb2YgZHNpLiBTbwo+IFJl
bW92ZSB0aGUgcG9ydHMgbm9kZSBhbmQgbW92ZSBidXJzdCBhbmQgZXNjIGNsb2NrIGZyZXF1ZW5j
eQo+IHByb3BlcnRpZXMgdG8gdGhlIHBhcmVudCAoRFNJIG5vZGUpLgo+Cj4gU2lnbmVkLW9mZi1i
eTogSG9lZ2V1biBLd29uIDxob2VnZXVuLmt3b25Ac2Ftc3VuZy5jb20+CgpGb3IgdGhlIHdob2xl
IHBhdGNoc2V0OgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNv
bT4KLS0KUmVnYXJkcwpBbmRyemVqCgo+IC0tLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5v
cy9leHlub3M1NDMzLXRtMi1jb21tb24uZHRzaSB8IDE2ICsrLS0tLS0tLS0tLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTItY29tbW9uLmR0
c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi1jb21tb24uZHRz
aQo+IGluZGV4IDZjZTkzYTMuLjc3YmEyMzggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTItY29tbW9uLmR0c2kKPiArKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi1jb21tb24uZHRzaQo+IEBAIC0yOTgsMjMg
KzI5OCwxMSBAQAo+ICAJc3RhdHVzID0gIm9rYXkiOwo+ICAJdmRkY29yZS1zdXBwbHkgPSA8Jmxk
bzZfcmVnPjsKPiAgCXZkZGlvLXN1cHBseSA9IDwmbGRvN19yZWc+Owo+ICsJc2Ftc3VuZyxidXJz
dC1jbG9jay1mcmVxdWVuY3kgPSA8NTEyMDAwMDAwPjsKPiArCXNhbXN1bmcsZXNjLWNsb2NrLWZy
ZXF1ZW5jeSA9IDwxNjAwMDAwMD47Cj4gIAlzYW1zdW5nLHBsbC1jbG9jay1mcmVxdWVuY3kgPSA8
MjQwMDAwMDA+Owo+ICAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiAgCXBpbmN0cmwtMCA9
IDwmdGVfaXJxPjsKPiAtCj4gLQlwb3J0cyB7Cj4gLQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4g
LQkJI3NpemUtY2VsbHMgPSA8MD47Cj4gLQo+IC0JCXBvcnRAMSB7Cj4gLQkJCXJlZyA9IDwxPjsK
PiAtCj4gLQkJCWRzaV9vdXQ6IGVuZHBvaW50IHsKPiAtCQkJCXNhbXN1bmcsYnVyc3QtY2xvY2st
ZnJlcXVlbmN5ID0gPDUxMjAwMDAwMD47Cj4gLQkJCQlzYW1zdW5nLGVzYy1jbG9jay1mcmVxdWVu
Y3kgPSA8MTYwMDAwMDA+Owo+IC0JCQl9Owo+IC0JCX07Cj4gLQl9Owo+ICB9Owo+ICAKPiAgJmhk
bWkgewoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
