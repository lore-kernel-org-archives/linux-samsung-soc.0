From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 2/6] Exynos4 NURI: configure regulators and PMIC
 (MAX8997)
Date: Thu, 21 Jul 2011 01:59:15 +0900
Message-ID: <06c401cc46fe$5e9348d0$1bb9da70$%kim@samsung.com>
References: <1309421729-11172-1-git-send-email-myungjoo.ham@samsung.com>
 <1309421729-11172-3-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:20959 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751418Ab1GTQ7W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jul 2011 12:59:22 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LON00ITB5UW5GH0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 01:59:20 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LON000LQ5UWRQ@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 01:59:20 +0900 (KST)
In-reply-to: <1309421729-11172-3-git-send-email-myungjoo.ham@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Changhwan Youn' <chaos.youn@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, myungjoo.ham@gmail.com, tushar.behera@linaro.org

MyungJoo Ham wrote:
> 
> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

(snip)

> +#include <linux/mfd/max8997.h>

(snip)

> 
> +static void __init nuri_power_init(void)
> +{
> +	int gpio;
> +	int irq_base = IRQ_GPIO_END + 1;
> +
> +	nuri_max8997_pdata.irq_base = irq_base;
> +	irq_base += MAX8997_IRQ_NR;

Oops :(

arch/arm/mach-exynos4/mach-nuri.c: In function 'nuri_power_init':
arch/arm/mach-exynos4/mach-nuri.c:1051: error: 'MAX8997_IRQ_NR' undeclared
(first use in this function)
arch/arm/mach-exynos4/mach-nuri.c:1051: error: (Each undeclared identifier
is reported only once
arch/arm/mach-exynos4/mach-nuri.c:1051: error: for each function it appears
in.)
make[2]: *** [arch/arm/mach-exynos4/mach-nuri.o] Error 1

So need to add inclusion of <linux/mfd/max8997-private.h> on this file.

I fixed it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.


> +
> +	gpio = EXYNOS4_GPX0(7);
> +	gpio_request(gpio, "AP_PMIC_IRQ");
> +	s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(0xf));
> +	s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NONE);
> +}
> +
>  /* USB EHCI */
>  static struct s5p_ehci_platdata nuri_ehci_pdata;
> 
> @@ -361,6 +980,7 @@ static void __init nuri_ehci_init(void)
> 
>  static struct platform_device *nuri_devices[] __initdata = {
>  	/* Samsung Platform Devices */
> +	&s3c_device_i2c5, /* PMIC should initialize first */
>  	&emmc_fixed_voltage,
>  	&s3c_device_hsmmc0,
>  	&s3c_device_hsmmc2,
> @@ -387,10 +1007,13 @@ static void __init nuri_machine_init(void)
>  {
>  	nuri_sdhci_init();
>  	nuri_tsp_init();
> +	nuri_power_init();
> 
>  	i2c_register_board_info(1, i2c1_devs, ARRAY_SIZE(i2c1_devs));
>  	s3c_i2c3_set_platdata(&i2c3_data);
>  	i2c_register_board_info(3, i2c3_devs, ARRAY_SIZE(i2c3_devs));
> +	s3c_i2c5_set_platdata(NULL);
> +	i2c5_devs[I2C5_MAX8997].irq = gpio_to_irq(EXYNOS4_GPX0(7));
>  	i2c_register_board_info(5, i2c5_devs, ARRAY_SIZE(i2c5_devs));
> 
>  	nuri_ehci_init();
> --
> 1.7.4.1
