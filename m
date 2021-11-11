Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29DDC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Nov 2021 08:53:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC51861989
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Nov 2021 08:53:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbhKKI4a (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 11 Nov 2021 03:56:30 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33344
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229543AbhKKI4a (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 11 Nov 2021 03:56:30 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C62113F1AC
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Nov 2021 08:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636620820;
        bh=0Svl+eFQ7YNUr5AuRvNYApFYmUrQVsAuZa9qnzL1YbY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=LHQm7wMotMC5LHgkbDYwSffknJ0GAVCZznwyz9XwaLYyXCuijP67sjLpagBf6SGdP
         e8k839yzGKWVCX0pLcZIIWikIGS6oQUNuUtMt3GJPBYpC9eu/35UvXew0catdsT8hH
         tDAyopvR414YJ9WI7fDYyJGPhwXuhensEKm6n/t1G8qMxqf5SwWvmrbroz+lGlZb0o
         xNfBOKqkpcO+cc2aWYeKazunAoKxx9SOdSexXeHEyit8Jzq2s6VwUggCys/kRqmyt/
         mC2dSL9n7zLdZ/L69/uNzmAsPgyvSszlit7+ErxcnNoH5gjQVi2tDyj3OF6QnpJPYw
         jBYHVul7ftgww==
Received: by mail-lf1-f69.google.com with SMTP id u20-20020a056512129400b0040373ffc60bso2396186lfs.15
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Nov 2021 00:53:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0Svl+eFQ7YNUr5AuRvNYApFYmUrQVsAuZa9qnzL1YbY=;
        b=4CnC1jL1OE6o42Bu08kPY9/GQ+z01R1/mf7Mm2VOnVO3neWy6e0AJpzhUW4EsMfBEV
         Q6WZ0ku3mFPmZvQqWnjbtSvHjVinZc87NwoIeXnA12q+TmP5zc+No8AodoTjlCp5V5eq
         nHujLR1N769C9ClRurG/KYj1UKKwRmrvWLF87iOHz0olm4Pn8QrNIb+Fo479gc3lg2E6
         5jbjR9VBLXy4YKPPOac1WZDZ2g4eRBvgaNdMQPUT0ECxKl6IzB+0UXe6L65T+QC+K5NN
         2+QY8QkOlrHdYqRoPpYmFfyud2+/wpdTBI26DSiOnOmQ6JoP89f/Q1mZMGVO7Wee4qdY
         u+Lg==
X-Gm-Message-State: AOAM530NJQCRweZHJq7ld5dMdPy5hmcJ9W0lJuC3ypvP1U6kPDXcOsgZ
        IubqD+Ry6cDDQskd/BGvVkFwh+Lo6eZCNsv1eRrNusJUgYT8VqrEsBzNceHLWwlPzUVnEUNOoje
        FC7Pl0i+G0o8Lt9/URRczRpC1P4hgc+Hq/ALMkh+8hD0I2jr6
X-Received: by 2002:a2e:7310:: with SMTP id o16mr1861178ljc.394.1636620820173;
        Thu, 11 Nov 2021 00:53:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxO2BY4siKh/EcTOSPKbywuDox2ug+4b7NO1Ji9teIwijIsGcEpMZ1GlkqEcPYuqO80fAhtYw==
X-Received: by 2002:a2e:7310:: with SMTP id o16mr1861153ljc.394.1636620819985;
        Thu, 11 Nov 2021 00:53:39 -0800 (PST)
Received: from [192.168.0.27] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id n1sm208525ljj.79.2021.11.11.00.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 00:53:39 -0800 (PST)
Message-ID: <3f66a3bd-2253-e887-badc-f51fa9447fe9@canonical.com>
Date:   Thu, 11 Nov 2021 09:53:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 1/2] dt-bindings: i2c: exynos5: add exynosautov9-hsi2c
 compatible
Content-Language: en-US
To:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        chanho61.park@samsung.com,
        Sam Protsenko <semen.protsenko@linaro.org>
References: <20211111084327.106696-1-jaewon02.kim@samsung.com>
 <CGME20211111084749epcas2p291a982cce677c58febcf00d5d900c4a5@epcas2p2.samsung.com>
 <20211111084327.106696-2-jaewon02.kim@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211111084327.106696-2-jaewon02.kim@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/11/2021 09:43, Jaewon Kim wrote:
> This patch adds new "samsung,exynosautov9-hsi2c" compatible.
> It is for i2c compatible with HSI2C available on Exynos SoC with USI.
> 
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-exynos5.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

You did not Cc the necessary lists (devicetree). Please use
scripts/get_maintainers.pl to get list of addresses to CC.

Patch itself looks good, so you can resend with:
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
