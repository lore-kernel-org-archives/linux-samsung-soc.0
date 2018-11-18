From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 02/10] ARM64: dts: exynos: Add all CPUs in cooling maps
Date: Sun, 18 Nov 2018 15:20:17 +0100
Message-ID: <20181118142017.GB11419@kozik-lap>
References: <cover.1542362530.git.viresh.kumar@linaro.org>
 <74e23257aece9ceef48b1c1cf6c9bafcce3c6fbd.1542362530.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <74e23257aece9ceef48b1c1cf6c9bafcce3c6fbd.1542362530.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Nov 16, 2018 at 03:34:25PM +0530, Viresh Kumar wrote:
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
>  .../arm64/boot/dts/exynos/exynos5433-tmu.dtsi | 36 ++++++++++++-------

Thanks, applied.

Best regards,
Krzysztof
