From: Ben Dooks <ben@simtec.co.uk>
Subject: Re: [PATCH v3 3/7] ARM: S5P: Added default pll values for APLL 800/1000MHz
Date: Wed, 21 Jul 2010 01:37:40 +0100
Message-ID: <4C464154.1010709@simtec.co.uk>
References: <1279517483-22751-1-git-send-email-myungjoo.ham@samsung.com>	<1279517483-22751-2-git-send-email-myungjoo.ham@samsung.com>	<1279517483-22751-3-git-send-email-myungjoo.ham@samsung.com> <1279517483-22751-4-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from dsl78-143-211-26.in-addr.fast.co.uk ([78.143.211.26]:36417 "EHLO
	kira.home.fluff.org" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1761672Ab0GUBT6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jul 2010 21:19:58 -0400
In-Reply-To: <1279517483-22751-4-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org

On 07/19/10 06:31, MyungJoo Ham wrote:
> CPUFREQ of S5PV210 uses different APLL settings and we provide
> such values for CPUFREQ at pll.h. We have been using differently
> between EVT0 and EVT1 machines. Although this version of kernel
> assumes that the CPU is EVT1, users may use code for EVT0 later.
>
> Note that at 1GHz of ARMCLK, APLL should be 1GHz and for other lower
> ARMCLK, APLL should be 800MHz.
>
> Signed-off-by: MyungJoo Ham<myungjoo.ham@samsung.com>
> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> ---
>   arch/arm/plat-s5p/include/plat/pll.h |    8 ++++++++
>   1 files changed, 8 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/plat-s5p/include/plat/pll.h b/arch/arm/plat-s5p/include/plat/pll.h
> index 7db3227..679e0d3 100644
> --- a/arch/arm/plat-s5p/include/plat/pll.h
> +++ b/arch/arm/plat-s5p/include/plat/pll.h
> @@ -21,6 +21,14 @@
>
>   #include<asm/div64.h>
>
> +#ifdef CONFIG_S5PC110_EVT0_WORKAROUND
> +#define PLL45XX_APLL_VAL_1000	((1<<  31) | (0xfa<<16) | (0x6<<8) | (0x1))
> +#define PLL45XX_APLL_VAL_800	((1<<  31) | (0xc8<<16) | (0x6<<8) | (0x1))
> +#else
> +#define PLL45XX_APLL_VAL_1000	((1<<  31) | (125<<16) | (3<<8) | (1))
> +#define PLL45XX_APLL_VAL_800	((1<<  31) | (100<<16) | (3<<8) | (1))
> +#endif
> +
>   enum pll45xx_type_t {
>   	pll_4500,
>   	pll_4502,

yuck. can we detect EVT0 and have these as variables that get
set depending on detection?

-- 
Ben Dooks, Design & Software Engineer, Simtec Electronics

http://www.simtec.co.uk/
