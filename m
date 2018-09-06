From: Cedric Roux <sed@free.fr>
Subject: Re: [PATCH] mini2440 MMC correct write protect detection
Date: Thu, 6 Sep 2018 21:22:20 +0200
Message-ID: <d993bd0c-a69e-8d03-c5e5-d40de363bd95@free.fr>
References: <85dac0df-2b75-9cc4-fde1-f62136974a1e@free.fr>
 <20180905174513.6w7z5jsc2e6ndntv@kozik-lap>
 <204cf57b-a4f2-76b9-766c-20905596ca4e@free.fr>
 <20180906160124.626l5fgn2cn4veyq@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180906160124.626l5fgn2cn4veyq@kozik-lap>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDkvMDYvMjAxOCAwNjowMSBQTSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBUaGUg
cGF0Y2ggd2FzIG5vdCBwYXRjaHdvcmsgY29tcGF0aWJsZToKPiAgICAgQXBwbHlpbmcgcGF0Y2gg
IzEwNTg3ODYzIHVzaW5nICdnaXQgYW0gLXMnCj4gICAgIERlc2NyaXB0aW9uOiBtaW5pMjQ0MCBN
TUMgY29ycmVjdCB3cml0ZSBwcm90ZWN0IGRldGVjdGlvbgo+ICAgICBBcHBseWluZzogbWluaTI0
NDAgTU1DIGNvcnJlY3Qgd3JpdGUgcHJvdGVjdCBkZXRlY3Rpb24KPiAgICAgZXJyb3I6IGFybS9t
YWNoLXMzYzI0eHgvbWFjaC1taW5pMjQ0MC5jOiBkb2VzIG5vdCBleGlzdCBpbiBpbmRleAoKTXkg
YmFkLCBzb3JyeS4gSSBkaWRuJ3QgcmVhZCBjYXJlZnVsbHkKRG9jdW1lbnRhdGlvbi9wcm9jZXNz
L3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QKCj4gCj4gZ2l0LWFtIGJ5IGRlZmF1bHQgZXhwZWN0cyAt
cDEuCj4gCj4gVGhlIHByZWZlcnJlZCBhbmQgZWFzaWVzdCB3YXkgdG8gZ2VuZXJhdGUgcGF0Y2hl
cyBpcyB0byB1c2UgZ2l0IGZvciB5b3VyCj4gd29yayBhbmQgdGhlbiBqdXN0Ogo+ICAgICAkIGdp
dCBmb3JtYXQtcGF0Y2ggLTEKPiAgICAgJCBzY3JpcHRzL2dldF9tYWludGFpbmVyIDAwMCoKPiAg
ICAgJCBnaXQgc2VuZC1lbWFpbCAtLXRvIC4uLi4uLi4uICAwMDAqCj4gCj4gKHRoZSBsYXN0IGNv
bW1hbmRzIGNhbiBiZSBldmVuIHNxdWFzaGVkIGludG8gb25lIGJ1dCB0aGF0IGlzIGp1c3QKPiBv
cHRpbWl6YXRpb24pLgo+IAo+IElmIHlvdSBkbyBub3QgdXNlIGdpdCwgcGxlYXNlIHBheSBhdHRl
bnRpb24gdG8gZ2VuZXJhdGUgcHJvcGVyCj4gYXBwbGljYWJsZSBwYXRjaGVzLgoKSSdsbCBzdGlj
ayB0byBnaXQgZm9yIHRoZSBuZXh0IG9uZXMuIFRoYW5rcyBmb3IgdGhlIHF1aWNrCnR1dG9yaWFs
LiBJJ2xsIGFsc28gdHJ5IHRvIHVzZSB0aGUgY29ycmVjdCBwcmVmaXggaW4gbXkgZW1haWxzLgoK
QmVzdCByZWdhcmRzLApDw6lkcmljLgoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJt
LWtlcm5lbAo=
