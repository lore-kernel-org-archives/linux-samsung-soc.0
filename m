From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: fix RTC interrupt for exynos5410
Date: Fri, 22 Dec 2017 10:19:24 +0100
Message-ID: <CAJKOXPfj0dFEzuu4wSqb2jV-S9QyDTStJiHQxR6r8HwrTxRoYg@mail.gmail.com>
References: <20171221213020.3080361-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171221213020.3080361-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Dec 21, 2017 at 10:30 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> According to the comment added to exynos_dt_pmu_match[] in commit
> 8b283c025443 ("ARM: exynos4/5: convert pmu wakeup to stacked domains"),
> the RTC is not able to wake up the system through the PMU on Exynos5410,
> unlike Exynos5420.
>
> However, when the RTC DT node got added, it was a straight copy of
> the Exynos5420 node, which now causes a warning from dtc.
>
> This removes the incorrect interrupt-parent, which should get the
> interrupt working and avoid the warning.
>
> Fixes: e1e146b1b062 ("ARM: dts: exynos: Add RTC and I2C to Exynos5410")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/boot/dts/exynos5410.dtsi | 1 -
>  1 file changed, 1 deletion(-)

In my pull request thread [1] you mentioned that PMU should not be
interrupt controller for Exynos5410. Yes, I think you are right.
Regardless whether Exynos5410 really supports Suspend to RAM or not,
now it is not configured as IRQ controller so the RTC's should go
straight to GIC. I think your fix is correct and I should drop my
patch.

I do not have Exynos5410 anymore (Odroid XU was left at Samsung
Poland) so I cannot test it. Maybe guys in Poland can test it? Marek?
Sylwester? Bartlomiej?

BTW,
It annoys me so much that it is so difficult to get Samsung boards. I
was writing to Samsung many times - to HQ, Open Source Group, LSI,
Artik and nothing. They do not have any boards... or they do not want
to share. This is how Samsung's support for Open Source really looks
like.
>From the three boards I have, two of them I bought myself by my own
money, one was donated to me by Markus Reichl (Odroid U3, thanks!).
When I was working in Samsung Poland they provided me with boards
(thanks guys!) but only for the time of work there and I am not
Samsung employee anymore.

So except this board from Markus, all infrastructure I have was built
by my own money. Eh, it is not that expensive, one board costs like
50-70 USD with shipment, but come on! Seriously, damn big company,
with damn big marketing budget and plenty of people and they cannot
provide their own boards to open-source... It really pisses me off
sometimes...

Back to the topic - thanks for the patch!

Best regards,
Krzysztof

[1] https://www.spinics.net/lists/arm-kernel/msg624966.html

>
> diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
> index 06713ec86f0d..d2174727df9a 100644
> --- a/arch/arm/boot/dts/exynos5410.dtsi
> +++ b/arch/arm/boot/dts/exynos5410.dtsi
> @@ -333,7 +333,6 @@
>  &rtc {
>         clocks = <&clock CLK_RTC>;
>         clock-names = "rtc";
> -       interrupt-parent = <&pmu_system_controller>;
>         status = "disabled";
>  };
>
> --
> 2.9.0
>
