Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D3FCDB47E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Oct 2023 21:54:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233757AbjJKVyd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 11 Oct 2023 17:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233771AbjJKVyc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Oct 2023 17:54:32 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CEA6DA
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Oct 2023 14:54:30 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c9c145bb5bso25375ad.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Oct 2023 14:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697061270; x=1697666070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hFNTOUr3sjh42JldH+ELeMO62wE15U4NeCTwSZiG1r0=;
        b=MjnQptqEg4ipHT90p/fyGoyMRgBmEBA/zKe+wr1zLuKEbnozf2E2zJqABqm0ZsMr7x
         N/3ZXkdXwCHlTtUckFRV3AH0m9UO+2BxTRO5abaVQ+3NVSwXf7MeDRlribpS4Rybygd4
         j0PlSIZ6JZCDh3R1/BIHpZjfsTo2kfWh+DrcVJ0WF0MvWNNQImgpEt3hlFO3RplyUGSF
         MEjbH2Kv5R7q44sfytkk0CyfQvFLRHsJwok5vWl76pzwaqYRuiaHGzEe6KJMAXnHJ2p5
         BdPG6ZkWx6D8efXUvWF7OGOUgHpLovVW3bpS6L4x/PR9Wv4WaTnL3qd1QiZgqWadKTWX
         /CDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697061270; x=1697666070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFNTOUr3sjh42JldH+ELeMO62wE15U4NeCTwSZiG1r0=;
        b=HEQ21Mc0JYpdUUwHar/br/RluBr5KW42VGoTGRW9Wfoa4c8vC31KGsRLLgN0G4ND08
         oJjK3MTci45I6v0NHoAXsRQ2W98RQpBd9ovapY5DADrbApZ+PDKAaWL0hlXtjZJFSuVE
         WoLxuI8BStV9ghP2OKuCPG6mxmjk7UleFzxZASkK85IkrJzKEn8MQxIgS5vA3uw6Bu7w
         LNsIZBAJwS100XBj++w7CQMDY8J+UZi7rS4CcFDLT5OjS83/2QMHSxqjZyd+n9uEPTVE
         kHWFx1Sx/IszziNPgPDVxomghDT2JwqYUHcj+y8GP6yeGzTiIZI2f67Bt2VgNZ9/aIgp
         mFEw==
X-Gm-Message-State: AOJu0Yx6NycGR96gGdJWCmlgy4Utp+IuGeRuRNg/vlYvTKY0gTnpJTVu
        qLXqOzMGZ6pD3JFjvCFTrlS97w==
X-Google-Smtp-Source: AGHT+IESnmMbD2m86bsiGhw8JvUJbRSUCZ9voOyC7gGycNSvge5EBHqaFjy4tS+2pc3LAqrXcBMp8A==
X-Received: by 2002:a17:903:228f:b0:1c3:976e:22e6 with SMTP id b15-20020a170903228f00b001c3976e22e6mr363519plh.12.1697061269436;
        Wed, 11 Oct 2023 14:54:29 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id e19-20020aa78253000000b006950032f0c9sm10551259pfn.84.2023.10.11.14.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 14:54:28 -0700 (PDT)
Date:   Wed, 11 Oct 2023 14:54:25 -0700
From:   William McVicker <willmcvicker@google.com>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 16/20] tty: serial: samsung: Add gs101 compatible and
 SoC data
Message-ID: <ZScZkWWATxdd4oqP@google.com>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-17-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011184823.443959-17-peter.griffin@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/11/2023, Peter Griffin wrote:
> Add serial driver data for Google Tensor gs101 SoC.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  drivers/tty/serial/samsung_tty.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> index 07fb8a9dac63..26bc52e681a4 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -2597,14 +2597,22 @@ static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
>  	.fifosize = { 256, 64, 64, 64 },
>  };
>  
> +static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
> +	EXYNOS_COMMON_SERIAL_DRV_DATA(),
> +	/* rely on samsung,uart-fifosize DT property for fifosize */
> +	.fifosize = { 0 },
> +};
> +
>  #define EXYNOS4210_SERIAL_DRV_DATA (&exynos4210_serial_drv_data)
>  #define EXYNOS5433_SERIAL_DRV_DATA (&exynos5433_serial_drv_data)
>  #define EXYNOS850_SERIAL_DRV_DATA (&exynos850_serial_drv_data)
> +#define GS101_SERIAL_DRV_DATA (&gs101_serial_drv_data)
>  
>  #else
>  #define EXYNOS4210_SERIAL_DRV_DATA NULL
>  #define EXYNOS5433_SERIAL_DRV_DATA NULL
>  #define EXYNOS850_SERIAL_DRV_DATA NULL
> +#define GS101_SERIAL_DRV_DATA NULL
>  #endif
>  
>  #ifdef CONFIG_ARCH_APPLE
> @@ -2688,6 +2696,9 @@ static const struct platform_device_id s3c24xx_serial_driver_ids[] = {
>  	}, {
>  		.name		= "artpec8-uart",
>  		.driver_data	= (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DATA,
> +	}, {
> +		.name		= "gs101-uart",
> +		.driver_data	= (kernel_ulong_t)GS101_SERIAL_DRV_DATA,
>  	},
>  	{ },
>  };
> @@ -2709,6 +2720,8 @@ static const struct of_device_id s3c24xx_uart_dt_match[] = {
>  		.data = EXYNOS850_SERIAL_DRV_DATA },
>  	{ .compatible = "axis,artpec8-uart",
>  		.data = ARTPEC8_SERIAL_DRV_DATA },
> +	{ .compatible = "google,gs101-uart",
> +		.data =  GS101_SERIAL_DRV_DATA },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
> -- 
> 2.42.0.655.g421f12c284-goog
> 
