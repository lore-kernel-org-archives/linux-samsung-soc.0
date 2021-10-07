Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21308C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 17:55:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0693E61263
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 17:55:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242884AbhJGR5P (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Oct 2021 13:57:15 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:50638
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233768AbhJGR5O (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 13:57:14 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E25E33FFE3
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Oct 2021 17:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633629319;
        bh=RHIxQR5/XLDcaDS37kX42uJXjB3Z32e+kyImp4kLKLk=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=UWHvP3Kpf9d2vE1FiSWtBIpmjBIo1oLgnVk6suZ8Jbjt+yo1I0ckeF4G3FKc5ENc2
         UxQF5zr5Vh+DZoXlAREHkl5Nr/90/9n3c1ApTTVIkZBJGghgITOJ/ySgrN+2+rALf7
         EGj6c7jO3Ty7puUE3QLSLXjfra7YTmwD7MQspmLswTYnkii6v6E2uIJD2DfDvKFOb9
         Yxdu57oP+tQKQfmT89J1014qhNjnwXsw4vrqYbDzPhZimyrb1KRGHedj6vC4/USDg7
         E31T+GJ2bAeUMAWs7XG2lLh7gII9U9ULHnz1ouRFO+/lGekDkGEEXbhu8D6o6o8czO
         X12p+anI2akCg==
Received: by mail-ed1-f69.google.com with SMTP id i7-20020a50d747000000b003db0225d219so6719667edj.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Oct 2021 10:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RHIxQR5/XLDcaDS37kX42uJXjB3Z32e+kyImp4kLKLk=;
        b=GAJVLfJf+/veDxQCPbOqrvyL/p6vLDawPj7lOXqos5W/T/kzcofkM7p/pb2krCTO6O
         pfsR8GKc2Qp9guOL9DpxKtQM+DJGsu97qeNiZFmsnCINPTiY4zz6qH4Tq9HUYrv7w9vh
         aRQ+/N08F+iBhTPRRbA3+8l0+5443zjxNEQAWkFjWTP56MIXf+AGBtAPkZbL2jGBdtac
         BSCXk3H1iZWFNWAxVAYOxjFw0HZfskN0zUgmdI4HixWmiQm2Mp1k6UcWxtAiSpLu43q1
         1XintZYKAp/AInjUdGZVtA/3/u9MYUC7LUZLaBnxYh9NU+SRIZgadpygb1eDrE9vGjLG
         yWrw==
X-Gm-Message-State: AOAM531ceN7V1I7kQsI+U8aB9xERp1Lmk46COkY9tGgKp3l2WytRt6SQ
        dQy3eqrTI/UikzIRpwauem5v7R2/mr4LJ3M+0HU47DxoHgS+5NK5keMQhmYz0WEKoIbMiTMCU3g
        nCVeLVPss7UFE7seD6alEOwuYW0jIMX4KN11WGc4ZeLi6AjE5
X-Received: by 2002:a17:906:a01:: with SMTP id w1mr7591307ejf.117.1633629319494;
        Thu, 07 Oct 2021 10:55:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytrVcfj5APSOLV2LLtYlgQyfzBm6l/QfBJY3SCMmvSvJ9Xx/PqePC4DEiRBIkXTEZfIOkR6w==
X-Received: by 2002:a17:906:a01:: with SMTP id w1mr7591281ejf.117.1633629319321;
        Thu, 07 Oct 2021 10:55:19 -0700 (PDT)
Received: from [192.168.1.24] (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id bx11sm31411ejb.107.2021.10.07.10.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 10:55:18 -0700 (PDT)
To:     Chanho Park <chanho61.park@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20211007120855.56555-1-chanho61.park@samsung.com>
 <CGME20211007121055epcas2p2ed43488faa0c856c5009a3a2f3b779ed@epcas2p2.samsung.com>
 <20211007120855.56555-2-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 1/3] pinctrl: samsung: support ExynosAutov9 SoC pinctrl
Message-ID: <a6826964-5949-26b5-fc6b-7b52f7c752af@canonical.com>
Date:   Thu, 7 Oct 2021 19:55:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007120855.56555-2-chanho61.park@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/10/2021 14:08, Chanho Park wrote:
> Add pinctrl data for ExynosAuto v9 SoC.
> 
> - GPA0, GPA1: 10, External wake up interrupt
> - GPQ0: 2, XbootLDO, Speedy PMIC I/F
> - GPB0, GPB1, GPB2, GPB3: 29, I2S 7 CH
> - GPF0, GPF1, GPF2, GPF3,GPF4, GPF5, GPF6, GPF8: 52, FSYS
> - GPG0, GPG1, GPG2, GPG3: 25, GPIO x 24, SMPL_INT
> - GPP0, GPP1, GPP2, GPP3, GPP4, GPP5: 48, USI 12 CH
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>

Thanks Chanho for the patches. It's awesome to see this work upstreamed!

Few comments below.

> ---
>  .../bindings/pinctrl/samsung-pinctrl.txt      |   1 +
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 108 ++++++++++++++++++
>  drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
>  4 files changed, 112 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> index e7a1b1880375..b8b475967ff9 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> @@ -23,6 +23,7 @@ Required Properties:
>    - "samsung,exynos5433-pinctrl": for Exynos5433 compatible pin-controller.
>    - "samsung,exynos7-pinctrl": for Exynos7 compatible pin-controller.
>    - "samsung,exynos850-pinctrl": for Exynos850 compatible pin-controller.
> +  - "samsung,exynosautov9-pinctrl": for ExynosAutov9 compatible pin-controller.
>  
>  - reg: Base address of the pin controller hardware module and length of
>    the address space it occupies.
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> index fe5f6046fbd5..3bf18e844402 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -538,3 +538,111 @@ const struct samsung_pinctrl_of_match_data exynos850_of_data __initconst = {
>  	.ctrl		= exynos850_pin_ctrl,
>  	.num_ctrl	= ARRAY_SIZE(exynos850_pin_ctrl),
>  };
> +
> +/* pin banks of exynosautov9 pin-controller 0 (ALIVE) */
> +static struct samsung_pin_bank_data exynosautov9_pin_banks0[] = {

This and below should be static const and __initconst.

> +	EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
> +	EXYNOS850_PIN_BANK_EINTW(2, 0x020, "gpa1", 0x04),
> +	EXYNOS850_PIN_BANK_EINTN(2, 0x040, "gpq0"),
> +};
> +
> +/* pin banks of exynosautov9 pin-controller 1 (AUD) */
> +static struct samsung_pin_bank_data exynosautov9_pin_banks1[] = {
> +	EXYNOS850_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpb1", 0x04),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpb2", 0x08),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpb3", 0x0C),
> +};
> +
> +/* pin banks of exynosautov9 pin-controller 2 (FSYS0) */
> +static struct samsung_pin_bank_data exynosautov9_pin_banks2[] = {
> +	EXYNOS850_PIN_BANK_EINTG(6, 0x000, "gpf0", 0x00),
> +	EXYNOS850_PIN_BANK_EINTG(6, 0x020, "gpf1", 0x04),
> +};
> +
> +/* pin banks of exynosautov9 pin-controller 3 (FSYS1) */
> +static struct samsung_pin_bank_data exynosautov9_pin_banks3[] = {
> +	EXYNOS850_PIN_BANK_EINTG(6, 0x000, "gpf8", 0x00),
> +};
> +
> +/* pin banks of exynosautov9 pin-controller 4 (FSYS2) */
> +static struct samsung_pin_bank_data exynosautov9_pin_banks4[] = {
> +	EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpf2", 0x00),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpf3", 0x04),
> +	EXYNOS850_PIN_BANK_EINTG(7, 0x040, "gpf4", 0x08),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpf5", 0x0C),
> +	EXYNOS850_PIN_BANK_EINTG(7, 0x080, "gpf6", 0x10),
> +};
> +
> +/* pin banks of exynosautov9 pin-controller 5 (PERIC0) */
> +static struct samsung_pin_bank_data exynosautov9_pin_banks5[] = {
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp0", 0x00),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp1", 0x04),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp2", 0x08),
> +	EXYNOS850_PIN_BANK_EINTG(5, 0x060, "gpg0", 0x0C),
> +};
> +
> +/* pin banks of exynosautov9 pin-controller 6 (PERIC1) */
> +static struct samsung_pin_bank_data exynosautov9_pin_banks6[] = {
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp3", 0x00),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp4", 0x04),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp5", 0x08),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpg1", 0x0C),
> +	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpg2", 0x10),
> +	EXYNOS850_PIN_BANK_EINTG(4, 0x0A0, "gpg3", 0x14),
> +};
> +
> +const struct samsung_pin_ctrl exynosautov9_pin_ctrl[] = {

__initconst at the end, please.

> +	{
> +		/* pin-controller instance 0 ALIVE data */
> +		.pin_banks      = exynosautov9_pin_banks0,
> +		.nr_banks       = ARRAY_SIZE(exynosautov9_pin_banks0),
> +		.eint_wkup_init = exynos_eint_wkup_init,
> +		.suspend        = exynos_pinctrl_suspend,
> +		.resume         = exynos_pinctrl_resume,
> +	}, {

Best regards,
Krzysztof
