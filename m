From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 07/15] arm: dts: exynos: Add missing cooling device
 properties for CPUs
Date: Wed, 20 Jun 2018 20:44:03 +0200
Message-ID: <20180620184403.u6tdqc2zvyslospe@kozik-lap>
References: <cover.1527244200.git.viresh.kumar@linaro.org>
 <cfd8de4b2ad1cfd7b0f1a0706c0b6b918e1ebffc.1527244201.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cfd8de4b2ad1cfd7b0f1a0706c0b6b918e1ebffc.1527244201.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: arm@kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, ionela.voinescu@arm.com, Daniel Lezcano <daniel.lezcano@linaro.org>, chris.redpath@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, May 25, 2018 at 04:01:53PM +0530, Viresh Kumar wrote:
> The cooling device properties, like "#cooling-cells" and
> "dynamic-power-coefficient", should either be present for all the CPUs
> of a cluster or none. If these are present only for a subset of CPUs of
> a cluster then things will start falling apart as soon as the CPUs are
> brought online in a different order. For example, this will happen
> because the operating system looks for such properties in the CPU node
> it is trying to bring up, so that it can register a cooling device.
> 
> Add such missing properties.
> 
> Fix other missing properties (clocks, OPP, clock latency) as well to
> make it all work.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  arch/arm/boot/dts/exynos3250.dtsi | 16 ++++++++++++++++
>  arch/arm/boot/dts/exynos4210.dtsi | 13 +++++++++++++
>  arch/arm/boot/dts/exynos4412.dtsi |  9 +++++++++
>  arch/arm/boot/dts/exynos5250.dtsi | 23 +++++++++++++++++++++++
>  4 files changed, 61 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
