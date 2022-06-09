Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A9FCCA473
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Jun 2022 06:36:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbiFIGgc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Jun 2022 02:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236824AbiFIGgb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 02:36:31 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 307C122BACB
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Jun 2022 23:36:30 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id o10so29838593edi.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Jun 2022 23:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=NJcB6ULEi06ujOrbXg5DIncgArHtF9TanOoBMremDoQ=;
        b=VtJkNhAWYfQbqsjEIqLeHUu8ofkD3JeBO5CAZb7XAu6cAU2WkhI/YKTE6hWXet6Uq6
         79NRAFd/OHqYqij5QY1xxZshI6ekUmeJe0tTu3BhxnQbpLljmRCEeqMLCsjI72VW7cvL
         EXVgEEJn5M49qbr0EMje6ivbOqBZ0kpzPVi7GbeuH9HmRuf4SAyYmENok9Iv0l0tAYVK
         CtuILTdGChDDFgBcROHLcdJsN3dxqq6B0nbuS/tjC0Uv+F3wonK0GJ7IvkjK4nf5iEcr
         DNHei/sAkbeEqFnRZeLP1jSDWuE5YOkiMF1UNZX18T+KyCZ3DSNrNqH5OLXTWRBaUIK2
         oh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NJcB6ULEi06ujOrbXg5DIncgArHtF9TanOoBMremDoQ=;
        b=ikgwsjCzfBx9UgCths0bNInTcv3c89pu9qP2LBltbmqEHk1NzBfyr+XOj2si7hvGBi
         LQwr6C2NoCt4xOqiArAO7zO3lT5obas86dLmwgG+cReek0LZpKjrdugf3Q3iWrl5ta7T
         w2d/HkdMPT55rwyFeI0EWknUECCLwItLEi2XrXdNlIGWYhd4sJZ27gRG4Ga8MpTwtrkI
         SjbW/04q50pfYLPALfAvUN6k0DWZWyckCL2WmFDAPUbnj7rG7zphs7T5j6iobCawBuXN
         cU+Z4lIY9A9fe1Pu7U4V0XS5BFiFDBsG/2xrkdlQHYGcjwi2AovVEq/9MO3jiXdxJCH2
         y/uQ==
X-Gm-Message-State: AOAM531IawJKYQ98xUYAIH+838C9z695g4QhfgiHAlaMdPjFV6jbg6ve
        IhqbfqiM+D2uQofnMnQEU4SMrQ==
X-Google-Smtp-Source: ABdhPJyrrS9vRDWjaFmMAy4TlrvqadM+BD1Szg6LB3GdLycpZnPGz4Dvs0SeaGaMZu6Wd8cJjTPXzA==
X-Received: by 2002:a05:6402:43c5:b0:42d:e4f6:d63e with SMTP id p5-20020a05640243c500b0042de4f6d63emr43390497edc.303.1654756588798;
        Wed, 08 Jun 2022 23:36:28 -0700 (PDT)
Received: from [192.168.0.194] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z3-20020a170906270300b00704a5c530ccsm10311579ejc.162.2022.06.08.23.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 23:36:27 -0700 (PDT)
Message-ID: <c0062aad-50f2-a9ea-ad04-8af9e70f8bba@linaro.org>
Date:   Thu, 9 Jun 2022 08:36:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH -next] spi: Return true/false (not 1/0) from bool function
Content-Language: en-US
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     andi@etezian.org, broonie@kernel.org, alim.akhtar@samsung.com,
        linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Abaci Robot <abaci@linux.alibaba.com>
References: <20220609060323.106095-1-yang.lee@linux.alibaba.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220609060323.106095-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/06/2022 08:03, Yang Li wrote:
> Return boolean values ("true" or "false") instead of 1 or 0 from bool
> function. This fixes the following warnings from coccicheck:
> 
> ./drivers/spi/spi-s3c64xx.c:385:9-10: WARNING: return of 0/1 in function
> 's3c64xx_spi_can_dma' with return type bool
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>

It was reported by coccinelle, not robot, wasn't it?

I cannot find this report. This is an open source work and public
collaboration. The "Reported-by" usually means that the issue was
reported. Usually in public. Can we see the report?
Otherwise adding non-public reports is useless and clutters our
report-credit-system.



> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/spi/spi-s3c64xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 82558e37c735..28e7b7cb68a7 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -382,7 +382,7 @@ static bool s3c64xx_spi_can_dma(struct spi_master *master,
>  	if (sdd->rx_dma.ch && sdd->tx_dma.ch) {
>  		return xfer->len > (FIFO_LVL_MASK(sdd) >> 1) + 1;
>  	} else {
> -		return 0;
> +		return false;
>  	}
>  
>  }


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
