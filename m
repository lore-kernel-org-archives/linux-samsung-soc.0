From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [RFC 05/12] ARM: EXYNOS: Add devicetree node for mipi-csis driver
 for exynos5
Date: Sun, 10 Mar 2013 21:57:10 +0100
Message-ID: <513CF3A6.3080903@gmail.com>
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
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -47,6 +47,8 @@
>   		i2c6 =&i2c_6;
>   		i2c7 =&i2c_7;
>   		i2c8 =&i2c_8;
> +		csis0 =&csis_0;
> +		csis1 =&csis_1;

You can drop these aliases if you use my latest patches as indicated
in the comment to patch 00/12.

> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
> index e9d7b80..34a22ff 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -859,6 +859,16 @@ static struct clk exynos5_init_clocks_off[] = {
>   		.enable		= exynos5_clk_ip_gscl_ctrl,
>   		.ctrlbit	= (1<<  3),
>   	}, {
> +		.name		= "csis",
> +		.devname	= "s5p-mipi-csis.0",
> +		.enable		= exynos5_clk_ip_gscl_ctrl,
> +		.ctrlbit	= (1<<  5),
> +	}, {

Instead you should add relevant clock definitions to the Samsung clocks 
driver,
it's already merged in Kukjin's tree.
