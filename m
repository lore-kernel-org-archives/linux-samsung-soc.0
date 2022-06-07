Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2261CCA484
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 06:39:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237113AbiFGGjX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 02:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237116AbiFGGjU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 02:39:20 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA98CB043F
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jun 2022 23:39:18 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id q1so33153091ejz.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jun 2022 23:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=30/swRoGI7lxOeK/JCZOMenofIQ2Qnwy381c+smb4TA=;
        b=hRvd0fRQ06nsWwDyDjPYxTGsvqvXXrNQMbjT1Em4UrrOfqMzAG5qNorVycW89lVPlM
         /4d395QujBeRwU1UilsC99/3sC3wup/EJDNh4LKuI0DvkhJoZ9tAvIa6Uve607PoFRme
         2i09ToSIIxI+Tdx4TAk40sq2HIPtM52oEOsZwHI3qQtcUe0eBRno4BS+DdEYJGOExBx7
         LqplQKH0pLizRr1ziLYe5MBWbS4swqfviGOjwvMfj5PCWdxXRHy9XXu09/LjaUcphHwV
         9LaZSxuXkKdBAW5a3zSBLlkw/IJjmQEsdUMQxuH6RqPvrDbcc46SxLtUnE6GIRLLH0gq
         6eoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=30/swRoGI7lxOeK/JCZOMenofIQ2Qnwy381c+smb4TA=;
        b=pRIO/k/sPZqh3PeBpIQVPm8TeB8PNRI0tiRMn/Bda0Jv/8ZwQvSc0bVqrwyMw84dQs
         Uh05bFjviON94WDYz0ojj98plAkvaALCVQ3f+syTb7Y1lvTBIdi16f2ZkZJOO5vwJY7w
         UKdDBrE/eM+26HZssYSSw+Ud9cSNkoOL0IeWfZNjM0qBfTERdqVGIkbqwgjIt8yM/VqP
         i5w9SVSEX/2687eZf46qU8/QhSAZKNJNZf0xsh2EbwWy7I+3at2oHBy+nCqZIDK5J88W
         fE9JPxiFycEVulprFBET6VE1ZNbLzQn/+l1LcKIaXuMEZBGodiqP+PHmwIkapzhVSO32
         y9SQ==
X-Gm-Message-State: AOAM531cE/AedAUFhmhgGy2cRwaRWXMGX4CMmkCjYn3tz2iPwhrq2Vr8
        fiy1S/Lx9HqKE5r8wtVrRY+GDw==
X-Google-Smtp-Source: ABdhPJxPb4B1+kYdlB7X2PcS4f0mWtob9442OqwnUgNprAost6mEYGoTJP2LBYDLNSUfIEVPMRgI3Q==
X-Received: by 2002:a17:906:b816:b0:708:2e56:97d7 with SMTP id dv22-20020a170906b81600b007082e5697d7mr24712545ejb.502.1654583957338;
        Mon, 06 Jun 2022 23:39:17 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jo13-20020a170906f6cd00b006febc86b8besm7016888ejb.117.2022.06.06.23.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 23:39:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     Chanho Park <chanho61.park@samsung.com>
Subject: Re: (subset) [PATCH v3 2/8] ARM: dts: s3c64xx: use local header for pinctrl register values
Date:   Tue,  7 Jun 2022 08:39:10 +0200
Message-Id: <165458395109.7886.7299681625638246723.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220605160508.134075-3-krzysztof.kozlowski@linaro.org>
References: <20220605160508.134075-1-krzysztof.kozlowski@linaro.org> <20220605160508.134075-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 5 Jun 2022 18:05:02 +0200, Krzysztof Kozlowski wrote:
> The DTS uses hardware register values directly in pin controller pin
> configuration.  These are not some IDs or other abstraction layer but
> raw numbers used in the registers.
> 
> These numbers were previously put in the bindings header to avoid code
> duplication and to provide some context meaning (name), but they do not
> fit the purpose of bindings.  It is also quite confusing to use
> constants prefixed with Exynos for other SoC, because there is actually
> nothing here in common, except the actual value.
> 
> [...]

Applied, thanks!

[2/8] ARM: dts: s3c64xx: use local header for pinctrl register values
      https://git.kernel.org/krzk/linux/c/468fff18c3776ced9bb466ae4fb2e30fdf671bef

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
