Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EADAC001B0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Jul 2023 07:36:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbjGSHga (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Jul 2023 03:36:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbjGSHgV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 03:36:21 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2D41FEA
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jul 2023 00:36:19 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51e6113437cso8926832a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jul 2023 00:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689752177; x=1692344177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DbQclnO5/rfDYXUIQCGeTR+bKwq13YyL6Z/DX92Aak=;
        b=MVrDWEr/Mgufbd8XfQwnR4vsEwPQnbIBgKWtAq9uNdxYhZy0dh2IlLyJaB4WVjTyyL
         TR7Shia/RpeyW/4bjYC7A8fEYW7b3UC+iQr7z6fLcuPv3klq4CU4OydfXmVfDbQ/Pdo/
         mdogA5NeOtPChG2mN+bukpmxxKUaENgoECEkVsxpX/CwPdrjpe/R3WXpzWeo45y4+3RM
         KZQ+gUqmA5Ao/hpwrHLfRn8R5XLagdQ5yMrjP2T6l9VNbSucZksZjhigdog/Kce1y5g8
         f71/W/jhQiqeajq6QG1e7JzQprnmOgjnZIhtlOiGBUYhO6sQEB/hXBjTPVrNZcIUBmwY
         wXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689752177; x=1692344177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DbQclnO5/rfDYXUIQCGeTR+bKwq13YyL6Z/DX92Aak=;
        b=EznhqmBo4bLV9+J1sELiOAVYhzeRoLP6yiL7gQexC7pOmty4P89QoFdcB4vlRT4sUT
         SZ0JFX2Ox9Nuxe506ysk1MOgoqTZF5E/V0ylSXusTYU0YDPpAB8HkwH+bBbn8SG4zm37
         mPMuGb8Ab3nMCdwjLTO18kCREqbA77VmhEw5AnZh4MT3FbOV8QWgcxqgyQBjlzGwoj9o
         0yvNUUnlHta59qO3YmOx3+y0tILq+6OBF9gkxFoOYKGdLNOPKKxPZ8Jr1D9F/c7fRR3A
         +Kq8z3sQ3rnYXRjN6Rs8+Jw2qK+58hw3QxI1hCV4b1Brdz2f/ikpk3UrjC0kt9s21On3
         7Wqw==
X-Gm-Message-State: ABy/qLZVgcYT+OsRcrjLirqJSv8hB98jCYJ4jCU4Qc+qjPJF/Rjt9E3y
        wKTn4hrniLhgLvM8cNsR7iqDBQ==
X-Google-Smtp-Source: APBJJlE3IYLxLeZ+oZiMrjzQhsCuQurBTVwa3yKhhUh2cYJPhH59g7l9R6lYn6KTSVEjMzuKrOrulg==
X-Received: by 2002:a05:6402:1817:b0:51c:dd99:a211 with SMTP id g23-20020a056402181700b0051cdd99a211mr1716655edy.27.1689752177612;
        Wed, 19 Jul 2023 00:36:17 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id v5-20020aa7cd45000000b0051e069ebee3sm2310594edw.14.2023.07.19.00.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 00:36:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v6 0/2] support PWM for exynosautov9
Date:   Wed, 19 Jul 2023 09:36:10 +0200
Message-Id: <168975215983.14599.604884288213493709.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230718062200.79306-1-jaewon02.kim@samsung.com>
References: <CGME20230718062723epcas2p4fa1d2b07220c873a4d7de2d1899f1699@epcas2p4.samsung.com> <20230718062200.79306-1-jaewon02.kim@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Tue, 18 Jul 2023 15:21:58 +0900, Jaewon Kim wrote:
> Add pwm nodes to support PWM fan on exynosautov9-sadk board.
> 

Applied, thanks!

[1/2] dt-bindings: pwm: samsung: add exynosautov9 compatible
      https://git.kernel.org/krzk/linux/c/8188b984dea9df7bfa128fc6f8ec0b01edff2d43
[2/2] arm64: dts: exynos: add pwm node for exynosautov9-sadk
      https://git.kernel.org/krzk/linux/c/74641f4a79af8dd3138a7e9a0ec352fdca5d7aba

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
