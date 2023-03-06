Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06438C6FD1C
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Mar 2023 11:39:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbjCFLjV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Mar 2023 06:39:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjCFLjU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 06:39:20 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF91610D9
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Mar 2023 03:39:18 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id k10so13306524edk.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Mar 2023 03:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678102757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJA1+Nsh3/tu6/DEAYbMhEmvhzJFVZ7cNKIY9M1zLxo=;
        b=OibuzJbQXLlWyYu02Fy9XPtw9fXAhWrIqOrxOxz0zhdaBv1gYUOX1aUisW2OmZRmiB
         C4jhf+nkVLdIxz+3BhIPrUAvX3MduHyMf12Zqp++XiOI6WSgIv5Hav8OXc/OFQWa/bfY
         uak/8+bMFbqelQ3J/pq5bfyfBuDOR3/wlfaHOUyZVxMK2Z1KpgcKkwT9yambWVMdShsa
         mlL4n9K8kYBj6ra9Wu+a60RCVhOrO8bsfq+LGi/TXK+C+4w+yML0F9GAuXbr8DU8DWUB
         8UiVvzYBrl6t/XpL+Ayhk6uFP9D/eInf61N1goU8eGsQy7i+4el2ozi5hr63q1sehfRj
         L5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678102757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJA1+Nsh3/tu6/DEAYbMhEmvhzJFVZ7cNKIY9M1zLxo=;
        b=1rooyHs2v+cME7Ws7tW739lIlcNvflCrM+D9AwmL8wWDyxWOPRbiKeE0Tmglbf6kcx
         zmppahtG+EclBF3kDNL+drywd2L2m9ehZndx3rZl5uqoezA/lvppXLjTrIj7+QMgqqjB
         aPuqdFtTWPBRXB2arsfGf0DpT9+ZKHnmreaszQ/7YDayvlUjH04lhKppya91vMrDakAT
         gNKc8366Zd2nD1Jxsi/2qOnupZJuGbyJ6M8rjveUxMqQ7ehcMD/8C190BGKDchiCZwFf
         Z8us8FU6ErWZiPQI/+HYHn/AemGpNZGN00ilCWNB/zM/H7K4NCsiAweKPfnf0+y/JRY2
         TxpA==
X-Gm-Message-State: AO0yUKXfMNmZ+pCcBUeQwWPd3AWAq8brPq8n5Fsdq71dzftC7n/hClSK
        w8A+3g3gJf5azg1Ck31tTkiYVWafa2Aj+qaC2tE=
X-Google-Smtp-Source: AK7set8tacaPduX6qmvYm9SD44o5T1uYNPBd5zlHnYBlEXBiIC+zU2ezQnC2NbhcR+ad9nyMJqXpMw==
X-Received: by 2002:a17:906:7f86:b0:883:fe6b:814 with SMTP id f6-20020a1709067f8600b00883fe6b0814mr9499535ejr.37.1678102757347;
        Mon, 06 Mar 2023 03:39:17 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d85d:5a4b:9830:fcfe])
        by smtp.gmail.com with ESMTPSA id ch10-20020a170906c2ca00b008cf8c6f5c43sm4411936ejb.83.2023.03.06.03.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 03:39:16 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: samsung: exynos-pmu: allow phys as child on Exynos3 and Exynos4
Date:   Mon,  6 Mar 2023 12:39:06 +0100
Message-Id: <167810274095.82312.15579252387644659076.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207192851.549242-1-krzysztof.kozlowski@linaro.org>
References: <20230207192851.549242-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 7 Feb 2023 20:28:49 +0100, Krzysztof Kozlowski wrote:
> Just like on Exynos5250, Exynos5420 and Exynos5433 the MIPI phy is
> actually part of the Power Management Unit system controller thus allow
> it as PMU's child.
> 
> 

Applied, thanks!

[1/3] dt-bindings: soc: samsung: exynos-pmu: allow phys as child on Exynos3 and Exynos4
      https://git.kernel.org/krzk/linux/c/e3fc841ef02fe065255327b4c0259ac94bc9763c
[2/3] ARM: dts: exynos: move MIPI phy to PMU node in Exynos3250
      https://git.kernel.org/krzk/linux/c/37688852fd6f4fed2b3800a7652be87147137125
[3/3] ARM: dts: exynos: move MIPI phy to PMU node in Exynos4
      https://git.kernel.org/krzk/linux/c/d237b2270c68032ad3471ca82d1f3581398179c6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
