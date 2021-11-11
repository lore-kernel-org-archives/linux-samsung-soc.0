Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 966C0C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Nov 2021 08:57:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81DE0610A2
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Nov 2021 08:57:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232347AbhKKJAo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 11 Nov 2021 04:00:44 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:48016
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232519AbhKKJAm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 11 Nov 2021 04:00:42 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5F84F3F1B9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Nov 2021 08:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636621073;
        bh=EkW1pMNvYMXSWViTWL0b6uTuOm+kaiADnR/jCTEvI80=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=FM9chcfkEKS5UmgFVD0w5b9dxCWhwrbDxGk4Gxl9SMKOMVfynBLi2ekUUDucDADnJ
         aYSElyRGwC5uSqlhQDYFytJNCPaDDS+7Ae6c/kNnB3YUxRfQq2FXefQx/vrYmP0XfN
         aEZFLUV3Q+4ux/VhLlcsbZZF9iDuXmIOBNaYqjq3sLAfjKlHlXwvG31T5uoUu8ax0x
         RWRtyn2RF2GPf59xN2HObjYfqIQRhXFF0AxmfRmqTLE0mTGx9HpLs93uksanIvjrQk
         hEJ3oRYg4Fhc7upjkKBEeQfUxl/MzqSvyXNcJ2KljYY9gQUWKEdKSm4dMGjLIkb3di
         MjrF1Ozspgkvw==
Received: by mail-lj1-f197.google.com with SMTP id bn14-20020a05651c178e00b002164a557684so1529318ljb.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Nov 2021 00:57:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EkW1pMNvYMXSWViTWL0b6uTuOm+kaiADnR/jCTEvI80=;
        b=CyORKF0PW1/LrdJiCC1P30RKiMeF4QZ2pxnRYqrExFRSB/OY0PIib/4Yxt1CWqmb9i
         TMnMXlYgmHS/bG//PeKbRCQLHrmoa0AHqb9mXGUAWd1QTXOsCCdANW2PUWogPpmpnTvs
         RGsSmPQelFMOfGlxtWdvNG6d5geybYwiJewaqLakG7hu53u0xADouT3I/HOWBKY+/yfH
         +p3uvBReTV8v9C6jxYBSJYQx4NE0aSa8Rojjz94cAWeHr0THvqMQWDKXjsKJc7HL/Qt0
         Bx+4SudWvfqaKCjRzeh7cFLdjbTSWO3N/zW5soZ8TPf+6DLt1hlmef4+tQrbxnys2XIW
         xCYA==
X-Gm-Message-State: AOAM532MMmpj+cvvNZI4MiryfDW5sb1Ia0cEIgtRNKB5pSMGhJITO4SZ
        uIItul7485gzEzHAd3gifr190nLjU8oIn1rOMkH5vNdoJuuNaEYUvmG8wv5b/hKY7UdtFRSG7Oz
        3CcQcezckLeWR3wyt5+hunLfCN74jPq5uMNNY6H4oeWSI76d6
X-Received: by 2002:a05:6512:3f1a:: with SMTP id y26mr5120176lfa.372.1636621072858;
        Thu, 11 Nov 2021 00:57:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyske0xauslL1Z+bnPQXmlOUOZVcMqum4mhLp9zOOVR+D9d0O2rE+kzkRpn+ZngtwgIcE/UAw==
X-Received: by 2002:a05:6512:3f1a:: with SMTP id y26mr5120146lfa.372.1636621072540;
        Thu, 11 Nov 2021 00:57:52 -0800 (PST)
Received: from [192.168.0.27] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id x7sm229110lfu.116.2021.11.11.00.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 00:57:52 -0800 (PST)
Message-ID: <4f46fefc-09c9-f9ee-a456-382a64d4ed6f@canonical.com>
Date:   Thu, 11 Nov 2021 09:57:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 2/2] i2c: exynos5: add support for ExynosAutov9 SoC
Content-Language: en-US
To:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        chanho61.park@samsung.com,
        Sam Protsenko <semen.protsenko@linaro.org>
References: <20211111084327.106696-1-jaewon02.kim@samsung.com>
 <CGME20211111084749epcas2p1e80b3f3657310498bfdae65c425b3278@epcas2p1.samsung.com>
 <20211111084327.106696-3-jaewon02.kim@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211111084327.106696-3-jaewon02.kim@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/11/2021 09:43, Jaewon Kim wrote:
