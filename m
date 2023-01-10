Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7574C54EBE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Jan 2023 19:38:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbjAJTin (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Jan 2023 14:38:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232988AbjAJTiT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 14:38:19 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0FC5AC57
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jan 2023 11:38:09 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id m3so9590012wmq.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jan 2023 11:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+6ojRSTKPFeCe6Qwmp9K84vaHxDFNyRTeBBcQ3RV5M=;
        b=xsH+Op9cD+IQLfl4OEz2QpMEIRTas5J7avpoUB1pCD+UzHbyqzE9QSnaMbvka6BGXE
         LEGdVoUjCheOj9NSEA57Q0z0LK9+8ouhM2CcYLoxpq6HyH2qOFMaWOJ7PbHMRRFK2RNm
         v5R7sDTYeZYXKKjitJprDhfP6oH0pqygv+I+SFipI6KHoWPjC2CEHJJ+XAYM1uUsJ4ph
         omLEc9R01uy9xsGF8EwwdOa9lWqGly1ajy/erZZnMbdaE7/JG7Q3ETbE16lTyT1AOVYl
         loxxADvQyO5BZoolaBT7Qmt0+VqMGny2lvfhAyZMSJXdOBdwMi1agFGeAyWq7U2VOZUd
         oVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+6ojRSTKPFeCe6Qwmp9K84vaHxDFNyRTeBBcQ3RV5M=;
        b=eInfl6WiWp75Z1jKPPFYWbLL52ENkKvZStcHJ7DdlRvTHlfnGPs5nerMcgym8hIg3Q
         ecGhhdVavQ+lcpzuj9lE595msDYuEBraBlznCQ50V7uLMGPJrLKG9ZiKix7OWKbHGvCr
         H+flzD3jkHSfflGXW32ytv6l1J9GbQyM7iAN2pQml62m4Qg2FdBlm5qxQdRbuVBCBE16
         vWA9G7TFFBNmvD6O7IPzcMMCTihFHFOfzQYaRoD2WRDXhFL50smNCj50dhBmps3bC0O2
         fTi3vz0Ci+S2OJMVkJULCYkT33LcFvLlKN7OgEHG/w/oDhBhxgOJ1Alws7P2Bm2RmZ6Q
         Cmqg==
X-Gm-Message-State: AFqh2kpRTIc59IbIPem4vED6F5cO36KjWSLCG3qzI90gUgJovfpVVEPh
        wx7R9mwPqjBO5jd9a9CmBPMhhQ==
X-Google-Smtp-Source: AMrXdXvxzJ/8+am6/NrozsHmhrMVkKG8mJ/6egL59X2oPK88ZlWj/W/lo3nGHnVbtgkiBctpTVii3A==
X-Received: by 2002:a05:600c:3b26:b0:3d7:fa4a:681b with SMTP id m38-20020a05600c3b2600b003d7fa4a681bmr52517306wms.0.1673379488053;
        Tue, 10 Jan 2023 11:38:08 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q6-20020a05600c46c600b003cfd4e6400csm17253043wmo.19.2023.01.10.11.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 11:38:07 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: exynos: drop unsupported I2C properties in Espresso
Date:   Tue, 10 Jan 2023 20:37:58 +0100
Message-Id: <167337945584.1430972.13331082393080125830.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204190543.143986-1-krzysztof.kozlowski@linaro.org>
References: <20221204190543.143986-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 4 Dec 2022 20:05:42 +0100, Krzysztof Kozlowski wrote:
> The Samsung HSI2C (High Speed I2C) bindings do not allow
> samsung,i2c-sda-delay (present in older S3C24xx I2C bindings):
> 
>   exynos7-espresso.dtb: i2c@13660000: Unevaluated properties are not allowed ('samsung,i2c-sda-delay', 'samsung,i2c-max-bus-freq' were unexpected)
> 
> 

Applied, thanks!

[1/2] arm64: dts: exynos: drop unsupported I2C properties in Espresso
      https://git.kernel.org/krzk/linux/c/91d89306579b7a2963e39e4711b893634ace23d6
[2/2] ARM: dts: exynos: drop unused pinctrl-names from Galaxy Tab
      https://git.kernel.org/krzk/linux/c/5d1ab51463d6c609e65861625512f912eb1d7cb2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
