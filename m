From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: S3C64XX: Add registration of WM2200 Bells device
 on Cragganmore
Date: Wed, 28 Nov 2012 08:31:43 +0900
Message-ID: <50B54D5F.3090502@samsung.com>
References: <1353944701-5129-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:46051 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756023Ab2K0Xbs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Nov 2012 18:31:48 -0500
Received: by mail-pa0-f46.google.com with SMTP id bh2so6311570pad.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Nov 2012 15:31:48 -0800 (PST)
In-Reply-To: <1353944701-5129-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, patches@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 11/27/12 00:45, Mark Brown wrote:
> Signed-off-by: Mark Brown<broonie@opensource.wolfsonmicro.com>
> ---
>   arch/arm/mach-s3c64xx/mach-crag6410.c |   10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/mach-crag6410.c
> index 2abe95d..c06bcfa 100644
> --- a/arch/arm/mach-s3c64xx/mach-crag6410.c
> +++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
> @@ -287,16 +287,21 @@ static struct platform_device littlemill_device = {
>   	.id		= -1,
>   };
>
> -static struct platform_device bells_wm5102_device = {
> +static struct platform_device bells_wm2200_device = {
>   	.name		= "bells",
>   	.id		= 0,
>   };
>
> -static struct platform_device bells_wm5110_device = {
> +static struct platform_device bells_wm5102_device = {
>   	.name		= "bells",
>   	.id		= 1,
>   };
>
> +static struct platform_device bells_wm5110_device = {
> +	.name		= "bells",
> +	.id		= 2,
> +};
> +
>   static struct regulator_consumer_supply wallvdd_consumers[] = {
>   	REGULATOR_SUPPLY("SPKVDD", "1-001a"),
>   	REGULATOR_SUPPLY("SPKVDD1", "1-001a"),
> @@ -376,6 +381,7 @@ static struct platform_device *crag6410_devices[] __initdata = {
>   	&tobermory_device,
>   	&littlemill_device,
>   	&lowland_device,
> +	&bells_wm2200_device,
>   	&bells_wm5102_device,
>   	&bells_wm5110_device,
>   	&wallvdd_device,

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
