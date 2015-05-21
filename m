From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v6 07/12] drm/exynos: atomic phase 3: use atomic .set_config
 helper
Date: Thu, 21 May 2015 17:02:46 -0300
Message-ID: <1432238571-31621-8-git-send-email-gustavo@padovan.org>
References: <1432238571-31621-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1432238571-31621-1-git-send-email-gustavo@padovan.org>
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
Cc: tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogR3VzdGF2byBQYWRvdmFuIDxndXN0YXZvLnBhZG92YW5AY29sbGFib3JhLmNvLnVrPgoK
Tm93IHRoYXQgcGhhc2UgMSBhbmQgMiBhcmUgY29tcGxldGUgc3dpdGNoIC5zZXRfY29uZmlnIGhl
bHBlciB0bwp1c2UgdGhlIGF0b21pYyBvbmUuCgpTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIFBhZG92
YW4gPGd1c3Rhdm8ucGFkb3ZhbkBjb2xsYWJvcmEuY28udWs+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfZHJtX2NydGMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1f
Y3J0Yy5jCmluZGV4IDIwZTA1M2QuLjY4NmZlNjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfZHJtX2NydGMuYwpAQCAtMTk2LDcgKzE5Niw3IEBAIHN0YXRpYyB2b2lkIGV4eW5vc19k
cm1fY3J0Y19kZXN0cm95KHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIH0KIAogc3RhdGljIHN0cnVj
dCBkcm1fY3J0Y19mdW5jcyBleHlub3NfY3J0Y19mdW5jcyA9IHsKLQkuc2V0X2NvbmZpZwk9IGRy
bV9jcnRjX2hlbHBlcl9zZXRfY29uZmlnLAorCS5zZXRfY29uZmlnCT0gZHJtX2F0b21pY19oZWxw
ZXJfc2V0X2NvbmZpZywKIAkucGFnZV9mbGlwCT0gZXh5bm9zX2RybV9jcnRjX3BhZ2VfZmxpcCwK
IAkuZGVzdHJveQk9IGV4eW5vc19kcm1fY3J0Y19kZXN0cm95LAogCS5yZXNldCA9IGRybV9hdG9t
aWNfaGVscGVyX2NydGNfcmVzZXQsCi0tIAoyLjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
