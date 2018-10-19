From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 4/6] clocksource: exynos_mct: Add arch_timer
 cooperation mode for ARM64
Date: Fri, 19 Oct 2018 09:44:07 +0200
Message-ID: <CAJKOXPfE9cYZ1Wh1yYWH=utvVWO2YndHO9yY8KLLcJ+A=XkKMw@mail.gmail.com>
References: <CGME20181018095717eucas1p20a7d2d2b1b18ae60a4893a8e3d8c19f9@eucas1p2.samsung.com>
 <20181018095708.1527-1-m.szyprowski@samsung.com> <20181018095708.1527-5-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018095708.1527-5-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, will.deacon@arm.com, catalin.marinas@arm.com, marc.zyngier@arm.com, tglx@linutronix.de, daniel.lezcano@linaro.org, Chanwoo Choi <cw00.choi@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>, mark.rutland@arm.com
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 18 Oct 2018 at 11:57, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> To get ARM Architected Timers working on Samsung Exynos SoCs, one has to
> first configure and enable Exynos Multi-Core Timer, because they both
> share some common hardware blocks (global system counter). This patch
> adds a mode of cooperation with arch_timer driver, so kernel can use
> CP15 based timer interface via arch_timer driver, which is mandatory
> on ARM64. In such mode MCT driver only enables its clocks and starts
> global timer. Everything else will be handled by arch_timer driver.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  drivers/clocksource/exynos_mct.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
