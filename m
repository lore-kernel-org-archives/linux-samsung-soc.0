Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E627C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 07:28:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EF2260F25
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 07:28:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbhIOH3e (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Sep 2021 03:29:34 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:50434
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231349AbhIOH3c (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 03:29:32 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B5F923F335
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 07:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631690893;
        bh=ppU//N0NUX+HEww/poMBVGUJs7BZs8SJh0ZQtOCNRAM=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=ssw8E1r5YHLnzGI4DVD39r2yVQq3PMzeQBBVtdrGWmba0iDc9sBnrqiRzH7VRI0pL
         fbZsjlqBfemLeZv9v7LcibRrT+KUY7+35O6Ep0pns/uvvTkfsAJpMPBaYFpqOmkJcc
         a+FrU8jf7Rip7Uzwbf20iFzpAoynMC3orKW+tLGUApBa2k07sc44bHyovfE5KvO8Yy
         sXeTveB6Akp622adYRvgqV8vqmZXoVAxbq/BnQGNIvNCX3SamfwNFxXJApiPS2X3w5
         khwwJj3H5JwzYsuEwC/H8xtnf/iHeBf60OtdQkJSTiNoSW0wBnSGvVG+0UpoDFtiOA
         SecAUiMTjOQ4A==
Received: by mail-ed1-f70.google.com with SMTP id h15-20020aa7de0f000000b003d02f9592d6so1053840edv.17
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 00:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ppU//N0NUX+HEww/poMBVGUJs7BZs8SJh0ZQtOCNRAM=;
        b=5M+zj6vGFAwdx7OTd7IeycFyTl/TzPDqGZiKG1mZkZl4xmYPqX2mvVvJFc12fGPJus
         5dAbs7QsPHtYvGsYsbRdwkjqAJfAjFT44YcuabJmgq15FmaGnkXNrb1JigkLdwJ4s2XV
         c5W6HuPzVWL0UPEaobD+mLC9jxQ2ySL6ejb0raMAk/MggWgHzSYGyY2N8E2wBxETMQzW
         tT88Y5wJBbHobVMQ4z2mr67qErsIz6Y6mVYN11JuRYEjQmAsyIBIYvKzzI2/k2qRnkF1
         5NtdLH8BR9AQxq2Mm1r0nvumeKeBtqnH0xRzgdMZfpLZSyQ0nHK9mEQpXQsLJd9uEkCH
         zXdQ==
X-Gm-Message-State: AOAM5315o6w104XwxvB0hDkEB6WPIRdu8Yycz1y0Gx+cQh66v71luGMS
        iTGqZ7n+PJonWXmVs/sjA9JWWJ9SeuFts4F0bRbpeeBE5ob6zzaP8ftEPstqmy/yRXHbjdFXthz
        nPXlwfNT+pCvGEz8zjf44XnY4SppXkQ1UjDdHcdu2+7TEOk11
X-Received: by 2002:a17:906:2346:: with SMTP id m6mr23498754eja.512.1631690893433;
        Wed, 15 Sep 2021 00:28:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyN/EjBqzUCq1sM72TJYj/g0y3W59czzE+ItSwaFOFp4dbIj+7l0b+VUUuJ4BIofa079Yw9kQ==
X-Received: by 2002:a17:906:2346:: with SMTP id m6mr23498743eja.512.1631690893233;
        Wed, 15 Sep 2021 00:28:13 -0700 (PDT)
Received: from [192.168.3.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id b38sm1487559edf.46.2021.09.15.00.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 00:28:12 -0700 (PDT)
Subject: Re: [PATCH] tty: serial: samsung: Improve naming for common macro
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210914142315.26596-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6efec37b-4392-dffe-1bda-d4f7aac6643f@canonical.com>
Date:   Wed, 15 Sep 2021 09:28:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914142315.26596-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/09/2021 16:23, Sam Protsenko wrote:
> Having "_USI" suffix in EXYNOS_COMMON_SERIAL_DRV_DATA_USI() macro is
> confusing. Rename it to just EXYNOS_COMMON_SERIAL_DRV_DATA() and provide
> USI registers availability for all Exynos variants instead.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/tty/serial/samsung_tty.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> index e2f49863e9c2..542b7e2b99dc 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -2780,7 +2780,7 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
>  #endif
>  
>  #if defined(CONFIG_ARCH_EXYNOS)
> -#define EXYNOS_COMMON_SERIAL_DRV_DATA_USI(_has_usi)		\
> +#define EXYNOS_COMMON_SERIAL_DRV_DATA(_has_usi)			\
>  	.info = &(struct s3c24xx_uart_info) {			\
>  		.name		= "Samsung Exynos UART",	\
>  		.type		= TYPE_S3C6400,			\
> @@ -2804,21 +2804,18 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
>  		.has_fracval	= 1,				\
>  	}							\
>  
> -#define EXYNOS_COMMON_SERIAL_DRV_DATA				\
> -	EXYNOS_COMMON_SERIAL_DRV_DATA_USI(0)
> -
>  static struct s3c24xx_serial_drv_data exynos4210_serial_drv_data = {
> -	EXYNOS_COMMON_SERIAL_DRV_DATA,
> +	EXYNOS_COMMON_SERIAL_DRV_DATA(0),
>  	.fifosize = { 256, 64, 16, 16 },
>  };
>  
>  static struct s3c24xx_serial_drv_data exynos5433_serial_drv_data = {
> -	EXYNOS_COMMON_SERIAL_DRV_DATA,
> +	EXYNOS_COMMON_SERIAL_DRV_DATA(0),
>  	.fifosize = { 64, 256, 16, 256 },
>  };
>  
>  static struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
> -	EXYNOS_COMMON_SERIAL_DRV_DATA_USI(1),

Makes sense, although I would prefer to have here true or false. More
obvious. Otherwise "1" looks like counter/number for some property.

The has_usi field in struct could be then also converted to bool.


Best regards,
Krzysztof
