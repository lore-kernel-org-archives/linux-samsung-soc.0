From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v3 1/7] drm/exynos: rename zpos to index
Date: Mon, 04 Jan 2016 21:42:59 +0900
Message-ID: <568A68D3.6080806@samsung.com>
References: <1450268508-15028-1-git-send-email-m.szyprowski@samsung.com>
 <1450268508-15028-2-git-send-email-m.szyprowski@samsung.com>
 <567BA9B1.5020607@samsung.com> <56812C60.2070209@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <56812C60.2070209@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgTWFyZWssCgoyMDE164WEIDEy7JuUIDI47J28IDIxOjM07JeQIE1hcmVrIFN6eXByb3dza2kg
7J20KOqwgCkg7JO0IOq4gDoKPiBIZWxsbywKPiAKPiBPbiAyMDE1LTEyLTI0IDA5OjE1LCBJbmtp
IERhZSB3cm90ZToKPj4gU2VlbXMgdGhpcyBwYXRjaCBjb3VsZCBiZSBtb3JlIGNsZWFuZWQgdXAu
Cj4+Cj4+IEVhY2ggY3R4IG9iamVjdCBvZiBlYWNoIGNydGMgZHJpdmVyIGhhcyBpdHMgb3duIHBs
YW5lIGNvbmZpZyBvYmplY3Qgd2hpY2ggaW5jbHVkZXMgYWxyZWFkeSB6cG9zIHZhbHVlLgo+PiBT
byBJIHRoaW5rIHdlIHdvdWxkbid0IG5lZWQgdG8ga2VlcCB6cG9zIG9mIHRoZSBwbGFuZSBjb25m
aWcgYW5kIGluZGV4IG9mIHRoZSBwbGFuZSBvYmplY3QuCj4+IEhvdyBhYm91dCByZW1vdmluZyBp
bmRleCBmcm9tIGV4eW5vcyBwbGFuZSBzdHJ1Y3R1cmUgYW5kIHVzaW5nIHpwb3Mgb2YgZXh5bm9z
IHBsYW5lIGNvbmZpZyBzdHJ1Y3R1cmUgaW5zdGVhZD8KPj4KPj4gQmVsb3cgcGF0Y2ggY2FuIGJl
IGFwcGxpZWQgb24gdG9wIG9mIHlvdXIgcGF0Y2gsCj4gCj4gSWYgeW91IHdhbnQgSSBjYW4gbW92
ZSAnaW5kZXgnIGVudHJ5IHRvIGNvbmZpZyBvYmplY3QsIGJ1dCB0aGUgaW5pdGlhbCB6cG9zIHZh
bHVlCj4gc2hvdWxkIGFsc28gYmUgdGhlcmUuIFBsZWFzZSBub3RlIHRoYXQgaW5kZXggaXMgbm90
IGFsd2F5cyBlcXVhbCB0byB0aGUgaW5pdGlhbCB6cG9zCj4gYW5kIGhhdmluZyBpbml0aWFsIHpw
b3MgY29uZmlndXJhYmxlIGlzIGFsc28gbmVlZGVkLiBUaGVyZSB3ZXJlIGFscmVhZHkgY29uY2Vy
bnMgaWYKPiBtaXhlcidzIGRlZGljYXRlZCB2aWRlbyBwbGFuZSBzaG91bGQgYmUgYmVsb3cgb3Ig
YWJvdmUgdGhlIHByaW1hcnkgZ2Z4IHBsYW5lIGluIHRoZQo+IGRlZmF1bHQgY29uZmlndXJhdGlv
bi4KCk1lcmdlZCBhbGwgcGF0Y2hlcy4KClRoYW5rcywKSW5raSBEYWUKCj4gCj4+ICguLi4pCj4g
Cj4gQmVzdCByZWdhcmRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
