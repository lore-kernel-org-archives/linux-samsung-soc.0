From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/2] clk: samsung: exynos5260: Move struct samsung_cmu_info
 to init section
Date: Thu, 25 Aug 2016 16:28:22 +0900
Message-ID: <57BE9E16.7090309@samsung.com>
References: <1471834185-20249-1-git-send-email-cw00.choi@samsung.com>
 <1471834185-20249-2-git-send-email-cw00.choi@samsung.com>
 <CGME20160823005523epcas1p3993794ba487bb055cbf8a0b247fcb280@epcas1p3.samsung.com>
 <20160823005512.GP6502@codeaurora.org> <57BBB66E.2060807@samsung.com>
 <84e40b9b-1e08-24e0-f1ef-60b38b760ae6@samsung.com>
 <20160824044346.GR6502@codeaurora.org> <57BD5CFB.5050500@samsung.com>
 <20160825001109.GO19826@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20160825001109.GO19826@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, mturquette@baylibre.com, tomasz.figa@gmail.com, linux-kernel@vger.kernel.org, kgene@kernel.org, chanwoo@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

SGkgU3RlcGhlbiwKCk9uIDIwMTbrhYQgMDjsm5QgMjXsnbwgMDk6MTEsIFN0ZXBoZW4gQm95ZCB3
cm90ZToKPiBPbiAwOC8yNCwgQ2hhbndvbyBDaG9pIHdyb3RlOgo+PiBPbiAyMDE264WEIDA47JuU
IDI07J28IDEzOjQzLCBTdGVwaGVuIEJveWQgd3JvdGU6Cj4+PiBPbiAwOC8yMywgU3lsd2VzdGVy
IE5hd3JvY2tpIHdyb3RlOgo+Pj4+IFNvIHRoZSBzYXZpbmcgaXMgcmF0aGVyIGluc2lnbmlmaWNh
bnQgYnV0IHRoZSBwYXRjaCBkb2Vzbid0IG1ha2UKPj4+PiB0aGluZ3Mgd29yc2UgYW5kIEknZCBz
YXkgaXQgbWlnaHQgYmUgd29ydGggYXBwbHlpbmcuCj4+Pj4KPj4+Cj4+PiBTb3VuZHMgZ29vZC4g
VGhpcyBzb3J0IG9mIGluZm9ybWF0aW9uIHNob3VsZCBiZSBpbiB0aGUgY29tbWl0Cj4+PiB0ZXh0
IHRob3VnaC4gVGFsa2luZyBhYm91dCBjb25zdCBkb2Vzbid0IG1ha2UgYW55IHNlbnNlIHRvIG1l
Lgo+Pgo+PiBEbyB5b3UgbWVhbiB0aGF0ICdjb25zdCcgaXMgaW5pdGNvbnN0IHNlY2lvbj8KPiAK
PiBOby4gTWFya2luZyBpdCBhcyBpbml0Y29uc3QgaW4gdGhlIHBhdGNoIGlzIGNvcnJlY3QuCgpP
Sy4KCj4gCj4+IElmIHBvc3NpYmxlLCBjb3VsZCB5b3UgZXhwbGFpbiB0aGUgYW55dGhpbmcKPj4g
d2h5IHlvdSBkb24ndCBtYWtlIHNlbnNlIGFib3V0ICdjb25zdCc/Cj4+Cj4gCj4gSSdtIGp1c3Qg
c2F5aW5nIHRoYXQgdGhlIHJlYXNvbmluZyB0byBtb3ZlIGl0IGZyb20gdGhlIHRleHQKPiBzZWN0
aW9uIHRvIHRoZSBkYXRhIHNlY3Rpb24gc2hvdWxkbid0IGJlIGJlY2F1c2Ugb2YgY29uc3QuIFRo
ZXJlCj4gc2hvdWxkIGJlIGJldHRlciByZWFzb25zIHRvIGRvIHRoaXMsIGxpa2Ugc2l6ZSBiZW5l
Zml0cy4KPiAKCkFzIEkgYWxyZWFkeSBzYWlkLCB0aGUgc2Ftc3VuZ19jbXVfcmVnaXN0ZXJfb24o
KSByZXF1aXJlcwp0aGUgJ2NvbnN0JyB0eXBlIGFyZ3VtZW50IGZvciAnc3RydWN0IHNhbXN1bmdf
Y211X2luZm8nLgoKU28sIEkgZGVmaW5lZCB0aGUgaW5zdGFuY2Ugb24gdGhlIG91dCBvZiB0aGUg
ZXh5bm9zNTI2MF9jbGtfYXVkX2luaXQoKSBhcyBmb2xsb3dpbmc6CglzdGF0aWMgY29uc3Qgc3Ry
dWN0IHNhbXN1bmdfY211X2luZm8gYXVkX2NtdSBfX2luaXRjb25zdCA9IHsKCkhvdyBjYW4gaSBh
ZGQgdGhlICdjb25zdCcga2V5d29yZCBhbmQgJ19faW5pdHNlY2lvbicgdG8gdGhlIAoic3RydWN0
IHNhbXN1bmdfY211X2luZm8gYXVkX2NtdSIgaW4gdGhlICJzdGF0aWMgdm9pZCBfX2luaXQgCmV4
eW5vczUyNjBfY2xrX2F1ZF9pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApIj8KCi0tIApCZXN0
IFJlZ2FyZHMsCkNoYW53b28gQ2hvaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
