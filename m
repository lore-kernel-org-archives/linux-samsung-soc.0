From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 3/6] drm/exynos: Remove exynos_plane_dpms() call with no
 effect
Date: Fri, 30 Jan 2015 11:12:08 +0900
Message-ID: <54CAE878.7030805@samsung.com>
References: <1422016980-23806-1-git-send-email-gustavo@padovan.org>
 <1422016980-23806-3-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1422016980-23806-3-git-send-email-gustavo@padovan.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

K0NjIElua2ksCgpIaSwKCk9uIDAxLzIzLzIwMTUgMDk6NDIgUE0sIEd1c3Rhdm8gUGFkb3ZhbiB3
cm90ZToKPiBGcm9tOiBHdXN0YXZvIFBhZG92YW4gPGd1c3Rhdm8ucGFkb3ZhbkBjb2xsYWJvcmEu
Y28udWs+Cj4gCj4gZXh5bm9zX3BsYW5lX2RwbXMoRFJNX01PREVfRFBNU19PTikgY2FsbHMgdGhl
IHdpbl9lbmFibGUoKSdzIGNhbGxiYWNrCj4gZnJvbSB0aGUgdW5kZXJseWluZyBsYXllci4gSG93
ZXZlciBuZWl0aGVyIG9uZSBvZiB0aGVzZSBsYXllcnMgaW1wbGVtZW50Cj4gd2luX2VuYWJsZSgp
IC0gRklNRCwgTWl4ZXIgYW5kIFZJREkuIFRodXMgdGhlIGNhbGwgdG8gZXh5bm9zX3BsYW5lX2Rw
bXMoKQo+IGlzIHBvaW50bGVzcy4KPiAKCk5vLCBpdCBuZWVkcyBmb3IgcGFpciB3aXRoIERSTV9N
T0RFX0RQTVNfT0ZGIGNhc2UuCgpUaGFua3MuCgo+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gUGFk
b3ZhbiA8Z3VzdGF2by5wYWRvdmFuQGNvbGxhYm9yYS5jby51az4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2NydGMuYyB8IDIgLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fY3J0
Yy5jCj4gaW5kZXggYjFmMWIyNS4uZDBmNGUxYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcm1fY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5v
cy9leHlub3NfZHJtX2NydGMuYwo+IEBAIC02NSw4ICs2NSw2IEBAIHN0YXRpYyB2b2lkIGV4eW5v
c19kcm1fY3J0Y19jb21taXQoc3RydWN0IGRybV9jcnRjICpjcnRjKQo+ICAKPiAgCWlmIChleHlu
b3NfY3J0Yy0+b3BzLT5jb21taXQpCj4gIAkJZXh5bm9zX2NydGMtPm9wcy0+Y29tbWl0KGV4eW5v
c19jcnRjKTsKPiAtCj4gLQlleHlub3NfcGxhbmVfZHBtcyhjcnRjLT5wcmltYXJ5LCBEUk1fTU9E
RV9EUE1TX09OKTsKPiAgfQo+ICAKPiAgc3RhdGljIGJvb2wKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
