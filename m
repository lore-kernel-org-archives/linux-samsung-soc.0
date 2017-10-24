From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: [PATCH 1/3] drm/exynos/dsi: Use common error handling code in
 exynos_dsi_enable()
Date: Tue, 24 Oct 2017 11:08:26 +0200
Message-ID: <ac01b36a-2d5c-6852-2f2c-8aed89acdaba@users.sourceforge.net>
References: <7d4cdb43-432c-c67a-5d3f-c37bd604f539@users.sourceforge.net>
 <9028478a-a00d-6fcd-0286-b8daefa8c912@users.sourceforge.net>
 <CAJKOXPc_QQ-QKkPWQoxj0LjeJsG2BjhP6X0X9m8YQEo=qTnOvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAJKOXPc_QQ-QKkPWQoxj0LjeJsG2BjhP6X0X9m8YQEo=qTnOvg@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Pj4gQEAgLTE0MDEsMTEgKzE0MDAsMTQgQEAgc3RhdGljIHZvaWQgZXh5bm9zX2RzaV9lbmFibGUo
c3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQo+PiAgICAgICAgICAgICAgICAgZHNpLT5zdGF0
ZSAmPSB+RFNJTV9TVEFURV9FTkFCTEVEOwo+PiAgICAgICAgICAgICAgICAgZXh5bm9zX2RzaV9z
ZXRfZGlzcGxheV9lbmFibGUoZHNpLCBmYWxzZSk7Cj4+ICAgICAgICAgICAgICAgICBkcm1fcGFu
ZWxfdW5wcmVwYXJlKGRzaS0+cGFuZWwpOwo+PiAtICAgICAgICAgICAgICAgcG1fcnVudGltZV9w
dXRfc3luYyhkc2ktPmRldik7Cj4+IC0gICAgICAgICAgICAgICByZXR1cm47Cj4+ICsgICAgICAg
ICAgICAgICBnb3RvIHB1dF9zeW5jOwo+PiAgICAgICAgIH0KPj4KPj4gICAgICAgICBkc2ktPnN0
YXRlIHw9IERTSU1fU1RBVEVfVklET1VUX0FWQUlMQUJMRTsKPj4gKyAgICAgICByZXR1cm47Cj4+
ICsKPj4gK3B1dF9zeW5jOgo+PiArICAgICAgIHBtX3J1bnRpbWVfcHV0X3N5bmMoZHNpLT5kZXYp
Owo+PiAgfQo+IAo+IE5vLCB0aGlzIGRvZXMgbm90IHNpbXBsaWZ5IHRoZSBjb2RlLgoKSG93IGRv
IHlvdSB0aGluayBhYm91dCB0byBjaGVjayBhIGJpdCBtb3JlIGlmIHRoZXJlIGFyZSBkZXNpcmVk
IGVmZmVjdHMgdG8gY29uc2lkZXIKd2hlbiB0aGUgc2hvd24gZnVuY3Rpb24gY2FsbCBpcyBzdG9y
ZWQgb25seSBvbmNlIGF0IHRoZSBlbmQgb2YgdGhpcyBmdW5jdGlvbiBpbXBsZW1lbnRhdGlvbj8K
Cgo+IFN0b3AgdXNpbmcgY29jY2luZWxsZS4KClRoaXMgd2lsbCBub3QgaGFwcGVuIGZvciBhIHdo
aWxlLiAtIFRoZXJlIGFyZSBzbyBtYW55IHNvdXJjZSBjb2RlIHBsYWNlcyBsZWZ0IG92ZXIKd2hl
cmUgeW91IG1pZ2h0IGNhcmUgbW9yZSBmb3Igc2ltaWxhciBzb2Z0d2FyZSBpbXByb3ZlbWVudHMu
CgpSZWdhcmRzLApNYXJrdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
