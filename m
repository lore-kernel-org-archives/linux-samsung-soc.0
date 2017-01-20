From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/7] drm/exynos: add Ultra HD and interlace modes support to
 Exynos5433
Date: Fri, 20 Jan 2017 07:52:18 +0100
Message-ID: <1484895145-511-1-git-send-email-a.hajda@samsung.com>
References: <CGME20170120065229eucas1p22f0eed53220820b1145294029d4bd706@eucas1p2.samsung.com>
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
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgSW5raSwKClRoaXMgcGF0Y2hzZXQgYWRkcyBzdXBwb3J0IGZvciBVbHRyYUhEIGFuZCBpbnRy
ZWxhY2UgbW9kZXMgb24gREVDT04gYW5kIEhETUkKZHJpdmVycyBvZiBFeHlub3M1NDMzIGNoaXBz
ZXQuIFRvIGZ1bGx5IHN1cHBvcnQgaXQgb24gVE0yKGUpIHBsYXRmb3JtcyBNSEwKcGF0Y2hlcyBh
cmUgYWxzZSByZXF1aXJlZCB3aGljaCB3aWxsIGJlIHBvc3RlZCBpbiBzZXBhcmF0ZSBwYXRjaHNl
dC4KCktyenlzenRvZiwgRFRTIHBhdGNoIGRvIG5vdCBkZXBlbmQgb24gdGhlIHByZXZpb3VzIHBh
dGNoZXMsIHNvIHRoZXJlIGlzCm5vIG5lZWQgdG8gc3luY2hyb25pemUgYnJhbmNoZXMuCgpSZWdh
cmRzCkFuZHJ6ZWoKCgpBbmRyemVqIEhhamRhICg3KToKICBkcm0vZXh5bm9zL2hkbWk6IGFkZCAy
OTdNSHogcGl4ZWwgY2xvY2sgc3VwcG9ydAogIGRybS9leHlub3MvaGRtaTogZml4IFZTSSBpbmZv
ZnJhbWUgcmVnaXN0ZXJzCiAgZHJtL2V4eW5vcy9oZG1pOiBmaXggUExMIGZvciAyN01IeiBzZXR0
aW5ncwogIGRybS9leHlub3MvaGRtaTogYWRkIGJyaWRnZSBzdXBwb3J0CiAgZHJtL2V4eW5vcy9k
ZWNvbjU0MzM6IGFkZCBzdXBwb3J0IGZvciBpbnRlcmxhY2UgbW9kZXMKICBkcm0vZXh5bm9zL2Rl
Y29uNTQzMzogc2lnbmFsIHZibGFuayBvbmx5IG9uIG9kZCBmaWVsZHMKICBhcm02NDogZHRzOiBl
eHlub3M6IGNvbmZpZ3VyZSBUViBwYXRoIGNsb2NrcyBmb3IgVWx0cmEgSEQgbW9kZXMKCiBhcmNo
L2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLmR0c2kgICAgfCAgMyArCiBkcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2RlY29uLmMgfCA1MiArKysrKysrKysrKyst
LS0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfaGRtaS5jICAgICAgICAgIHwgODAg
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tCiBpbmNsdWRlL3ZpZGVvL2V4eW5vczU0MzNfZGVj
b24uaCAgICAgICAgICAgICAgfCAgMiArCiA0IGZpbGVzIGNoYW5nZWQsIDEwNyBpbnNlcnRpb25z
KCspLCAzMCBkZWxldGlvbnMoLSkKCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
