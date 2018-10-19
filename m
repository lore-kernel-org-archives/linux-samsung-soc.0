From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 3/6] clocksource: exynos_mct: Refactor resources allocation
Date: Fri, 19 Oct 2018 09:43:18 +0200
Message-ID: <CAJKOXPc=eNjk+9F3TE5S_Ci2ztuSXGJxdahgWOGamz9rGJO0xg@mail.gmail.com>
References: <CGME20181018095717eucas1p2c89f6e71642e6db62676e1af5514529f@eucas1p2.samsung.com>
 <20181018095708.1527-1-m.szyprowski@samsung.com> <20181018095708.1527-4-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018095708.1527-4-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, will.deacon@arm.com, catalin.marinas@arm.com, marc.zyngier@arm.com, tglx@linutronix.de, daniel.lezcano@linaro.org, Chanwoo Choi <cw00.choi@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>, mark.rutland@arm.com
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 18 Oct 2018 at 11:57, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Move interrupts allocation from exynos4_timer_resources() into separate
> function together with the interrupt number parsing code from
> mct_init_dt(), so the code for managing interrupts is kept together.
> While touching exynos4_timer_resources() function, move of_iomap() to it.
> No functional changes.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  drivers/clocksource/exynos_mct.c | 50 +++++++++++++++++++-------------
>  1 file changed, 30 insertions(+), 20 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
