From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm: Exynos: Respect framebuffer pitch for FIMD/Mixer
Date: Thu, 26 Mar 2015 23:32:30 +0900
Message-ID: <5514187E.60405@samsung.com>
References: <1426598698-31095-1-git-send-email-daniels@collabora.com>
 <CABxcv==Z0ccmR-3Hasnkmg14m3hBJEwha=6c6288jQPUhyQt-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CABxcv==Z0ccmR-3Hasnkmg14m3hBJEwha=6c6288jQPUhyQt-g@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Daniel Stone <daniels@collabora.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGVsbG8gSmF2aWVyLAoKQXBwbGllZC4KCkNvdWxkIHlvdSB1c2UgcmlnaHQgcHJlZml4IG9mIHRo
ZSBzdWJqZWN0IGxpa2UgYmVsb3cgd2hlbiB5b3UgcG9zdCBwYXRjaD8KCidkcm0vZXh5bm9zOiAu
Li4nLCBub3QgJ2RybTogRXh5bm9zOiAuLi4nCgpZb3VyIGVtYWlsIHdpbGwgYmUgZmlsdGVyZWQg
ZnJvbSBteSBtYWlsYm94IGlmIHlvdSBkb24ndCB1c2UgdGhlIHJpZ2h0CnByZWZpeCBzbyBJIGNv
dWxkbid0IGNoZWNrIGFuZCB0YWtlIGNhcmUgb2YgeW91ciBwYXRjaC4KClRoYW5rcywKSW5raSBE
YWUKCk9uIDIwMTXrhYQgMDPsm5QgMjTsnbwgMTc6NTcsIEphdmllciBNYXJ0aW5leiBDYW5pbGxh
cyB3cm90ZToKPiBIZWxsbyBJbmtpLAo+IAo+IE9uIFR1ZSwgTWFyIDE3LCAyMDE1IGF0IDI6MjQg
UE0sIERhbmllbCBTdG9uZSA8ZGFuaWVsc0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPj4gV2hlbiBw
ZXJmb3JtaW5nIGEgbW9kZXNldCwgdXNlIHRoZSBmcmFtZWJ1ZmZlciBwaXRjaCB2YWx1ZSB0byBz
ZXQgRklNRAo+PiBJTUdfU0laRSBhbmQgTWl4ZXIgU1BBTiByZWdpc3RlcnMuIFRoZXNlIGFyZSBi
b3RoIGRlZmluZWQgYXMgcGl0Y2ggLSB0aGUKPj4gZGlzdGFuY2UgYmV0d2VlbiBjb250aWd1b3Vz
IGxpbmVzIChieXRlcyBmb3IgRklNRCwgcGl4ZWxzIGZvciBtaXhlcikuCj4+Cj4+IEZpeGVzIGRp
c3BsYXkgb24gU25vdyAoMTM2Nng3NjgpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgU3Rv
bmUgPGRhbmllbHNAY29sbGFib3JhLmNvbT4KPj4gVGVzdGVkLWJ5OiBKYXZpZXIgTWFydGluZXog
Q2FuaWxsYXMgPGphdmllci5tYXJ0aW5lekBjb2xsYWJvcmEuY28udWs+Cj4gCj4gQW55IGNvbW1l
bnRzIG9uIHRoaXMgcGF0Y2g/IEl0IHdvdWxkIGJlIGdyZWF0IHRvIHBpY2sgdGhpcyBzb29uZXIK
PiByYXRoZXIgdGhhbiBsYXRlciBzaW5jZSBpdCBmaXhlcyAoYXQgbGVhc3QpIGRpc3BsYXkgb3V0
cHV0IG9uIFNub3cgYW5kCj4gSERNSSBvdXRwdXQgb24gUGVhY2ggUGl0L1BpLgo+IAo+IEJlc3Qg
cmVnYXJkcywKPiBKYXZpZXIKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
