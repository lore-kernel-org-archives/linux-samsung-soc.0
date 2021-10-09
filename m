Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFAEC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  9 Oct 2021 18:24:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5737260F23
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  9 Oct 2021 18:24:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhJIS0e (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 9 Oct 2021 14:26:34 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:50240
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229558AbhJIS0e (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 9 Oct 2021 14:26:34 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 436D43F324
        for <linux-samsung-soc@vger.kernel.org>; Sat,  9 Oct 2021 18:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633803876;
        bh=Ei1hV/Dz3jvsf5ChHvqte/QRf3elfc2KBG/vq2elCSg=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=bRBUPPoicAzJMJ8xIry+K5BcvtCn99SClHrsVvnNbpzkp73b1MDeRi/RtHHpZH3et
         Sec5n2R69orlqdjCOx35PfgIx7LimNiu2OPWcrYRC5DHqcIRM3lkHUHMYoLVcoK67C
         /fKtwjpVxDsKPLXYci89ZFFYsC7vp7jqiwdL/sNESiDEhE1Ss2R8jwkUPaqw9bLJoh
         RZJ7AoKluHXK0eSGIcJwadFb3Q+pxiJwLjyZeeOBhgiTXqG1mWZGREFvlsp7cCfYQD
         yZuwzjsjVQYZOGXdY8zQ9ZXpW/H+JOtN54STZPDmKVkAR/7PCPUwvdZNBY3oIT0CN+
         LtOuCEfjXnGIQ==
Received: by mail-ed1-f70.google.com with SMTP id f4-20020a50e084000000b003db585bc274so6422447edl.17
        for <linux-samsung-soc@vger.kernel.org>; Sat, 09 Oct 2021 11:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ei1hV/Dz3jvsf5ChHvqte/QRf3elfc2KBG/vq2elCSg=;
        b=rFP9SXnzQ9KAJ2kfdVS1iyNhKLEQVAFm2Hrkh19IwdHBWJZ/6qy4pjfdVFyT1zqkiA
         E2eb84lcbV6QNv/UcGiGNDw+2oUVaFU5AyEj0h+Z4c1Sujlo7SJyfYEBSNHJjNO0dGfY
         8joMzX2QfpWG734lg/GNFWdgjLj3K5tvxJmILm+MGxG+jqK5qPKzwhOCmRINKImW/412
         2U4n5MgaaEQo8TrThxqurXbSX203JCFMLzGPe0I73FmQf9ZFmGH82WPW0GLYaP0/+VLf
         ILl9rVVE7tYmJdyIQGyo8nC98yg1V/I7OVGiDZMMU3NpnlrS1oPp91DxYcuV5H7ITtwG
         KFhQ==
X-Gm-Message-State: AOAM531+xqxExGL0GQ/p1JewpmeniaL85CZpWerIaFXZBA7HWnTfZ6T0
        tiwnJ1LHdATiI/PV2AxR2i2KjawzhBK44vlVHAhwROWSced4NoZZ130OyjVHW9yDZ759SU8JZzO
        E/1xWBlEkSvYk87pxMOCbHbQ4UqmKLb73PCX60JlEW/1OTulG
X-Received: by 2002:a05:6402:1157:: with SMTP id g23mr26750340edw.379.1633803875995;
        Sat, 09 Oct 2021 11:24:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5HNyLC0DkYoZPf+ye983JfKtvyhWw2jw2i6kikKuwdFH3Yt0au80nxHJSr+Jqy/j9iysNjg==
X-Received: by 2002:a05:6402:1157:: with SMTP id g23mr26750326edw.379.1633803875863;
        Sat, 09 Oct 2021 11:24:35 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g2sm1515427edp.74.2021.10.09.11.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Oct 2021 11:24:35 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] arm64: dts: exynos: add minimal support for
 exynosautov9 sadk board
To:     Chanho Park <chanho61.park@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20211008091443.44625-1-chanho61.park@samsung.com>
 <CGME20211008091640epcas2p280fb1bce16ebff863f6ae4db66b2b240@epcas2p2.samsung.com>
 <20211008091443.44625-4-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ddea428e-b756-ec75-5cb6-33226c900259@canonical.com>
Date:   Sat, 9 Oct 2021 20:24:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008091443.44625-4-chanho61.park@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/10/2021 11:14, Chanho Park wrote:
> SADK(Samsung Automotive Development Kit) is the development kit to
> evaluate Exynos Auto v9 SoC. It has 16GB LPDDR4 DRAM and two
> 256GB Samsung UFS. This patch enables only serial console and ufs0
> device.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../bindings/arm/samsung/samsung-boards.yaml  |  6 ++
>  arch/arm64/boot/dts/exynos/Makefile           |  3 +-
>  .../boot/dts/exynos/exynosautov9-sadk.dts     | 56 +++++++++++++++++++
>  3 files changed, 64 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index 0796f0c87727..ef6dc14be4b5 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -199,6 +199,12 @@ properties:
>                - samsung,exynos7-espresso        # Samsung Exynos7 Espresso
>            - const: samsung,exynos7
>  
> +      - description: Exynos Auto v9 based boards
> +        items:
> +          - enum:
> +              - samsung,exynosautov9-sadk   # Samsung Exynos Auto v9 SADK
> +          - const: samsung,exynosautov9
> +
>  required:
>    - compatible
>  

This looks good, but depends on fixes in patch #2.


Best regards,
Krzysztof
