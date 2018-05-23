From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/3] Exynos DRM - add 2 more planes to Decon on Exynos5433
Date: Wed, 23 May 2018 12:59:59 +0200
Message-ID: <20180523110002.25512-1-m.szyprowski@samsung.com>
References: <CGME20180523110016eucas1p1d92dd44b2012805dfbc754a872617bc1@eucas1p1.samsung.com>
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
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

RGVhciBhbGwsCgpUaGlzIHBhdGNoc2V0IGVuYWJsZXMgc3VwcG9ydCBmb3IgMiBtb3JlIGhhcmR3
YXJlIHdpbmRvd3MgaW4gRXh5bm9zNTQzMwpEZWNvbidzLCB3aGF0IGdpdmVzIHVzIDIgbW9yZSBv
dmVybGF5IHBsYW5lcy4gVGhpcyByZXF1aXJlIGVuYWJsaW5nCmEgZmV3IG1vcmUgY2xvY2tzIHRv
IGdldCBpdCB3b3JraW5nIHByb3Blcmx5LgoKTXkgbWVyZ2UgcGxhbiBmb3IgdGhpcyBwYXRjaHNl
dDoKMS4gZHRzIChwYXRjaCAyLzMpIC0gcGxlYXNlIHNjaGVkdWxlIGZvciB2NC4xOCBtZXJnZSB3
aW5kb3cKMi4gZHJpdmVyIChwYXRjaCAzLzMpIC0gcGxlYXNlIHNjaGVkdWxlIGZvciB0aGUgbmV4
dCByZWxlYXNlIGFmdGVyIGR0cyBpcwogICBtZXJnZWQKMy4gYmluZGluZ3MgKHBhdGNoIDEvMykg
LSBwcm9iYWJseSBjYW4gZ28gdG9nZXRoZXIgd2l0aCB0aGUgZHJpdmVyIHBhdGNoCgpCZXN0IHJl
Z2FyZHMKTWFyZWsgU3p5cHJvd3NraQpTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kCgpNYXJl
ayBTenlwcm93c2tpICgzKToKICBkdC1iaW5kaW5nczogZXh5bm9zNTQzMy1kZWNvbjogYWRkIG1v
cmUgcmVxdWlyZWQgY2xvY2tzCiAgYXJtNjQ6IGR0czogZXh5bm9zOiBBZGQgbW9yZSBjbG9ja3Mg
dG8gRXh5bm9zNTQzMyBEZWNvbiBhbmQgRGVjb25UVgogIGRybS9leHlub3M6IGRlY29uOiBBZGQg
c3VwcG9ydCBmb3IgaGFyZHdhcmUgd2luZG93cyBubyA0IGFuZCA1CgogLi4uL2Rpc3BsYXkvZXh5
bm9zL2V4eW5vczU0MzMtZGVjb24udHh0ICAgICAgIHwgIDkgKysrKysrLS0KIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvZXh5bm9zL2V4eW5vczU0MzMuZHRzaSAgICB8IDE0ICsrKysrKysrKysrLS0KIGRy
aXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zNTQzM19kcm1fZGVjb24uYyB8IDIxICsrKysrKysr
KysrLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRp
b25zKC0pCgotLSAKMi4xNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
