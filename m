Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3202AC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 09:04:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbiCGJFe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 04:05:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231652AbiCGJFc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 04:05:32 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8292443FF
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 01:04:38 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 476AD3F1B7
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 09:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646643877;
        bh=bCGKnBRm9v2sKeJoewgF99EVSOj1eSTH2ia4hbNzqfc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=I0h56zhE/VsyJCNOvhSi4Yq4KsPB3ExPWkf91UojSiA5sn4VaiuxS7gFipiu5BPp2
         GNK8DaYnfFoIMicVZTy+8+nZV95DWbogA0KcL1BYr8+8J3kNgENE7GRCwWCJ+uyNlI
         JXCkCYcvXVFM+9UQ5y1OSHXNZHjuyTGrBMmgZY//JPjq4wqcW70b4JXSvepghlLtKS
         E8XIhoL5djU4gpnrYqrK2mfQR7i42kITOUB/p34Q81zNUzlHpc8M42VDEzdQFwPM+W
         t+I+L1iYC9NOuAU8pCRwss9ydcJMXFbBx+WEYs/o4fTWi85BxZPI8QwijMWADyHHjG
         nTrHfFqycsl3w==
Received: by mail-ed1-f71.google.com with SMTP id bq19-20020a056402215300b0040f276105a4so8246928edb.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 01:04:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bCGKnBRm9v2sKeJoewgF99EVSOj1eSTH2ia4hbNzqfc=;
        b=vLIkIi8+d8bx6DWTucADiub2TK7+6y4Tfm3VYFxKXm3ZQOUK5Pa/XuJDIxCxqU5A/4
         MM3lxQ9tZ0z6TuYhXBHobuZwmFQ1f4mNhxutoqWQjnQBby/KgGLbH1tuPo8NGyhBCRks
         9QOzd+xWmwUI6kLoMpgU/lIOeP6gmCQcZ3WYuJkDXvk5b2erdJzMtlaEsaOB9ebDh41C
         ETamxVSjfQCk37Jy+YfTzQjyI1W7vsOoMsV7lWDCiayw1idtCjCJkKeb1KeSPMSEino3
         1ga5oKo/2CRbr7ie+j6fyvYaj7Cy2l+UKf+Vwk7YFDYmUWft2v+xVuxOHP8RdJ7pItR2
         nGIQ==
X-Gm-Message-State: AOAM532oAJBmghhyibKcyeD6UtLFN36rQ1cjzXiAa13Nnf1qbZkzQP1R
        Ew3dErDG4r/HH0YxI58lmE9o2dNC0LsOj9k8Q2i8YtnctCAB3sc0YCdbsYihofAL8Np9D/MtREs
        /SPnvN5dbYSjuoFyMrhcHsF2PRNxGSjbXZAYZP/z//vapqa9R
X-Received: by 2002:a17:906:3803:b0:6cf:56b9:60a9 with SMTP id v3-20020a170906380300b006cf56b960a9mr7974960ejc.716.1646643877036;
        Mon, 07 Mar 2022 01:04:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznp/n2u6f3ACuFsi3tn3Y52SEoSIz1Qz9ikaklDE2Cdic0VgHikeNWUnubx67cDnGPPuwgvQ==
X-Received: by 2002:a17:906:3803:b0:6cf:56b9:60a9 with SMTP id v3-20020a170906380300b006cf56b960a9mr7974939ejc.716.1646643876806;
        Mon, 07 Mar 2022 01:04:36 -0800 (PST)
Received: from [192.168.0.141] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id et3-20020a170907294300b006d6534ef273sm4435569ejc.156.2022.03.07.01.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 01:04:36 -0800 (PST)
Message-ID: <30db9e75-5176-e8e2-6a2c-1ef4022ba9f7@canonical.com>
Date:   Mon, 7 Mar 2022 10:04:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] tty: serial: samsung: Add ARTPEC-8 support
Content-Language: en-US
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     kernel@axis.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
        alim.akhtar@samsung.com
References: <20220307085053.1636475-1-vincent.whitchurch@axis.com>
 <20220307085053.1636475-3-vincent.whitchurch@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220307085053.1636475-3-vincent.whitchurch@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/03/2022 09:50, Vincent Whitchurch wrote:
> Add support for the UART on the ARTPEC-8 SoC.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
>  drivers/tty/serial/Kconfig       |  2 +-
>  drivers/tty/serial/samsung_tty.c | 38 ++++++++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index e952ec5c7a7c..ae120d3d933a 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -237,7 +237,7 @@ config SERIAL_CLPS711X_CONSOLE
>  
>  config SERIAL_SAMSUNG
>  	tristate "Samsung SoC serial support"
> -	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || ARCH_APPLE || COMPILE_TEST
> +	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || ARCH_APPLE || ARCH_ARTPEC || COMPILE_TEST
>  	select SERIAL_CORE
>  	help
>  	  Support for the on-chip UARTs on the Samsung
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> index d002a4e48ed9..4f9e74c6bcef 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -2837,6 +2837,36 @@ static struct s3c24xx_serial_drv_data s5l_serial_drv_data = {
>  #define S5L_SERIAL_DRV_DATA ((kernel_ulong_t)NULL)
>  #endif
>  
> +#if defined(CONFIG_ARCH_ARTPEC)
> +static struct s3c24xx_serial_drv_data artpec8_serial_drv_data = {

This will conflict with my constifying patches:
https://lore.kernel.org/all/20220307080810.53847-1-krzysztof.kozlowski@canonical.com/T/#t

The code itself looks good.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
