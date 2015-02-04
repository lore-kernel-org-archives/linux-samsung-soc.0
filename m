From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 02/14] drm/exynos: Remove exynos_plane_dpms() call with no
 effect
Date: Wed, 04 Feb 2015 16:42:57 +0900
Message-ID: <54D1CD81.6020704@samsung.com>
References: <1422990871-21355-1-git-send-email-gustavo@padovan.org>
 <1422990871-21355-3-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1422990871-21355-3-git-send-email-gustavo@padovan.org>
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

SGksCgpPbiAwMi8wNC8yMDE1IDA0OjE0IEFNLCBHdXN0YXZvIFBhZG92YW4gd3JvdGU6Cj4gRnJv
bTogR3VzdGF2byBQYWRvdmFuIDxndXN0YXZvLnBhZG92YW5AY29sbGFib3JhLmNvLnVrPgo+IAo+
IGV4eW5vc19wbGFuZV9kcG1zKERSTV9NT0RFX0RQTVNfT04pIGNhbGxzIHRoZSB3aW5fZW5hYmxl
KCkncyBjYWxsYmFjawo+IGZyb20gdGhlIHVuZGVybHlpbmcgbGF5ZXIuIEhvd2V2ZXIgbmVpdGhl
ciBvbmUgb2YgdGhlc2UgbGF5ZXJzIGltcGxlbWVudAo+IHdpbl9lbmFibGUoKSAtIEZJTUQsIE1p
eGVyIGFuZCBWSURJLiBUaHVzIHRoZSBjYWxsIHRvIGV4eW5vc19wbGFuZV9kcG1zKCkKPiBpcyBw
b2ludGxlc3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBQYWRvdmFuIDxndXN0YXZvLnBh
ZG92YW5AY29sbGFib3JhLmNvLnVrPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1fY3J0Yy5jIHwgMiAtLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2NydGMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9jcnRjLmMKPiBpbmRleCBiMmE0
Yjg0Li5hZDY3NWZiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9jcnRjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fY3J0
Yy5jCj4gQEAgLTY1LDggKzY1LDYgQEAgc3RhdGljIHZvaWQgZXh5bm9zX2RybV9jcnRjX2NvbW1p
dChzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4gIAo+ICAJaWYgKGV4eW5vc19jcnRjLT5vcHMtPmNv
bW1pdCkKPiAgCQlleHlub3NfY3J0Yy0+b3BzLT5jb21taXQoZXh5bm9zX2NydGMpOwo+IC0KPiAt
CWV4eW5vc19wbGFuZV9kcG1zKGNydGMtPnByaW1hcnksIERSTV9NT0RFX0RQTVNfT04pOwoKQXMg
aSBzYWlkLCB0aGlzIG5lZWRzIHRvIGtlZXAgcGFpciBlbmFibGVkIGZsYWcgb2Ygc3RydWN0CmV4
eW5vc19kcm1fcGxhbmUuCgpUaGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
