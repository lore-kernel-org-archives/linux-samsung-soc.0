From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 6/7] drm/exynos/decon5433: signal vblank only on odd fields
Date: Mon, 23 Jan 2017 10:15:16 +0100
Message-ID: <953193f0-484e-0457-baf4-e42b44a3f147@samsung.com>
References: <1484895145-511-1-git-send-email-a.hajda@samsung.com>
 <CGME20170120065231eucas1p121d2a987695fdce00e1b2bba445f1818@eucas1p1.samsung.com>
 <1484895145-511-7-git-send-email-a.hajda@samsung.com>
 <20170120135540.GC31595@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20170120135540.GC31595@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjAuMDEuMjAxNyAxNDo1NSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+IE9uIEZyaSwgSmFu
IDIwLCAyMDE3IGF0IDA3OjUyOjI0QU0gKzAxMDAsIEFuZHJ6ZWogSGFqZGEgd3JvdGU6Cj4+IElu
IGNhc2Ugb2YgaW50ZXJsYWNlIG1vZGUgaXJxIGlzIGdlbmVyYXRlZCBmb3Igb2RkIGFuZCBldmVu
IGZpZWxkcywgYnV0Cj4+IHZibGFuayBzaG91bGQgYmUgc2lnbmFsZWQgb25seSBmb3IgdGhlIGxh
c3QgZW1pdHRlZCBmaWVsZC4KPiBJJ20gcHJldHR5IHN1cmUgbW9zdCBkcml2ZXJzIHNpZ25hbCBp
dCBmb3IgYm90aCBmaWVsZHMuIEF0IGxlYXN0IGk5MTUKPiBkb2VzLgoKVGhlIHF1ZXN0aW9uIGlz
IHdoaWNoIGJlaGF2aW9yIGlzIGNvcnJlY3Q/IEkgaGF2ZSBub3QgZm91bmQgYW55IGNsZWFyCnN0
YXRlbWVudCBpbiB0aGUgZG9jdW1lbnRhdGlvbiwgb3IgZHJtIGNvcmUgY29kZS4KSSBoYXZlIGd1
ZXNzZWQgdGhhdCBzaW5jZSB2YmxhbmsgZXZlbnQgaXMgdXNlZCB0byBzaWduYWwgZW5kIG9mIHNj
YW4tb3V0Cm9mIGJ1ZmZlciBpdCBzaG91bGQgYmUgY2FsbGVkIGFmdGVyIHNjYW4tb3V0IG9mIHdo
b2xlIGJ1ZmZlciAtIGluIGNhc2UKb2YgaW50ZXJsYWNlZCBtb2RlIGFmdGVyIHNjYW4tb3V0IG9m
IDJuZCBmaWVsZC4KTWF5YmUgbXkgYXNzdW1wdGlvbiBpcyB3cm9uZywgaW4gc3VjaCBjYXNlIHRo
aXMgcGF0Y2ggc2hvdWxkIGJlIGRyb3BwZWQKYW5kIG1peGVyIGRyaXZlciBhbHNvIHNob3VsZCBi
ZSBmaXhlZCwgYnV0IGJlZm9yZSBkb2luZyB0aGF0IGl0IHdvdWxkIGJlCmdvb2QgdG8ga25vdyBm
b3Igc3VyZSBob3cgaXQgc2hvdWxkIGJlIGhhbmRsZWQgY29ycmVjdGx5LgoKUmVnYXJkcwpBbmRy
emVqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
