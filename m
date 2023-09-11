Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D66FCA0EC2
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 11 Sep 2023 21:37:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348739AbjIKVae (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 11 Sep 2023 17:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236913AbjIKLjj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 07:39:39 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D2B3CEB
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Sep 2023 04:39:34 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-52c4d3ff424so5685904a12.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Sep 2023 04:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694432373; x=1695037173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CNTfpAlLwJmILsM2ML8AYXqOfMhJFlBtfc+NKYRir1U=;
        b=ghEBbB1urKJGeO8Bdy6HofhhQiZ1S9/1NhPG7BsncRMDGG0s5wlXonQOGlxx3mCzEp
         TilWMdnEyOCs0gkiHJmjCkgpyd7ExzLF/Tu34fhN8/6+VnBwsxwCzeWgexmuIvBaMw8Z
         dJ82hwi84usc0wlEKfbGtWoTaNixYew8o60dxoh0hKzNbt9GXjAKhoJTD/+sQdS8BdUS
         d3ZU+GHBp4Vlq1QX7zPgn44yoRm1EpADc37AqjLbxRr1uhgKl1FBR4lg4ahRVeRfWtZz
         9+FRq50oD3WMRi4cIC8zBX2iQY5tOmdmeVnRLUW9Fn7kwgZ7sPR2rb45+qfElWJ2n8v5
         qPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694432373; x=1695037173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNTfpAlLwJmILsM2ML8AYXqOfMhJFlBtfc+NKYRir1U=;
        b=iomwVXYoQm1f6tv/UP6NHjH2S3U5m5dGXxM+f6aESb+MqAl531VMWTZFCI1MUXfzJg
         5pJWQDU0flTEN4sh8vnCMgDTihPJtpj5Jox1mqwqLZgN71neGNbhIA46HMPsApxeiO5X
         NQnPyJq4wQ6bw7nsYTVTpImkN7SePslp+c4TOV3bC5JU7whgV3Vp1YcLHolBi4C3gxoB
         PZ8t7zLDI34o2CTwpaD18zQeMHhAPt6JTcp58DCMiS1e2fn9MkpI12RU74dhwZbNlPQ9
         tQSg42zvhDXbMtAXuzLPjfqi+NoBNX0v+QdjOdQ/4CxLROytJUdHt0pATLceCvLCoLK6
         HLCg==
X-Gm-Message-State: AOJu0Ywy2sp5vr6czjcEbcHnbX0fv9AdRLw2lr2S7Ja4vIB9kyT1zo93
        a77RXpWhzcL0BlY7p3tWCsAUIw==
X-Google-Smtp-Source: AGHT+IHwEnPhO+VHQG0S+VrfAHaLii+tG8XXkAqNaOPbo0YVPvNOqmH3dpTLzyBvYyQwoxAyv+FnFA==
X-Received: by 2002:a05:6402:1254:b0:522:3ef1:b10 with SMTP id l20-20020a056402125400b005223ef10b10mr7390345edw.6.1694432373037;
        Mon, 11 Sep 2023 04:39:33 -0700 (PDT)
Received: from krzk-bin.. ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id g15-20020a056402180f00b00523b1335618sm4431003edy.97.2023.09.11.04.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 04:39:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: defconfig: enable syscon-poweroff driver
Date:   Mon, 11 Sep 2023 13:39:24 +0200
Message-Id: <169443234708.34398.6225536362107834291.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230901115732.45854-1-krzysztof.kozlowski@linaro.org>
References: <20230901115732.45854-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Fri, 01 Sep 2023 13:57:32 +0200, Krzysztof Kozlowski wrote:
> Enable the generic syscon-poweroff driver used on all Exynos ARM64 SoCs
> (e.g. Exynos5433) and few APM SoCs.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: enable syscon-poweroff driver
      https://git.kernel.org/krzk/linux/c/471eed5ad217fc8e83089e708d5cf5a1d0b205f7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
