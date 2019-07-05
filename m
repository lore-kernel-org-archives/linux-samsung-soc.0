From: Colin King <colin.king@canonical.com>
Subject: [PATCH][next] drm/exynos: remove redundant assignment to pointer
 'node'
Date: Fri,  5 Jul 2019 16:55:49 +0100
Message-ID: <20190705155549.15836-1-colin.king@canonical.com>
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
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBwb2lu
dGVyICdub2RlJyBpcyBiZWluZyBhc3NpZ25lZCB3aXRoIGEgdmFsdWUgdGhhdCBpcyBuZXZlcgpy
ZWFkIGFuZCBpcyByZS1hc3NpZ25lZCBsYXRlci4gVGhlIGFzc2lnbm1lbnQgaXMgcmVkdW5kYW50
IGFuZApjYW4gYmUgcmVtb3ZlZC4KCkFkZHJlc3Nlcy1Db3Zlcml0eTogKCJVbnVzZWQgdmFsdWUi
KQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nMmQuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nMmQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9nMmQuYwppbmRleCA1MDkwNGVlZTk2ZjcuLjJhMzM4MmQ0M2Jj
OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2cyZC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nMmQuYwpAQCAtMjY3LDcgKzI2
Nyw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBnMmRfaHdfcmVzZXQoc3RydWN0IGcyZF9kYXRhICpn
MmQpCiBzdGF0aWMgaW50IGcyZF9pbml0X2NtZGxpc3Qoc3RydWN0IGcyZF9kYXRhICpnMmQpCiB7
CiAJc3RydWN0IGRldmljZSAqZGV2ID0gZzJkLT5kZXY7Ci0Jc3RydWN0IGcyZF9jbWRsaXN0X25v
ZGUgKm5vZGUgPSBnMmQtPmNtZGxpc3Rfbm9kZTsKKwlzdHJ1Y3QgZzJkX2NtZGxpc3Rfbm9kZSAq
bm9kZTsKIAlpbnQgbnI7CiAJaW50IHJldDsKIAlzdHJ1Y3QgZzJkX2J1Zl9pbmZvICpidWZfaW5m
bzsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
