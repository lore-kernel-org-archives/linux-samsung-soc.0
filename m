Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B03C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Dec 2021 18:27:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243326AbhLISbC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Dec 2021 13:31:02 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:58406
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238208AbhLISbC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Dec 2021 13:31:02 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E12183F1B7
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Dec 2021 18:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639074447;
        bh=7MMZq0hIb3eR8oUwilVI+A8i34AgFBxa5Ka85QzcfFY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=lmZ/+Pcf9J+jIMTbMywzzvjooWzRH43kZx0ahc4YMzXwwN+InCT1pgjPaN6fwLRk0
         D6VjiKgeZf9Mu1Yzks6nMRBrbz3GWUR43bRtjtU0p53l3tG75vlBigIjLASpIWxgS4
         sut9QovFbW54LrotajFkd4b3W+S28HUhCGnjuhBepJM2uIW/fm84dqYbU3Nlz3iCn4
         tbV3WQTQk3bfzn0C+tkLLi2xLhfZOm/9qQlFI8453zb85QEloyTGBs9PvfLT90QLNm
         dO6hSVn3xDAZZWsrAGXD+crYHwHUVhXSUDps+fWygWX+R0rzH3MnjjP3/ThDnF0ApJ
         CupmhUht95y2w==
Received: by mail-lf1-f69.google.com with SMTP id m1-20020ac24281000000b004162863a2fcso2956189lfh.14
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Dec 2021 10:27:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7MMZq0hIb3eR8oUwilVI+A8i34AgFBxa5Ka85QzcfFY=;
        b=bVek8ZaTv5rxP2VAOBd6WQAz1MFzvQplw52Km1q0ssjwbhYv2172sziil0Eik1iGS7
         zSdYCNWEdNWQW21BXtIHffEmwzvvQG+lte85qtyj2ELX6n2dAyHTT3FipKlO5mt7T5F8
         YVVROebpl8dHgQ3KyMZ4QdnKfs0Wuw8ZjAT2iXurFZTirE9+jsnH7dJ95MahpGrJJBpy
         LYWbRL7RnzjkOpeLR+pszXP1y0ToRkzL+/hjYIaYM8KVQ+CLt7R8AZgvML6IC7OghyA+
         rycejRwiWDF+N/rx+n2/VwwF4PtN6uX2jXC5klvJ/wuKbAXB8HNvHNpLjeh/eas+Ifww
         /e7g==
X-Gm-Message-State: AOAM530Gsm2T3lFdtcFMzAxrWOotbWJuEHp2gcu/R2y+j/47j32Kkkk1
        CfTDADV2byXvxi/NoAzygPnernWSILolx7cqrDQ2lr3ZzkvgxGem2gJG+VcFVWOy5QXgdSTBoxk
        CpjtNCivwrtnJWMMqtHRlyWxipFBVZK473Yp29pp+Vfi096Ut
X-Received: by 2002:a05:6512:3084:: with SMTP id z4mr7402046lfd.330.1639074447357;
        Thu, 09 Dec 2021 10:27:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFTHICovFbRNrnIcqijBCIzldopHWrU33OIjD8u3dhRnkf0VqswJDI7rEJaO6c3iWhQ46Bdg==
X-Received: by 2002:a05:6512:3084:: with SMTP id z4mr7402032lfd.330.1639074447186;
        Thu, 09 Dec 2021 10:27:27 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id x15sm50007ljc.124.2021.12.09.10.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 10:27:26 -0800 (PST)
Message-ID: <5f74a62f-fb94-72d3-341c-e2921faa4282@canonical.com>
Date:   Thu, 9 Dec 2021 19:27:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v3 1/4] dt-bindings: mmc: exynos-dw-mshc: Add support for
 ARTPEC-8
Content-Language: en-US
To:     =?UTF-8?Q?M=c3=a5rten_Lindahl?= <marten.lindahl@axis.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jaehoon Chung <jh80.chung@samsung.com>
Cc:     Doug Anderson <dianders@google.com>, kernel@axis.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211209164558.13729-1-marten.lindahl@axis.com>
 <20211209164558.13729-2-marten.lindahl@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211209164558.13729-2-marten.lindahl@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/12/2021 17:45, Mårten Lindahl wrote:
> The ARTPEC-8 SoC has a DWMMC controller that is compatible with the
> Exynos 7 version v2.70a. The main differences from Exynos 7 is that it
> does not support HS400 and has extended data read timeout.
> 
> Add compatibility string "axis,artpec8-dw-mshc" for ARTPEC-8.
> 
> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> ---
> 
> v2:
>  - Change compatible string vendor prefix
> 
>  Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
> index 0419a63f73a0..753e9d7d8956 100644
> --- a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
> +++ b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
> @@ -22,6 +22,8 @@ Required Properties:
>  	  specific extensions.
>  	- "samsung,exynos7-dw-mshc-smu": for controllers with Samsung Exynos7
>  	  specific extensions having an SMU.
> +	- "axis,artpec8-dw-mshc": for controllers with ARTPEC-8 specific
> +	  extensions.
>  

Any reason why you ignored my tag?


Best regards,
Krzysztof
