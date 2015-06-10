From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 0/9] drm/exynos: cleanups and small fixes for libdrm
Date: Wed, 10 Jun 2015 15:42:19 +0200
Message-ID: <1433943748-15849-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-samsung-soc@vger.kernel.org
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, gustavo.padovan@collabora.co.uk
List-Id: linux-samsung-soc@vger.kernel.org

SGVsbG8sCgpJJ3ZlIHNwbGl0IG9mZiB0aGUgRXh5bm9zIHNwZWNpZmljIGJpdHMsIHNvIHRoaXMg
aXMganVzdCBzb21lIGNsZWFudXBzIGFuZCBzbWFsbCBmaXhlcy4gRXZlcnl0aGluZyBjYW4gYmUg
cmV2aWV3ZWQgd2l0aG91dCBrbm93bGVkZ2UgYWJvdXQgdGhlIEV4eW5vcyBwbGF0Zm9ybS4gTXkg
aG9wZSBpcyB0aGF0IEkgY2FuIGdldCBhdCBsZWFzdCBzb21lIG9mIHRoZSBwYXRjaGVzIGZyb20g
bXkgbGFzdCBzZXJpZXMgdXBzdHJlYW0uCgpXaXRoIGJlc3Qgd2lzaGVzLApUb2JpYXMKClRvYmlh
cyBKYWtvYmkgKDkpOgogIGV4eW5vczogZmltZzJkOiBmaXggcmV0dXJuIGNvZGVzCiAgdGVzdHMv
ZXh5bm9zOiByZXBsYWNlIHJldHVybiBieSBicmVhawogIGV4eW5vcy9maW1nMmQ6IHNpbXBsaWZ5
IGcyZF9maW5pKCkKICB0ZXN0cy9leHlub3M6IGNsZWFuIHN0cnVjdCBjb25uZWN0b3IKICB0ZXN0
cy9leHlub3M6IHJlbW92ZSB1bnVzZWQgZGVmaW5lCiAgdGVzdHMvZXh5bm9zOiByZW1vdmUgc3Ry
dWN0IGZpbWcyZF90ZXN0X2Nhc2UKICB0ZXN0cy9leHlub3M6IHNpbXBsaWZ5IGRybV9zZXRfY3J0
YwogIHRlc3RzL2V4eW5vczogcmVtb3ZlIGNvbm5lY3Rvcl9maW5kX3BsYW5lCiAgdGVzdHMvZXh5
bm9zOiBoYW5kbGUgRzJEX0lNR0JVRl9DT0xPUiBpbiBzd2l0Y2ggc3RhdGVtZW50cwoKIGV4eW5v
cy9leHlub3NfZmltZzJkLmMgICAgICAgICAgICB8ICAyMyArKy0tLS0tLQogdGVzdHMvZXh5bm9z
L2V4eW5vc19maW1nMmRfdGVzdC5jIHwgMTEyICsrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDEwOSBkZWxldGlv
bnMoLSkKCi0tIAoyLjAuNQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
