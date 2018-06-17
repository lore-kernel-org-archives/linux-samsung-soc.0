From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH] drm/exynos: ipp: use correct enum type
Date: Sun, 17 Jun 2018 10:55:29 +0200
Message-ID: <20180617085533.13867-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIGxpbWl0X2lkX2ZhbGxiYWNrIGFycmF5IHVzZXMgZW51bSBkcm1faXBwX3NpemVfaWQgdG8g
aW5kZXggaXRzCmNvbnRlbnQuIFRoZSBjb250ZW50IGl0c2VsZiBpcyBvZiB0eXBlIGVudW0gZHJt
X2V4eW5vc19pcHBfbGltaXRfdHlwZS4KCkNjOiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dz
a2lAc2Ftc3VuZy5jb20+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBBZ25lciA8c3RlZmFuQGFnbmVy
LmNoPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9pcHAuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9pcHAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zX2RybV9pcHAuYwppbmRleCAyNjM3NGU1OGM1NTcuLjA0NzAyZTk3
NGU4MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2lwcC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9pcHAuYwpAQCAtNDI4LDcg
KzQyOCw3IEBAIGVudW0gZHJtX2lwcF9zaXplX2lkIHsKIAlJUFBfTElNSVRfQlVGRkVSLCBJUFBf
TElNSVRfQVJFQSwgSVBQX0xJTUlUX1JPVEFURUQsIElQUF9MSU1JVF9NQVgKIH07CiAKLXN0YXRp
YyBjb25zdCBlbnVtIGRybV9pcHBfc2l6ZV9pZCBsaW1pdF9pZF9mYWxsYmFja1tJUFBfTElNSVRf
TUFYXVs0XSA9IHsKK3N0YXRpYyBjb25zdCBlbnVtIGRybV9leHlub3NfaXBwX2xpbWl0X3R5cGUg
bGltaXRfaWRfZmFsbGJhY2tbSVBQX0xJTUlUX01BWF1bNF0gPSB7CiAJW0lQUF9MSU1JVF9CVUZG
RVJdICA9IHsgRFJNX0VYWU5PU19JUFBfTElNSVRfU0laRV9CVUZGRVIgfSwKIAlbSVBQX0xJTUlU
X0FSRUFdICAgID0geyBEUk1fRVhZTk9TX0lQUF9MSU1JVF9TSVpFX0FSRUEsCiAJCQkJRFJNX0VY
WU5PU19JUFBfTElNSVRfU0laRV9CVUZGRVIgfSwKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
