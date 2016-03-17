From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch 2/2] drm/exynos: mic: remove some dead code
Date: Thu, 17 Mar 2016 13:39:12 +0300
Message-ID: <20160317103912.GB3100@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

V2Uga25vdyAicmV0IiBpcyB6ZXJvIGFuZCB0aGUgdGVzdCBtYWtlcyBzdGF0aWMgY2hlY2tlcnMg
Y29tcGxhaW4gc28KbGV0J3MgZGVsZXRlIHRoaXMgcHJpbnRrLgoKU2lnbmVkLW9mZi1ieTogRGFu
IENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9taWMuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9taWMuYwppbmRleCA4OTBjOWIxLi4xMmRiMzUzIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fbWljLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfZHJtX21pYy5jCkBAIC0xMzAsOCArMTMwLDYgQEAgc3RhdGljIHZv
aWQgbWljX3NldF9wYXRoKHN0cnVjdCBleHlub3NfbWljICptaWMsIGJvb2wgZW5hYmxlKQogCQl2
YWwgJj0gfihNSUMwX1JHQl9NVVggfCBNSUMwX0k4MF9NVVggfCBNSUMwX09OX01VWCk7CiAKIAly
ZWdtYXBfd3JpdGUobWljLT5zeXNyZWcsIERTRF9DRkdfTVVYLCB2YWwpOwotCWlmIChyZXQpCi0J
CURSTV9FUlJPUigibWljOiBGYWlsZWQgdG8gcmVhZCBzeXN0ZW0gcmVnaXN0ZXJcbiIpOwogfQog
CiBzdGF0aWMgaW50IG1pY19zd19yZXNldChzdHJ1Y3QgZXh5bm9zX21pYyAqbWljKQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
