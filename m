From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/3] drm/exynos: add support for dynamic zpos in DECON and FIMD
Date: Thu, 06 Dec 2018 10:38:54 +0100
Message-ID: <20181206093857.22324-1-a.hajda@samsung.com>
References: <CGME20181206093905eucas1p133ead84adfb9dd7a9756ce91b6b35895@eucas1p1.samsung.com>
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
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgSW5raSwKClRoaXMgc21hbGwgcGF0Y2hzZXQgYWRkcyBkeW5hbWljIHpwb3Mgc3VwcG9ydCBm
b3IgREVDT04gYW5kIEZJTUQuCkl0IHdhcyB0ZXN0ZWQgb24gdG0yIGFuZCB0cmF0czIuCgpSZWdh
cmRzCkFuZHJ6ZWoKCgpBbmRyemVqIEhhamRhICgzKToKICBkcm0vZXh5bm9zL2RlY29uNTQzMzog
YWRkIGR5bmFtaWMgenBvcyBzdXBwb3J0CiAgZHJtL2V4eW5vcy9maW1kOiBjcmVhdGUgbG9jYWwg
aGVscGVyIGZvciBkaXNhYmxpbmcgaGFyZHdhcmUgd2luZG93CiAgZHJtL2V4eW5vcy9maW1kOiBh
ZGQgZHluYW1pYyB6cG9zIHN1cHBvcnQKCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0
MzNfZHJtX2RlY29uLmMgfCAyMyArKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1fZmltZC5jICAgICAgfCA0MiArKysrKysrKy0tLS0tLS0tLS0tCiAyIGZpbGVzIGNo
YW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
