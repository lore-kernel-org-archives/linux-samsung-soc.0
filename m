From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 1/7] clocksource: exynos_mct: Add the support for ARM64
Date: Thu, 8 Sep 2016 13:04:58 +0200
Message-ID: <562e232f-7e69-6d54-e49d-36042d166800@linaro.org>
References: <1472046551-703-1-git-send-email-cw00.choi@samsung.com>
 <1472046551-703-2-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1472046551-703-2-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chanwoo Choi <cw00.choi@samsung.com>, k.kozlowski@samsung.com, kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: inki.dae@samsung.com, jonghwa3.lee@samsung.com, s.nawrocki@samsung.com, jy0922.shim@samsung.com, jaewon02.kim@samsung.com, sw0312.kim@samsung.com, krzk@kernel.org, jh80.chung@samsung.com, a.hajda@samsung.com, human.hwang@samsung.com, chanwoo@kernel.org, ingi2.kim@samsung.com, m.szyprowski@samsung.com, Thomas Gleixner <tglx@linutronix.de>, beomho.seo@samsung.com, ideal.song@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjQvMDgvMjAxNiAxNTo0OSwgQ2hhbndvbyBDaG9pIHdyb3RlOgo+IFRoaXMgcGF0Y2ggYWRk
cyB0aGUgc3VwcG9ydCBmb3IgQVJNIDY0Yml0LiBUaGUgZGVsYXlfdGltZXIgaXMgb25seSBzdXBw
b3J0ZWQKPiBvbiBBUk0gMzJiaXQuCj4gCj4gQ2M6IERhbmllbCBMZXpjYW5vIDxkYW5pZWwubGV6
Y2Fub0BsaW5hcm8ub3JnPgo+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5k
ZT4KPiBDYzogS3VramluIEtpbSA8a2dlbmVAa2VybmVsLm9yZz4KPiBDYzogS3J6eXN6dG9mIEtv
emxvd3NraSA8ay5rb3psb3dza2lAc2Ftc3VuZy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2hhbndv
byBDaG9pIDxjdzAwLmNob2lAc2Ftc3VuZy5jb20+Cj4gLS0tCgpJIGRvbid0IHJlYWxseSBsaWtl
ICNpZmRlZiBpbiB0aGUgY29kZSBpdHNlbGYgYnV0IEkgc3VwcG9zZSB0aGVyZSBpcyBubwptdWNo
IGNob2ljZS4KCkFja2VkLWJ5OiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNhbm9AbGluYXJv
Lm9yZz4KCgotLSAKIDxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVu
IHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3
dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5j
b20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8t
YmxvZy8+IEJsb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hcm0ta2VybmVsCg==
