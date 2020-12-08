Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FBAC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Dec 2020 07:02:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35E4E23A6C
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Dec 2020 07:02:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgLHHCM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Dec 2020 02:02:12 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:31158 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbgLHHCM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Dec 2020 02:02:12 -0500
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20201208070127epoutp02f6c26853f631be02f86c0420f71ded2e~Oq6_Symtg2967129671epoutp026
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Dec 2020 07:01:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20201208070127epoutp02f6c26853f631be02f86c0420f71ded2e~Oq6_Symtg2967129671epoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1607410887;
        bh=rU8e1vTuVPjDA1xrv0aDyk5v1/s2jHOArEEBVwxuO7g=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=XVquJz6Vrlk3UrPU+djmuoixEgmkixnfz1cdNZk+lL0+sW6w7IpACNqeUVMEPGFr8
         QM3YBDqpNvUImYhac/evwxxaUgF1G92Dbno7XSBeXdVmi+Vw+0rMRi+fBIufIW06v9
         EJa2j8v+EHT78emDTXmXFdv+fNbQvpXKkRy3O35o=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTP id
        20201208070126epcas5p2e8289701f35779b93671ab571dbe77e6~Oq69oN2cp1718717187epcas5p2S;
        Tue,  8 Dec 2020 07:01:26 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
        epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
        E3.EA.33964.6C42FCF5; Tue,  8 Dec 2020 16:01:26 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
        20201208070126epcas5p10bd2a1874acf58ee476fee29fcea7de9~Oq69ACMHc1156911569epcas5p13;
        Tue,  8 Dec 2020 07:01:26 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201208070126epsmtrp11467220616c61bd550ceffd542eec6c8~Oq68-EUE92977329773epsmtrp1f;
        Tue,  8 Dec 2020 07:01:26 +0000 (GMT)
