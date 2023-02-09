Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72F8C61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Feb 2023 11:10:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjBILK4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Feb 2023 06:10:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbjBILKw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 06:10:52 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79BDE410A7
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Feb 2023 03:10:51 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id j23so1433450wra.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Feb 2023 03:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GqEDrPecY5AdtYYouWhVhtBYmguh12NLHmLw2zaxBkw=;
        b=N0Q5+nSVpEn1IotrtH2c4+nMdnr1/jyszLxZ/6lQMPJBZjviOGLuhoG6raY3m5lhFB
         O2wxxDVEaaRLabE+uawnsyjpPsvF4GPS82iUGS07Fuw0h0fut0pEZD2/YLUrAs9etNL+
         mfeI0H6HSlyNT1OeD9TfCxjYHh20ggINxshXzEE738PUw2u5cB4KuetNTEGGdpDm0Fk3
         eMwGIs/fufc+dm6JyNSBNOL+zTbECLXETq/WsvjQVKouYGAlM20IxzlKayzuG2m6wz9F
         dgy0oefLkqzhN6Inr8gt5iBkksAf5/l2WoWHxpYtlczlYxqHMyqnkJcvjkjf/4Tro2RR
         5R8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqEDrPecY5AdtYYouWhVhtBYmguh12NLHmLw2zaxBkw=;
        b=Lb5M2O1hPp1Dk3kMojw3t1x8i0yv02U2C25lOeiVb0mtdpvcjPt0/Hq6HX/aXxlwVL
         x2Pu8RXD9OKG6tDG4N0yOXLcHXdDPKb9vYDokqvwfwJqgEvdKMN5EN569OA0IknRdo4L
         SzR1R2jOEIRiuykLK+ZK+YQ4RgKJd3HSSqUvEsEqm4sE7/xhDmtKlUCRVDmNqPS1Nn7k
         7rBMZDOxPfkVvrNSCZMzOfNejaCrqF5yGaLfZPZcuJ0T119Ny/UwLbeujGSjZIlaaUCU
         plmNCTGGENf4fLaMN0LGKT0mcz/XLDBdWpW0JetBlern7/o1a4N7GE7JSDZ6FCGNMu1u
         0bRQ==
X-Gm-Message-State: AO0yUKWowg14QkQvjlAkL6u3e2hGm+m9YzntZq+Itdhb4ks7nnYzK6kS
        mS7AmNsF9hDyPlKkK67hito1vQ==
X-Google-Smtp-Source: AK7set9Pptf/+9lQEs77Kb8R5toaf19I2u6q/MDWpOPs200SL3rdIyte95YRxP0YKdK27FN5ovVHrQ==
X-Received: by 2002:adf:eccb:0:b0:2c3:f7a9:e71a with SMTP id s11-20020adfeccb000000b002c3f7a9e71amr8449189wro.30.1675941050053;
        Thu, 09 Feb 2023 03:10:50 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q13-20020adff94d000000b002be099f78c0sm963207wrr.69.2023.02.09.03.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 03:10:49 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 7/7] ARM: dts: exynos: move I2C10 out of soc node on Arndale
Date:   Thu,  9 Feb 2023 12:10:41 +0100
Message-Id: <167594102110.781687.3726712835236512846.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207210020.677007-7-krzysztof.kozlowski@linaro.org>
References: <20230207210020.677007-1-krzysztof.kozlowski@linaro.org> <20230207210020.677007-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 7 Feb 2023 22:00:20 +0100, Krzysztof Kozlowski wrote:
> I2C10 is represented as i2c-gpio device, thus it is not really a part of
> soc MMIO bus:
> 
>   exynos5250-arndale.dtb: soc: i2c-10: {'pinctrl-names': ['default'], ... } should not be valid under {'type': 'object'}
> 
> 

Applied, thanks!

[7/7] ARM: dts: exynos: move I2C10 out of soc node on Arndale
      https://git.kernel.org/krzk/linux/c/27dfcb622b59cbce2c7f55cd87f06d2cdf20d5eb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
