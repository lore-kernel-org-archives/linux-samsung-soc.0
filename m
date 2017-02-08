From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 7/8] mfd: exynos-lpass: Add missing remove() function
Date: Wed, 8 Feb 2017 10:57:43 +0000
Message-ID: <20170208105743.wgq4o6ev6ybvwbgz@dell>
References: <1485419634-28331-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170126083405eucas1p29a888fa3896e2bd131e23585f7d033d9@eucas1p2.samsung.com>
 <1485419634-28331-8-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1485419634-28331-8-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, linux-gpio@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gVGh1LCAyNiBKYW4gMjAxNywgTWFyZWsgU3p5cHJvd3NraSB3cm90ZToKCj4gRGlzYWJsZSBk
ZXZpY2Ugb24gZHJpdmVyIHJlbW92ZSBhbmQgcmVsZWFzZSBhbGxvY2F0ZWQgcmVnbWFwLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9tZmQvZXh5bm9zLWxwYXNzLmMgfCAxMSArKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKRm9yIG15IG93biByZWZlcmVuY2U6
CiAgQWNrZWQtZm9yLU1GRC1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KICAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvZXh5bm9zLWxwYXNzLmMgYi9kcml2ZXJzL21mZC9l
eHlub3MtbHBhc3MuYwo+IGluZGV4IGJlMjY0OTg4YmRjOS4uOWRiYmVkYWQ5MTZmIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvbWZkL2V4eW5vcy1scGFzcy5jCj4gKysrIGIvZHJpdmVycy9tZmQvZXh5
bm9zLWxwYXNzLmMKPiBAQCAtMTM3LDYgKzEzNywxNiBAQCBzdGF0aWMgaW50IGV4eW5vc19scGFz
c19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJcmV0dXJuIG9mX3BsYXRm
b3JtX3BvcHVsYXRlKGRldi0+b2Zfbm9kZSwgTlVMTCwgTlVMTCwgZGV2KTsKPiAgfQo+ICAKPiAr
c3RhdGljIGludCBleHlub3NfbHBhc3NfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4gK3sKPiArCXN0cnVjdCBleHlub3NfbHBhc3MgKmxwYXNzID0gcGxhdGZvcm1fZ2V0X2Ry
dmRhdGEocGRldik7Cj4gKwo+ICsJZXh5bm9zX2xwYXNzX2Rpc2FibGUobHBhc3MpOwo+ICsJcmVn
bWFwX2V4aXQobHBhc3MtPnRvcCk7Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gIHN0YXRp
YyBpbnQgX19tYXliZV91bnVzZWQgZXh5bm9zX2xwYXNzX3N1c3BlbmQoc3RydWN0IGRldmljZSAq
ZGV2KQo+ICB7Cj4gIAlzdHJ1Y3QgZXh5bm9zX2xwYXNzICpscGFzcyA9IGRldl9nZXRfZHJ2ZGF0
YShkZXYpOwo+IEBAIC0xNzEsNiArMTgxLDcgQEAgc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKGxw
YXNzX3BtX29wcywgZXh5bm9zX2xwYXNzX3N1c3BlbmQsCj4gIAkJLm9mX21hdGNoX3RhYmxlCT0g
ZXh5bm9zX2xwYXNzX29mX21hdGNoLAo+ICAJfSwKPiAgCS5wcm9iZQk9IGV4eW5vc19scGFzc19w
cm9iZSwKPiArCS5yZW1vdmUJPSBleHlub3NfbHBhc3NfcmVtb3ZlLAo+ICB9Owo+ICBtb2R1bGVf
cGxhdGZvcm1fZHJpdmVyKGV4eW5vc19scGFzc19kcml2ZXIpOwo+ICAKCi0tIApMZWUgSm9uZXMK
TGluYXJvIFNUTWljcm9lbGVjdHJvbmljcyBMYW5kaW5nIFRlYW0gTGVhZApMaW5hcm8ub3JnIOKU
giBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJv
b2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
