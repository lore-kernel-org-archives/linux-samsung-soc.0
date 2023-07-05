Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84DAC001DE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Jul 2023 13:57:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231865AbjGEN5Q (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Jul 2023 09:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbjGEN5Q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 09:57:16 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BBE11B
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Jul 2023 06:57:14 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3113da5260dso7339147f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Jul 2023 06:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688565432; x=1691157432;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vpsssEPmpajsdnttO+o6S0QxmmSISUMu1xjEBKdnavk=;
        b=fD71TGTj9jsY0UXWe1YPxNQrgKHIBCFFVo4LqQx2+K/2cTGPHFlq79aRE47A/ZItFd
         6XyygQZ/vXwtQNJX/HTbSduyvXmSH7sf3x9GybmS2clBIMBvzCcZZczmmdTWoyV4YBSE
         4aFq6AHV7zb/rZhvTIPupJCK11S2uKUYJAXZ7YgSAimNCxydK1GV11RehdCt9EZ9LhtI
         kfnQC2YWcqFqm26EjEVrHpiAWiJhgTrOHFIbcrxTZ0x0p5D4CoxxnAc9hRYpa+3Fr538
         zmoRXKtxuk06B74XQLvcgaF+XsMlKgfAHf+P675k5wTM7jKYX/9SbO2ZtiYdjsiZq9nH
         AAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688565432; x=1691157432;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpsssEPmpajsdnttO+o6S0QxmmSISUMu1xjEBKdnavk=;
        b=eXPnbASJs658OBe3KrIgCP0fsgfZFeOY/rMmbozJj8p5HcQXXmiQxvc+QHWgj/mm7y
         pX2H27WXq4MnuSi9xNzpWxuYRAg11ZBqqblBz89Fbl70oXWc5V1TSQ7AiKdEducTbPvK
         U2vIHF5zOfqiLN57gmN5sUmf0FGHc7vCvsxNmqISkq3r4HhgsFcTFjpE8m0T4WUyofKJ
         sTNL7kwHb9DcvIBW+SKiorK6aJ/ZRaeQKby+6wGMC5Nfm1pi8IpRguZWOd4glN4J/gs4
         JFkKrlGMgTCHR4JV/yKDtC3WK2JKlUeWmh0iqPhzWYtWSF/Tdnzm4OWNsVieW0oTXuIG
         GSbA==
X-Gm-Message-State: ABy/qLb4esm6FyW8HBHc01QDARBRB0aX0Sixj0vKAtAK8srqbewP8Her
        0ZqOa8a2jeY/8negkoj/1huQtQ==
X-Google-Smtp-Source: APBJJlH2dsA5o6+F7TnmKCeRS52ZywTNpTZxfxsv8glLGMhJN/IETOKgQmhOy4erRIAKsJmydhhq3g==
X-Received: by 2002:a5d:452f:0:b0:314:35c2:c4aa with SMTP id j15-20020a5d452f000000b0031435c2c4aamr7986708wra.8.1688565432505;
        Wed, 05 Jul 2023 06:57:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:65eb:d140:2d45:ee85? ([2a01:e0a:982:cbb0:65eb:d140:2d45:ee85])
        by smtp.gmail.com with ESMTPSA id u13-20020a5d514d000000b0030e56a9ff25sm30867700wrt.31.2023.07.05.06.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 06:57:11 -0700 (PDT)
Message-ID: <194ac047-b20e-04c1-1d96-67cc483bb4a1@linaro.org>
Date:   Wed, 5 Jul 2023 15:57:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/3] drm/panel: ld9040: Register a backlight device
Content-Language: en-US
To:     Paul Cercueil <paul@crapouillou.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20230703214715.623447-1-paul@crapouillou.net>
 <20230703214715.623447-3-paul@crapouillou.net>
Organization: Linaro Developer Services
In-Reply-To: <20230703214715.623447-3-paul@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/07/2023 23:47, Paul Cercueil wrote:
> Register a backlight device to be able to switch between all the gamma
> levels.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>   drivers/gpu/drm/panel/panel-samsung-ld9040.c | 40 ++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-ld9040.c b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> index 7fd9444b42c5..b4f87d6244cb 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> @@ -8,6 +8,7 @@
>    * Andrzej Hajda <a.hajda@samsung.com>
>   */
>   
> +#include <linux/backlight.h>
>   #include <linux/delay.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/module.h>
> @@ -311,8 +312,40 @@ static int ld9040_parse_dt(struct ld9040 *ctx)
>   	return 0;
>   }
>   
> +static int ld9040_bl_update_status(struct backlight_device *dev)
> +{
> +	struct ld9040 *ctx = dev_get_drvdata(&dev->dev);
> +
> +	ctx->brightness = dev->props.brightness;
> +	ld9040_brightness_set(ctx);
> +
> +	return 0;
> +}
> +
> +static int ld9040_bl_get_intensity(struct backlight_device *dev)
> +{
> +	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
> +			dev->props.power == FB_BLANK_UNBLANK)
> +		return dev->props.brightness;
> +
> +	return 0;
> +}

You can totally drop the _get_brightness.

Neil

> +
> +static const struct backlight_ops ld9040_bl_ops = {
> +	.get_brightness = ld9040_bl_get_intensity,
> +	.update_status  = ld9040_bl_update_status,
> +};
> +
> +static const struct backlight_properties ld9040_bl_props = {
> +	.type = BACKLIGHT_RAW,
> +	.scale = BACKLIGHT_SCALE_NON_LINEAR,
> +	.max_brightness = ARRAY_SIZE(ld9040_gammas) - 1,
> +	.brightness = ARRAY_SIZE(ld9040_gammas) - 1,
> +};
> +
>   static int ld9040_probe(struct spi_device *spi)
>   {
> +	struct backlight_device *bldev;
>   	struct device *dev = &spi->dev;
>   	struct ld9040 *ctx;
>   	int ret;
> @@ -354,6 +387,13 @@ static int ld9040_probe(struct spi_device *spi)
>   	drm_panel_init(&ctx->panel, dev, &ld9040_drm_funcs,
>   		       DRM_MODE_CONNECTOR_DPI);
>   
> +
> +	bldev = devm_backlight_device_register(dev, dev_name(dev), dev,
> +					       ctx, &ld9040_bl_ops,
> +					       &ld9040_bl_props);
> +	if (IS_ERR(bldev))
> +		return PTR_ERR(bldev);
> +
>   	drm_panel_add(&ctx->panel);
>   
>   	return 0;

