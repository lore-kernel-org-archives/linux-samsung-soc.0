From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 1/7] ARM: dts: s5pv210: Add missing interrupt-controller
 property to gph2
Date: Thu, 21 Jun 2018 21:09:53 +0200
Message-ID: <1529608199-5583-2-git-send-email-pawel.mikolaj.chmiel@gmail.com>
References: <1529608199-5583-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1529608199-5583-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: kgene@kernel.org, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, xc-racer2@live.ca, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, pawel.mikolaj.chmiel@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

QWRkcyBtaXNzaW5nIGludGVycnVwdC1jb250cm9sbGVyIHByb3BlcnR5IHRvIGdwaDIgYmxvY2ss
CnRvIHNpbGVuY2UgZm9sbG93aW5nIHdhcm5pbmdzIGR1cmluZyBidWlsZAogIC9zb2MvcGluY3Ry
bEBlMDIwMDAwMC9ncGgyOiBNaXNzaW5nIGludGVycnVwdC1jb250cm9sbGVyIG9yIGludGVycnVw
dC1tYXAgcHJvcGVydHkKCkl0J3MgcmVndWlyZWQgYnkgU2Ftc3VuZyBhcmllcyBib2FyZHMsIGFu
IFM1UFYyMTAgYmFzZWQKU2Ftc3VuZyBHYWxheHkgUyAoaTkwMDApIGFuZCBHYWxheHkgUyA0RyBw
aG9uZXMsIHdoaWNoIGFyZSBhZGRlZCBpbiBuZXh0IHBhdGNoZXMuCgpTaWduZWQtb2ZmLWJ5OiBQ
YXdlxYIgQ2htaWVsIDxwYXdlbC5taWtvbGFqLmNobWllbEBnbWFpbC5jb20+Ci0tLQogYXJjaC9h
cm0vYm9vdC9kdHMvczVwdjIxMC1waW5jdHJsLmR0c2kgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvczVwdjIxMC1w
aW5jdHJsLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zNXB2MjEwLXBpbmN0cmwuZHRzaQppbmRl
eCAzYTc5ZmVhYjExYzMuLjdmMGM5ZDQ0Nzg3MSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9k
dHMvczVwdjIxMC1waW5jdHJsLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvczVwdjIxMC1w
aW5jdHJsLmR0c2kKQEAgLTI1OCw2ICsyNTgsOCBAQAogCWdwaDI6IGdwaDIgewogCQlncGlvLWNv
bnRyb2xsZXI7CiAJCSNncGlvLWNlbGxzID0gPDI+OworCisJCWludGVycnVwdC1jb250cm9sbGVy
OwogCQkjaW50ZXJydXB0LWNlbGxzID0gPDI+OwogCX07CiAKLS0gCjIuNy40CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBt
YWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
