From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH RESEND] ARM: dts: Add EHCI device tree node for Exynos4
Date: Mon, 31 Dec 2012 09:09:22 +0530
Message-ID: <50E108EA.1010404@linaro.org>
References: <1356921918-12959-1-git-send-email-tobetter@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1356921918-12959-1-git-send-email-tobetter@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dongjin Kim <tobetter@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 12/31/2012 08:15 AM, Dongjin Kim wrote:
> This patch adds EHCI device node on device tree for Exynos4 and defines its
> default platform data, s5p_usb_phy_init and s5p_usb_phy_exit, so that those
> function can be called from the driver.
> 
> Signed-off-by: Dongjin Kim <tobetter@gmail.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi         |    7 +++++++
>  arch/arm/mach-exynos/mach-exynos4-dt.c |    9 +++++++++
>  2 files changed, 16 insertions(+)

[ ... ]

>  
> +static struct s5p_ehci_platdata s5p_ehci_platdata = {
> +	.phy_init = s5p_usb_phy_init,
> +	.phy_exit = s5p_usb_phy_exit,
> +};
> +

Going by the recent development on Samsung USBPHY driver, we won't need
these hooks once that patch gets accepted. [1]

Patch for adding EHCI support for EXYNOS5-DT can be found here.[2]

[1] https://patchwork.kernel.org/patch/1794651/
[2] https://patchwork.kernel.org/patch/1875491/


>  /*
>   * The following lookup table is used to override device names when devices
>   * are registered from device tree. This is temporarily added to enable
> @@ -80,6 +87,8 @@ static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initconst = {
>  	OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_MDMA1, "dma-pl330.2", NULL),
>  	OF_DEV_AUXDATA("samsung,exynos4210-tmu", EXYNOS4_PA_TMU,
>  				"exynos-tmu", NULL),
> +	OF_DEV_AUXDATA("samsung,exynos-ehci", EXYNOS4_PA_EHCI,
> +				"s5p-ehci", &s5p_ehci_platdata),
>  	{},
>  };
>  
> 


-- 
Tushar Behera
