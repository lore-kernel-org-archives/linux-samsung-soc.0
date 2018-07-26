From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: exynos: arndale: use i2c-gpio for HDMI-DDC
Date: Thu, 26 Jul 2018 13:51:44 +0200
Message-ID: <CAJKOXPe_YKhgm_e0U3uu2PJ2Edg=Zcsjd0FOSFgew5WMMkoGMg@mail.gmail.com>
References: <CGME20180726101245eucas1p16d84c77490d9eb81300f38c2f3fb34a5@eucas1p1.samsung.com>
 <20180726101228.14956-1-a.hajda@samsung.com>
 <CAJKOXPd-59v78yDRtUA=5aqmuac8Gxu2JWwrbR44Wn3jXr+nJw@mail.gmail.com>
 <20180726110451eucas1p1cddb55c0c0feeb2494e6199445773c8a~E5mQ6hXvs0711807118eucas1p1l@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180726110451eucas1p1cddb55c0c0feeb2494e6199445773c8a~E5mQ6hXvs0711807118eucas1p1l@eucas1p1.samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjYgSnVseSAyMDE4IGF0IDEzOjA0LCBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcu
Y29tPiB3cm90ZToKPiBPbiAyNi4wNy4yMDE4IDEyOjIzLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+PiBPbiAyNiBKdWx5IDIwMTggYXQgMTI6MTIsIEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFA
c2Ftc3VuZy5jb20+IHdyb3RlOgo+Pj4gSERNSS1EREMgZm9yIHVua25vd24gcmVhc29ucyBkb2Vz
bid0IHdvcmsgd2l0aCBFeHlub3MgSTJDCj4+PiBjb250cm9sbGVycy4gRm9ydHVuYXRlbHkgaTJj
LWdwaW8gY29tZXMgdG8gdGhlIHJlc2N1ZS4KPj4gV2FpdC4uLiB3aGF0PyBUaGUgSTJDIGNvbnRy
b2xsZXIgb24gU29DIChvciBpdHMgZHJpdmVyKSBpcyBidWdneSBpbgo+PiBzb21lIHdheSBhbmQg
d2UgbmVlZCB0byB1c2UgdGhlc2UgcGlucyBhcyBHUElPIHRvIHJ1biBpMmMtZ3BpbyBkcml2ZXIK
Pj4gdGhlcmU/IEl0IGxvb2tzIGxpa2Ugd29ya2Fyb3VuZCBub3QgYSBwcm9wZXIgc29sdXRpb24u
Li4KPgo+IEJ1dCBhdCBsZWFzdCB3b3JraW5nIG9uZSA6KSBCZXR0ZXIgc29sdXRpb25zIGFyZSB3
ZWxjb21lLgo+IFRoaXMgc2VlbXMgdG8gYmUgbm90IHVuY29tbW9uIGlzc3VlLCBpZiB5b3UgZm9y
IGV4YW1wbGUgbG9vayBpbnRvIG9kcm9pZAo+IHZlbmRvciBrZXJuZWwgeW91IGNhbiBldmVuIGZp
bmQgaGFyZGNvZGVkIEVESURzIDopCgpJIGFtIG5vdCBzdXJlIHdoZXRoZXIgaGFyZGtlcm5lbCdz
IHRyZWUgaXMgYSBnb29kIGFyZ3VtZW50LiBUaGV5IHRvb2sKdmVuZG9yJ3MgdHJlZSBhbmQgYXBw
bHkgd2hhdGV2ZXIgcGF0Y2hlcy9maXhlcyBhcmUgbmVlZGVkIHRvIGJyaW5nIGl0CnVwLiBUaGV5
IGRvIG5vdCBoYXZlIHRpbWUgdG8gbG9vayBmb3IgY29ycmVjdCAodGhlICJiZXN0IikgZml4ZXMu
IFRoZXkKY2hvb3NlIHdoYXRldmVyIGlzIHdvcmtpbmcgbm93LgpCZXR0ZXIgc29sdXRpb24gd291
bGQgYmUgdG8gc3BlbmQgbW9udGhzIGFuZCBmaXggdGhlIGRyaXZlci4gOikKCkNhbiB5b3UgYXQg
bGVhc3QgbWVudGlvbiBuZXh0IHRvIGkyYy1ncGlvIG5vZGUgdGhhdCBpdCByZXBsYWNlcyBpMmNf
MgpiZWNhdXNlIG9mIHRoaXM/CgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
