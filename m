From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: S5PC210: add support for i2c PMICs on
 Universal_C210	board
Date: Thu, 03 Mar 2011 11:21:00 +0900
Message-ID: <018901cbd949$c86e8f80$594bae80$%kim@samsung.com>
References: <20110215113504.GF4152@n2100.arm.linux.org.uk>
 <1297774241-16149-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36484 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757557Ab1CCCWd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Mar 2011 21:22:33 -0500
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHG0011UMKRXI60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Mar 2011 11:22:03 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHG005JRMKQ77@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Mar 2011 11:22:03 +0900 (KST)
In-reply-to: <1297774241-16149-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, broonie@opensource.wolfsonmicro.com, linux@arm.linux.org.uk

Marek Szyprowski wrote:
> 
> This patch adds basic definitions for MAX8952 & LP3974 (MAX8998
> compatible) PMICs for UniversalC210 board. Power consumers for the
> device drivers will be added later. These two PMICs occupy I2C5 bus.
> 

Hi Marek,

Could you please re-work this based on Exynos4?
And there are really small comments below :)

(snip)

> +static struct regulator_init_data lp3974_buck1_data = {
> +	.constraints	= {
> +		.name		= "VINT_1.1V",
> +		.min_uV		= 750000,
> +		.max_uV		= 1500000,
> +		.valid_ops_mask	= REGULATOR_CHANGE_VOLTAGE |
> +			REGULATOR_CHANGE_STATUS,
> +		.boot_on	= 1,
> +		.state_mem	= {
> +			.enabled = 0,
                                ^
> +			.disabled = 1,
                                 ^

Do we need "disabled" with "enabled"?

(snip)

> +static struct max8998_platform_data universal_lp3974_pdata = {
> +	.num_regulators		= ARRAY_SIZE(lp3974_regulators),
> +	.regulators		= lp3974_regulators,
> +	.buck1_voltage1		= 1100000,	/* INT */
> +	.buck1_voltage2		= 1000000,
> +	.buck1_voltage3		= 1100000,
> +	.buck1_voltage4		= 1000000,
> +	.buck1_set1             = S5PV310_GPX0(5),
                   ^^^^^^^^^^^^^
tab?

> +	.buck1_set2             = S5PV310_GPX0(6),
                   ^^^^^^^^^^^^^
same.

> +	.buck2_voltage1		= 1200000,	/* G3D */
> +	.buck2_voltage2		= 1100000,
> +	.buck1_default_idx	= 0,
> +	.buck2_set3             = S5PV310_GPE2(0),
                   ^^^^^^^^^^^^^
same.

> +	.buck2_default_idx	= 0,
> +	.wakeup			= true,
> +};

(snip)

> @@ -223,6 +661,9 @@ static void __init universal_machine_init(void)
>  	i2c_register_board_info(0, i2c0_devs, ARRAY_SIZE(i2c0_devs));
>  	i2c_register_board_info(1, i2c1_devs, ARRAY_SIZE(i2c1_devs));
> 
> +	s3c_i2c5_set_platdata(NULL);
> +	i2c_register_board_info(5, i2c_devs5, ARRAY_SIZE(i2c_devs5));

How about "i2c5_devs" like others?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
