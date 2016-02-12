From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 00/10] Exynos DRM: various fixes for 64bit and Exynos5433
Date: Fri, 12 Feb 2016 10:19:37 +0100
Message-ID: <56BDA3A9.5020807@samsung.com>
References: <1454503374-16382-1-git-send-email-m.szyprowski@samsung.com>
 <CACvgo515c0qooM2Qjks9TYaRisprEV8OB82J1p5GE9f0mn43sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CACvgo515c0qooM2Qjks9TYaRisprEV8OB82J1p5GE9f0mn43sQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Emil Velikov <emil.l.velikov@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, ML dri-devel <dri-devel@lists.freedesktop.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgRW1pbCwKCgpPbiAwMi8wOC8yMDE2IDEyOjE0IFBNLCBFbWlsIFZlbGlrb3Ygd3JvdGU6Cj4g
SGkgTWFyZWssCj4gCj4gT24gMyBGZWJydWFyeSAyMDE2IGF0IDEyOjQyLCBNYXJlayBTenlwcm93
c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+PiBIZWxsbyBhbGwsCj4+Cj4+
IFRoaXMgcGF0Y2ggc2VyaWVzIGlzIGEgc2V0IG9mIHZhcmlvdXMgZml4ZXMgdG8gZ2V0IEV4eW5v
cyBEUk0gd29ya2luZyBvbgo+PiBFeHlub3MgNTQzMyBTb0NzIGFuZCA2NGJpdCBBUk02NCBhcmNo
aXRlY3R1cmUuCj4+Cj4gQXMgeW91IG1lbnRpb25lZCAiNjRiaXQgRXh5bm9zIiBkZXZpY2VzLCBJ
J20gd29uZGVyaW5nIGlmIHlvdSdsbCBoYXZlCj4gc29tZSBpbnB1dCBvbiB0aGUgY3VycmVudCBl
eHlub3MgZHJtIEFCSSBhcyBtZW50aW9uZWQgaGVyZSBbMV0uIEkuZS4KPiBpdCBmZWVscyBicm9r
ZW4gd2hlbiB1c2luZyAzMmJpdCB1c2Vyc3BhY2Ugb24gNjQgYml0IGtlcm5lbCBkdWUgdG8gdGhl
Cj4gdXNlIG9mIHVuc2lnbmVkIGludCBhbmQgYWxpa2UgdHlwZXMuIFNob3VsZCB3ZSByZXBsYWNl
IHRoZW0gKGZpeAo+IHRoaW5ncykgd2l0aCBleHBsaWNpdGx5IHNpemVkIG9uZXMgLSBfdTMyLzY0
Lgo+IAo+IERvZXMgdGhhdCBzb3VuZCByZWFzb25hYmxlLCBpcyBhbnlvbmUgZnJvbSB0aGUgRXh5
bm9zIHRlYW0gaW50ZXJlc3RlZAo+IGluIHNvcnRpbmcgaXQgb3V0ID8KCkkgd2lsbCB0YWtlIGNh
cmUgb2YgaXQuClRoYW5rcyBvZiBwb2ludGluZyBpdCBvdXQuCgpSZWdhcmRzCkFuZHJ6ZWoKCj4g
Cj4gUmVnYXJkcywKPiBFbWlsCj4gCj4gWzFdIGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE2LUphbnVhcnkvMDk5NTQ3Lmh0bWwKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
