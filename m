From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 1/2] drm/exynos: ipp: fix wrong index referencing a config
 element
Date: Thu, 11 Jun 2015 23:53:07 +0900
Message-ID: <5579A0D3.2020900@samsung.com>
References: <1433821515-8952-1-git-send-email-human.hwang@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1433821515-8952-1-git-send-email-human.hwang@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Hyungwon Hwang <human.hwang@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjAxNeuFhCAwNuyblCAwOeydvCAxMjo0NSwgSHl1bmd3b24gSHdhbmcgd3JvdGU6Cj4gQ29u
ZmlnIGRlcGVuZHMgb24gdGhlIG9wcmVhdGlvbi4gU28gaXQgbXVzdCBiZSByZWZlcmVuY2VkIGJ5
IGFuCj4gb3BlcmF0aW9uIGlkLCBub3QgYSBwcm9wZXJ0eSBpZC4KCkFwcGxpZWQuCgpUaGFua3Ms
Cklua2kgRGFlCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEh5dW5nd29uIEh3YW5nIDxodW1hbi5od2Fu
Z0BzYW1zdW5nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJt
X2lwcC5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1faXBwLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1faXBwLmMKPiBpbmRl
eCBiN2YxY2JjLi41NGM1Y2Y0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RybV9pcHAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2Ry
bV9pcHAuYwo+IEBAIC00ODYsOCArNDg2LDcgQEAgc3RhdGljIGludCBpcHBfdmFsaWRhdGVfbWVt
X25vZGUoc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYsCj4gIAl1bnNpZ25lZCBpbnQgYnBwOwo+
ICAJaW50IGk7Cj4gIAo+IC0JLyogVGhlIHByb3BlcnR5IGlkIHNob3VsZCBhbHJlYWR5IGJlIHZh
cmlmaWVkICovCj4gLQlpcHBfY2ZnID0gJmNfbm9kZS0+cHJvcGVydHkuY29uZmlnW21fbm9kZS0+
cHJvcF9pZF07Cj4gKwlpcHBfY2ZnID0gJmNfbm9kZS0+cHJvcGVydHkuY29uZmlnW21fbm9kZS0+
b3BzX2lkXTsKPiAgCW51bV9wbGFuZSA9IGRybV9mb3JtYXRfbnVtX3BsYW5lcyhpcHBfY2ZnLT5m
bXQpOwo+ICAKPiAgCS8qKgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
