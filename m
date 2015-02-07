From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 4/4] ARM: dts: exynos5420: use pmureg device node to enable
 mipi phy
Date: Sat, 07 Feb 2015 20:53:08 +0900
Message-ID: <1423309988-11793-5-git-send-email-inki.dae@samsung.com>
References: <1423309988-11793-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1423309988-11793-1-git-send-email-inki.dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, a.hajda@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

VGhpcyBwYXRjaCByZW1vdmVzIG1pcGkgcGh5IHJlbGV2YW50IHByb3BlcnRpZXMgZnJvbSBkc2lt
IGRldmljZSBub2RlCmFuZCBtYWtlcyB0aGUgcG11cmVnIGRldmljZSBub2RlIHRvIGJlIHVzZWQg
aW5zdGVhZCB0byBlbmFibGUKbWlwaSBwaHkuCgpTaWduZWQtb2ZmLWJ5OiBJbmtpIERhZSA8aW5r
aS5kYWVAc2Ftc3VuZy5jb20+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQyMC5kdHNp
IHwgICAgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M1NDIwLmR0c2kgYi9hcmNo
L2FybS9ib290L2R0cy9leHlub3M1NDIwLmR0c2kKaW5kZXggNmQzOGY4Yi4uYjhiODgyNiAxMDA2
NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQyMC5kdHNpCisrKyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL2V4eW5vczU0MjAuZHRzaQpAQCAtNTI1LDggKzUyNSw3IEBACiAJCWNvbXBhdGli
bGUgPSAic2Ftc3VuZyxleHlub3M1NDEwLW1pcGktZHNpIjsKIAkJcmVnID0gPDB4MTQ1MDAwMDAg
MHgxMDAwMD47CiAJCWludGVycnVwdHMgPSA8MCA4MiAwPjsKLQkJcGh5cyA9IDwmbWlwaV9waHkg
MT47Ci0JCXBoeS1uYW1lcyA9ICJkc2ltIjsKKwkJc2Ftc3VuZyxwbXVyZWcgPSA8JnBtdV9zeXN0
ZW1fY29udHJvbGxlcj47CiAJCWNsb2NrcyA9IDwmY2xvY2sgQ0xLX0RTSU0xPiwgPCZjbG9jayBD
TEtfU0NMS19NSVBJMT47CiAJCWNsb2NrLW5hbWVzID0gImJ1c19jbGsiLCAicGxsX2NsayI7CiAJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+OwotLSAKMS43LjkuNQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
