From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 02/25] ARM: dts: exynos542x: add rotator node
Date: Tue, 10 Nov 2015 14:23:18 +0100
Message-ID: <1447161821-1877-3-git-send-email-m.szyprowski@samsung.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIGRldmljZSBub2RlIGZvciBSb3RhdG9yIGRldmljZSB0byBFeHlub3Mg
NTQyeCBkZXZpY2UKdHJlZSBmaWxlLgoKU2lnbmVkLW9mZi1ieTogTWFyZWsgU3p5cHJvd3NraSA8
bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczU0
MjAuZHRzaSB8IDE5ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQyMC5kdHNp
IGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQyMC5kdHNpCmluZGV4IDFiM2Q2Yzc2OWEzYy4u
NDhhMGE1NTMxNGY1IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M1NDIwLmR0
c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQyMC5kdHNpCkBAIC03MTcsNiArNzE3
LDE1IEBACiAJCWlvbW11cyA9IDwmc3lzbW11X3R2PjsKIAl9OwogCisJcm90YXRvcjogcm90YXRv
ckAxMUMwMDAwMCB7CisJCWNvbXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3M1MjUwLXJvdGF0b3Ii
OworCQlyZWcgPSA8MHgxMUMwMDAwMCAweDY0PjsKKwkJaW50ZXJydXB0cyA9IDwwIDg0IDA+Owor
CQljbG9ja3MgPSA8JmNsb2NrIENMS19ST1RBVE9SPjsKKwkJY2xvY2stbmFtZXMgPSAicm90YXRv
ciI7CisJCWlvbW11cyA9IDwmc3lzbW11X3JvdGF0b3I+OworCX07CisKIAlnc2NfMDogdmlkZW8t
c2NhbGVyQDEzZTAwMDAwIHsKIAkJY29tcGF0aWJsZSA9ICJzYW1zdW5nLGV4eW5vczUtZ3NjIjsK
IAkJcmVnID0gPDB4MTNlMDAwMDAgMHgxMDAwPjsKQEAgLTEwNTksNiArMTA2OCwxNiBAQAogCQkj
aW9tbXUtY2VsbHMgPSA8MD47CiAJfTsKIAorCXN5c21tdV9yb3RhdG9yOiBzeXNtbXVAMHgxMUQ0
MDAwMCB7CisJCWNvbXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3Mtc3lzbW11IjsKKwkJcmVnID0g
PDB4MTFENDAwMDAgMHgxMDAwPjsKKwkJaW50ZXJydXB0LXBhcmVudCA9IDwmY29tYmluZXI+Owor
CQlpbnRlcnJ1cHRzID0gPDQgMD47CisJCWNsb2NrLW5hbWVzID0gInN5c21tdSIsICJtYXN0ZXIi
OworCQljbG9ja3MgPSA8JmNsb2NrIENMS19TTU1VX1JPVEFUT1I+LCA8JmNsb2NrIENMS19ST1RB
VE9SPjsKKwkJI2lvbW11LWNlbGxzID0gPDA+OworCX07CisKIAlzeXNtbXVfanBlZzA6IHN5c21t
dUAweDExRjEwMDAwIHsKIAkJY29tcGF0aWJsZSA9ICJzYW1zdW5nLGV4eW5vcy1zeXNtbXUiOwog
CQlyZWcgPSA8MHgxMUYxMDAwMCAweDEwMDA+OwotLSAKMS45LjIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
