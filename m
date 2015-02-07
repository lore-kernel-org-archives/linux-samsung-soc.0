From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 3/4] ARM: dts: exynos3250: use pmureg device node to enable
 mipi phy
Date: Sat, 07 Feb 2015 20:53:07 +0900
Message-ID: <1423309988-11793-4-git-send-email-inki.dae@samsung.com>
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
aS5kYWVAc2Ftc3VuZy5jb20+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zMzI1MC5kdHNp
IHwgICAgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9leHlub3MzMjUwLmR0c2kgYi9hcmNo
L2FybS9ib290L2R0cy9leHlub3MzMjUwLmR0c2kKaW5kZXggMjI0NjU0OS4uZWI4MDgwMiAxMDA2
NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zMzI1MC5kdHNpCisrKyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL2V4eW5vczMyNTAuZHRzaQpAQCAtMjQ2LDggKzI0Niw3IEBACiAJCQlpbnRlcnJ1
cHRzID0gPDAgODMgMD47CiAJCQlzYW1zdW5nLHBoeS10eXBlID0gPDA+OwogCQkJc2Ftc3VuZyxw
b3dlci1kb21haW4gPSA8JnBkX2xjZDA+OwotCQkJcGh5cyA9IDwmbWlwaV9waHkgMT47Ci0JCQlw
aHktbmFtZXMgPSAiZHNpbSI7CisJCQlzYW1zdW5nLHBtdXJlZyA9IDwmcG11X3N5c3RlbV9jb250
cm9sbGVyPjsKIAkJCWNsb2NrcyA9IDwmY211IENMS19EU0lNMD4sIDwmY211IENMS19TQ0xLX01J
UEkwPjsKIAkJCWNsb2NrLW5hbWVzID0gImJ1c19jbGsiLCAicGxsX2NsayI7CiAJCQkjYWRkcmVz
cy1jZWxscyA9IDwxPjsKLS0gCjEuNy45LjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
