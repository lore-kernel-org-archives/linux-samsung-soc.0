From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/2] [media] s5p-g2d: Replace old driver with DRM version
Date: Wed, 13 Jul 2016 09:59:06 +0200
Message-ID: <5785F4CA.8070908@samsung.com>
References: <1464096493-13378-1-git-send-email-k.kozlowski@samsung.com>
 <1464096493-13378-2-git-send-email-k.kozlowski@samsung.com>
 <20160712200202.7496445e@recife.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20160712200202.7496445e@recife.lan>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Kamil Debski <k.debski@samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDcvMTMvMjAxNiAwMTowMiBBTSwgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIHdyb3RlOgo+IEkg
c3VzcGVjdCB0aGF0IHlvdSdsbCBiZSBhcHBseWluZyB0aGlzIG9uZSB2aWEgRFJNIHRyZWUsIHNv
Ogo+IAo+IEVtIFR1ZSwgMjQgTWF5IDIwMTYgMTU6Mjg6MTMgKzAyMDAKPiBLcnp5c3p0b2YgS296
bG93c2tpIDxrLmtvemxvd3NraUBzYW1zdW5nLmNvbT4gZXNjcmV2ZXU6Cj4gCj4+IFJlbW92ZSB0
aGUgb2xkIG5vbi1EUk0gZHJpdmVyIGJlY2F1c2UgaXQgaXMgbm93IGVudGlyZWx5IHN1cHBvcnRl
ZCBieQo+PiBleHlub3NfZHJtX2cyZCBkcml2ZXIuCj4+Cj4+IENjOiBLeXVuZ21pbiBQYXJrIDxr
eXVuZ21pbi5wYXJrQHNhbXN1bmcuY29tPgo+PiBDYzogS2FtaWwgRGVic2tpIDxrLmRlYnNraUBz
YW1zdW5nLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8ay5rb3ps
b3dza2lAc2Ftc3VuZy5jb20+Cj4gCj4gQWNrZWQtYnk6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8
bWNoZWhhYkBzLW9wZW5zb3VyY2UuY29tPgo+IAo+IFBTLjogSWYgeW91IHByZWZlciB0byBhcHBs
eSB0aGlzIG9uZSB2aWEgbXkgdHJlZSwgSSdtIG9rIHRvby4gSnVzdAo+IGxldCBtZSBrbm93IHdo
ZW4gdGhlIGZpcnN0IHBhdGNoIGdldHMgbWVyZ2VkIHVwc3RyZWFtLgoKVGhpcyBwYXRjaHNldCB3
YXMgaW5zdWZmaWNpZW50IGFuZCBJIGRpZG4ndCBjYW1lIHVwIHdpdGggZm9sbG93IHVwLgpQbGVh
c2UgaWdub3JlIGl0IGZvciBub3cuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
