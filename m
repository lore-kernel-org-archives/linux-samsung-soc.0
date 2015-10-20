From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 02/10] clk/samsung: exynos5433: add pclk_decon clock
Date: Tue, 20 Oct 2015 11:22:33 +0200
Message-ID: <1445332961-25419-3-git-send-email-a.hajda@samsung.com>
References: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

VGhpcyB1bmRvY3VtZW50ZWQgZ2F0ZSBjbG9jayBpcyB1c2VkIGJ5IERFQ09OIElQLgoKU2lnbmVk
LW9mZi1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJz
L2Nsay9zYW1zdW5nL2Nsay1leHlub3M1NDMzLmMgICB8IDIgKysKIGluY2x1ZGUvZHQtYmluZGlu
Z3MvY2xvY2svZXh5bm9zNTQzMy5oIHwgNCArKystCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3NhbXN1bmcv
Y2xrLWV4eW5vczU0MzMuYyBiL2RyaXZlcnMvY2xrL3NhbXN1bmcvY2xrLWV4eW5vczU0MzMuYwpp
bmRleCBlMDM3NDA2Li5lN2I0NTMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9zYW1zdW5nL2Ns
ay1leHlub3M1NDMzLmMKKysrIGIvZHJpdmVycy9jbGsvc2Ftc3VuZy9jbGstZXh5bm9zNTQzMy5j
CkBAIC0yODIyLDYgKzI4MjIsOCBAQCBzdGF0aWMgc3RydWN0IHNhbXN1bmdfZ2F0ZV9jbG9jayBk
aXNwX2dhdGVfY2xrc1tdIF9faW5pdGRhdGEgPSB7CiAJCQlFTkFCTEVfUENMS19ESVNQLCAyLCAw
LCAwKSwKIAlHQVRFKENMS19QQ0xLX0RFQ09OX1RWLCAicGNsa19kZWNvbl90diIsICJkaXZfcGNs
a19kaXNwIiwKIAkJCUVOQUJMRV9QQ0xLX0RJU1AsIDEsIDAsIDApLAorCUdBVEUoQ0xLX1BDTEtf
REVDT04sICJwY2xrX2RlY29uIiwgImRpdl9wY2xrX2Rpc3AiLAorCQkJRU5BQkxFX1BDTEtfRElT
UCwgMCwgMCwgMCksCiAKIAkvKiBFTkFCTEVfU0NMS19ESVNQICovCiAJR0FURShDTEtfUEhZQ0xL
X01JUElEUEhZMV9CSVRDTEtESVY4LCAicGh5Y2xrX21pcGlkcGh5MV9iaXRjbGtkaXY4IiwKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svZXh5bm9zNTQzMy5oIGIvaW5jbHVk
ZS9kdC1iaW5kaW5ncy9jbG9jay9leHlub3M1NDMzLmgKaW5kZXggNGYwZDU2Ni4uNWMyNjM2YyAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9leHlub3M1NDMzLmgKKysrIGIv
aW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9leHlub3M1NDMzLmgKQEAgLTc2OCw3ICs3NjgsOSBA
QAogI2RlZmluZSBDTEtfUEhZQ0xLX0hETUlQSFlfUElYRUxfQ0xLT19QSFkJCTExMQogI2RlZmlu
ZSBDTEtfUEhZQ0xLX0hETUlQSFlfVE1EU19DTEtPX1BIWQkJMTEyCiAKLSNkZWZpbmUgRElTUF9O
Ul9DTEsJCQkJCTExMworI2RlZmluZSBDTEtfUENMS19ERUNPTgkJCQkJMTEzCisKKyNkZWZpbmUg
RElTUF9OUl9DTEsJCQkJCTExNAogCiAvKiBDTVVfQVVEICovCiAjZGVmaW5lIENMS19NT1VUX0FV
RF9QTExfVVNFUgkJCQkxCi0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