X-AuditID: b6c32a4b-eb7ff700000184ac-38-5fcf24c655a7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        CF.79.08745.6C42FCF5; Tue,  8 Dec 2020 16:01:26 +0900 (KST)
Received: from pankajdubey02 (unknown [107.122.12.6]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201208070124epsmtip1e610788d70be79ab7c6179efa7c98070~Oq67fiO5x1101211012epsmtip17;
        Tue,  8 Dec 2020 07:01:24 +0000 (GMT)
From:   "Pankaj Dubey" <pankaj.dubey@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzk@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Cc:     "'Sylwester Nawrocki'" <snawrocki@kernel.org>,
        "'Marek Szyprowski'" <m.szyprowski@samsung.com>,
        "'Bartlomiej Zolnierkiewicz'" <b.zolnierkie@samsung.com>,
        "'Arnd Bergmann'" <arnd@arndb.de>,
        "'Chanwoo Choi'" <cw00.choi@samsung.com>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>
In-Reply-To: <20201207190517.262051-5-krzk@kernel.org>
Subject: RE: [PATCH v2 4/4] soc: samsung: exynos-chipid: convert to driver
 and merge exynos-asv
Date:   Tue, 8 Dec 2020 12:31:23 +0530
Message-ID: <001101d6cd2f$f1e4a9a0$d5adfce0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI3Sc44zrAFnNObXiIFTUqq/KcsYAH9ecAAAoFbRUupB8uFAA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIKsWRmVeSWpSXmKPExsWy7bCmhu4xlfPxBhcvGlg8mLeNzeLvpGPs
        FhtnrGe1uP7lOavF+fMb2C02Pb7GanF51xw2ixnn9zFZrD1yl92i/elLZgcuj9+/JjF6bFrV
        yeaxeUm9R9+WVYwenzfJBbBGcdmkpOZklqUW6dslcGW8WnGLuWBLbsWyN5PZGxgfRnQxcnJI
        CJhIfP/xgK2LkYtDSGA3o8SGncuZIZxPjBJTr1xmhXA+M0qsaOxkhGn5MH0jE0RiF6PEtzub
        oFpeMUq8fjuPFaSKTUBf4tyPeWDtIgLzGCU2HfrEDuIwC8xikpj4pZUFpIpTwEyidc8JJhBb
        WCBRYuatTWBxFgEViZnb37CD2LwClhL7r+6GsgUlTs58AlbDLCAvsf3tHGaImxQkfj5dBrZZ
        RMBJ4uCyC2wQNeISL48eAVssIbCWQ6L9yhKoBheJ7XPOQNnCEq+Ob2GHsKUkXva3Qdn5Ej8W
        T2KGaG5hlJh8fC4rRMJe4sCVOUBXcABt0JRYv0sfYhmfRO/vJ0wgYQkBXomONiGIajWJ789h
        VslIPGxeygRhe0jMnXOUaQKj4iwkr81C8tosJC/MQli2gJFlFaNkakFxbnpqsWmBcV5quV5x
        Ym5xaV66XnJ+7iZGcKrS8t7B+OjBB71DjEwcjIcYJTiYlUR41aTOxgvxpiRWVqUW5ccXleak
        Fh9ilOZgURLnVfpxJk5IID2xJDU7NbUgtQgmy8TBKdXA1OqzWrTdunXhpabvDidm31dPTt2/
        ytVqY5OfULvhuaKLZRZ1XBoCbZ2Cm228WP0vKvzL2tVc8Xb3rznqd6/km5tcMMxNkWVuu6Dm
        m/DEzfH/DJMvD92jPj97sybhZu3BLUrfXulER+4rt568Z/9yo3LrHP9X+162rfucM+FjSYKl
        TJeW8u0Tm728xA+FKk8pYNj9g1ctqdT7w1yliJN9f/YlHdg0acpOHeFrE6zu9nIJL33IXh/+
        9cCCpt/z3z016dnDVWq5OuV4yl0jK60creob6257dTXv3plo58LdX+VTl28vf+gez2rfbdwf
        X8x03ySmVsAyPWVqz4GCi5UTM05PuBC7XundD+GM9GMLlViKMxINtZiLihMBqg8jEMQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsWy7bCSnO4xlfPxBo0TWCwezNvGZvF30jF2
        i40z1rNaXP/ynNXi/PkN7BabHl9jtbi8aw6bxYzz+5gs1h65y27R/vQlswOXx+9fkxg9Nq3q
        ZPPYvKTeo2/LKkaPz5vkAlijuGxSUnMyy1KL9O0SuDJerbjFXLAlt2LZm8nsDYwPI7oYOTkk
        BEwkPkzfyNTFyMUhJLCDUeLJh35GiISMxOTVK1ghbGGJlf+es0MUvWCU6Ny8hQkkwSagL3Hu
        xzywIhGBBYwS23+GgxQxC8xjkmh+/ooRomMjo0TfublgVZwCZhKte06AdQsLxEuce94BZrMI
        qEjM3P6GHcTmFbCU2H91N5QtKHFy5hOWLkYOoKl6Em0bwa5jFpCX2P52DjPEdQoSP58ugzrC
        SeLgsgtsEDXiEi+PHmGfwCg8C8mkWQiTZiGZNAtJxwJGllWMkqkFxbnpucWGBUZ5qeV6xYm5
        xaV56XrJ+bmbGMGxpqW1g3HPqg96hxiZOBgPMUpwMCuJ8KpJnY0X4k1JrKxKLcqPLyrNSS0+
        xCjNwaIkznuh62S8kEB6YklqdmpqQWoRTJaJg1Oqgan7TL9wSdxHZZkWIftouaSPGsKNXUcX
        528szLO5kWVZ8tNjIUf13yWTjrS/WrM42PmO0pmZly7Kfr33OUptoZTBjWVse7dazhCtW7Pk
        68PYTf+7PtxebR3a328Yevdlz9Fsh0keC4678/3Q4ppxdPqZjhnJ2v+bjT47xC59u79kzoIA
        3ZRPnxarfM9nm2Wlwr/MbanT9rX7i5qfJbg8uqz4tiyvNfDA2Tnt3q1PpHtlekQnLNStiNwq
        27a3V3tD1r5Hsi/PB+iFXl6295W+aNFZTrV03ZVh7xsDi/pm7Ghks/q74sB624UMHF8ddZfb
        X7lee3tNHY+XaYtS+MGjt9ruBnK8cGzSVH6XG355jawSS3FGoqEWc1FxIgCHXufOJAMAAA==
X-CMS-MailID: 20201208070126epcas5p10bd2a1874acf58ee476fee29fcea7de9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20201207190545epcas5p2e46fcf0e430b2ae9a2ecaf140d197327
References: <20201207190517.262051-1-krzk@kernel.org>
        <CGME20201207190545epcas5p2e46fcf0e430b2ae9a2ecaf140d197327@epcas5p2.samsung.com>
        <20201207190517.262051-5-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Tuesday, December 8, 2020 12:35 AM
> To: Krzysztof Kozlowski <krzk@kernel.org>; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Cc: Sylwester Nawrocki <snawrocki@kernel.org>; Marek Szyprowski
> <m.szyprowski@samsung.com>; Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com>; Arnd Bergmann <arnd@arndb.de>; Chanwoo
> Choi <cw00.choi@samsung.com>; Alim Akhtar <alim.akhtar@samsung.com>;
> Pankaj Dubey <pankaj.dubey@samsung.com>
> Subject: [PATCH v2 4/4] soc: samsung: exynos-chipid: convert to driver and
> merge exynos-asv
> 
> The Exynos Chip ID driver on Exynos SoCs has so far only informational
> purpose - to expose the SoC device in sysfs.  No other drivers depend on
it
> so there is really no benefit of initializing it early.
> 

One of the intention behind initializing Exynos Chip ID driver in early
stage was to simplify code in arch/arm/mach-exynos specifically calls such
as soc_is_exynosXXXX. 
But there were lot of resistance from community to add any such calls (or
exported function) from mach-exynos files to the driver file. Whereas some
other SoC code is using the same, e.g. tegra_get_chip_id being called from
mach-tegra files to drivers/soc/tegra/. Unfortunately we could not accept
similar solution for Exynos SoC and hence could not get rid of
soc_is_exynosxXXX and similar macros from various file in mach-exynos and
eventually converting those files into a full-fledged driver files. 

Any opinion how can we achieve this if we convert Exynos Chip ID driver to a
regular driver?

Thanks,
Pankaj Dubey

> The code would be the most flexible if converted to a regular driver.
> However there is already another driver - Exynos ASV (Adaptive Supply
> Voltage) - which binds to the device node of Chip ID.
> 
> The solution is to convert the Exynos Chip ID to a built in driver and
merge
> the Exynos ASV into it.
> 
> This has several benefits:
> 1. Although the Exynos ASV driver binds to a device node present in all
>    Exynos DTS (generic compatible), it fails to probe except on the
>    supported ones (only Exynos5422).  This means that the regular boot
>    process has a planned/expected device probe failure.
> 
>    Merging the ASV into Chip ID will remove this probe failure because
>    the final driver will always bind, just with disabled ASV features.
> 
> 2. Allows to use dev_info() as the SoC bus is present (since
>    core_initcall).
> 
> 3. Could speed things up because of execution of Chip ID code in a SMP
>    environment (after bringing up secondary CPUs, unlike early_initcall),
>    This reduces the amount of work to be done early, when the kernel has
>    to bring up critical devices.
> 
> 5. Makes the Chip ID code defer-probe friendly,
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/mach-exynos/Kconfig        |  1 -
>  drivers/soc/samsung/Kconfig         | 12 ++---
>  drivers/soc/samsung/Makefile        |  3 +-
>  drivers/soc/samsung/exynos-asv.c    | 45 +++++------------
>  drivers/soc/samsung/exynos-asv.h    |  2 +
>  drivers/soc/samsung/exynos-chipid.c | 75 ++++++++++++++++++++---------
>  6 files changed, 70 insertions(+), 68 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-
> exynos/Kconfig index 56d272967fc0..5a48abac6af4 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -13,7 +13,6 @@ menuconfig ARCH_EXYNOS
>  	select ARM_GIC
>  	select EXYNOS_IRQ_COMBINER
>  	select COMMON_CLK_SAMSUNG
> -	select EXYNOS_ASV
>  	select EXYNOS_CHIPID
>  	select EXYNOS_THERMAL
>  	select EXYNOS_PMU
> diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
> index fc7f48a92288..5745d7e5908e 100644
> --- a/drivers/soc/samsung/Kconfig
> +++ b/drivers/soc/samsung/Kconfig
> @@ -7,21 +7,19 @@ menuconfig SOC_SAMSUNG
> 
>  if SOC_SAMSUNG
> 
> -config EXYNOS_ASV
> -	bool "Exynos Adaptive Supply Voltage support" if COMPILE_TEST
> -	depends on (ARCH_EXYNOS && EXYNOS_CHIPID) || COMPILE_TEST
> -	select EXYNOS_ASV_ARM if ARM && ARCH_EXYNOS
> -
>  # There is no need to enable these drivers for ARMv8  config
> EXYNOS_ASV_ARM
>  	bool "Exynos ASV ARMv7-specific driver extensions" if
> COMPILE_TEST
> -	depends on EXYNOS_ASV
> +	depends on EXYNOS_CHIPID
> 
>  config EXYNOS_CHIPID
> -	bool "Exynos Chipid controller driver" if COMPILE_TEST
> +	bool "Exynos ChipID controller and ASV driver" if COMPILE_TEST
>  	depends on ARCH_EXYNOS || COMPILE_TEST
> +	select EXYNOS_ASV_ARM if ARM && ARCH_EXYNOS
>  	select MFD_SYSCON
>  	select SOC_BUS
> +	help
> +	  Support for Samsung Exynos SoC ChipID and Adaptive Supply
> Voltage.
> 
>  config EXYNOS_PMU
>  	bool "Exynos PMU controller driver" if COMPILE_TEST diff --git
> a/drivers/soc/samsung/Makefile b/drivers/soc/samsung/Makefile index
> 59e8e9453f27..0c523a8de4eb 100644
> --- a/drivers/soc/samsung/Makefile
> +++ b/drivers/soc/samsung/Makefile
> @@ -1,9 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
> 
> -obj-$(CONFIG_EXYNOS_ASV)	+= exynos-asv.o
>  obj-$(CONFIG_EXYNOS_ASV_ARM)	+= exynos5422-asv.o
> 
> -obj-$(CONFIG_EXYNOS_CHIPID)	+= exynos-chipid.o
> +obj-$(CONFIG_EXYNOS_CHIPID)	+= exynos-chipid.o exynos-asv.o
>  obj-$(CONFIG_EXYNOS_PMU)	+= exynos-pmu.o
> 
>  obj-$(CONFIG_EXYNOS_PMU_ARM_DRIVERS)	+= exynos3250-
> pmu.o exynos4-pmu.o \
> diff --git a/drivers/soc/samsung/exynos-asv.c
> b/drivers/soc/samsung/exynos-asv.c
> index 5daeadc36382..d60af8acc391 100644
> --- a/drivers/soc/samsung/exynos-asv.c
> +++ b/drivers/soc/samsung/exynos-asv.c
> @@ -2,7 +2,9 @@
>  /*
>   * Copyright (c) 2019 Samsung Electronics Co., Ltd.
>   *	      http://www.samsung.com/
> + * Copyright (c) 2020 Krzysztof Kozlowski <krzk@kernel.org>
>   * Author: Sylwester Nawrocki <s.nawrocki@samsung.com>
> + * Author: Krzysztof Kozlowski <krzk@kernel.org>
>   *
>   * Samsung Exynos SoC Adaptive Supply Voltage support
>   */
> @@ -10,12 +12,7 @@
>  #include <linux/cpu.h>
>  #include <linux/device.h>
>  #include <linux/errno.h>
> -#include <linux/init.h>
> -#include <linux/mfd/syscon.h>
> -#include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
> -#include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/regmap.h>
>  #include <linux/soc/samsung/exynos-chipid.h>
> @@ -111,7 +108,7 @@ static int exynos_asv_update_opps(struct
> exynos_asv *asv)
>  	return	0;
>  }
> 
> -static int exynos_asv_probe(struct platform_device *pdev)
> +int exynos_asv_init(struct device *dev, struct regmap *regmap)
>  {
>  	int (*probe_func)(struct exynos_asv *asv);
>  	struct exynos_asv *asv;
> @@ -119,21 +116,16 @@ static int exynos_asv_probe(struct platform_device
> *pdev)
>  	u32 product_id = 0;
>  	int ret, i;
> 
> -	asv = devm_kzalloc(&pdev->dev, sizeof(*asv), GFP_KERNEL);
> +	asv = devm_kzalloc(dev, sizeof(*asv), GFP_KERNEL);
>  	if (!asv)
>  		return -ENOMEM;
> 
> -	asv->chipid_regmap = device_node_to_regmap(pdev-
> >dev.of_node);
> -	if (IS_ERR(asv->chipid_regmap)) {
> -		dev_err(&pdev->dev, "Could not find syscon regmap\n");
> -		return PTR_ERR(asv->chipid_regmap);
> -	}
> -
> +	asv->chipid_regmap = regmap;
> +	asv->dev = dev;
>  	ret = regmap_read(asv->chipid_regmap,
> EXYNOS_CHIPID_REG_PRO_ID,
>  			  &product_id);
>  	if (ret < 0) {
> -		dev_err(&pdev->dev, "Cannot read revision from
> ChipID: %d\n",
> -			ret);
> +		dev_err(dev, "Cannot read revision from ChipID: %d\n", ret);
>  		return -ENODEV;
>  	}
> 
> @@ -142,7 +134,9 @@ static int exynos_asv_probe(struct platform_device
> *pdev)
>  		probe_func = exynos5422_asv_init;
>  		break;
>  	default:
> -		return -ENODEV;
> +		dev_dbg(dev, "No ASV support for this SoC\n");
> +		devm_kfree(dev, asv);
> +		return 0;
>  	}
> 
>  	cpu_dev = get_cpu_device(0);
> @@ -150,14 +144,11 @@ static int exynos_asv_probe(struct platform_device
> *pdev)
>  	if (ret < 0)
>  		return -EPROBE_DEFER;
> 
> -	ret = of_property_read_u32(pdev->dev.of_node, "samsung,asv-
> bin",
> +	ret = of_property_read_u32(dev->of_node, "samsung,asv-bin",
>  				   &asv->of_bin);
>  	if (ret < 0)
>  		asv->of_bin = -EINVAL;
> 
> -	asv->dev = &pdev->dev;
> -	dev_set_drvdata(&pdev->dev, asv);
> -
>  	for (i = 0; i < ARRAY_SIZE(asv->subsys); i++)
>  		asv->subsys[i].asv = asv;
> 
> @@ -167,17 +158,3 @@ static int exynos_asv_probe(struct platform_device
> *pdev)
> 
>  	return exynos_asv_update_opps(asv);
>  }
> -
> -static const struct of_device_id exynos_asv_of_device_ids[] = {
> -	{ .compatible = "samsung,exynos4210-chipid" },
> -	{}
> -};
> -
> -static struct platform_driver exynos_asv_driver = {
> -	.driver = {
> -		.name = "exynos-asv",
> -		.of_match_table = exynos_asv_of_device_ids,
> -	},
> -	.probe	= exynos_asv_probe,
> -};
> -module_platform_driver(exynos_asv_driver);
> diff --git a/drivers/soc/samsung/exynos-asv.h
> b/drivers/soc/samsung/exynos-asv.h
> index 3fd1f2acd999..dcbe154db31e 100644
> --- a/drivers/soc/samsung/exynos-asv.h
> +++ b/drivers/soc/samsung/exynos-asv.h
> @@ -68,4 +68,6 @@ static inline u32 exynos_asv_opp_get_frequency(const
> struct exynos_asv_subsys *s
>  	return __asv_get_table_entry(&subsys->table, level, 0);  }
> 
> +int exynos_asv_init(struct device *dev, struct regmap *regmap);
> +
>  #endif /* __LINUX_SOC_EXYNOS_ASV_H */
> diff --git a/drivers/soc/samsung/exynos-chipid.c
> b/drivers/soc/samsung/exynos-chipid.c
> index b4cd0cc00f45..fa6a9b9f6d70 100644
> --- a/drivers/soc/samsung/exynos-chipid.c
> +++ b/drivers/soc/samsung/exynos-chipid.c
> @@ -2,20 +2,28 @@
>  /*
>   * Copyright (c) 2019 Samsung Electronics Co., Ltd.
>   *	      http://www.samsung.com/
> + * Copyright (c) 2020 Krzysztof Kozlowski <krzk@kernel.org>
>   *
>   * Exynos - CHIP ID support
>   * Author: Pankaj Dubey <pankaj.dubey@samsung.com>
>   * Author: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> + * Author: Krzysztof Kozlowski <krzk@kernel.org>
> + *
> + * Samsung Exynos SoC Adaptive Supply Voltage and Chip ID support
>   */
> 
> -#include <linux/io.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/of.h>
> +#include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  #include <linux/soc/samsung/exynos-chipid.h>
>  #include <linux/sys_soc.h>
> 
> +#include "exynos-asv.h"
> +
>  static const struct exynos_soc_id {
>  	const char *name;
>  	unsigned int id;
> @@ -46,25 +54,17 @@ static const char * __init
> product_id_to_soc_id(unsigned int product_id)
>  	return NULL;
>  }
> 
> -static int __init exynos_chipid_early_init(void)
> +static int exynos_chipid_probe(struct platform_device *pdev)
>  {
>  	struct soc_device_attribute *soc_dev_attr;
>  	struct soc_device *soc_dev;
>  	struct device_node *root;
> -	struct device_node *syscon;
>  	struct regmap *regmap;
>  	u32 product_id;
>  	u32 revision;
>  	int ret;
> 
> -	syscon = of_find_compatible_node(NULL, NULL,
> -					 "samsung,exynos4210-chipid");
> -	if (!syscon)
> -		return -ENODEV;
> -
> -	regmap = device_node_to_regmap(syscon);
> -	of_node_put(syscon);
> -
> +	regmap = device_node_to_regmap(pdev->dev.of_node);
>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
> 
> @@ -74,7 +74,8 @@ static int __init exynos_chipid_early_init(void)
> 
>  	revision = product_id & EXYNOS_REV_MASK;
> 
> -	soc_dev_attr = kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
> +	soc_dev_attr = devm_kzalloc(&pdev->dev, sizeof(*soc_dev_attr),
> +				    GFP_KERNEL);
>  	if (!soc_dev_attr)
>  		return -ENOMEM;
> 
> @@ -84,31 +85,57 @@ static int __init exynos_chipid_early_init(void)
>  	of_property_read_string(root, "model", &soc_dev_attr->machine);
>  	of_node_put(root);
> 
> -	soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%x", revision);
> +	soc_dev_attr->revision = devm_kasprintf(&pdev->dev, GFP_KERNEL,
> +						"%x", revision);
>  	soc_dev_attr->soc_id = product_id_to_soc_id(product_id);
>  	if (!soc_dev_attr->soc_id) {
>  		pr_err("Unknown SoC\n");
> -		ret = -ENODEV;
> -		goto err;
> +		return -ENODEV;
>  	}
> 
>  	/* please note that the actual registration will be deferred */
>  	soc_dev = soc_device_register(soc_dev_attr);
> -	if (IS_ERR(soc_dev)) {
> -		ret = PTR_ERR(soc_dev);
> +	if (IS_ERR(soc_dev))
> +		return PTR_ERR(soc_dev);
> +
> +	ret = exynos_asv_init(&pdev->dev, regmap);
> +	if (ret)
>  		goto err;
> -	}
> 
> -	/* it is too early to use dev_info() here (soc_dev is NULL) */
> -	pr_info("soc soc0: Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x]
> Detected\n",
> -		soc_dev_attr->soc_id, product_id, revision);
> +	platform_set_drvdata(pdev, soc_dev);
> +
> +	dev_info(soc_device_to_device(soc_dev),
> +		 "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
> +		 soc_dev_attr->soc_id, product_id, revision);
> 
>  	return 0;
> 
>  err:
> -	kfree(soc_dev_attr->revision);
> -	kfree(soc_dev_attr);
> +	soc_device_unregister(soc_dev);
> +
>  	return ret;
>  }
> 
> -early_initcall(exynos_chipid_early_init);
> +static int exynos_chipid_remove(struct platform_device *pdev) {
> +	struct soc_device *soc_dev = platform_get_drvdata(pdev);
> +
> +	soc_device_unregister(soc_dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id exynos_chipid_of_device_ids[] = {
> +	{ .compatible = "samsung,exynos4210-chipid" },
> +	{}
> +};
> +
> +static struct platform_driver exynos_chipid_driver = {
> +	.driver = {
> +		.name = "exynos-chipid",
> +		.of_match_table = exynos_chipid_of_device_ids,
> +	},
> +	.probe	= exynos_chipid_probe,
> +	.remove	= exynos_chipid_remove,
> +};
> +builtin_platform_driver(exynos_chipid_driver);
> --
> 2.25.1


