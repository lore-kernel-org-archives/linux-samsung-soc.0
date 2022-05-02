Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D82C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 May 2022 18:40:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386937AbiEBSoG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 May 2022 14:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236754AbiEBSoG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 May 2022 14:44:06 -0400
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70307E7A;
        Mon,  2 May 2022 11:40:36 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id e189so16043005oia.8;
        Mon, 02 May 2022 11:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dbczb+PEVgHPfvlP/+QadZcqpKGlDbFUYYPRXDCU/Ck=;
        b=1edzZPmbs7av+tjWQ9rJq9CTlH82NFgGR+XEnN5fvRiuazkhWJrdogfG5kYGUjJQTy
         IiC8+KZp1QbDCUqtsd37qP3CHCQJFTwhZZhqa9E9GErRiA3fva6jTSKWkvlHUk7+lDYP
         SZI3bbJEmMdbtEq4Q9s3IHQt9j7/UBbvRK/4ocN8BJapQWKa43C/r5i/TcFutHqY+yag
         B7AN4o/Qo6UmHO+2wxy8+rmnQtowWNUdzBP/pvwJHPmKmq7aYEg1wOhK0vQ6sjg1Vw8M
         VnTdz+K+aes2osnLEXDZ6adjIMVziockijVlQSzSSeW0e2BvbKXZguV64htoyHXwBhDo
         0m6Q==
X-Gm-Message-State: AOAM532m71JJSJKKvB1niuIutuwOI5i/22vVxn+pQy3z+BJgn+ZW+kbc
        xSqgkMnWONJrCc21alftXA==
X-Google-Smtp-Source: ABdhPJzPWl9lTSCNohNcTQ8OiNYoZ7u7NxbgOuip+wDqeK9VOnRcwfLfApdyfl+5EvdPKhUbErMh8g==
X-Received: by 2002:a05:6808:114e:b0:325:1625:eb93 with SMTP id u14-20020a056808114e00b003251625eb93mr248197oiu.55.1651516835735;
        Mon, 02 May 2022 11:40:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b11-20020a056808010b00b00325cda1ff87sm2603577oie.6.2022.05.02.11.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 11:40:35 -0700 (PDT)
Received: (nullmailer pid 1502141 invoked by uid 1000);
        Mon, 02 May 2022 18:40:34 -0000
Date:   Mon, 2 May 2022 13:40:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v2] dt-bindings: eeprom/at24: Add samsung,s524ad0xd1
 compatible
Message-ID: <YnAlomm/0ahEOF5e@robh.at.kernel.org>
References: <20220426175938.2262966-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426175938.2262966-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 26 Apr 2022 12:59:39 -0500, Rob Herring wrote:
> The samsung,s524ad0xd1 compatible is in use, but not documented. According
> to arch/arm/mach-s3c/mach-smdk6410.c, the samsung,s524ad0xd1 is compatible
> with the 24c128. As the schema requires a fallback compatible to the
> corresponding Atmel compatible, 'atmel,24c128' is added as a fallback.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Fix the example in samsung,s3c2410-i2c.yaml
> 
>  Documentation/devicetree/bindings/eeprom/at24.yaml            | 4 +++-
>  .../devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml          | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 

Applied, thanks!
