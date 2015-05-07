From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [RFT PATCH v2 0/3] drm/exynos: Fix build breakage on !DRM_EXYNOS_FIMD
Date: Thu, 07 May 2015 09:04:43 +0900
Message-ID: <1430957086-25005-1-git-send-email-k.kozlowski@samsung.com>
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
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8ay5rb3psb3dza2kua0BnbWFpbC5jb20+CgpIaSwK
ClRoaXMgaXMgc2Vjb25kIHRyeSB0byBmaXggdGhlIGJ1aWxkIGJyZWFrYWdlIGludHJvZHVjZWQg
aW4gMWMzNjNjN2NjY2Y2CigiZHJtL2V4eW5vczogRW5hYmxlIERQIGNsb2NrIHRvIGZpeCBkaXNw
bGF5IG9uIEV4eW5vczUyNTAgYW5kIG90aGVyIikuCgpUaGUgZml4IGlzIG5vdCB0cml2aWFsIHNv
IEkgYW0ga2luZGx5IGFza2luZyBmb3IgdGVzdGluZyBvbiBDaHJvbWVib29rCmFuZCBvdGhlciBE
UC1lbmFibGVkIGJvYXJkcyAoSSBkb24ndCBoYXZlIENocm9tZWJvb2sgcmlnaHQgbm93KS4KClRl
c3RlZCBvbiBFeHlub3M0NDEyIFRyYXRzMiBib2FyZC4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9m
CgoKCktyenlzenRvZiBLb3psb3dza2kgKDMpOgogIGRybS9leHlub3M6IEZpeCBidWlsZCBicmVh
a2FnZSBvbiAhRFJNX0VYWU5PU19GSU1ECiAgZHJtL2V4eW5vczogQ29uc3RpZnkgZXh5bm9zX2Ry
bV9jcnRjX29wcwogIGRybS9leHlub3M6IENvbnNvbGlkYXRlIHJldHVybiBzdGF0ZW1lbnRzIGlu
IGZpbWRfYmluZCgpCgogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3M3X2RybV9kZWNvbi5j
IHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RwX2NvcmUuYyAgICB8IDEx
ICsrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9jcnRjLmMgICB8ICAy
ICstCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fY3J0Yy5oICAgfCAgMiArLQog
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rydi5oICAgIHwgIDcgKysrKy0KIGRy
aXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9maW1kLmMgICB8IDQ2ICsrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Zp
bWQuaCAgIHwgMTUgLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJt
X3ZpZGkuYyAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVyLmMg
ICAgICB8ICAyICstCiA5IGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDUwIGRlbGV0
aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9maW1kLmgKCi0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
