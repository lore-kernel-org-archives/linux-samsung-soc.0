From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] ARM: S5PV210: Use REGULATOR_SUPPLY macro for regulator
 consumers
Date: Fri, 11 Feb 2011 10:31:08 +0100
Message-ID: <000501cbc9ce$6d281360$47783a20$%szyprowski@samsung.com>
References: <1296206960-28148-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:51077 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755431Ab1BKJbV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Feb 2011 04:31:21 -0500
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LGG00FYL547BOE0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Feb 2011 18:31:19 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LGG009D753YZ9@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Feb 2011 18:31:19 +0900 (KST)
In-reply-to: <1296206960-28148-1-git-send-email-kgene.kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Mark Brown' <mark.brown@wolfsonmicro.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hello,

I'm sorry for the late reply, just noticed this commit on your kernel tree...

On Friday, January 28, 2011 10:29 AM Kukjin Kim wrote:

> To use REGULATOR_SUPPLY macro is cleaner for initializing regulator
> consumer supply.
> 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5pv210/mach-aquila.c |   52 +++++++++++-----------------------
>  arch/arm/mach-s5pv210/mach-goni.c   |   52 +++++++++++-----------------------
>  2 files changed, 34 insertions(+), 70 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
> index 461aa03..38b3d67 100644
> --- a/arch/arm/mach-s5pv210/mach-aquila.c
> +++ b/arch/arm/mach-s5pv210/mach-aquila.c
> @@ -296,13 +296,11 @@ static struct regulator_init_data aquila_ldo17_data = {
>  };
> 
>  /* BUCK */
> -static struct regulator_consumer_supply buck1_consumer[] = {
> -	{	.supply	= "vddarm", },
> -};
> +static struct regulator_consumer_supply buck1_consumer =
> +	REGULATOR_SUPPLY("vddarm", NULL);
> 
> -static struct regulator_consumer_supply buck2_consumer[] = {
> -	{	.supply	= "vddint", },
> -};
> +static struct regulator_consumer_supply buck2_consumer =
> +	REGULATOR_SUPPLY("vddint", NULL);
> 
>  static struct regulator_init_data aquila_buck1_data = {
>  	.constraints	= {
> @@ -313,8 +311,8 @@ static struct regulator_init_data aquila_buck1_data = {
>  		.valid_ops_mask	= REGULATOR_CHANGE_VOLTAGE |
>  				  REGULATOR_CHANGE_STATUS,
>  	},
> -	.num_consumer_supplies	= ARRAY_SIZE(buck1_consumer),
> -	.consumer_supplies	= buck1_consumer,
> +	.num_consumer_supplies	= 1,
> +	.consumer_supplies	= &buck1_consumer,
>  };

I'm really not sure that this type of change is necessary. IMHO it makes the code harder
to read, update or reuse. What is the reason for it?

[snip]

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
