From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: S5PC110: disable unused power regulators on Goni
	board
Date: Wed, 23 Feb 2011 19:23:33 +0900
Message-ID: <01f301cbd343$d0af4c90$720de5b0$%kim@samsung.com>
References: <1297760784-8486-1-git-send-email-m.szyprowski@samsung.com>
 <1297760784-8486-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36171 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751131Ab1BWKYP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Feb 2011 05:24:15 -0500
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LH20016EFKCG600@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Feb 2011 19:24:12 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LH200MKOFKCFQ@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Feb 2011 19:24:12 +0900 (KST)
In-reply-to: <1297760784-8486-2-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com

Marek Szyprowski wrote:
> 
> A lot of power regulator has been enabled by default causing the board
> to consume a lot of power. This patch fixes this issue.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv210/mach-goni.c |   10 +---------
>  1 files changed, 1 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/mach-goni.c
b/arch/arm/mach-s5pv210/mach-
> goni.c
> index 43c1c1b..10f754b 100644
> --- a/arch/arm/mach-s5pv210/mach-goni.c
> +++ b/arch/arm/mach-s5pv210/mach-goni.c
> @@ -292,7 +292,6 @@ static struct regulator_init_data goni_ldo3_data = {
>  		.min_uV		= 1100000,
>  		.max_uV		= 1100000,
>  		.apply_uV	= 1,
> -		.always_on	= 1,
>  	},
>  };
> 
> @@ -311,6 +310,7 @@ static struct regulator_init_data goni_ldo5_data = {
>  		.min_uV		= 2800000,
>  		.max_uV		= 2800000,
>  		.apply_uV	= 1,
> +		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
>  	},
>  	.num_consumer_supplies = ARRAY_SIZE(goni_ldo5_consumers),
>  	.consumer_supplies = goni_ldo5_consumers,
> @@ -341,7 +341,6 @@ static struct regulator_init_data goni_ldo8_data = {
>  		.min_uV		= 3300000,
>  		.max_uV		= 3300000,
>  		.apply_uV	= 1,
> -		.always_on	= 1,
>  	},
>  };
> 
> @@ -351,7 +350,6 @@ static struct regulator_init_data goni_ldo9_data = {
>  		.min_uV		= 2800000,
>  		.max_uV		= 2800000,
>  		.apply_uV	= 1,
> -		.always_on	= 1,
>  	},
>  };
> 
> @@ -371,7 +369,6 @@ static struct regulator_init_data goni_ldo11_data = {
>  		.min_uV		= 2800000,
>  		.max_uV		= 2800000,
>  		.apply_uV	= 1,
> -		.always_on	= 1,
>  	},
>  };
> 
> @@ -381,7 +378,6 @@ static struct regulator_init_data goni_ldo12_data = {
>  		.min_uV		= 1200000,
>  		.max_uV		= 1200000,
>  		.apply_uV	= 1,
> -		.always_on	= 1,
>  	},
>  };
> 
> @@ -391,7 +387,6 @@ static struct regulator_init_data goni_ldo13_data = {
>  		.min_uV		= 2800000,
>  		.max_uV		= 2800000,
>  		.apply_uV	= 1,
> -		.always_on	= 1,
>  	},
>  };
> 
> @@ -401,7 +396,6 @@ static struct regulator_init_data goni_ldo14_data = {
>  		.min_uV		= 1800000,
>  		.max_uV		= 1800000,
>  		.apply_uV	= 1,
> -		.always_on	= 1,
>  	},
>  };
> 
> @@ -411,7 +405,6 @@ static struct regulator_init_data goni_ldo15_data = {
>  		.min_uV		= 3300000,
>  		.max_uV		= 3300000,
>  		.apply_uV	= 1,
> -		.always_on	= 1,
>  	},
>  };
> 
> @@ -421,7 +414,6 @@ static struct regulator_init_data goni_ldo16_data = {
>  		.min_uV		= 1800000,
>  		.max_uV		= 1800000,
>  		.apply_uV	= 1,
> -		.always_on	= 1,
>  	},
>  };
> 
> --

Ok...will apply this.
And how about "mach-aquila.c"?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
