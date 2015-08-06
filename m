From: Yakir Yang <ykk@rock-chips.com>
Subject: [RFC PATCH 8/8] drm: bridge/analogix_dp: expand the delay time for
 hpd detect
Date: Thu,  6 Aug 2015 09:26:33 -0500
Message-ID: <1438871193-24067-1-git-send-email-ykk@rock-chips.com>
References: <1438868947-22132-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1438868947-22132-1-git-send-email-ykk@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Heiko Stuebner <heiko@sntech.de>, Russell King <rmk+kernel@arm.linux.org.uk>, Fabio Estevam <fabio.estevam@freescale.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Yakir Yang <ykk@rock-chips.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Ajay Kumar <ajaykumar.rs@samsung.com>, linux-samsung-soc@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Thierry Reding <treding@nvidia.com>, dianders@google.com, linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, djkurtz@google.com, Andy Yan <andy.yan@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

U29tZSBlZHAgc2NyZWVuIHdpdGggbm8gaHBkIHNpZ25hbCB3b3VsZCBuZWVkIHNvbWUgZGVsYXkg
dGltZQp0byBlbnN1cmUgdGhhdCBzY3JlZW4gd291bGQgYmUgcmVhZHkgZm9yIHdvcmssIHNvIHdl
IGNhbiBleHBhbmQKdGhlIGRlbGF5IHRpbWUgaW4gaHBkIGRldGVjdCBmdW5jdGlvbiwgaXQgd29y
a3MgcHJlZmVjdGx5IG9uIG15CnJrMzI4OCBzZGsgYm9hcmQuCgpTaWduZWQtb2ZmLWJ5OiBZYWtp
ciBZYW5nIDx5a2tAcm9jay1jaGlwcy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
bmFsb2dpeF9kcF9jb3JlLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxv
Z2l4X2RwX2NvcmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXhfZHBfY29yZS5j
CmluZGV4IDdlNjdmMTkuLjQ0N2M5NGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvYW5hbG9naXhfZHBfY29yZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9n
aXhfZHBfY29yZS5jCkBAIC03Myw3ICs3Myw3IEBAIHN0YXRpYyBpbnQgYW5hbG9naXhfZHBfZGV0
ZWN0X2hwZChzdHJ1Y3QgYW5hbG9naXhfZHBfZGV2aWNlICpkcCkKIAkJCXJldHVybiAwOwogCiAJ
CXRpbWVvdXRfbG9vcCsrOwotCQl1c2xlZXBfcmFuZ2UoMTAsIDExKTsKKwkJdXNsZWVwX3Jhbmdl
KDEwMCwgMTEwKTsKIAl9CiAKIAkvKgotLSAKMi4xLjIKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
