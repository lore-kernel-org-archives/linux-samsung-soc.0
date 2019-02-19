From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 5/5] ARM: exynos: Enable support for ARM architected timers
Date: Tue, 19 Feb 2019 09:06:26 +0900
Message-ID: <724bfe6c-477d-63b2-cd79-15b2acd60811@samsung.com>
References: <20190215125229.30180-1-m.szyprowski@samsung.com>
 <CGME20190215125240eucas1p219154e5bd27bd09dac0b8419c3e4e259@eucas1p2.samsung.com>
 <20190215125229.30180-6-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190215125229.30180-6-m.szyprowski@samsung.com>
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
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgTWFyZWssCgpPbiAxOS4gMi4gMTUuIOyYpO2bhCA5OjUyLCBNYXJlayBTenlwcm93c2tpIHdy
b3RlOgo+IEFSTSBhcmNoaXRlY3RlZCB0aW1lciBjYW4gYmUgdXNlZCB0b2dldGhlciB3aXRoIEV4
eW5vcyBNdWx0aUNvcmUgVGltZXIKPiBkcml2ZXIsIHNvIGVuYWJsZSBzdXBwb3J0IGZvciBpdC4g
U3VwcG9ydCBmb3IgQVJNIGFyY2hpdGVjdGVkIHRpbWVycyBpcwo+IGVzc2VudGlhbCBmb3IgZW5h
YmxpbmcgcHJvcGVyIEtWTSBzdXBwb3J0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXBy
b3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KPiAtLS0KPiAgYXJjaC9hcm0vbWFjaC1l
eHlub3MvS2NvbmZpZyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAK
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1leHlub3MvS2NvbmZpZyBiL2FyY2gvYXJtL21h
Y2gtZXh5bm9zL0tjb25maWcKPiBpbmRleCBiNDA5NjNjZjkxYzcuLmI1ZWMyMWMwMjdhMSAxMDA2
NDQKPiAtLS0gYS9hcmNoL2FybS9tYWNoLWV4eW5vcy9LY29uZmlnCj4gKysrIGIvYXJjaC9hcm0v
bWFjaC1leHlub3MvS2NvbmZpZwo+IEBAIC0xOCw2ICsxOCw3IEBAIG1lbnVjb25maWcgQVJDSF9F
WFlOT1MKPiAgCXNlbGVjdCBFWFlOT1NfU1JPTQo+ICAJc2VsZWN0IEVYWU5PU19QTV9ET01BSU5T
IGlmIFBNX0dFTkVSSUNfRE9NQUlOUwo+ICAJc2VsZWN0IEdQSU9MSUIKPiArCXNlbGVjdCBIQVZF
X0FSTV9BUkNIX1RJTUVSCj4gIAlzZWxlY3QgSEFWRV9BUk1fU0NVIGlmIFNNUAo+ICAJc2VsZWN0
IEhBVkVfUzNDMjQxMF9JMkMgaWYgSTJDCj4gIAlzZWxlY3QgSEFWRV9TM0MyNDEwX1dBVENIRE9H
IGlmIFdBVENIRE9HCj4gCgpSZXZlaXdlZC1ieTogQ2hhbndvbyBDaG9pIDxjdzAwLmNob2lAc2Ft
c3VuZy5jb20+CgoKLS0gCkJlc3QgUmVnYXJkcywKQ2hhbndvbyBDaG9pClNhbXN1bmcgRWxlY3Ry
b25pY3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFybS1rZXJuZWwK
