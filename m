From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 1/6] drm/exynos: Don't touch DPMS when updating overlay planes
Date: Wed, 26 Nov 2014 16:10:49 -0200
Message-ID: <1417025454-3916-2-git-send-email-gustavo@padovan.org>
References: <1417025454-3916-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1417025454-3916-1-git-send-email-gustavo@padovan.org>
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
RFBNUyBzZXR0aW5ncyBzaG91bGQgb25seSBiZSBjaGFuZ2VkIGJ5IGEgZnVsbCBtb2Rlc2V0Lgpl
eHlub3NfcGxhbmVfdXBkYXRlKCkgc2hvdWxkIG9ubHkgY2FyZSBhYm91dCB1cGRhdGluZyB0aGUg
cGxhbmVzIGl0c2VsZgphbmQgbm90aGluZyBlbHNlLgoKU2lnbmVkLW9mZi1ieTogR3VzdGF2byBQ
YWRvdmFuIDxndXN0YXZvLnBhZG92YW5AY29sbGFib3JhLmNvLnVrPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zX2RybV9wbGFuZS5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2Ry
bV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3BsYW5lLmMKaW5k
ZXggODQzZjc0MS4uNGZlM2MyYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfZHJtX3BsYW5lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJt
X3BsYW5lLmMKQEAgLTE5MCw3ICsxOTAsNiBAQCBleHlub3NfdXBkYXRlX3BsYW5lKHN0cnVjdCBk
cm1fcGxhbmUgKnBsYW5lLCBzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJCXJldHVybiByZXQ7CiAK
IAlleHlub3NfcGxhbmVfY29tbWl0KHBsYW5lKTsKLQlleHlub3NfcGxhbmVfZHBtcyhwbGFuZSwg
RFJNX01PREVfRFBNU19PTik7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjEuOS4zCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
