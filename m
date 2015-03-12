From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 RESEND 3/4] ARM: dts: exynos5420: add async-bridge clocks to
 disp1 power domain
Date: Thu, 12 Mar 2015 14:37:10 +0100
Message-ID: <1426167431-24470-4-git-send-email-a.hajda@samsung.com>
References: <1426167431-24470-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1426167431-24470-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Liquid.Acid@gmx.net, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, javier.martinez@collabora.co.uk, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

RklNRCBhbmQgTUlYRVIgSVBzIGluIGRpc3AxIHBvd2VyIGRvbWFpbiBoYXZlIGFzeW5jLWJyaWRn
ZXMgKHRvIEdTQ0FMRVIpLAp0aGVyZWZvcmUgdGhlaXIgY2xvY2tzIHNob3VsZCBiZSBlbmFibGVk
IGR1cmluZyBwb3dlciBkb21haW4gc3dpdGNoLgoKU2lnbmVkLW9mZi1ieTogQW5kcnplaiBIYWpk
YSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KUmV2aWV3ZWQtYnk6IEphdmllciBNYXJ0aW5leiBDYW5p
bGxhcyA8amF2aWVyLm1hcnRpbmV6QGNvbGxhYm9yYS5jby51az4KVGVzdGVkLWJ5OiBKYXZpZXIg
TWFydGluZXogQ2FuaWxsYXMgPGphdmllci5tYXJ0aW5lekBjb2xsYWJvcmEuY28udWs+ClJldmll
d2VkLWJ5OiBTeWx3ZXN0ZXIgTmF3cm9ja2kgPHMubmF3cm9ja2lAc2Ftc3VuZy5jb20+Ci0tLQog
YXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQyMC5kdHNpIHwgNiArKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9h
cm0vYm9vdC9kdHMvZXh5bm9zNTQyMC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQy
MC5kdHNpCmluZGV4IGMwZTk4Y2YuLjU1ZTM4ODcgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2V4eW5vczU0MjAuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M1NDIwLmR0
c2kKQEAgLTI4Myw5ICsyODMsMTEgQEAKIAkJCSA8JmNsb2NrIENMS19NT1VUX1NXX0FDTEszMDA+
LAogCQkJIDwmY2xvY2sgQ0xLX01PVVRfVVNFUl9BQ0xLMzAwX0RJU1AxPiwKIAkJCSA8JmNsb2Nr
IENMS19NT1VUX1NXX0FDTEs0MDA+LAotCQkJIDwmY2xvY2sgQ0xLX01PVVRfVVNFUl9BQ0xLNDAw
X0RJU1AxPjsKKwkJCSA8JmNsb2NrIENMS19NT1VUX1VTRVJfQUNMSzQwMF9ESVNQMT4sCisJCQkg
PCZjbG9jayBDTEtfRklNRDE+LCA8JmNsb2NrIENMS19NSVhFUj47CiAJCWNsb2NrLW5hbWVzID0g
Im9zY2NsayIsICJwY2xrMCIsICJjbGswIiwKLQkJCSAgICAgICJwY2xrMSIsICJjbGsxIiwgInBj
bGsyIiwgImNsazIiOworCQkJICAgICAgInBjbGsxIiwgImNsazEiLCAicGNsazIiLCAiY2xrMiIs
CisJCQkgICAgICAiYXNiMCIsICJhc2IxIjsKIAl9OwogCiAJcGluY3RybF8wOiBwaW5jdHJsQDEz
NDAwMDAwIHsKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
