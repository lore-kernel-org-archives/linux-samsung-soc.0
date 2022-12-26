Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDBAC4708E
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Dec 2022 15:17:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbiLZPR0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Dec 2022 10:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231609AbiLZPRY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 10:17:24 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB91A615F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Dec 2022 07:17:22 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id j17so6754433lfr.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Dec 2022 07:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+U3HkQ1xBMj36xQbBp/aJnNX746KlSZ3KrNx3sr/0FA=;
        b=gvdkVrcohcDNeUreKN0HqNYB9wDbVtKnB5cCaVPNZ0NnvGcmrVjjqGWPLOgh7ABcdB
         s5PsWV/d+yun6u0ltQwXkzcQlsr3VHr+uCVtrBwmX7zw6MP86LcVzPApedGn7SThK1av
         +hUu5cAd1slCOeHtkzm9iSWC4+kDSqb5bkkQKCJWiG0uoZ7qVwkM1Zw0Qz4WRdXwiK+h
         L7Mn+uZNfwJPqEXLRQv8OOYufXA+1dFLh+h4aFC7J6rGBNj4H8iJhCOgrIAyeuvCcpFZ
         iJ34Ytk8/U+jl6Q4D08Y7BH9lfAj7VM9SemAUdJtzu7TYmn4hKw4+AX1cKaP2K2BRKbX
         +1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+U3HkQ1xBMj36xQbBp/aJnNX746KlSZ3KrNx3sr/0FA=;
        b=bPlx+pLnuhOrRHwCs/aYbydqcHv37rkjP702LfWcFF48mfnknK52kTpoYHAH5IV8rV
         9zW4Ujwjj7GpFVSdHf6rhykUtcKQtj7fRQmk1EfFQ86RWtPz6XTCpgo2JuPIyonVSijL
         25GG6hveY2QFM9hzdO8HRMEcMCdvaC9jmHyE8guZkujX1HAnazskGKuJXjV3BAgfFC/S
         To3jgkJrNx3trwiAhYgakHN1+SBFzCaD136EtfSW7/90z9oM0iq5CXiytgmZEFPYESva
         8h3Ej0sB8+xllDN3U4J54QaVKNjemlUlRD8f7taLZFKNEmDjRB7xZNOguoRufQkuS43J
         5hGQ==
X-Gm-Message-State: AFqh2krOD84RGkI+piVDB8Jpbev/0I8/yhsGIkRPuzO9YVq0TpIyemdW
        D2JiLvzymJ8zcORc8yaGcHdBrg==
X-Google-Smtp-Source: AMrXdXv8J08/f3M8b3Ooetk1zYx+WchyzQ3Rl4PoQ3t4gJpWae5SUgJCKI+uoRkEuHz58zVhx324eg==
X-Received: by 2002:a05:6512:2987:b0:4a4:68b7:d642 with SMTP id du7-20020a056512298700b004a468b7d642mr5260450lfb.41.1672067841109;
        Mon, 26 Dec 2022 07:17:21 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k2-20020ac24562000000b004b4ea0f4e7fsm1821286lfm.299.2022.12.26.07.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 07:17:20 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sriranjani P <sriranjani.p@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: exynos: add dedicated SYSREG compatibles to Exynos5433
Date:   Mon, 26 Dec 2022 16:17:14 +0100
Message-Id: <167206781676.20416.7774235574010819707.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127123259.20339-1-krzysztof.kozlowski@linaro.org>
References: <20221127123259.20339-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 27 Nov 2022 13:32:56 +0100, Krzysztof Kozlowski wrote:
> Exynos5433 has several different SYSREGs, so use dedicated compatibles
> for them.
> 
> 

Applied, thanks!

[1/4] arm64: dts: exynos: add dedicated SYSREG compatibles to Exynos5433
      https://git.kernel.org/krzk/linux/c/c514239c4f3d0e5d0eb2be9adbd1992702647e76
[2/4] dt-bindings: soc: samsung: exynos-sysreg: split from syscon
      https://git.kernel.org/krzk/linux/c/c2e322ae9f06be31ab5db1f29630f81469a37d75
[3/4] dt-bindings: soc: samsung: exynos-sysreg: add dedicated SYSREG compatibles to Exynos5433
      https://git.kernel.org/krzk/linux/c/7b35b6b8aab2fd4249fe2828f108e88e9279eadd
[4/4] dt-bindings: soc: samsung: exynos-sysreg: add clocks for Exynos850
      https://git.kernel.org/krzk/linux/c/af7354c7c02249276ceb3011eecddd469246b2bf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
