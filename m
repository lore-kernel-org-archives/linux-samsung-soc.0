From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH 2/2] drm/exynos: use irq_flags instead of triggering
Date: Fri, 14 Nov 2014 11:36:04 +0900
Message-ID: <1415932564-16463-3-git-send-email-jy0922.shim@samsung.com>
References: <1415932564-16463-1-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1415932564-16463-1-git-send-email-jy0922.shim@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIGRybV9oYW5kbGVfdmJsYW5rIHNob3VsZCBiZSBjYWxsZWQgd2hlbmV2ZXIgYmUgdnN5bmMs
IHRlIGludGVycnVwdAptZWFucyB2c3luYyBvbiBpODAgaW50ZXJmYWNlLgoKU2lnbmVkLW9mZi1i
eTogSm9vbnlvdW5nIFNoaW0gPGp5MDkyMi5zaGltQHNhbXN1bmcuY29tPgotLS0KQmFzZWQgb24g
bGFzdGVzdCBleHlub3MtZHJtLW5leHQgYnJhbmNoIGFuZCBwYXRjaCBvZiBZb3VuZ2p1biBDaG8K
KCJkcm0vZXh5bm9zOiBmaW1kOiBtb3ZlIGhhbmRsZSB2YmxhbmsgcG9zaXRpb24gaW4gVEUgaGFu
ZGxlciIpLgoKIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9maW1kLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmltZC5jIGIvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWQuYwppbmRleCAwMzNiMThiLi41Y2M1N2Y3IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmltZC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9maW1kLmMKQEAgLTk4NCw3ICs5ODQs
NyBAQCBzdGF0aWMgdm9pZCBmaW1kX3RlX2hhbmRsZXIoc3RydWN0IGV4eW5vc19kcm1fbWFuYWdl
ciAqbWdyKQogCQl3YWtlX3VwKCZjdHgtPndhaXRfdnN5bmNfcXVldWUpOwogCX0KIAotCWlmICgh
YXRvbWljX3JlYWQoJmN0eC0+dHJpZ2dlcmluZykpCisJaWYgKHRlc3RfYml0KDAsICZjdHgtPmly
cV9mbGFncykpCiAJCWRybV9oYW5kbGVfdmJsYW5rKGN0eC0+ZHJtX2RldiwgY3R4LT5waXBlKTsK
IH0KIAotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
