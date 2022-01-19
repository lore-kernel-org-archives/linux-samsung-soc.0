Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B4EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Jan 2022 08:17:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351783AbiASIRI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Jan 2022 03:17:08 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:39344
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346549AbiASIRG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 03:17:06 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 66FA43F1E9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 08:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642580225;
        bh=Imx3kf9wgKIjFiRAfSEUYAd3UD3FoLyXyiRfwo3W0jw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=jc41ZE15QodTGhDnok9okAzaSdV+GruBY4IuiTEWxTj4HPr6OyYdxImbT1/hZntJH
         jvMBkGKk+eVsu0Xvv9+8GjFGH1ZCfF5/OjSrzBiDvxG7rhLwYE64zRoWIyT7rSJSUf
         P/aK+HILbtT3DrKVP9LSPz8cybJSriJqd+u5ENSFfH3+yccXWHW9ck5W1w7PnPvarG
         Ao6WWqGtNurVhTLAK69VlxupVzFowm/iwZZ8LlqpXPPYB1JPSpEVrOP2KMMSA/FsQg
         U/mQCDS38UDn/yHZeXID227pVtqZEwB86T36X4umP14QaFxBLoopzjnERlN3JDRrH+
         LCy+ZU76hibhA==
Received: by mail-ed1-f69.google.com with SMTP id bs4-20020a056402304400b004032af6b7ebso1531275edb.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 00:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Imx3kf9wgKIjFiRAfSEUYAd3UD3FoLyXyiRfwo3W0jw=;
        b=4yyZagi42J3mtOs72p/Q6MvVg/Y0R+rcwQrvXKvy/iXU8/GA9xyHs8Ywa9QZ9r9ajX
         Au1xgiCRXxeECThXH7F3QF6aQbZXVdsQdzyDDZ30H7AdbFgsMBdNYt7yx7aybVpRak0h
         n4M8lWNbh8BOBSJotPvGSf7PggzqHsC0roT3NsQ3ummLyPY1BLRLBMs2jxE1chUt2QzJ
         AuZpDBFZJ34W+9XSE0QQgGWwWr/z5jO7+tvjPppuLLgqMffZzFb340fIbLoZtmAdn028
         dzlF3SGZS9YglPb5dod8J7Eq8iutMrgjy5/euMEhspKosUHBwwpFCa2K2qFtVU92QrPb
         3pFg==
X-Gm-Message-State: AOAM531JEn1IjTTCMiK9XZ8gqYmmLPPM/R6f8WzMyI0CBVfPuf+B8yZf
        9LLP+Lv6DnYzeuKWCoPbL+Qj2w5wMT/+m02Aynf+mF/b0Kk2ZWDeFt9ZxXKUWsToCO8bCrnTN8a
        JLsH392/KtUGCzm8gf5gAhyoEJUl4mABCWl5Sh5ehc5+vQEjv
X-Received: by 2002:a05:6402:518a:: with SMTP id q10mr14521655edd.167.1642580225087;
        Wed, 19 Jan 2022 00:17:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+gNQ4xe/XmNo0NgfjpFqiYC7jEStHal2Ln24R4j70lfc7WBC2/nXhKmj6WICnkND83g2K7A==
X-Received: by 2002:a05:6402:518a:: with SMTP id q10mr14521646edd.167.1642580224954;
        Wed, 19 Jan 2022 00:17:04 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f20sm6127420ejf.162.2022.01.19.00.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 00:17:04 -0800 (PST)
Message-ID: <383b454e-f185-968a-2539-7a370dedbdcd@canonical.com>
Date:   Wed, 19 Jan 2022 09:17:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] spi: s3c24xx: Convert to GPIO descriptors
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc:     linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>
References: <20220119000914.192553-1-linus.walleij@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220119000914.192553-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/01/2022 01:09, Linus Walleij wrote:
> This driver has a bunch of custom oldstyle GPIO number-passing
> fields and a custom set-up callback.
> 
> The good thing is: nothing in the kernel is using it.
> 
> Convert the driver to use GPIO descriptors with a SPI_MASTER_GPIO_SS
> flag so that the local CS callback also get invoked as the hardware
> needs this.
> 
> New users of this driver can provide GPIO descriptor tables like
> the other converted drivers.
> 
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Sylwester Nawrocki <snawrocki@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/spi/spi-s3c24xx.c   | 47 +++----------------------------------
>  include/linux/spi/s3c24xx.h |  5 ----
>  2 files changed, 3 insertions(+), 49 deletions(-)
> 

LGTM:
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
