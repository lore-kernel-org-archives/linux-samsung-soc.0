Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50C1C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Jul 2022 06:34:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233366AbiGGGex (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Jul 2022 02:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbiGGGew (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Jul 2022 02:34:52 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F1602613A
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 23:34:51 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id e20so720549lfq.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Jul 2022 23:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ysc87HWO1xUWXFPdwqw2dVcHrfoCXIGok2opDqUtzfw=;
        b=OZML/7Kij+34LoFn4KZeoOsd6smLupYBJrkB9DKdoKig31Zyl+O07MqCh+uoV0CrKv
         aWjlfN3fZthwDAo/Pk4pjmgQA+7EZR8fK5A20lnPzP4YzxGwVcT8mDemtJaXyN9Z3tUs
         +oT2/IxmpHsYPdqQKqtQULYP9cueICA5nznTPKSij14LjAIFYY6uQ46MyR2sSULpUf0K
         r1Fq/ZWLzbMqCcG8esvWpKa9AnFyFm+1ieSYchBo/yI/athdMHAnI38Zpu8q6rLCyrFa
         7jcueUwDN+Atxv025fb4vllkbR0Rqh15Yp5wG79BOlhHNBJpAd/XotnfhF+D776RJvjF
         jHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ysc87HWO1xUWXFPdwqw2dVcHrfoCXIGok2opDqUtzfw=;
        b=woxvm0bSKiXKSPCdd0ITZGDToLdLPrZM2/nm3z9yysRW+AAC0fx7cpXUjWA/v0kRE4
         PyKipBybxFhxQk6S+rcdxCKCXRtr6ExttI/umSm/zmk3RnNgtZfbQKh0SwZrIas7XNAS
         rM8cfgz/IA9oXyLq/YwwudbS+A3DAmjawdrPyskyJhFRNTIatdSfltgkcILHSe57btEZ
         /7CSscMGiuarHdT87A4QbbVm9zVKXWTHQm3GvENzOoTt6fhBkvf4Q3W+iTLX+IWIJ3Up
         vy/SYo7tyYqW5e114b+zwvrOD15fL9veEsUIIQTbYQZj0l43Xjb0sckBC6IZNkoJ//vQ
         +C0Q==
X-Gm-Message-State: AJIora9EFMHWEVPblG14oYuJx6+76v/I6eFFulZctxYCB4Y7JfuE/q7j
        jMsAHOsYYtV6Q056ONRQ8GS5TQ==
X-Google-Smtp-Source: AGRyM1vNp38CehOe+BehnQZOQ5DRGhrTKJhX90Cyhwscys7T3R991jX0z8uhQGenGTnn7LvXI0Ay0Q==
X-Received: by 2002:a05:6512:2381:b0:482:ba6e:4a08 with SMTP id c1-20020a056512238100b00482ba6e4a08mr10574066lfv.666.1657175689961;
        Wed, 06 Jul 2022 23:34:49 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id k26-20020a05651c10ba00b0025a736f5a41sm6653583ljn.9.2022.07.06.23.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 23:34:49 -0700 (PDT)
Message-ID: <4e8a36de-a631-f6c9-44d7-7d873f775db2@linaro.org>
Date:   Thu, 7 Jul 2022 08:34:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] dt-bindings: phy: samsung,ufs-phy: match clock items
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <CGME20220707063058epcas2p19364a05a5b2fc8aad81fa390ac030f21@epcas2p1.samsung.com>
 <20220707062807.135960-1-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707062807.135960-1-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/07/2022 08:28, Chanho Park wrote:
> Below error is detected from dtbs_check. exynos7-ufs-phy is required
> symbol clocks otherwise only PLL ref clock is required.
> 
> clock-names: ['ref_clk'] is too short
> 
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Suggested-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
