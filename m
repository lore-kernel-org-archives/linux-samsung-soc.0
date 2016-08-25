From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/2] clk: samsung: exynos5260: Move struct
 samsung_cmu_info to init section
Date: Wed, 24 Aug 2016 17:11:09 -0700
Message-ID: <20160825001109.GO19826@codeaurora.org>
References: <1471834185-20249-1-git-send-email-cw00.choi@samsung.com>
 <1471834185-20249-2-git-send-email-cw00.choi@samsung.com>
 <CGME20160823005523epcas1p3993794ba487bb055cbf8a0b247fcb280@epcas1p3.samsung.com>
 <20160823005512.GP6502@codeaurora.org>
 <57BBB66E.2060807@samsung.com>
 <84e40b9b-1e08-24e0-f1ef-60b38b760ae6@samsung.com>
 <20160824044346.GR6502@codeaurora.org>
 <57BD5CFB.5050500@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <57BD5CFB.5050500@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, mturquette@baylibre.com, tomasz.figa@gmail.com, linux-kernel@vger.kernel.org, kgene@kernel.org, chanwoo@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDgvMjQsIENoYW53b28gQ2hvaSB3cm90ZToKPiBPbiAyMDE264WEIDA47JuUIDI07J28IDEz
OjQzLCBTdGVwaGVuIEJveWQgd3JvdGU6Cj4gPiBPbiAwOC8yMywgU3lsd2VzdGVyIE5hd3JvY2tp
IHdyb3RlOgo+ID4+IFNvIHRoZSBzYXZpbmcgaXMgcmF0aGVyIGluc2lnbmlmaWNhbnQgYnV0IHRo
ZSBwYXRjaCBkb2Vzbid0IG1ha2UKPiA+PiB0aGluZ3Mgd29yc2UgYW5kIEknZCBzYXkgaXQgbWln
aHQgYmUgd29ydGggYXBwbHlpbmcuCj4gPj4KPiA+IAo+ID4gU291bmRzIGdvb2QuIFRoaXMgc29y
dCBvZiBpbmZvcm1hdGlvbiBzaG91bGQgYmUgaW4gdGhlIGNvbW1pdAo+ID4gdGV4dCB0aG91Z2gu
IFRhbGtpbmcgYWJvdXQgY29uc3QgZG9lc24ndCBtYWtlIGFueSBzZW5zZSB0byBtZS4KPiAKPiBE
byB5b3UgbWVhbiB0aGF0ICdjb25zdCcgaXMgaW5pdGNvbnN0IHNlY2lvbj8KCk5vLiBNYXJraW5n
IGl0IGFzIGluaXRjb25zdCBpbiB0aGUgcGF0Y2ggaXMgY29ycmVjdC4KCj4gSWYgcG9zc2libGUs
IGNvdWxkIHlvdSBleHBsYWluIHRoZSBhbnl0aGluZwo+IHdoeSB5b3UgZG9uJ3QgbWFrZSBzZW5z
ZSBhYm91dCAnY29uc3QnPwo+IAoKSSdtIGp1c3Qgc2F5aW5nIHRoYXQgdGhlIHJlYXNvbmluZyB0
byBtb3ZlIGl0IGZyb20gdGhlIHRleHQKc2VjdGlvbiB0byB0aGUgZGF0YSBzZWN0aW9uIHNob3Vs
ZG4ndCBiZSBiZWNhdXNlIG9mIGNvbnN0LiBUaGVyZQpzaG91bGQgYmUgYmV0dGVyIHJlYXNvbnMg
dG8gZG8gdGhpcywgbGlrZSBzaXplIGJlbmVmaXRzLgoKLS0gClF1YWxjb21tIElubm92YXRpb24g
Q2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIENvZGUgQXVyb3JhIEZvcnVtLAphIExpbnV4IEZv
dW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
