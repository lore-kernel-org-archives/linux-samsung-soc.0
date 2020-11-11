Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76286C388F9
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Nov 2020 10:11:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E67B52076E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Nov 2020 10:11:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rBcY8PnT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbgKKKLw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 11 Nov 2020 05:11:52 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:62445 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727212AbgKKKLv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Nov 2020 05:11:51 -0500
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20201111101148epoutp02608666a0bfaeb42e2a1a4672ea3f12dc~GbGdFikf51487214872epoutp02A
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Nov 2020 10:11:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20201111101148epoutp02608666a0bfaeb42e2a1a4672ea3f12dc~GbGdFikf51487214872epoutp02A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1605089508;
        bh=UK192lurrVstoJVqplp6lLRHryqWEbuY4owgU9ypYPU=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=rBcY8PnTgwBhziQQMm9eCvO+ipDVmqRTd6dhK/eybebUfiESNTDJ/QlLERnumnrQQ
         KsCOgZYC4YbIth1JKz+9Q7fnXt4yrWNStLMGBaIfgI2TkbXXbAfn6NtvcV3uHpcKeG
         EqA8PLDfPlWGt7LHWcA+AeJfs/KkuT5R6IuyjelI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20201111101147epcas1p3f9fc958728fc8706400bee24c466d286~GbGctdzi70281302813epcas1p3L;
        Wed, 11 Nov 2020 10:11:47 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.158]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4CWL9s2pMtzMqYkk; Wed, 11 Nov
        2020 10:11:45 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        E0.AD.10463.1E8BBAF5; Wed, 11 Nov 2020 19:11:45 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201111101144epcas1p13b8e67701630ed85d4984de890f2f6b0~GbGZ0Ujz20897308973epcas1p1B;
        Wed, 11 Nov 2020 10:11:44 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201111101144epsmtrp2631b382c7481c23ca1cb8ac8a857287f~GbGZuAeHT2680026800epsmtrp2R;
        Wed, 11 Nov 2020 10:11:44 +0000 (GMT)
X-AuditID: b6c32a38-efbff700000028df-fd-5fabb8e1f058
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        D9.17.13470.0E8BBAF5; Wed, 11 Nov 2020 19:11:44 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201111101144epsmtip110eaf6e36052b5b5417772605217937d~GbGZZZK9x2400324003epsmtip1U;
        Wed, 11 Nov 2020 10:11:44 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: allow building the clkout driver as
 module
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <0f8c5a70-44e0-b4aa-51e7-73d8db9ff85b@samsung.com>
Date:   Wed, 11 Nov 2020 19:25:33 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201110193749.261367-1-krzk@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKJsWRmVeSWpSXmKPExsWy7bCmnu7DHavjDaZs4LM4f34Du8Wmx9dY
        LT723GO1uLxrDpvFjPP7mCwunnK1OPymndXi37WNLBardv1hdOD0eH+jld1j56y77B6bVnWy
        eWxeUu/Rt2UVo8fnTXIBbFHZNhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJ
        uam2Si4+AbpumTlANykplCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCiwL9IoTc4tL
        89L1kvNzrQwNDIxMgQoTsjPaTxoXzBar6OpYztjAuEmoi5GTQ0LAROLG+0csXYxcHEICOxgl
        vvV0MkM4nxglnv/+xARSJSTwjVFiarcgTEfn5j1QRXsZJSYf6mCFcN4zSpz99IMRpEpYwF/i
        RdtXdpCEiMBlJonp5yeCjWIT0JLY/+IGG4jNL6AocfXHY7AGXgE7iQ8fT7KA2CwCqhLT9hxn
        B7FFBcIkTm5rgaoRlDg58wlYDaeAmcSWo3vBbGYBcYlbT+YzQdjyEtvfzgE7T0JgLodE98Et
        jBB3u0i0dvawQtjCEq+Ob2GHsKUkPr/bywZhV0usPHmEDaK5g1Fiy/4LUA3GEvuXTgbawAG0
        QVNi/S59iLCixM7fcxkhFvNJvPsKMp8DKM4r0dEGDWBlicsP7jJB2JISi9s7oVZ5SNz/NZ91
        AqPiLCSvzULyziwk78xCWLyAkWUVo1hqQXFuemqxYYEJcmxvYgSnVy2LHYxz337QO8TIxMF4
        iFGCg1lJhJepbVW8EG9KYmVValF+fFFpTmrxIUZTYGBPZJYSTc4HJvi8knhDUyNjY2MLE0Mz
        U0NDJXHeP9od8UIC6YklqdmpqQWpRTB9TBycUg1MDKzKy/5v7+f8qL1cVNbb1Ofaz45Nk89y
        rV29a4XDJWn2nXdVhC70JZ58eaJBzOxeecmqbXETSk+u2F32aONkQ45NwpI+p56pTLv07ebv
        xIfSbr82SgaF8C/61djhM6vI6JJG7qH9HtMEmHNXRs4TVPr166lWQPHRmbny53ZHBp3xvsO0
        VyG+0jpkw+wO/32Wf76uLT0Uly+57sXjCSINU9lDjxsqtS273f/6yb34nEc5qXIn2rgEFPVy
        9K6nLPhq6fMwQKSDe8M65bknZJiV61K5VK6E+lodk+C08pL1Mlz2itdmZ9RDsU+f9k3ynnSw
        y1+oomdHm0Umx/3pydUn3RxZ81xcfOR+avPzlV9QYinOSDTUYi4qTgQAlL5jZTgEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphkeLIzCtJLcpLzFFi42LZdlhJTvfBjtXxBp+W81mcP7+B3WLT42us
        Fh977rFaXN41h81ixvl9TBYXT7laHH7Tzmrx79pGFotVu/4wOnB6vL/Ryu6xc9Zddo9NqzrZ
        PDYvqffo27KK0ePzJrkAtigum5TUnMyy1CJ9uwSujPaTxgWzxSq6OpYzNjBuEupi5OSQEDCR
        6Ny8h7mLkYtDSGA3o8SOtzfYIRKSEtMuHgVKcADZwhKHDxdD1LxllHiy7CorSI2wgK/E3KsP
        GUESIgLXmSSmH1jMCFHVySjxZt0usElsAloS+1/cYAOx+QUUJa7+eMwIYvMK2El8+HiSBcRm
        EVCVmLbnOFi9qECYxM4lj5kgagQlTs58AlbDKWAmseXoXjCbWUBd4s+8S8wQtrjErSfzmSBs
        eYntb+cwT2AUmoWkfRaSlllIWmYhaVnAyLKKUTK1oDg3PbfYsMAwL7Vcrzgxt7g0L10vOT93
        EyM4orQ0dzBuX/VB7xAjEwfjIUYJDmYlEV6mtlXxQrwpiZVVqUX58UWlOanFhxilOViUxHlv
        FC6MExJITyxJzU5NLUgtgskycXBKNTBFXtt+3KJ9mVb0g7szKhoY5bOdr552nb7P8+y5CD4X
        gadacXqX9ZOr7ojEPTs/NXLOJN74mIe1TH3XRHOUpP5LaZ9Y/nLaxzmnzjYUZ65hFN5lFrP9
        5JHJduzJ2g1qNzcXXctdwKXsX1ptkch7S/f7Hb87n+Mc+Zw9mJqXXTQw/fc1sfLZRcVUx0+v
        5FeWPmk+8VEl9UN64/3zAQrXf35cx9IdbOljWJW82a5Ccfd71Z8yQlKLVjnf5GnPqgnhEaxJ
        z/2q+Uy0qdzxyvww3gP6S1cnFs1czn9hqvuNN61uL3I6NXW5fFjftm3PX5WVdsnkb90XaX4O
        11olw6Z25z9zNidf4XjePUNxxxm1ACWW4oxEQy3mouJEAPJ6W1oXAwAA
