From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 0/4] drm/exynos: mixer: small optimisations
Date: Thu, 22 Sep 2016 16:57:16 +0200
Message-ID: <1474556240-14055-1-git-send-email-tjakobi@math.uni-bielefeld.de>
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
To: linux-samsung-soc@vger.kernel.org
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

SGVsbG8sCgpoZXJlJ3MgdjIgb2YgdGhpcyBwYXRjaHNldC4gSSd2ZSBhZGRlZCB0d28gb3RoZXIg
J2Nvc21ldGljJyBwYXRjaGVzIGFzIHdlbGwuCgpBbnl3YXksIEkgaGF2ZSBmaXhlZCB1cCB0aGUg
c2Vjb25kIHBhdGNoIGFuZCBpbnRlZ3JhdGVkIEFuZHJ6ZWoncyBzdWdnZXN0aW9ucy4gRmlyc3Qg
cGF0Y2ggaXMgdW5tb2RpZmllZCBleGNlcHQgZm9yIHRoZSBSZXZpZXdlZC1CeSB0YWcuCgpXaXRo
IGJlc3Qgd2lzaGVzLApUb2JpYXMKClRvYmlhcyBKYWtvYmkgKDQpOgogIGRybS9leHlub3M6IG1p
eGVyOiBjb252ZXJ0IGJvb2xlYW5zIHRvIGZsYWdzIGluIG1peGVyIGNvbnRleHQKICBkcm0vZXh5
bm9zOiBtaXhlcjogY29uZmlndXJlIGxheWVycyBvbmNlIGluIG1peGVyX2F0b21pY19mbHVzaCgp
CiAgZHJtL2V4eW5vczogbWl4ZXI6IHNpbXBsaWZ5IGxvb3AgaW4gdnBfd2luX3Jlc2V0KCkKICBk
cm0vZXh5bm9zOiBnMmQ6IGJlYXV0aWZ5IHByb2JpbmcgbWVzc2FnZQoKIGRyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9nMmQuYyB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL2V4eW5v
cy9leHlub3NfbWl4ZXIuYyAgIHwgMTg3ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
CiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL3JlZ3MtbWl4ZXIuaCAgICAgfCAgIDIgKwogMyBmaWxl
cyBjaGFuZ2VkLCAxMjAgaW5zZXJ0aW9ucygrKSwgNzEgZGVsZXRpb25zKC0pCgotLSAKMi43LjMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
