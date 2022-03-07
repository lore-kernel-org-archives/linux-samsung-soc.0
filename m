Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27843C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 09:13:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236261AbiCGJOS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 04:14:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236260AbiCGJOR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 04:14:17 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1744552B
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 01:13:23 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id i186-20020a1c3bc3000000b003898fc06f1eso155998wma.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 01:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=O4wnB7ArI0waaXl3ollevDRR7P2ljcBCFuA2BVyo4sM=;
        b=flKX3c8N8zfSxvYg0TraD7mwUu/xAx05SVHKu30AyVRQh/OGIXw0EQz+xDvIFTvo0u
         KaKO2+g36n7ICSC8lmArKObtnzxV/6NvqVr5HdN8qfOEzsBIFq62ZJLZuB5wL/Fgk5Ln
         Lj1YOAnAyeZVEHctmq+SeaurzZxNyfzpyW+zkHXMAJQ2rirJcNun3SaYf6XKFWztulBy
         xQ+gTVXVs767DdqPtBl5VcgM3Z0smW2CR4q+52o6KAdcz5rLBrkzmNwXj5kgk1VIue9D
         V1daIFUGsJSBdM8RvtoEeopVAlbh+J0zaTK+uGdggSEZ+7bTL9K5MLsMed5VqPvGbmGM
         P0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=O4wnB7ArI0waaXl3ollevDRR7P2ljcBCFuA2BVyo4sM=;
        b=L/JNPiF19z7gsgDDjN4rXOZjR+0uklw/+ru0xVolJfz87LrbHgJyaxJm3NsscE6HDn
         ubcWTxDTjEGaGPiic3Odwyoto26CjgLKdGDaIqmJH7yRUI49N785xyFv75n6TiKBtAsy
         t47jK/ccxIe7y6CTkbaD52mREm/NH8kwoMfoJ4S9V4TssRqz26Pi6DcNWuDICuhsmFfq
         NddLageLE124Oqf99PChrDb/ZrYEsEu7InlZEVLOOmkCcO5C0JEJ+C7REI9L4e6FiWON
         utrU9KhkO6IH8Zz44jFXIG31KLa8Ex+oBU1cghx2VpIUeYZy//vjPNCSSft/RFKofIUp
         278w==
X-Gm-Message-State: AOAM532s9v3aRSfgHTCGsFJxujunFTF2nb6LfiJCWv0M1zXlrEr/YiHb
        sqjYxgbnZoYfKu9+D6jjg7XH7w==
X-Google-Smtp-Source: ABdhPJxFSmsiP4xlxqLySV/hDnHI+YvTmhLMuW7hB+nMe0t4B25VsNyfvOXNlHAzxq9CoVjBjDBeOw==
X-Received: by 2002:a05:600c:22c9:b0:381:3b27:89be with SMTP id 9-20020a05600c22c900b003813b2789bemr8341809wmg.83.1646644401937;
        Mon, 07 Mar 2022 01:13:21 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id k13-20020a7bc40d000000b00381890032dfsm18024504wmi.1.2022.03.07.01.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 01:13:21 -0800 (PST)
Date:   Mon, 7 Mar 2022 09:13:19 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: mfd: maxim,max77843: add MAX77843
 bindings
Message-ID: <YiXMr8ApxmQTr2vr@google.com>
References: <20220111174805.223732-1-krzysztof.kozlowski@canonical.com>
 <20220111174805.223732-5-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220111174805.223732-5-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 11 Jan 2022, Krzysztof Kozlowski wrote:

> Document the bindings for MAX77843 MFD driver, based on Exynos5433 TM2
> devicetree.  These are neither accurate nor finished bindings but at
> least allow parsing existing DTS files.
> 
> The example DTS was copied from existing DTS
> (exynos5433-tm2-common.dtsi), so keep the license as GPL-2.0-only.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/mfd/maxim,max77843.yaml          | 144 ++++++++++++++++++
>  1 file changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77843.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
