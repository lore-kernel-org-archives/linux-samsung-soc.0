From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH 2/4] clk: samsung: Remove Exynos4415 driver (SoC not
 supported anymore)
Date: Sat, 21 Jan 2017 14:08:34 +0900
Message-ID: <CAGTfZH2Eh67iMb7bBY2ostNUbxmOtQxy=P7ZRSEDzS4=enyMKg@mail.gmail.com>
References: <20170114123642.15581-1-krzk@kernel.org>
 <CGME20170114123727epcas2p296aae6459c8575d7e5def74f18e5c64d@epcas2p2.samsung.com>
 <20170114123642.15581-3-krzk@kernel.org>
 <c9b51cb6-f798-d41e-afff-f779b963345c@samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <c9b51cb6-f798-d41e-afff-f779b963345c@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgU3lsd2VzdGVyLAoKSSBhZGQgcmV2ZWl3ZWQtYnkgdGFnIGZyb20gdGhpcyBwYXRjaC4gQnV0
LCBvbiB5b3UgdHJlZSwgdGhpcyBwYXRjaFsxXSBkb2VzbuKAmXQKaW5jbHVkZSB0aGUgbXkgcmV2
aWV3ZWQtYnkgdGFnLgoKWzFdIGh0dHBzOi8vZ2l0LmxpbnV4dHYub3JnL3NuYXdyb2NraS9zYW1z
dW5nLmdpdC9jb21taXQvP2g9Zm9yLXY0LjExL2Nsay9uZXh0JmlkPWNiNGFjOTQ5ZWExNDQxNmEy
ZDU3YjdhMzQzYmM0YjU3MTA3NGUzYmQKCjIwMTctMDEtMTYgMTk6MzIgR01UKzA5OjAwIFN5bHdl
c3RlciBOYXdyb2NraSA8cy5uYXdyb2NraUBzYW1zdW5nLmNvbT46Cj4gT24gMDEvMTQvMjAxNyAw
MTozNiBQTSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gU3VwcG9ydCBmb3IgRXh5bm9z
NDQxNSBpcyBnb2luZyBhd2F5IGJlY2F1c2UgdGhlcmUgYXJlIG5vIGludGVybmFsIG5vcgo+PiBl
eHRlcm5hbCB1c2Vycy4KPj4KPj4gU2luY2UgY29tbWl0IDQ2ZGNmMGZmMGRlMyAoIkFSTTogZHRz
OiBleHlub3M6IFJlbW92ZSBleHlub3M0NDE1LmR0c2kiKSwKPj4gdGhlIHBsYXRmb3JtIGNhbm5v
dCBiZSBpbnN0YW50aWF0ZWQgc28gcmVtb3ZlIGFsc28gdGhlIGRyaXZlcnMuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPgo+IEFwcGxp
ZWQsIHRoYW5rcy4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKCgoKLS0gCkJlc3QgUmVnYXJkcywKQ2hhbndvbyBDaG9pClNhbXN1bmcgRWxlY3Ry
b25pY3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
