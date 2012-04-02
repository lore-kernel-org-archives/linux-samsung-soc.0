From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: S3C64XX: Hook up new style regulator-regulator supplies
 on Cragganmore
Date: Mon, 02 Apr 2012 12:05:53 -0700
Message-ID: <4F79F891.7050106@samsung.com>
References: <1333366519-7900-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:41241 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751295Ab2DBTFx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Apr 2012 15:05:53 -0400
Received: by pbcun15 with SMTP id un15so4745280pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Apr 2012 12:05:53 -0700 (PDT)
In-Reply-To: <1333366519-7900-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, patches@opensource.wolfsonmicro.com

Mark Brown wrote:
> The regulator API now allows supplies used by regulators to be specified
> as normal supplies - provide the hookup for that mechanism on Cragganmore.
> 
> Signed-off-by: Mark Brown<broonie@opensource.wolfsonmicro.com>
> ---
>   arch/arm/mach-s3c64xx/mach-crag6410.c |   18 ++++++++++++++++++
>   1 files changed, 18 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/mach-crag6410.c
> index 02fd009..4ee0249 100644
> --- a/arch/arm/mach-s3c64xx/mach-crag6410.c
> +++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
> @@ -306,6 +306,24 @@ static struct regulator_consumer_supply wallvdd_consumers[] = {
>   	REGULATOR_SUPPLY("SPKVDD2", "1-001a"),
>   	REGULATOR_SUPPLY("SPKVDDL", "1-001a"),
>   	REGULATOR_SUPPLY("SPKVDDR", "1-001a"),
> +
> +	REGULATOR_SUPPLY("DC1VDD", "0-0034"),
> +	REGULATOR_SUPPLY("DC2VDD", "0-0034"),
> +	REGULATOR_SUPPLY("DC3VDD", "0-0034"),
> +	REGULATOR_SUPPLY("LDO1VDD", "0-0034"),
> +	REGULATOR_SUPPLY("LDO2VDD", "0-0034"),
> +	REGULATOR_SUPPLY("LDO4VDD", "0-0034"),
> +	REGULATOR_SUPPLY("LDO5VDD", "0-0034"),
> +	REGULATOR_SUPPLY("LDO6VDD", "0-0034"),
> +	REGULATOR_SUPPLY("LDO7VDD", "0-0034"),
> +	REGULATOR_SUPPLY("LDO8VDD", "0-0034"),
> +	REGULATOR_SUPPLY("LDO9VDD", "0-0034"),
> +	REGULATOR_SUPPLY("LDO10VDD", "0-0034"),
> +	REGULATOR_SUPPLY("LDO11VDD", "0-0034"),
> +
> +	REGULATOR_SUPPLY("DC1VDD", "1-0034"),
> +	REGULATOR_SUPPLY("DC2VDD", "1-0034"),
> +	REGULATOR_SUPPLY("DC3VDD", "1-0034"),
>   };
> 
>   static struct regulator_init_data wallvdd_data = {

Looks ok to me, will apply.

Mark, is this needed for v3.4?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
