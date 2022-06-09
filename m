Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8674C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Jun 2022 08:51:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241846AbiFIIvA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Jun 2022 04:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232184AbiFIIum (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 04:50:42 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A7F1498FF
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jun 2022 01:48:47 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id bg6so26277470ejb.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jun 2022 01:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0FrUfxGjJdLOSXTrxUdjkVL6nrlzjO3+JUo/vnRLcSA=;
        b=KMK4oI5Fxe0qAHQkJ9CRo4IKa3GThd6bcTMU9rPxWbxZqBQFMskPd+ihFJHP4JcnZ3
         XmY244lJqm4jhVPAye8YmfOGsXd/Bvvxjp0Fv9phkeVEFmoa81HLkTohIxs6I62s2ehf
         GHtq8jUZKG3ijDVptmfLjIlJWIMxE0PgMbMlQLjQJjgwSfsxXoIKXDNU2nSLpAHJx89S
         0o7tM13z5DXSV/8hRHefRz56S5a2PyGLBn7q/ETGU40Ym5n0UH7P1vHnbfcvJtT4++6o
         5C8rLdB+EO/p9c2aw6/9lyHwuY7Bu/V4QDKR92OXSqeOnii9+OajsSWAZbWuo0mdkoMQ
         U/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0FrUfxGjJdLOSXTrxUdjkVL6nrlzjO3+JUo/vnRLcSA=;
        b=AyQQfTCGrqgLlkQTXc+Cfk3G1OD5NvSwPgdV8QeALCKmKHbo/SQ1XGJFLEFbKfW88u
         SI/zn54GDsska3pjigI+WXTj45/k4Czqg6U+m8LN7GUpaJLFKmNOkO01i8+f/RDD6Z8C
         OCrVIz27iakVofNBVM4EDa5Yd9rfZCil7DnCFEqASTOFdOaI/CddQ0n+FboxVVzny0aE
         EyC7e4wXvLqpINgMfM3rF3m6IRiSV25tkg7ULXWdYdim+dSNUbQEoevu/0AUK7I7wjrS
         3c+lzRlXu5qy67dR4SM07VsET3C5R63r6VTbdz9UC+rceNeraW2oXEnnDzpf9bO2sHJQ
         EFJg==
X-Gm-Message-State: AOAM530/afRtBSghEdYDp7Grlqhv+E8jS1Ei3CBCygBseZhxIdwVXXYg
        Og3lkXTI5PLJXu/MIbQKUC31jg==
X-Google-Smtp-Source: ABdhPJy8eOac2SjmBWPxOPqIBIeeBstXz50bOn/9Q8cluK6jx974GoDpH/JlagK8BogFTdJyDpkODw==
X-Received: by 2002:a17:907:94c8:b0:711:d864:fd84 with SMTP id dn8-20020a17090794c800b00711d864fd84mr15226830ejc.18.1654764526284;
        Thu, 09 Jun 2022 01:48:46 -0700 (PDT)
Received: from [192.168.0.195] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y24-20020a170906071800b006feed200464sm10407049ejb.131.2022.06.09.01.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 01:48:45 -0700 (PDT)
Message-ID: <dbf1416d-03ab-dfb2-434c-3cab879afd59@linaro.org>
Date:   Thu, 9 Jun 2022 10:48:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH -next v2] spi: Return true/false (not 1/0) from bool
 function
Content-Language: en-US
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     andi@etezian.org, broonie@kernel.org, alim.akhtar@samsung.com,
        linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220609071250.59509-1-yang.lee@linux.alibaba.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220609071250.59509-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/06/2022 09:12, Yang Li wrote:
> Return boolean values ("true" or "false") instead of 1 or 0 from bool
> function.
> 
> As reported by coccicheck:
> ./drivers/spi/spi-s3c64xx.c:385:9-10: WARNING: return of 0/1 in function
> 's3c64xx_spi_can_dma' with return type bool
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.


Best regards,
Krzysztof
