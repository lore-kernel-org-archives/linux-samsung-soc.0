Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36635C636D6
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Feb 2023 11:07:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjBPLHK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Feb 2023 06:07:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbjBPLHJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Feb 2023 06:07:09 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F7637B67
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2023 03:07:07 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id b2so4196784ejz.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2023 03:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2XtfON9YmhK/54vgAcFs1XoGNiMG/tSNcLmL9ZluKEY=;
        b=xTtIjm+aMf26mPdovCi9L09kIwvE8z/9D/ZIgVDo0CjMWbgGkRpVEkbqaNq9/LFb2U
         HY6jsIAafQ37cZZSt+uegtQyTo6Fq4h2IKtAyXLOh41gpi37gjU0x+XmkmOAvhMHr5ug
         /SZVtkSJ7E8qiF0nTUg6h9vwIgJ3LC3hr9hlBYWKTMp0snLWgXTs+eSKsliGFKaOZcgq
         Vff7AaoxCVd0MqqXOfHXLjWCy/EZbLz/lD8Mav5xSyezIFhxgs5ypS8LqbH/79iGNMcr
         Ltu5XMxQGBheqBUSdTfV148/7BoiuncWJkivuxWaSfYCkt+NqlFpQZplIJDt6iVa6txF
         DgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2XtfON9YmhK/54vgAcFs1XoGNiMG/tSNcLmL9ZluKEY=;
        b=vIi/mGyU2bCSaJasQ/44RllilGgoDrQgdtveqtVv6PYMa9XCvnR/ZW7GYpPPZtVEt2
         hF4q6hyJeh5xPlP2qryXFe1OB1kM7MQaSX6ZTF+oOMFzyVXyk6tB3TAQ9/yDsndTtlOl
         FveNb0X8JXLeSqPs1JANcQwECBPzoqJsdAnz/75EA90Trr3c2hMp3//uMHNSVp91Csz3
         bO103XV7KsZkukMxZhiPiWe9He2dW9KzLUMkR9DKm9GHUP1/rwDGf6c+oIOYfbT6cVTq
         X+kmmVFfHxSoomeLxfCmQnH5GCQzG4R94cBZsTU255bYUv8uxDtgPAKgwh9etP95o4PX
         rvVQ==
X-Gm-Message-State: AO0yUKVQiPqKUQFbMEkoE2BEv2efHQqlzhNHlEAbaxTBHcqWAxDIkNiH
        t/XxlHS3hdxjEw2KciABOjiJpw==
X-Google-Smtp-Source: AK7set9+/bKi4OtttusS38rCL3Uq4qJh+IzTiwS3GRQZ6Gip9Lt1BDOBFqxhTbtmvnS3mFcQtENeVQ==
X-Received: by 2002:a17:906:40e:b0:87b:dc07:380f with SMTP id d14-20020a170906040e00b0087bdc07380fmr6245015eja.0.1676545626049;
        Thu, 16 Feb 2023 03:07:06 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ad24-20020a170907259800b0087bdac06a3bsm681976ejc.2.2023.02.16.03.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 03:07:05 -0800 (PST)
Message-ID: <a4bfad9d-b9df-28a5-6bee-5cbbca4dd23f@linaro.org>
Date:   Thu, 16 Feb 2023 12:07:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 08/16] PCI: samsung: Rename exynos_pcie to samsung_pcie
Content-Language: en-US
To:     Shradha Todi <shradha.t@samsung.com>, lpieralisi@kernel.org,
        kw@linux.com, robh@kernel.org, bhelgaas@google.com,
        krzysztof.kozlowski+dt@linaro.org, alim.akhtar@samsung.com,
        jingoohan1@gmail.com, Sergey.Semin@baikalelectronics.ru,
        lukas.bulwahn@gmail.com, hongxing.zhu@nxp.com, tglx@linutronix.de,
        m.szyprowski@samsung.com, jh80.chung@samsung.co,
        pankaj.dubey@samsung.com
Cc:     linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230214121333.1837-1-shradha.t@samsung.com>
 <CGME20230214121436epcas5p1641de02220bea5edb23bc875b6311270@epcas5p1.samsung.com>
 <20230214121333.1837-9-shradha.t@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230214121333.1837-9-shradha.t@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/02/2023 13:13, Shradha Todi wrote:
> The platform specific structure being used is named
> exynos_pcie. Changing it to samsung_pcie for making it
> generic.
> 
> Suggested-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> ---
>  drivers/pci/controller/dwc/pci-samsung.c | 190 +++++++++++------------
>  1 file changed, 95 insertions(+), 95 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-samsung.c b/drivers/pci/controller/dwc/pci-samsung.c
> index d5adf1017a05..be0177fcd763 100644
> --- a/drivers/pci/controller/dwc/pci-samsung.c
> +++ b/drivers/pci/controller/dwc/pci-samsung.c
> @@ -23,7 +23,7 @@
>  
>  #include "pcie-designware.h"
>  
> -#define to_exynos_pcie(x)	dev_get_drvdata((x)->dev)
> +#define to_samsung_pcie(x)	dev_get_drvdata((x)->dev)
>  
>  /* PCIe APPL registers */
>  #define EXYNOS_PCIE_IRQ_PULSE			0x000
> @@ -51,7 +51,7 @@
>  #define EXYNOS_PCIE_APPL_SLV_ARMISC		0x120
>  #define EXYNOS_PCIE_APPL_SLV_DBI_ENABLE	BIT(21)
>  
> -struct exynos_pcie {
> +struct samsung_pcie {

No, I don't see benefit of this at all. How we call stuff inside driver
is not related whether this is for Tesla or Exynos. We could even call
it "pony". :) Thus renamings just to support new variant of Samsung
device is not a good reason.

Unless all of the old "exynos" names will be soon needed for some
exynos-specific variants?

Best regards,
Krzysztof