X-CMS-MailID: 20201111101144epcas1p13b8e67701630ed85d4984de890f2f6b0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201110193800epcas1p22bc64cad38fe355f25684175d2c77e83
References: <CGME20201110193800epcas1p22bc64cad38fe355f25684175d2c77e83@epcas1p2.samsung.com>
        <20201110193749.261367-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 11/11/20 4:37 AM, Krzysztof Kozlowski wrote:
> The Exynos clock output driver can be built as module (it does not have
> to be part of core init process) for better customization.  Adding a
> KConfig entry allows also compile testing for build coverage.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/clk/samsung/Kconfig             | 10 ++++++++++
>  drivers/clk/samsung/Makefile            |  2 +-
>  drivers/clk/samsung/clk-exynos-clkout.c |  1 +
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
> index 57d4b3f20417..b6b2cb209543 100644
> --- a/drivers/clk/samsung/Kconfig
> +++ b/drivers/clk/samsung/Kconfig
> @@ -19,6 +19,16 @@ config EXYNOS_AUDSS_CLK_CON
>  	  on some Exynos SoC variants. Choose M or Y here if you want to
>  	  use audio devices such as I2S, PCM, etc.
>  
> +config EXYNOS_CLK_OUT
> +	tristate "Samsung Exynos clock output driver"
> +	depends on COMMON_CLK_SAMSUNG
> +	default y if ARCH_EXYNOS
> +	help
> +	  Support for the clock output (XCLKOUT) driver present on some of
> +	  Exynos SoC variants. Usually the XCLKOUT is used to monitor the
> +	  status of the certains clocks from SoC, but it could also be tied to
> +	  other devices as an input clock.
> +
>  # For S3C24XX platforms, select following symbols:
>  config S3C2410_COMMON_CLK
>  	bool "Samsung S3C2410 clock controller support" if COMPILE_TEST
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index 1a4e6b787978..4adbf972e9f6 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -15,7 +15,7 @@ obj-$(CONFIG_SOC_EXYNOS5420)	+= clk-exynos5420.o
>  obj-$(CONFIG_SOC_EXYNOS5420)	+= clk-exynos5-subcmu.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos5433.o
>  obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
> -obj-$(CONFIG_ARCH_EXYNOS)	+= clk-exynos-clkout.o
> +obj-$(CONFIG_EXYNOS_CLK_OUT)	+= clk-exynos-clkout.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7.o
>  obj-$(CONFIG_S3C2410_COMMON_CLK)+= clk-s3c2410.o
>  obj-$(CONFIG_S3C2410_COMMON_DCLK)+= clk-s3c2410-dclk.o
> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
> index f5f8a956b316..9ec2f40cc400 100644
> --- a/drivers/clk/samsung/clk-exynos-clkout.c
> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
> @@ -72,6 +72,7 @@ static const struct of_device_id exynos_clkout_ids[] = {
>  		.data = &exynos_clkout_exynos5,
>  	}, { }
>  };
> +MODULE_DEVICE_TABLE(of, exynos_clkout_ids);
>  
>  /*
>   * Device will be instantiated as child of PMU device without its own
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
