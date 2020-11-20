Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AA4C5519F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Nov 2020 10:25:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B025422255
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Nov 2020 10:25:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="P34G2Tt1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727645AbgKTKZK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Nov 2020 05:25:10 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:43073 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727527AbgKTKZK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Nov 2020 05:25:10 -0500
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20201120102504epoutp03071e5392d78b309814ddcd4010398ce3~JMFnsjVmb0241402414epoutp03Z
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Nov 2020 10:25:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20201120102504epoutp03071e5392d78b309814ddcd4010398ce3~JMFnsjVmb0241402414epoutp03Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1605867904;
        bh=7RujST5AViMMbyJUqfeZKhDggko2Fuju3w5K5L+MkuQ=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=P34G2Tt11Lyki9Vrs/xxl3QQmqllhrPBdPKQlq7dptpE2qXchgNj1oVHfm7+gYMRW
         39bPpgiSK6Rt92/AWjJ7MHbgPSwben87tUeiWBEu26P5ujZC+viUiNWNFTEnjoq3X1
         Qn/T1L9803Nupz9gjZo/dOlmE5tb5LfIFgv8741A=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201120102504epcas1p229c6ed101e12441813ae3ba9d2a9d67b~JMFnS1cmp1037610376epcas1p2d;
        Fri, 20 Nov 2020 10:25:04 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.152]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4Cct3220XszMqYlp; Fri, 20 Nov
        2020 10:25:02 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        F3.41.09582.E7997BF5; Fri, 20 Nov 2020 19:25:02 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20201120102500epcas1p44ed3f23e6a965e2dd22789f020804b73~JMFjzXaH90677506775epcas1p4Q;
        Fri, 20 Nov 2020 10:25:00 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201120102500epsmtrp15352bd6a1f1e0d937ff0c539a022b7ce~JMFjypxVY2548025480epsmtrp1C;
        Fri, 20 Nov 2020 10:25:00 +0000 (GMT)
