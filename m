From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [RFC 05/12] ARM: EXYNOS: Add devicetree node for mipi-csis driver
 for exynos5
Date: Sun, 10 Mar 2013 21:54:16 +0100
Message-ID: <513CF2F8.4000802@gmail.com>
References: <1362570838-4737-1-git-send-email-shaik.ameer@samsung.com> <1362570838-4737-6-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1362570838-4737-6-git-send-email-shaik.ameer@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Shaik Ameer Basha <shaik.ameer@samsung.com>
Cc: linux-media@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, s.nawrocki@samsung.com, shaik.samsung@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On 03/06/2013 12:53 PM, Shaik Ameer Basha wrote:
> This patch adds necessary source definations needed for mipi-csis
> driver and adds devicetree node for exynos5250.
>
> Signed-off-by: Shaik Ameer Basha<shaik.ameer@samsung.com>
> ---
>   arch/arm/boot/dts/exynos5250.dtsi       |   18 ++++++++++++++++++
>   arch/arm/mach-exynos/clock-exynos5.c    |   16 ++++++++++++++--
>   arch/arm/mach-exynos/include/mach/map.h |    3 +++
>   arch/arm/mach-exynos/mach-exynos5-dt.c  |    4 ++++
>   4 files changed, 39 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 3a2cd9a..4fff98b 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -47,6 +47,8 @@
>   		i2c6 =&i2c_6;
>   		i2c7 =&i2c_7;
>   		i2c8 =&i2c_8;
> +		csis0 =&csis_0;
> +		csis1 =&csis_1;
>   	};
>
>   	gic:interrupt-controller@10481000 {
> @@ -357,4 +359,20 @@
>   		reg =<0x14450000 0x10000>;
>   		interrupts =<0 94 0>;
>   	};
> +
> +	csis_0: csis@13C20000 {
> +		compatible = "samsung,exynos5250-csis";
> +		reg =<0x13C20000 0x4000>;
> +		interrupts =<0 79 0>;
> +		bus-width =<4>;
> +		status = "disabled";
> +	};
> +
> +	csis_1: csis@13C30000 {
> +		compatible = "samsung,exynos5250-csis";
> +		reg =<0x13C30000 0x4000>;
> +		interrupts =<0 80 0>;
> +		bus-width =<4>;

Shouldn't this be 2 ? Anyway what's the point of adding this node here
only to move it in a subsequent patch ? I guess you should first add
'camera' node and then have further patches adding relevant device nodes.

> +		status = "disabled";
> +	};
>   };

> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
> index e9d7b80..34a22ff 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c

This file is already removed in Kukjin's for-next tree.
And for dts changes I would start the patch summary line with "ARM: dts:".

> @@ -859,6 +859,16 @@ static struct clk exynos5_init_clocks_off[] = {
>   		.enable		= exynos5_clk_ip_gscl_ctrl,
>   		.ctrlbit	= (1<<  3),
>   	}, {
> +		.name		= "csis",
> +		.devname	= "s5p-mipi-csis.0",
> +		.enable		= exynos5_clk_ip_gscl_ctrl,
> +		.ctrlbit	= (1<<  5),
> +	}, {
> +		.name		= "csis",
> +		.devname	= "s5p-mipi-csis.1",
> +		.enable		= exynos5_clk_ip_gscl_ctrl,
> +		.ctrlbit	= (1<<  6),
> +	}, {
