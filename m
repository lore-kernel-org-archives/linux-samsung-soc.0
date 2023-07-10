Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B5EEB64DC
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 10 Jul 2023 07:01:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbjGJHBN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 10 Jul 2023 03:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjGJHBM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Jul 2023 03:01:12 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E58D2E9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jul 2023 00:01:10 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-98de21518fbso547116866b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jul 2023 00:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688972469; x=1691564469;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bAAM318e50FzwuPYMp5fFaAKn/TzSZTu0tdXq5W1k3U=;
        b=RTdZ0NYCeNaJPv0g58tv/l9RYh1y/Rv/GHdNaQfKRcAmFnLEI6riSkUu5QkvhOEubP
         28bQEeP3RrVqdbPb9Wj5tykDNaRulPdqIcfZDHriBi6qo8PeOEz3JTd/oUnZ7A7v8Qrp
         ZpDpzCRZcV5a/5arlXiyexGE61wq2KMv9BJygu3Oef0o1zpCq+UC01PDJTrpHIUO6UfB
         t7lHgvTa0dGcSuwtQW6CZYeWh65DG+PtjIVjM+aRA9yRF91Gt9dRnhWGBKQAuMGPj8wG
         69rJptP4dJlLU6uHJJvOXBNkkvI4c9fyI1HvO2sNHwykZD4hVFdEiVLo4tsEZas5BEyx
         5IJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688972469; x=1691564469;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAAM318e50FzwuPYMp5fFaAKn/TzSZTu0tdXq5W1k3U=;
        b=Ia413H0A5fQ02TDvqFj4abZoCUrnwmwAU1iUAKQmBKZjGuG0rMMttEFZb4FHVBYMxY
         m9AG+r5DREmsHdm5KIUJVdEdvSIXYnEMrcCHcClOfcQmYCj3cStzVGZWFtYFr6U0BAVg
         3GIrt3Qz83dKr8RHybNjHhyGb9G0fGWRhuM6rkDmq7nCZt4w8hk8//RqmjHABbMgMiHc
         vBFSKfG/z3MEy1OSM+oSzVVojXXDcNpzvvhACOCsS7Fkn9xALu3yjlqWYbp1AiFeqARV
         /ByXPcrk96xFrbKtrLx1us9sVEddpilbGiwGb24KNNm0vcO8kE8/u+ViAuw0rHBaJcON
         lWvg==
X-Gm-Message-State: ABy/qLZtrED9HkgUskxMi41BstkxKwUd/AV7t0HJCCLuLZyEbOqBrE2P
        y6rFyARBxrG/g9+BKM/Ue5VyCQ==
X-Google-Smtp-Source: APBJJlGBJv/pG3fRR7H73rSe8XqG6pWMaXfeTU/GjuyMR4ZA8r4RhtJyxCqLUDfc8K3TojxugeZm3w==
X-Received: by 2002:a17:906:2ce:b0:993:dd1d:8251 with SMTP id 14-20020a17090602ce00b00993dd1d8251mr8929143ejk.28.1688972469441;
        Mon, 10 Jul 2023 00:01:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id k3-20020a1709061c0300b0098d25cbb899sm5685021ejg.41.2023.07.10.00.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 00:01:09 -0700 (PDT)
Message-ID: <83847c7b-74fa-bc79-0287-893e23516a23@linaro.org>
Date:   Mon, 10 Jul 2023 09:01:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5] ARM: dts: exynos: Add Samsung Galaxy Tab 3 8.0 boards
Content-Language: en-US
To:     Artur Weber <aweber.kernel@gmail.com>,
        Olof Johansson <olof@lixom.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230628082332.25102-1-aweber.kernel@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230628082332.25102-1-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 28/06/2023 10:23, Artur Weber wrote:
> Introduce support for the Galaxy Tab 3 8.0 series of boards:
> 
>  - Samsung Galaxy Tab 3 8.0 WiFi (SM-T310/lt01wifi)
>  - Samsung Galaxy Tab 3 8.0 3G (SM-T311/lt013g)
>  - Samsung Galaxy Tab 3 8.0 LTE (SM-T315/lt01lte)
> 
> What works:
> 
>  - Display and backlight
>  - Touchscreen
>  - GPIO buttons, hall sensor
>  - WiFi and Bluetooth
>  - USB, fuel gauge, charging
>  - Accelerometer and magnetometer
>  - Audio: speaker, microphone, headset
>  - WiFi model only: light sensor
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> This is an updated version of "[PATCH v3 13/13] ARM: dts: exynos: Add Samsung
> Galaxy Tab 3 8.0 boards"[1].
> 
> Changed in v5:
>  - Re-added disabled RTC node instead of deleting it with delete-node
> 
> Changed in v4:
>  - Added touchkey keycodes
>  - Added audio nodes
>  - Added MMC aliases
>  - Fixed dtbs_check warnings
>  - Fixed indentation in pinctrl sleep state overrides
> 
> Changed in v3:
>  - Addressed review comments
>  - Removed rtc node (RTC is provided by PMIC)
>  - Added CPU thermal node
>  - Fixed dtbs_check warnings
>  - Added common changes from next/dt
> 
> Should pass dtbs_check with no errors, provided that the following patches
> are present:
> 
> Backlight node is adapted to changes from "[PATCH v2 1/4] dt-bindings:
> backlight: lp855x: convert to YAML and modernize"[2]. The whole patchset
> has been merged into the backlight tree.
> 
> Touchkey keycode property is added by "[PATCH 1/2] dt-bindings: mms114: Add
> linux,keycodes property for touch keys"[3]. So far only the bindings part
> of the patch has been acked, otherwise everything is awaiting review.
> 
> Display bindings have been added by "[PATCH v5 1/3] dt-bindings: display:
> panel: Add Samsung S6D7AA0 LCD panel controller"[4]. These are already
> reviewed and merged into the DRM tree.
> 
> [1] https://lore.kernel.org/linux-devicetree/20230501195525.6268-14-aweber.kernel@gmail.com/
> [2] https://lore.kernel.org/linux-devicetree/20230519180728.2281-2-aweber.kernel@gmail.com/
> [3] https://lore.kernel.org/linux-devicetree/20230521145843.19489-2-aweber.kernel@gmail.com/
> [4] https://lore.kernel.org/linux-devicetree/20230519170354.29610-2-aweber.kernel@gmail.com/
> ---
>  arch/arm/boot/dts/Makefile                  |    3 +
>  arch/arm/boot/dts/exynos4212-tab3-3g8.dts   |   29 +
>  arch/arm/boot/dts/exynos4212-tab3-lte8.dts  |   44 +
>  arch/arm/boot/dts/exynos4212-tab3-wifi8.dts |   26 +
>  arch/arm/boot/dts/exynos4212-tab3.dtsi      | 1310 +++++++++++++++++++


This does not apply. You rebased your work on some older version/tree,
without new layout. Please work on linux-next.



Best regards,
Krzysztof

