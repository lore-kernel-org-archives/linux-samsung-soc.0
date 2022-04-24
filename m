Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4FBC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 24 Apr 2022 14:55:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239505AbiDXO5y (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 24 Apr 2022 10:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239552AbiDXO5q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 24 Apr 2022 10:57:46 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDBF9153768
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Apr 2022 07:54:44 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id a21so3514472edb.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Apr 2022 07:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EXaQ5O6aW8iOE3VBZEqJgvs17b11E7AVbZySzMC4mZo=;
        b=lFLRsmUweurnZio4Op9D3iGC6LXYcYZfRxPk4bYIxlu7WaTFQMqqwV/9yf7mQ7FA+9
         uJRb017zkfqE0vUj4jbbRSfmY3FM5Fr63eQN08zS0JkxNODus+apiVB3VUCrod99TaAb
         41RpDVD6xWpqYD0FQuh/l4MmspWZ5Htvi/NVhBzxD6Xi+BqEek/nl0ROvJuyFehoJvWb
         MuONtx6hapPxAMeo1gvfCW8czIqz73J3F57DzPsIqQdjQdF2lYRmy3Wmmxf6DSo9n+1Q
         rDyDS/Q1p+FgPnNHXV8ZFdOMcojlVsUAFHuCHPEpRvMBOofmRsfBdhLYiVkTaxYEtCvf
         vLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EXaQ5O6aW8iOE3VBZEqJgvs17b11E7AVbZySzMC4mZo=;
        b=mlKM9136sTfnjFlO7pL2qWCIKi9YpZz3IQkOP5j2DOCcKOcwyWUvundSUsm8tvw32K
         PCX6lXFp+aMO/9XH8yrCENvNXXr7UyUeXvWhkYWHAa0L0RVDy2kmtrHtV8IgvPJaRSRG
         t6seS2EHrDt9PoqiQHyEeOxqW1STBnZJ8NnIfd8jpSgzSuiinyy2JztDkc/ZwahyoOGU
         y29tCiFm3b4rK0FGn1zRVk18Dn4g5PF5T25og8OlN8RO763LJZ6eiEVVsTPPfNitPo5l
         ZrIrAYQUn8n27l53+xWJF6Y/Kxh3q6HdlLNytE0fWoQmK88FBmmdb8Qh7EygWG0ALMes
         MYbg==
X-Gm-Message-State: AOAM533dBmQj0GiQldYtyx1+40DV4F5Owe46mBPpq9Z+Z8jq2xdIEH3p
        6FEj2EX/kjS9El2Gpujz+SbWCg==
X-Google-Smtp-Source: ABdhPJyBj/3ZR5Z4mHJautXp1JxdAru2RHWfVsabA5bNk+VNIPYcKegIT+Ze+i41iNOexvZP+d1MkA==
X-Received: by 2002:a50:eb87:0:b0:425:c3e2:17a9 with SMTP id y7-20020a50eb87000000b00425c3e217a9mr11268271edr.109.1650812083494;
        Sun, 24 Apr 2022 07:54:43 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l17-20020a056402231100b0041d98ed7ad8sm3387712eda.46.2022.04.24.07.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 07:54:43 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: [RESEND PATCH v2] dt-bindings: timer: exynos4210-mct: describe known hardware and its interrupts
Date:   Sun, 24 Apr 2022 16:54:40 +0200
Message-Id: <165081207650.53958.14139766049160653161.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220407194127.19004-1-krzysztof.kozlowski@linaro.org>
References: <20220407194127.19004-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 7 Apr 2022 21:41:27 +0200, Krzysztof Kozlowski wrote:
> Most of the Samsung Exynos SoCs use almost the same Multi-Core Timer
> block, so only two compatibles were used so far (for Exynos4210 and
> Exynos4412 flavors) with Exynos4210-one being used in most of the SoCs.
> However the Exynos4210 flavor actually differs by number of interrupts.
> 
> Add new compatibles, maintaining backward compatibility with Exynos4210,
> and constraints for number of interrupts.  This allows to exactly match
> the Exynos MCT hardware.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: timer: exynos4210-mct: describe known hardware and its interrupts
      commit: 5fe580196dd9b7d8eb2a99629055bb4ffa00f262

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