> Serial IPs(UART, I2C, SPI) are integrated into New IP-Core
> called USI(Universal Serial Interface).
> 
> As it is integrated into USI, there are additinal HW changes.
> Registers to control USI and sysreg to set serial IPs have been added.
> Also, some timing registres have been changed.
> 
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> ---
>  drivers/i2c/busses/i2c-exynos5.c | 133 ++++++++++++++++++++++++++++---
>  1 file changed, 123 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> index 97d4f3ac0abd..6a05af550aa5 100644
> --- a/drivers/i2c/busses/i2c-exynos5.c
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -22,6 +22,8 @@
>  #include <linux/of_device.h>
>  #include <linux/of_irq.h>
>  #include <linux/spinlock.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
>  
>  /*
>   * HSI2C controller from Samsung supports 2 modes of operation
> @@ -166,9 +168,21 @@
>  
>  #define EXYNOS5_I2C_TIMEOUT (msecs_to_jiffies(100))
>  
> +/* USI(Universal Serial Interface) Register map */
> +#define USI_CON					0xc4
> +#define USI_OPTION				0xc8
> +
> +/* USI(Universal Serial Interface) Register bits */
> +#define USI_CON_RESET				BIT(0)
> +
> +/* SYSREG Register bit */
> +#define SYSREG_USI_SW_CONF_MASK			(0x7 << 0)
> +#define SYSREG_I2C_SW_CONF			BIT(2)
> +
>  enum i2c_type_exynos {
>  	I2C_TYPE_EXYNOS5,
>  	I2C_TYPE_EXYNOS7,
> +	I2C_TYPE_EXYNOSAUTOV9,

The type in driver could stay USI, I only wanted the compatible to be
using SoC product ID/number. But current AUTOV9 is fine as well.

>  };
>  
>  struct exynos5_i2c {
> @@ -199,6 +213,10 @@ struct exynos5_i2c {
>  
>  	/* Version of HS-I2C Hardware */
>  	const struct exynos_hsi2c_variant *variant;
> +
> +	/* USI sysreg info */
> +	struct regmap		*usi_sysreg;
> +	unsigned int		usi_offset;
>  };
>  
>  /**
> @@ -212,24 +230,34 @@ struct exynos5_i2c {
>   */
>  struct exynos_hsi2c_variant {
>  	unsigned int		fifo_depth;
> +	unsigned int		has_usi;

Sorry for not noticing it earlier, but this should be bool.

>  	enum i2c_type_exynos	hw;
>  };
>  
>  static const struct exynos_hsi2c_variant exynos5250_hsi2c_data = {
>  	.fifo_depth	= 64,
> +	.has_usi	= 0,

And this should be "false".

>  	.hw		= I2C_TYPE_EXYNOS5,
>  };
>  
>  static const struct exynos_hsi2c_variant exynos5260_hsi2c_data = {
>  	.fifo_depth	= 16,
> +	.has_usi	= 0,
>  	.hw		= I2C_TYPE_EXYNOS5,
>  };
>  
>  static const struct exynos_hsi2c_variant exynos7_hsi2c_data = {
>  	.fifo_depth	= 16,
> +	.has_usi	= 0,
>  	.hw		= I2C_TYPE_EXYNOS7,
>  };
>  
> +static const struct exynos_hsi2c_variant exynosautov9_hsi2c_data = {
> +	.fifo_depth	= 64,
> +	.has_usi	= 1,
> +	.hw		= I2C_TYPE_EXYNOSAUTOV9,
> +};
> +
>  static const struct of_device_id exynos5_i2c_match[] = {
>  	{
>  		.compatible = "samsung,exynos5-hsi2c",
> @@ -243,6 +271,9 @@ static const struct of_device_id exynos5_i2c_match[] = {
>  	}, {
>  		.compatible = "samsung,exynos7-hsi2c",
>  		.data = &exynos7_hsi2c_data
> +	}, {
> +		.compatible = "samsung,exynosautov9-hsi2c",
> +		.data = &exynosautov9_hsi2c_data
>  	}, {},
>  };
>  MODULE_DEVICE_TABLE(of, exynos5_i2c_match);
> @@ -281,6 +312,31 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
>  		i2c->op_clock;
>  	int div, clk_cycle, temp;
>  
> +	/* In case of HSI2C controllers in EXYNOSAUTOV9

Linux coding comment please, so with a separate /* :

/*
 * In case of....

Rest looks good, thanks for the changes!

Best regards,
Krzysztof
