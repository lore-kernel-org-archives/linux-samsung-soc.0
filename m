Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654BDC43334
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  3 Jul 2022 19:10:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbiGCTKO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 3 Jul 2022 15:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbiGCTKO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 3 Jul 2022 15:10:14 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0399BE88
        for <linux-samsung-soc@vger.kernel.org>; Sun,  3 Jul 2022 12:10:13 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id t25so12366721lfg.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Jul 2022 12:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=C2tDfgoX+P267gLCuOT8WT5QIWnxnLjBwXsq25f/EmI=;
        b=x04iaenc8p/Yk53m9sEIoVyHfr30CrXFnGUblx6ubDvjy2/VNA6T7If/2Kvfthklt4
         3HH4kLMY5mvEklcgUGk0aeWDc6NriPEyg/0AxC1Y7eUtA4SmjtdDBD8N1//fOqovZ4MI
         kw1bqPUgQqE1+Oh/5OnUoQEcK85zxNzgahq1yDSuwyZzjvhgF8fwF4lkWz2NEjEQsBLm
         GHa4Ti1WgE4X97lQebJu1Ts8wlPlvWH6p22iWOwwRevblG2+jxcuB3HMlng3tVd1H3CQ
         uCsTezmE/h8FZBDl12yl3FbOULsDyTGRTV4a3mhSGuqIlhMy4ODpmTVg8YjskURr9AUc
         iCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=C2tDfgoX+P267gLCuOT8WT5QIWnxnLjBwXsq25f/EmI=;
        b=XdRUJmVpbaGy6jc6FQLn93glk8YTweRj2kQu/L9JnZHI7qxLTbCpUBKF7bvYqxs5mv
         ZaFymDhtsVCDF2kUcuNv6kaU9LIDjSsVoD+4ihlTn+vynOvwf4mm0CxXaKZCz9T6epqN
         8hV0sHsflW83bQAdz78qLMJx2dYWaaf1vFughozEVpfHNw+hXZ/8FN1TeGRPz20H+ZIW
         Ylv6er3HkgG+VU7ylIy4wz2K7bOwO/mLnnPPDrzS9mXVyvyiUU3fuLRqgYUbE4eYFx4r
         ZYghGR6eTqv5AJ69si/oad7D7r2xrXKF7CFBU5wyx/1unZM9Wq8e3GEJBO756A6lXWoE
         AjWg==
X-Gm-Message-State: AJIora/Zb64ljsVusrt9aQ1A0ymGr627Fu0Rb4U8Ua3S7bxKyBjQ/LjG
        0mwtHT5qb7WIQ43bHdiTc277/A==
X-Google-Smtp-Source: AGRyM1vt1+px48qZ8Nvj6T1HQ2dg8DedlqRt7777HjENa2umG2gtSUlaHdtqLM7XMJpVbyyOL4zS5A==
X-Received: by 2002:a05:6512:1385:b0:47f:781d:abc9 with SMTP id p5-20020a056512138500b0047f781dabc9mr15505032lfa.687.1656875411319;
        Sun, 03 Jul 2022 12:10:11 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id d7-20020a056512368700b00478ee064d9bsm4819210lfs.177.2022.07.03.12.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Jul 2022 12:10:10 -0700 (PDT)
Message-ID: <23357d34-4570-1309-6b6e-46055bdb8160@linaro.org>
Date:   Sun, 3 Jul 2022 21:10:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/4] iommu/exynos: Check if SysMMU v7 has VM registers
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Daniel Mentz <danielmentz@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        iommu@lists.linux-foundation.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220702213724.3949-1-semen.protsenko@linaro.org>
 <20220702213724.3949-3-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220702213724.3949-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/07/2022 23:37, Sam Protsenko wrote:
> SysMMU v7 can have Virtual Machine registers, which implement multiple
> translation domains. The driver should know if it's true or not, as VM
> registers shouldn't be accessed if not present. Read corresponding
> capabilities register to obtain that info, and store it in driver data.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/iommu/exynos-iommu.c | 42 ++++++++++++++++++++++++++++++------
>  1 file changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index 28f8c8d93aa3..df6ddbebbe2b 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -135,6 +135,9 @@ static u32 lv2ent_offset(sysmmu_iova_t iova)
>  #define CFG_SYSSEL	(1 << 22) /* System MMU 3.2 only */
>  #define CFG_FLPDCACHE	(1 << 20) /* System MMU 3.2+ only */
>  
> +#define CAPA0_CAPA1_EXIST		BIT(11)
> +#define CAPA1_VCR_ENABLED		BIT(14)
> +
>  /* common registers */
>  #define REG_MMU_CTRL		0x000
>  #define REG_MMU_CFG		0x004
> @@ -171,6 +174,10 @@ static u32 lv2ent_offset(sysmmu_iova_t iova)
>  #define REG_V5_FAULT_AR_VA	0x070
>  #define REG_V5_FAULT_AW_VA	0x080
>  
> +/* v7.x registers */
> +#define REG_V7_CAPA0		0x870
> +#define REG_V7_CAPA1		0x874
> +
>  #define has_sysmmu(dev)		(dev_iommu_priv_get(dev) != NULL)
>  
>  static struct device *dma_dev;
> @@ -274,6 +281,9 @@ struct sysmmu_drvdata {
>  	unsigned int version;		/* our version */
>  
>  	struct iommu_device iommu;	/* IOMMU core handle */
> +
> +	/* v7 fields */
> +	bool has_vcr;			/* virtual machine control register */
>  };
>  
>  static struct exynos_iommu_domain *to_exynos_domain(struct iommu_domain *dom)
> @@ -364,11 +374,7 @@ static void __sysmmu_disable_clocks(struct sysmmu_drvdata *data)
>  
>  static void __sysmmu_get_version(struct sysmmu_drvdata *data)
>  {
> -	u32 ver;
> -
> -	__sysmmu_enable_clocks(data);
> -
> -	ver = readl(data->sfrbase + REG_MMU_VERSION);
> +	const u32 ver = readl(data->sfrbase + REG_MMU_VERSION);


No need for const for local, non-pointer variables. There is no benefit
in preventing the modification and it is not a constant.

>  
>  	/* controllers on some SoCs don't report proper version */
>  	if (ver == 0x80000001u)
> @@ -378,6 +384,29 @@ static void __sysmmu_get_version(struct sysmmu_drvdata *data)
>  
>  	dev_dbg(data->sysmmu, "hardware version: %d.%d\n",
>  		MMU_MAJ_VER(data->version), MMU_MIN_VER(data->version));
> +}
> +
> +static bool __sysmmu_has_capa1(struct sysmmu_drvdata *data)
> +{
> +	const u32 capa0 = readl(data->sfrbase + REG_V7_CAPA0);

Same here and further.


Best regards,
Krzysztof
