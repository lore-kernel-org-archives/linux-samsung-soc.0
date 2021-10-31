Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A22AC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 20:56:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FEAB608FE
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 20:56:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbhJaU6g (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 31 Oct 2021 16:58:36 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:34948
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230106AbhJaU6g (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 31 Oct 2021 16:58:36 -0400
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 144BE3F179
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Oct 2021 20:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635713763;
        bh=7KiWIckEg5DsudTTcPUNNjrowRj4bFQWmsKz8u+RWuU=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=AEYOECt/0sECea+eC9L8DNRA5KL7TtLlJ0Hz1NQcCkVoeppDy2d5griuaKrFks1kK
         btd43w9KtNRRJf3CsdHt9duN2RZ6fqMX97WgY11Js/PSEU06Lt2mucdmnohdFo42Sm
         q0tNAtAyNpkXTUb8xA6kZbwgM12bZANQxbWVQbbmGdsfGu7PqkFq5r6q+XybXDxHRc
         D3rp3LhMA2bXJOwryNDCew7r9jgCBeAu98rHaNskE7ubQBJyubvJw4y6n3Lc37pfex
         5+Yg4CwQLkFTCBvk7QK1VzKeUby1p2KenWhlsen4XIpw93qCG1oQkpDQiP+pXqRX74
         MsSSthfEqfkPQ==
Received: by mail-lj1-f198.google.com with SMTP id y18-20020a2e7d12000000b00212b22bc3a4so4031043ljc.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Oct 2021 13:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7KiWIckEg5DsudTTcPUNNjrowRj4bFQWmsKz8u+RWuU=;
        b=RmC39YCDI5MLo8oYJcIGKZANV2gAIkK9HQcEoqmH5YnNxygmR8GX/0+TwJF9xCulZ2
         M8ZA6/nB5LSv2hrNzAVW7YGBu04KP0+yERuyAvhYLaO7lpu7w1WFTFPGdQUBGMPxZRzx
         dhzzpXY5cPrULFPO0fpOkd9cocxXimTu99aOyh3NLok/DuhAgb2txWESOXafhNn+6MC2
         agqOUujK/JFZXFcmJzV8UREKQoyDmINlYtSHeXP7nkN6L+zZdTrmSI9tFTJCDY7DNY4h
         OEMgBElFr0FPlb1nmsurahaGMbOLV9dsI9t2KeOeychxi9gPQY31+CcQMlpP/PXZhHTb
         nWQg==
X-Gm-Message-State: AOAM530bDFar47xIH2NPMM9sPRSziWBtrQtUBXzWTMJyEkaCTKDbnZQI
        gBRJWqb4gTMOcdfBViZSbbo6EunfJNA/OFl483ZC9iaEP0wIhjUEmFJ2/TL2GkYpUEEXav+T2WE
        /kG5ZoLtKcMQj6kuuSzmswLcTD200BmviW9Y6+XO6ehD+pOGN
X-Received: by 2002:ac2:5f58:: with SMTP id 24mr3812067lfz.22.1635713762471;
        Sun, 31 Oct 2021 13:56:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVrLKox/SzOP9upXtJKX4Xfl9XaYuC1R/evXsizpdmPbzB02lJcKZ/kQkSGdlIiYlNlO1ehw==
X-Received: by 2002:ac2:5f58:: with SMTP id 24mr3812057lfz.22.1635713762279;
        Sun, 31 Oct 2021 13:56:02 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id 185sm978769ljj.23.2021.10.31.13.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Oct 2021 13:56:01 -0700 (PDT)
Message-ID: <e1555f6c-63e2-60c8-9a7d-808545de01e0@canonical.com>
Date:   Sun, 31 Oct 2021 21:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] samsung: exynos-chipid: add Exynos7885 SoC support
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211031175329.27843-1-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211031175329.27843-1-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 31/10/2021 18:53, David Virag wrote:
> Exynos 7885 has product id "0xE7885000". Add this id to the ids with
> the name.
> 

Thanks for the patch!

> The downstream driver sets sub_rev to 2 if we are on Exynos 7885, we
> detected sub_rev 1 and the 27th bit of the revision register is set.

There is no revision register in older Exynos boards, so it seems you
speak about new version, but please mention it explicitly.

> This is presumably because Samsung might have set the wrong bits on
> rev2 of the SoC in the chipid, but we may never know as we have no
> manual.
> 
> Both the SM-A530F/jackpotlte with Exynos7885 and the SM-M305/m30lte
> with Exynos7904 (rebranded Exynos7885 with lower clock speeds) seem
> to have this bit set to 1 and have a sub_rev of 1 otherwise, but the
> downstream driver corrects it to 2.
> Let's replicate this behaviour in upstream too!

No, let's don't replicate weird vendor behavior without understanding
it, unless there is reason to. Please describe the reason or drop it.

> 
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
>  drivers/soc/samsung/exynos-chipid.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
> index a28053ec7e6a..ec8c76275aec 100644
> --- a/drivers/soc/samsung/exynos-chipid.c
> +++ b/drivers/soc/samsung/exynos-chipid.c
> @@ -55,6 +55,7 @@ static const struct exynos_soc_id {
>  	{ "EXYNOS5440", 0xE5440000 },
>  	{ "EXYNOS5800", 0xE5422000 },
>  	{ "EXYNOS7420", 0xE7420000 },
> +	{ "EXYNOS7885", 0xE7885000 },

This looks good, but please rebase on:
https://lore.kernel.org/linux-samsung-soc/20211031205212.59505-1-krzysztof.kozlowski@canonical.com/T/#u
because we use one compatible for entire family and I would like to have
it documented which family is this here.

>  	{ "EXYNOS850", 0xE3830000 },
>  	{ "EXYNOSAUTOV9", 0xAAA80000 },
>  };
> @@ -88,6 +89,14 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
>  	}
>  	main_rev = (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
>  	sub_rev = (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
> +
> +	//Exynos 7885 revision 2 apparently has the 27th bit set instead of having
> +	//a sub_rev of 2. Correct for this!

Not a Linux kernel comment. This will go away anyway, but please read
the coding style and use scripts/checkpatch.pl for future patches.

> +	if (soc_info->product_id == 0xE7885000) {
> +		if ((sub_rev == 1) && (val & 0x04000000))
> +			sub_rev = 2;
> +	}
> +
>  	soc_info->revision = (main_rev << EXYNOS_REV_PART_SHIFT) | sub_rev;
>  
>  	return 0;
> 


Best regards,
Krzysztof
