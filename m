From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 4/9] drm/exynos: Replace repeated declaration by include
 <drm/drmP.h>
Date: Fri, 31 Oct 2014 14:17:38 +0000
Message-ID: <1414765063-30598-4-git-send-email-gustavo@padovan.org>
References: <1414765063-30598-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1414765063-30598-1-git-send-email-gustavo@padovan.org>
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
Cc: linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogR3VzdGF2byBQYWRvdmFuIDxndXN0YXZvLnBhZG92YW5AY29sbGFib3JhLmNvLnVrPgoK
UmUtZGVjbGFyZSBzdHJ1Y3QgaXMgbm90IGEgZ29vZCBwcmFjdGljZSwgbGV0J3MgdXNlIHRoZSBv
cmlnaW5hbApkcm0gZGVjbGFyYXRpb25zLgoKU2lnbmVkLW9mZi1ieTogR3VzdGF2byBQYWRvdmFu
IDxndXN0YXZvLnBhZG92YW5AY29sbGFib3JhLmNvLnVrPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9l
eHlub3MvZXh5bm9zX2RybV9kcnYuaCB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9k
cnYuaAppbmRleCAzOTA1ZTMwLi43ODA2OTgxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlu
b3NfZHJtX2Rydi5oCkBAIC0xNSw2ICsxNSw3IEBACiAjaWZuZGVmIF9FWFlOT1NfRFJNX0RSVl9I
XwogI2RlZmluZSBfRVhZTk9TX0RSTV9EUlZfSF8KIAorI2luY2x1ZGUgPGRybS9kcm1QLmg+CiAj
aW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAKICNkZWZpbmUgTUFYX0NSVEMJMwpAQCAtMzYsOSAr
MzcsNiBAQAogCiAjZGVmaW5lIHdhaXRfZm9yKENPTkQsIE1TKSBfd2FpdF9mb3IoQ09ORCwgTVMp
CiAKLXN0cnVjdCBkcm1fZGV2aWNlOwotc3RydWN0IGRybV9jb25uZWN0b3I7Ci0KIC8qIFRoaXMg
ZW51bWVyYXRlcyBkZXZpY2UgdHlwZS4gKi8KIGVudW0gZXh5bm9zX2RybV9kZXZpY2VfdHlwZSB7
CiAJRVhZTk9TX0RFVklDRV9UWVBFX05PTkUsCi0tIAoxLjkuMwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
