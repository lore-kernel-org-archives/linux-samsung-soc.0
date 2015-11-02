From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/7] drm/exynos/hdmi: add Exynos5433 support
Date: Mon, 02 Nov 2015 14:16:38 +0100
Message-ID: <1446470205-15606-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
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
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgSW5raSwgS3J6eXN6dG9mLAoKVGhpcyBwYXRjaHNldCBhZGRzIHN1cHBvcnQgZm9yIEV4eW5v
cyA1NDMzIEhETUkuClRoZXJlIGFyZSBhbHNvIGZldyBwcmVwYXJhdGlvbi9jbGVhbnVwIHBhdGNo
ZXMuCkFsbCBwYXRjaGVzIGV4Y2VwdCBvbmUgdG91Y2ggb25seSBleHlub3MtZHJtLgpTaXh0aCBw
YXRjaCBhZGRzIGJpbmRpbmcgcHJvcGVydGllcyBmb3IgRXh5bm9zNTQzMyBIRE1JLApLcnp5c3p0
b2YgY291bGQgeW91IGxvb2sgYXQgaXQuCgpUaGUgcGF0Y2hzZXQgaXMgYmFzZWQgb24gZXh5bm9z
LWRybS1uZXh0LgoKUmVnYXJkcwpBbmRyemVqCgoKQW5kcnplaiBIYWpkYSAoNyk6CiAgZHJtL2V4
eW5vcy9oZG1pOiBjbG9jayBjb2RlIHJlLWZhY3RvcmluZwogIGRybS9leHlub3MvaGRtaTogY29u
c3RpZnkgZ2xvYmFsIHZhcmlhYmxlcwogIGRybS9leHlub3MvaGRtaTogdXNlIGFycmF5IHNwZWNp
ZmllciBmb3IgSERNSS1QSFkgY29uZmlndXJhdGlvbnMKICBkcm0vZXh5bm9zL2hkbWk6IGNvZGUg
Y2xlYW51cAogIGRybS9leHlub3MvaGRtaTogc3RvcCBwcm9ncmFtbWluZyByZWdpc3RlcnMgd2l0
aCBkZWZhdWx0IHZhbHVlcwogIGR0LWJpbmRpbmdzOiBleHlub3NfaGRtaTogYWRkIGJpbmRpbmdz
IGZvciBFeHlub3M1NDMzIHZhcmlhbnQKICBkcm0vZXh5bm9zL2hkbWk6IGFkZCBFeHlub3M1NDMz
IHN1cHBvcnQKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy92aWRlby9leHlub3NfaGRtaS50eHQg
ICAgICB8ICAyNyArLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfaGRtaS5jICAgICAg
ICAgICAgICAgfCA0NTQgKysrKysrKysrKysrKysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL3JlZ3MtaGRtaS5oICAgICAgICAgICAgICAgICB8ICAgOSArLQogMyBmaWxlcyBjaGFuZ2Vk
LCAzNTIgaW5zZXJ0aW9ucygrKSwgMTM4IGRlbGV0aW9ucygtKQoKLS0gCjEuOS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
