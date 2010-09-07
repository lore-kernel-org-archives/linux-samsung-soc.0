From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 1/3] rx1950: add battery device
Date: Wed, 08 Sep 2010 00:06:19 +0100
Message-ID: <4C86C56B.7090204@fluff.org>
References: <1283869946-28296-1-git-send-email-anarsoul@gmail.com> <1283869946-28296-2-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from dsl78-143-211-26.in-addr.fast.co.uk ([78.143.211.26]:59319 "EHLO
	ben-laptop" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752726Ab0IGXGl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Sep 2010 19:06:41 -0400
In-Reply-To: <1283869946-28296-2-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 07/09/10 15:32, Vasily Khoruzhick wrote:
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  arch/arm/mach-s3c2440/Kconfig       |    3 +
>  arch/arm/mach-s3c2440/mach-rx1950.c |  160 +++++++++++++++++++++++++++++++++++
>  2 files changed, 163 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c2440/Kconfig b/arch/arm/mach-s3c2440/Kconfig
> index cd8e7de..9b6b026 100644
> --- a/arch/arm/mach-s3c2440/Kconfig
> +++ b/arch/arm/mach-s3c2440/Kconfig
> @@ -198,6 +198,9 @@ config MACH_RX1950
>  	select S3C_DEV_NAND
>  	select S3C2410_IOTIMING if S3C2440_CPUFREQ
>  	select S3C2440_XTAL_16934400
> +	select S3C_ADC
> +	select PDA_POWER
> +	select BATTERY_S3C_ADC

not keen on forcing these on unless they are required for the
system to work.

>  	help
>  	   Say Y here if you're using HP iPAQ rx1950
>  
> diff --git a/arch/arm/mach-s3c2440/mach-rx1950.c b/arch/arm/mach-s3c2440/mach-rx1950.c
> index 142d1f9..1197ab4 100644
> --- a/arch/arm/mach-s3c2440/mach-rx1950.c
> +++ b/arch/arm/mach-s3c2440/mach-rx1950.c
> @@ -25,8 +25,10 @@

> +
> +static const struct s3c_adc_bat_thresh bat_lut_noac[] = {
> +	{4100, 156, 100},
> +	{4050, 156, 95},
> +	{4025, 141, 90},
> +	{3995, 144, 85},
> +	{3957, 162, 80},
> +	{3931, 147, 75},
> +	{3902, 147, 70},
> +	{3863, 153, 65},
> +	{3838, 150, 60},
> +	{3800, 153, 55},
> +	{3765, 153, 50},
> +	{3748, 172, 45},
> +	{3740, 153, 40},
> +	{3714, 175, 35},
> +	{3710, 156, 30},
> +	{3963, 156, 25},
> +	{3672, 178, 20},
> +	{3651, 178, 15},
> +	{3629, 178, 10},
> +	{3612, 162, 5},
> +	{3605, 162, 0},
> +

at least add a space after { and before }
it would be nice to have named initialisers.
