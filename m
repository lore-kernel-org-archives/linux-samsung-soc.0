From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 06/29] drm/exynos/fimd: don't initialize 'ret' variable in
 fimd_probe()
Date: Thu, 18 Dec 2014 11:58:32 -0200
Message-ID: <1418911135-5207-7-git-send-email-gustavo@padovan.org>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
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
Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogR3VzdGF2byBQYWRvdmFuIDxndXN0YXZvLnBhZG92YW5AY29sbGFib3JhLmNvLnVrPgoK
V2UgIHNldCBpdCBpbiB0aGUgYmVnaW5uaW5nIG9mIHRoZSBmdW5jdGlvbiwgdGh1cyBubyBuZWVk
IHRvIHNldCBpdCBhdAppbml0aWFsaXphdGlvbi4KClNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gUGFk
b3ZhbiA8Z3VzdGF2by5wYWRvdmFuQGNvbGxhYm9yYS5jby51az4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcm1fZmltZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfZHJtX2ZpbWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2Ry
bV9maW1kLmMKaW5kZXggMDhhNzk5NS4uNDk1ZDdlMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19kcm1fZmltZC5jCkBAIC0xMTI2LDcgKzExMjYsNyBAQCBzdGF0aWMgaW50IGZpbWRf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1Y3QgZmltZF9jb250ZXh0
ICpjdHg7CiAJc3RydWN0IGRldmljZV9ub2RlICppODBfaWZfdGltaW5nczsKIAlzdHJ1Y3QgcmVz
b3VyY2UgKnJlczsKLQlpbnQgcmV0ID0gLUVJTlZBTDsKKwlpbnQgcmV0OwogCiAJaWYgKCFkZXYt
Pm9mX25vZGUpCiAJCXJldHVybiAtRU5PREVWOwotLSAKMS45LjMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
