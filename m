From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/6] ARM: dts: exynos: Add all CPUs in cooling maps
Date: Sun, 18 Nov 2018 15:14:55 +0100
Message-ID: <20181118141455.GA11419@kozik-lap>
References: <cover.1542362000.git.viresh.kumar@linaro.org>
 <24d8433f544046eda4d21e8c7133e3bab770b615.1542362000.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <24d8433f544046eda4d21e8c7133e3bab770b615.1542362000.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Nov 16, 2018 at 03:31:10PM +0530, Viresh Kumar wrote:
> Each CPU can (and does) participate in cooling down the system but the
> DT only captures a handful of them, normally CPU0, in the cooling maps.
> Things work by chance currently as under normal circumstances its the
> first CPU of each cluster which is used by the operating systems to
> probe the cooling devices. But as soon as this CPU ordering changes and
> any other CPU is used to bring up the cooling device, we will start
> seeing failures.
> 
> Also the DT is rather incomplete when we list only one CPU in the
> cooling maps, as the hardware doesn't have any such limitations.
> 
> Update cooling maps to include all devices affected by individual trip
> points.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  arch/arm/boot/dts/exynos3250-artik5.dtsi      |   6 +-
>  arch/arm/boot/dts/exynos3250-monk.dts         |   6 +-
>  arch/arm/boot/dts/exynos3250-rinato.dts       |   6 +-
>  arch/arm/boot/dts/exynos4210-trats.dts        |   4 +-
>  arch/arm/boot/dts/exynos4210.dtsi             |   2 +-
>  .../boot/dts/exynos4412-itop-scp-core.dtsi    |   8 +-
>  arch/arm/boot/dts/exynos4412-midas.dtsi       |   8 +-
>  .../boot/dts/exynos4412-odroid-common.dtsi    |   8 +-
>  arch/arm/boot/dts/exynos4412-odroidu3.dts     |  17 ++-
>  arch/arm/boot/dts/exynos4412.dtsi             |   6 +-
>  arch/arm/boot/dts/exynos5250.dtsi             |   7 +-
>  arch/arm/boot/dts/exynos5422-odroidhc1.dts    | 106 +++++++++++-------
>  .../boot/dts/exynos5422-odroidxu3-common.dtsi | 106 +++++++++++-------

Thanks, applied.

Best regards,
Krzysztof