X-AuditID: b6c32a37-8afff7000000256e-c1-5fb7997e0c8b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        91.D4.13470.C7997BF5; Fri, 20 Nov 2020 19:25:00 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201120102500epsmtip28db34feb69ff9ad5c0a3f287207568ab~JMFjn8u0E2039220392epsmtip20;
        Fri, 20 Nov 2020 10:25:00 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: allow compile testing of Exynos, S3C64xx
 and S5Pv210
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <b09cd44c-8ec0-f0cc-d566-64c16f54b008@samsung.com>
Date:   Fri, 20 Nov 2020 19:39:23 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201119164509.754851-1-krzk@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDJsWRmVeSWpSXmKPExsWy7bCmvm7dzO3xBh9eclucP7+B3eJjzz1W
        i8u75rBZzDi/j8ni4ilXi8Nv2lkt/l3byGKxatcfRgcOj/c3Wtk9ds66y+6xaVUnm0ffllWM
        Hp83yQWwRmXbZKQmpqQWKaTmJeenZOal2yp5B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl
        5gCdoqRQlphTChQKSCwuVtK3synKLy1JVcjILy6xVUotSMkpsCzQK07MLS7NS9dLzs+1MjQw
        MDIFKkzIzthz7BNjwR2Liof/J7M2MC7Q72Lk4JAQMJHYdCO3i5GLQ0hgB6PEsSNPmCCcT4wS
        TY/uMkI43xglph44wdrFyAnW8fLaS1aIxF5GiV97bkC1vAfqv7uDDWSusECkxMHvNiBxEYG1
        TBJvX81mBOlmE9CS2P/iBhuIzS+gKHH1x2OwOK+AncTm/YuZQGwWAVWJGTdOMYPYogJhEie3
        tUDVCEqcnPmEBcTmFDCT2DBhF5jNLCAucevJfCYIW15i+9s5zCCLJQSmcki0vG5mgTjbReL/
        t4+MELawxKvjW9ghbCmJl/1tUHa1xMqTR9ggmjsYJbbsvwD1s7HE/qWTmUA+YxbQlFi/Sx8i
        rCix8/dcRojFfBLvvvawQgKVV6KjTQiiRFni8oO7TBC2pMTi9k42CNtD4ujyZqYJjIqzkLw2
        C8k7s5C8Mwth8QJGllWMYqkFxbnpqcWGBcbIsb2JEZxMtcx3ME57+0HvECMTB+MhRgkOZiUR
        3rWaW+OFeFMSK6tSi/Lji0pzUosPMZoCA3sis5Rocj4wneeVxBuaGhkbG1uYGJqZGhoqifP+
        0e6IFxJITyxJzU5NLUgtgulj4uCUamBi75nl8TaTZ8Pc7/t/z6y62nn8oMar/yzZ83Y2X1TY
        W7l4Tpa1x6L69bOc/n/fyR32lnPl34n9er3GUntC/jkKVkvcVNm7WbLwROaCxuZ10R7J7Psn
        /lne+LpU/tbTpiu7H/ZNcVCad5NzSp7lyz/rZy78dDs4L/ptsMOU60Fl9RmzvGIaev2bwhS0
        jB6J+L+471kj8WNy2tcrPPwb2Nh1Koon3f1q3LzR+4PMeqMDkaxubBqXby10uGm4act2uf5N
        SvJm+2b8+rC3+/JKz5WeptfDLPw+SHv89j4Stih+QXb/vzWO8yZPKG2PuBO89anl7+4cK8P1
        yU9nn9Kqn3LWV2fhxw62N3siAtdtEwnYp8RSnJFoqMVcVJwIABkqnSEvBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNLMWRmVeSWpSXmKPExsWy7bCSvG7NzO3xBlsaNCzOn9/AbvGx5x6r
        xeVdc9gsZpzfx2Rx8ZSrxeE37awW/65tZLFYtesPowOHx/sbreweO2fdZffYtKqTzaNvyypG
        j8+b5AJYo7hsUlJzMstSi/TtErgy9hz7xFhwx6Li4f/JrA2MC/S7GDk5JARMJF5ee8naxcjF
        ISSwm1Hi9v+97BAJSYlpF48ydzFyANnCEocPF0PUvGWUOPntE1hcWCBS4uB3G5C4iMB6JomW
        1aeYIIo6GSWWXH7KBDKITUBLYv+LG2wgNr+AosTVH48ZQWxeATuJzfsXg9WwCKhKzLhxihnE
        FhUIk9i55DETRI2gxMmZT1hAbE4BM4kNE3aB2cwC6hJ/5l1ihrDFJW49mc8EYctLbH87h3kC
        o9AsJO2zkLTMQtIyC0nLAkaWVYySqQXFuem5xYYFhnmp5XrFibnFpXnpesn5uZsYwfGjpbmD
        cfuqD3qHGJk4GA8xSnAwK4nwrtXcGi/Em5JYWZValB9fVJqTWnyIUZqDRUmc90bhwjghgfTE
        ktTs1NSC1CKYLBMHp1QDU6avdx+HUuxjv0Unzqmld31km1v5zGqu9c/JSmXHPDkmBPS++rO+
        y+PAhzpl/vfWti4bHoifP2YZo/Ug6tBpxiVvzlUwv2VhkhNZ5WFibcSi7LOpksVmyYy0no9P
        75xWWMUSL9x46vG0r5vtHsyVnlwQ+qOOI+RWVKasZ3fLYr6yFbNO7VPrPHDs3uzYyx23l8ie
        SchaJu7NbbJx0dqzzHH/eDgMPOfevN10qYizrrfp0Od79uEJgt0ZdU2xUzLeb+dfzM9nuXg2
        m7V2gZTc8VKr2yrhT7evYH2naPXY8/XTGyv8QiJjPqw4Vftu59FJOurc8xaeF1rv6xK1w8z9
        70mzrkXbG3o/J7AYuL49pMRSnJFoqMVcVJwIABXf8cgOAwAA
X-CMS-MailID: 20201120102500epcas1p44ed3f23e6a965e2dd22789f020804b73
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201119164614epcas1p23b1a2b17bf89f6396b7979fff623bdee
References: <CGME20201119164614epcas1p23b1a2b17bf89f6396b7979fff623bdee@epcas1p2.samsung.com>
        <20201119164509.754851-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/20/20 1:45 AM, Krzysztof Kozlowski wrote:
