From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: s3c64xx: cpuidle - declare the states with the
 new api
Date: Thu, 17 May 2012 16:02:09 +0900
Message-ID: <0b2101cd33fa$fa678020$ef368060$%kim@samsung.com>
References: <1337004377-17732-1-git-send-email-daniel.lezcano@linaro.org>
 <1337004377-17732-2-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:49654 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755144Ab2EQHCI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 May 2012 03:02:08 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4500FOGNJI11O0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 May 2012 16:02:07 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M45004NYNJHJPC1@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 May 2012 16:02:06 +0900 (KST)
In-reply-to: <1337004377-17732-2-git-send-email-daniel.lezcano@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Daniel Lezcano' <daniel.lezcano@linaro.org>, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com
Cc: linux-arm-kernel@lists.infradead.org, linaro-dev@lists.linaro.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, heiko@sntech.de

Daniel Lezcano wrote:
> 
> The states are now part of the cpuidle_driver structure, so we can
> declare the states in this structure directly. That saves us an extra
> variable declaration and a memcpy.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/arm/mach-s3c64xx/cpuidle.c |   33 ++++++++++++++-------------------
>  1 files changed, 14 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/cpuidle.c b/arch/arm/mach-
> s3c64xx/cpuidle.c
> index 179460f..2750e54 100644
> --- a/arch/arm/mach-s3c64xx/cpuidle.c
> +++ b/arch/arm/mach-s3c64xx/cpuidle.c
> @@ -51,33 +51,28 @@ static int s3c64xx_enter_idle(struct cpuidle_device
> *dev,
>  	return index;
>  }
> 
> -static struct cpuidle_state s3c64xx_cpuidle_set[] = {
> -	[0] = {
> -		.enter			= s3c64xx_enter_idle,
> -		.exit_latency		= 1,
> -		.target_residency	= 1,
> -		.flags			= CPUIDLE_FLAG_TIME_VALID,
> -		.name			= "IDLE",
> -		.desc			= "System active, ARM gated",
> -	},
> -};
> +static DEFINE_PER_CPU(struct cpuidle_device, s3c64xx_cpuidle_device);
> 
>  static struct cpuidle_driver s3c64xx_cpuidle_driver = {
> -	.name		= "s3c64xx_cpuidle",
> -	.owner		= THIS_MODULE,
> -	.state_count	= ARRAY_SIZE(s3c64xx_cpuidle_set),
> -};
> -
> -static struct cpuidle_device s3c64xx_cpuidle_device = {
> -	.state_count	= ARRAY_SIZE(s3c64xx_cpuidle_set),
> +	.name	= "s3c64xx_cpuidle",
> +	.owner  = THIS_MODULE,

I'd preferred to use original 'tab'

> +	.states = {
> +		{
> +			.enter            = s3c64xx_enter_idle,
> +			.exit_latency     = 1,
> +			.target_residency = 1,
> +			.flags            = CPUIDLE_FLAG_TIME_VALID,
> +			.name             = "IDLE",
> +			.desc             = "System active, ARM gated",
> +		},
> +	},
> +	.state_count = 1,
>  };
> 
>  static int __init s3c64xx_init_cpuidle(void)
>  {
>  	int ret;
> 
> -	memcpy(s3c64xx_cpuidle_driver.states, s3c64xx_cpuidle_set,
> -	       sizeof(s3c64xx_cpuidle_set));
>  	cpuidle_register_driver(&s3c64xx_cpuidle_driver);
> 
>  	ret = cpuidle_register_device(&s3c64xx_cpuidle_device);
> --
> 1.7.5.4


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
