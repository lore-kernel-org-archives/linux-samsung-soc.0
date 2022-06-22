Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA278CCA47D
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 22 Jun 2022 11:58:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354653AbiFVL65 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 22 Jun 2022 07:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237538AbiFVL64 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Jun 2022 07:58:56 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6856C3CA78
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jun 2022 04:58:55 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id e2so12621288edv.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jun 2022 04:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+hoDgmECCxkmEuLXgBpfFKs4eUitUbbxSUfe43Rhe54=;
        b=C+NroklpGh0nlubI+1ZeSqpfsLNzxb/G87D1tEFno3abaQT9GtucS9KDGd/I33ABE9
         B9rvOtees8v8+IHbiU5niiqIqxJ/XsZI+EN5IuNZjMBKaHMCft6W2iOiWM0JHhBVjKzN
         YHIk1ymllRhQooe5avdb1htIEaJDS4e6o7zQ47bl3mEaNvYOoAGMIFg0TNPOpXj6fNCF
         b4mt/VsMqMCslwz9Iw+OrjyyEba9dG9ZWJQXpQNsaWLsfc3+JShLJV+Y7fZS0sSe5aWN
         M+pU75P2Km9lx5B8DOm5BtfByPt89QbqZfxrnqoRJB3hBOCwQjwEx7W1MMn76MXpoLYP
         6aGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+hoDgmECCxkmEuLXgBpfFKs4eUitUbbxSUfe43Rhe54=;
        b=ta2ROImM2PKw+RV+mx/GY4sIRqbhUfCFUpT5ibMHgKMm2bvTgq09O+wxhcjdIqaZau
         rSIQumfPZh7MIoiOAZulzn1IuR6kTWeuce60/3mW4hwAg/gsJYihsttl8I4rP8Z02dGV
         p6PHcXzy4HR14lRL0dxg2ouhtLak/Y82DPrCCjCR/Sajj4HCyAoaZDm6kxSrAqdSuFVP
         oMLewPrdxS6zG2FXwhViE2iTHCe/oNb8iMka2U3s13TnJS1QjGdct7gDX96gXkQA+g9m
         EBmUNi71yFc3Ho/NE3PY+Kqcq00vMUwMXSS5il39Zj8ZVRCaj5cdbMDSrEgw6416BRnz
         A0Fg==
X-Gm-Message-State: AJIora82pMHttwPw3ImWdeHVxv7YRppQlYPf1OFswciQ6UhF67wteIti
        NbqO9uz8fedxFEhbzjONdo31kg==
X-Google-Smtp-Source: AGRyM1sV0n+kFPrHjo7J9mlB5BlTGLwd6/VlnulPgYV6wcLDYSE4OUHrGe0vlIYlpXI7KIin0ABbDw==
X-Received: by 2002:a05:6402:f8d:b0:435:6df2:68a with SMTP id eh13-20020a0564020f8d00b004356df2068amr3762502edb.209.1655899133972;
        Wed, 22 Jun 2022 04:58:53 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id qw21-20020a1709066a1500b0070c4abe4706sm1746212ejc.158.2022.06.22.04.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 04:58:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, robh+dt@kernel.org,
        pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, alim.akhtar@samsung.com,
        jacek.anaszewski@gmail.com
Subject: Re: (subset) [PATCH v2 2/3] ARM: dts: exynos: align aat1290 flash LED node with bindings in Galaxy S3
Date:   Wed, 22 Jun 2022 13:58:49 +0200
Message-Id: <165589912782.8422.17803439134103733138.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175033.130468-3-krzysztof.kozlowski@linaro.org>
References: <20220620175033.130468-1-krzysztof.kozlowski@linaro.org> <20220620175033.130468-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 20 Jun 2022 19:50:32 +0200, Krzysztof Kozlowski wrote:
> The bindings expect aat1290 flash LED child node to be named "led".
> 
> 

Applied, thanks!

[2/3] ARM: dts: exynos: align aat1290 flash LED node with bindings in Galaxy S3
      https://git.kernel.org/krzk/linux/c/efbf2c262c89f78f99fd781c77b7305fac23c3c7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
