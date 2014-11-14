From: YoungJun Cho <yj44.cho@samsung.com>
Subject: Re: [PATCH 2/2] drm/exynos: use irq_flags instead of triggering
Date: Fri, 14 Nov 2014 14:01:45 +0900
Message-ID: <54658CB9.8090306@samsung.com>
References: <1415932564-16463-1-git-send-email-jy0922.shim@samsung.com>
 <1415932564-16463-3-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1415932564-16463-3-git-send-email-jy0922.shim@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

SGkgSm9vbllvdW5nLAoKT24gMTEvMTQvMjAxNCAxMTozNiBBTSwgSm9vbnlvdW5nIFNoaW0gd3Jv
dGU6Cj4gVGhlIGRybV9oYW5kbGVfdmJsYW5rIHNob3VsZCBiZSBjYWxsZWQgd2hlbmV2ZXIgYmUg
dnN5bmMsIHRlIGludGVycnVwdAo+IG1lYW5zIHZzeW5jIG9uIGk4MCBpbnRlcmZhY2UuCgpUaGF0
J3MgcmlnaHQuCgo+Cj4gU2lnbmVkLW9mZi1ieTogSm9vbnlvdW5nIFNoaW0gPGp5MDkyMi5zaGlt
QHNhbXN1bmcuY29tPgo+IC0tLQo+IEJhc2VkIG9uIGxhc3Rlc3QgZXh5bm9zLWRybS1uZXh0IGJy
YW5jaCBhbmQgcGF0Y2ggb2YgWW91bmdqdW4gQ2hvCj4gKCJkcm0vZXh5bm9zOiBmaW1kOiBtb3Zl
IGhhbmRsZSB2YmxhbmsgcG9zaXRpb24gaW4gVEUgaGFuZGxlciIpLgo+Cj4gICBkcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmltZC5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RybV9maW1kLmMKPiBpbmRleCAwMzNiMThiLi41Y2M1N2Y3IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9maW1kLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmltZC5jCj4gQEAgLTk4NCw3ICs5ODQsNyBAQCBz
dGF0aWMgdm9pZCBmaW1kX3RlX2hhbmRsZXIoc3RydWN0IGV4eW5vc19kcm1fbWFuYWdlciAqbWdy
KQo+ICAgCQl3YWtlX3VwKCZjdHgtPndhaXRfdnN5bmNfcXVldWUpOwo+ICAgCX0KPgo+IC0JaWYg
KCFhdG9taWNfcmVhZCgmY3R4LT50cmlnZ2VyaW5nKSkKPiArCWlmICh0ZXN0X2JpdCgwLCAmY3R4
LT5pcnFfZmxhZ3MpKQo+ICAgCQlkcm1faGFuZGxlX3ZibGFuayhjdHgtPmRybV9kZXYsIGN0eC0+
cGlwZSk7CgpCdXQgYWZ0ZXIgdHJpZ2dlcmluZywgImZpbWRfaXJxX2hhbmRsZXIoKSIgaXMgY2Fs
bGVkIGJ5ICJsY2Rfc3lzIiAKaW50ZXJydXB0IGFuZCB0aGF0IGNhbGxzICJkcm1faGFuZGxlX3Zi
bGFuaygpIi4KClNvIEkgdGhpbmsgImZpbWRfdGVfaGFuZGxlcigpIiBjYWxscyAiZHJtX2hhbmRs
ZV92YmxhbmsoKSIgb25seSAKbm9uLXRyaWdnZXJpbmcgY29uZGl0aW9uLgoKVGhhbmsgeW91LgpC
ZXN0IHJlZ2FyZHMgWUoKCj4gICB9Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