> So far all Exynos, S3C64xx and S5Pv210 clock units were selected by
> respective SOC/ARCH Kconfig option.  On a kernel built for selected
> SoCs, this allowed to build only limited set of matching clock drivers.
> However compile testing was not possible in such case as Makefile object
> depent on SOC/ARCH option.
> 
> Add separate Kconfig options for each of them to be able to compile
> test.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/clk/samsung/Kconfig  | 67 ++++++++++++++++++++++++++++++++++--
>  drivers/clk/samsung/Makefile | 22 ++++++------
>  include/linux/clk/samsung.h  |  4 +--
>  3 files changed, 78 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
> index 7e9c186e57ef..0441c4f73ac9 100644
> --- a/drivers/clk/samsung/Kconfig
> +++ b/drivers/clk/samsung/Kconfig
> @@ -2,10 +2,73 @@
>  # Recent Exynos platforms should just select COMMON_CLK_SAMSUNG:
>  config COMMON_CLK_SAMSUNG
>  	bool "Samsung Exynos clock controller support" if COMPILE_TEST
> -	# Clocks on ARM64 SoCs (e.g. Exynos5433, Exynos7) are chosen by
> -	# EXYNOS_ARM64_COMMON_CLK to avoid building them on ARMv7:
> +	select S3C64XX_COMMON_CLK if ARM && ARCH_S3C64XX
> +	select S5PV210_COMMON_CLK if ARM && ARCH_S5PV210
> +	select EXYNOS_3250_COMMON_CLK if ARM && SOC_EXYNOS3250
> +	select EXYNOS_4_COMMON_CLK if ARM && ARCH_EXYNOS4
> +	select EXYNOS_5250_COMMON_CLK if ARM && SOC_EXYNOS5250
> +	select EXYNOS_5260_COMMON_CLK if ARM && SOC_EXYNOS5260
> +	select EXYNOS_5410_COMMON_CLK if ARM && SOC_EXYNOS5410
> +	select EXYNOS_5420_COMMON_CLK if ARM && SOC_EXYNOS5420
>  	select EXYNOS_ARM64_COMMON_CLK if ARM64 && ARCH_EXYNOS
>  
> +config S3C64XX_COMMON_CLK
> +	bool "Samsung S3C64xx clock controller support" if COMPILE_TEST
> +	depends on COMMON_CLK_SAMSUNG
> +	help
> +	  Support for the clock controller present on the Samsung S3C64xx SoCs.
> +	  Choose Y here only if you build for this SoC.
> +
> +config S5PV210_COMMON_CLK
> +	bool "Samsung S5Pv210 clock controller support" if COMPILE_TEST
> +	depends on COMMON_CLK_SAMSUNG
> +	help
> +	  Support for the clock controller present on the Samsung S5Pv210 SoCs.
> +	  Choose Y here only if you build for this SoC.
> +
> +config EXYNOS_3250_COMMON_CLK
> +	bool "Samsung Exynos3250 clock controller support" if COMPILE_TEST
> +	depends on COMMON_CLK_SAMSUNG
> +	help
> +	  Support for the clock controller present on the Samsung
> +	  Exynos3250 SoCs. Choose Y here only if you build for this SoC.
> +
> +config EXYNOS_4_COMMON_CLK
> +	bool "Samsung Exynos4 clock controller support" if COMPILE_TEST
> +	depends on COMMON_CLK_SAMSUNG
> +	help
> +	  Support for the clock controller present on the Samsung
> +	  Exynos4212 and Exynos4412 SoCs. Choose Y here only if you build for
> +	  this SoC.
> +
> +config EXYNOS_5250_COMMON_CLK
> +	bool "Samsung Exynos5250 clock controller support" if COMPILE_TEST
> +	depends on COMMON_CLK_SAMSUNG
> +	help
> +	  Support for the clock controller present on the Samsung
> +	  Exynos5250 SoCs. Choose Y here only if you build for this SoC.
> +
> +config EXYNOS_5260_COMMON_CLK
> +	bool "Samsung Exynos5260 clock controller support" if COMPILE_TEST
> +	depends on COMMON_CLK_SAMSUNG
> +	help
> +	  Support for the clock controller present on the Samsung
> +	  Exynos5260 SoCs. Choose Y here only if you build for this SoC.
> +
> +config EXYNOS_5410_COMMON_CLK
> +	bool "Samsung Exynos5410 clock controller support" if COMPILE_TEST
> +	depends on COMMON_CLK_SAMSUNG
> +	help
> +	  Support for the clock controller present on the Samsung
> +	  Exynos5410 SoCs. Choose Y here only if you build for this SoC.
> +
> +config EXYNOS_5420_COMMON_CLK
> +	bool "Samsung Exynos5420 clock controller support" if COMPILE_TEST
> +	depends on COMMON_CLK_SAMSUNG
> +	help
> +	  Support for the clock controller present on the Samsung
> +	  Exynos5420 SoCs. Choose Y here only if you build for this SoC.
> +
>  config EXYNOS_ARM64_COMMON_CLK
>  	bool "Samsung Exynos ARMv8-family clock controller support" if COMPILE_TEST
>  	depends on COMMON_CLK_SAMSUNG
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index 6891b087acff..028b2e27a37e 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -4,15 +4,15 @@
>  #
>  
>  obj-$(CONFIG_COMMON_CLK)	+= clk.o clk-pll.o clk-cpu.o
> -obj-$(CONFIG_SOC_EXYNOS3250)	+= clk-exynos3250.o
> -obj-$(CONFIG_ARCH_EXYNOS4)	+= clk-exynos4.o
> -obj-$(CONFIG_ARCH_EXYNOS4)	+= clk-exynos4412-isp.o
> -obj-$(CONFIG_SOC_EXYNOS5250)	+= clk-exynos5250.o
> -obj-$(CONFIG_SOC_EXYNOS5250)	+= clk-exynos5-subcmu.o
> -obj-$(CONFIG_SOC_EXYNOS5260)	+= clk-exynos5260.o
> -obj-$(CONFIG_SOC_EXYNOS5410)	+= clk-exynos5410.o
> -obj-$(CONFIG_SOC_EXYNOS5420)	+= clk-exynos5420.o
> -obj-$(CONFIG_SOC_EXYNOS5420)	+= clk-exynos5-subcmu.o
> +obj-$(CONFIG_EXYNOS_3250_COMMON_CLK)	+= clk-exynos3250.o
> +obj-$(CONFIG_EXYNOS_4_COMMON_CLK)	+= clk-exynos4.o
> +obj-$(CONFIG_EXYNOS_4_COMMON_CLK)	+= clk-exynos4412-isp.o
> +obj-$(CONFIG_EXYNOS_5250_COMMON_CLK)	+= clk-exynos5250.o
> +obj-$(CONFIG_EXYNOS_5250_COMMON_CLK)	+= clk-exynos5-subcmu.o
> +obj-$(CONFIG_EXYNOS_5260_COMMON_CLK)	+= clk-exynos5260.o
> +obj-$(CONFIG_EXYNOS_5410_COMMON_CLK)	+= clk-exynos5410.o
> +obj-$(CONFIG_EXYNOS_5420_COMMON_CLK)	+= clk-exynos5420.o
> +obj-$(CONFIG_EXYNOS_5420_COMMON_CLK)	+= clk-exynos5-subcmu.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos5433.o
>  obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
>  obj-$(CONFIG_EXYNOS_CLKOUT)	+= clk-exynos-clkout.o
> @@ -21,5 +21,5 @@ obj-$(CONFIG_S3C2410_COMMON_CLK)+= clk-s3c2410.o
>  obj-$(CONFIG_S3C2410_COMMON_DCLK)+= clk-s3c2410-dclk.o
>  obj-$(CONFIG_S3C2412_COMMON_CLK)+= clk-s3c2412.o
>  obj-$(CONFIG_S3C2443_COMMON_CLK)+= clk-s3c2443.o
> -obj-$(CONFIG_ARCH_S3C64XX)	+= clk-s3c64xx.o
> -obj-$(CONFIG_ARCH_S5PV210)	+= clk-s5pv210.o clk-s5pv210-audss.o
> +obj-$(CONFIG_S3C64XX_COMMON_CLK)	+= clk-s3c64xx.o
> +obj-$(CONFIG_S5PV210_COMMON_CLK)	+= clk-s5pv210.o clk-s5pv210-audss.o
> diff --git a/include/linux/clk/samsung.h b/include/linux/clk/samsung.h
> index 79097e365f7f..38b774001712 100644
> --- a/include/linux/clk/samsung.h
> +++ b/include/linux/clk/samsung.h
> @@ -10,7 +10,7 @@
>  
>  struct device_node;
>  
> -#ifdef CONFIG_ARCH_S3C64XX
> +#ifdef CONFIG_S3C64XX_COMMON_CLK
>  void s3c64xx_clk_init(struct device_node *np, unsigned long xtal_f,
>  		      unsigned long xusbxti_f, bool s3c6400,
>  		      void __iomem *base);
> @@ -19,7 +19,7 @@ static inline void s3c64xx_clk_init(struct device_node *np,
>  				    unsigned long xtal_f,
>  				    unsigned long xusbxti_f,
>  				    bool s3c6400, void __iomem *base) { }
> -#endif /* CONFIG_ARCH_S3C64XX */
> +#endif /* CONFIG_S3C64XX_COMMON_CLK */
>  
>  #ifdef CONFIG_S3C2410_COMMON_CLK
>  void s3c2410_common_clk_init(struct device_node *np, unsigned long xti_f,
> 

It looks good to me for compile testing. Thanks.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
