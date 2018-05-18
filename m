From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] drm/exynos: fimc: signedness bug in fimc_setup_clocks()
Date: Fri, 18 May 2018 01:04:45 -0700 (PDT)
Message-ID: <20180518080445.GB28335@mwanda>
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
To: Inki Dae <inki.dae@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

ImlkIiBuZWVkcyB0byBiZSBzaWduZWQgZm9yIHRoZSBlcnJvciBoYW5kbGluZyB0byB3b3JrLgoK
Rml4ZXM6IDdhMmQ1Yzc3YzU1OCAoImRybS9leHlub3M6IGZpbWM6IENvbnZlcnQgZHJpdmVyIHRv
IElQUCB2MiBjb3JlIEFQSSIpClNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJw
ZW50ZXJAb3JhY2xlLmNvbT4KCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1fZmltYy5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWMu
YwppbmRleCA0ZGZiZmM3ZjNiODQuLjVjZTg0MDI1ZDFjYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fZmltYy5jCkBAIC0xMjAwLDcgKzEyMDAsNyBAQCBzdGF0aWMgaW50IGZp
bWNfc2V0dXBfY2xvY2tzKHN0cnVjdCBmaW1jX2NvbnRleHQgKmN0eCkKIAogaW50IGV4eW5vc19k
cm1fY2hlY2tfZmltY19kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2KQogewotCXVuc2lnbmVkIGlu
dCBpZCA9IG9mX2FsaWFzX2dldF9pZChkZXYtPm9mX25vZGUsICJmaW1jIik7CisJaW50IGlkID0g
b2ZfYWxpYXNfZ2V0X2lkKGRldi0+b2Zfbm9kZSwgImZpbWMiKTsKIAogCWlmIChpZCA+PSAwICYm
IChCSVQoaWQpICYgZmltY19tYXNrKSkKIAkJcmV0dXJuIDA7Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
