From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 3/5] clocksource: exynos_mct: Increase priority over ARM
 arch timer
Date: Mon, 18 Feb 2019 09:55:52 +0100
Message-ID: <a1d2701b-90d5-b921-7c54-15742f25b7ad@linaro.org>
References: <20190215125229.30180-1-m.szyprowski@samsung.com>
 <CGME20190215125239eucas1p2d9167af42f2d04e462c56a070c3371c2@eucas1p2.samsung.com>
 <20190215125229.30180-4-m.szyprowski@samsung.com>
 <01569ba7-2e3e-5811-81e1-ca51cacbcb95@linaro.org>
 <CAJKOXPfs6i08OqXPZeJ19-tyoj7zY60tjq=fEScjm5wdRR6fXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAJKOXPfs6i08OqXPZeJ19-tyoj7zY60tjq=fEScjm5wdRR6fXw@mail.gmail.com>
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMTgvMDIvMjAxOSAwOTo1MywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiBGcmks
IDE1IEZlYiAyMDE5IGF0IDE3OjM1LCBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNhbm9AbGlu
YXJvLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDE1LzAyLzIwMTkgMTM6NTIsIE1hcmVrIFN6eXByb3dz
a2kgd3JvdGU6Cj4+PiBFeHlub3MgTXVsdGktQ29yZSBUaW1lciBkcml2ZXIgKGV4eW5vc19tY3Qp
IG11c3QgYmUgc3RhcnRlZCBiZWZvcmUgQVJNCj4+PiBBcmNoaXRlY3RlZCBUaW1lcnMgKGFyY2hf
dGltZXIpLCBiZWNhdXNlIHRoZXkgYm90aCBzaGFyZSBzb21lIGNvbW1vbgo+Pj4gaGFyZHdhcmUg
YmxvY2tzIChnbG9iYWwgc3lzdGVtIGNvdW50ZXIpIGFuZCB0dXJuaW5nIG9uIE1DVCBpcyBuZWVk
ZWQKPj4+IHRvIGdldCBBUk0gQXJjaGl0ZWN0ZWQgVGltZXIgd29ya2luZyBwcm9wZXJseS4gSW5j
cmVhc2UgTUNUIHRpbWVyIHJhdGluZwo+Pj4gYW5kIGhvdHBsdWcgcHJpb3JpdHkgb3ZlciBBUk0g
QXJjaGljdGVjdGVkIHRpbWVyIGRyaXZlciB0byBhY2hpZXZlIHRoYXQuCj4+Cj4+IFRoaXMgaXMg
YSBoYWNrLgo+Pgo+PiBUaGVyZSBhcmUgbWVjaGFuaXNtcyB0byBoYW5kbGUgdGhpcyBraW5kIG9m
IGRlcGVuZGVuY3kuCj4+Cj4+IGVnLiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y0
LjE1L2RyaXZlci1hcGkvZGV2aWNlX2xpbmsuaHRtbAo+IAo+IEhpIERhbmllbCwKPiAKPiBBcmUg
eW91IHN1cmUgeW91IGhhdmUgcHJvcGVyIGRldmljZXMgYXQgdGhpcyBwb2ludCBzbyB5b3UgY2Fu
IG9yZGVyCj4gZGVwZW5kZW5jaWVzIHdpdGggZGV2aWNlIGxpbmtzPwoKTm8sIGl0IHdhcyBhbiBl
eGFtcGxlIHRvIHNob3cgdGhlcmUgYXJlIG1lY2hhbmlzbSB0byBoYW5kbGUgdGhlCmRlcGVuZGVu
Y2llcy4gQWdyZWUgaXQgaXMgYSBjb25mdXNpbmcgZXhhbXBsZS4KCgoKCi0tIAogPGh0dHA6Ly93
d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBB
Uk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9M
aW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0
ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwg
bWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
