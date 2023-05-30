Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6D6C77B73
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 30 May 2023 08:22:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbjE3IWv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 30 May 2023 04:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjE3IWr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 May 2023 04:22:47 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E773EA
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 May 2023 01:22:46 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-96fe88cd2fcso746719566b.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 May 2023 01:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685434965; x=1688026965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/06GITGnCR0InunQ97FoRRag82uonE7bPllWWYnN1M=;
        b=U1TazgPBw5tN1EoHoX2aYS+f7yuRJQmgbSX8Faf0Bl+3Aen9PgAwjj/0rmvY9/jx/V
         wxUIl2QoR9bQBNWCOFoGRZvur5o8ChrHMf5YTCBx7BSdQyb7i0mCLSc6Hvu1ROVnMOmR
         qVL+77W7bRowiTu0GS4l1gbrykcmPub1l5cyvgiwp9qlcZkVHMv2glUWHW3XveLtjIbM
         RzxBtF+OaPNpCMPPq8+YGn2mdyLtvUriEkuiTO9c+PqnSpUy80yLpaEWwgUBYIh2mEMA
         m4Bfen7IRj2WfC0fXuHiXESe875Pr9nt/Neqkv41FZRzwKmqOGNKNFZKnTyBMO1nZe9J
         lgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685434965; x=1688026965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/06GITGnCR0InunQ97FoRRag82uonE7bPllWWYnN1M=;
        b=IlTeEh+uoukj2VDhUcdDjYTLHVuQeahTVajtqyMZblQ4bUloBmLXv4t6Y37r4cWcgp
         O8FwLq8swkAYBb1QSxkkMAccVQoF91zwIahUlMRN5FyR39nOoaValvKzppy8PBuNZjJH
         jbQ1T2RTPsbB6tfyFV85DyGKkimd7XPn8Bc1X005clU0kYcQAXRGeNfHwaMOCCdvFjp6
         CZdA7NfUjswGVfOUvF5HMvXIxRr/Q8Q8cZd0vamj367vtpmpHmohpRDO4izVvXr1sRqW
         Yg6VpNmCC1lB9W1q3tESNr1tbShms9eR3fobSiqsOlaqANue+7T38y5SaYkFuAl3gaeO
         felQ==
X-Gm-Message-State: AC+VfDzyNo3/pYw2U8M3hZJ7Jz4Bwj5XNkIFnUx3gIXYmMV/OCkRknmP
        atzi7jNL4nKIAwTDu6WC/Rgm/w==
X-Google-Smtp-Source: ACHHUZ75GDAqupUSVPJ5Aas4ogi42LerslQkAQXJPqBERjGGYbWLC0fwnXvjKlihSB0tFyOdHnUbNQ==
X-Received: by 2002:a17:907:3da0:b0:974:1e0e:9bd3 with SMTP id he32-20020a1709073da000b009741e0e9bd3mr1622046ejc.23.1685434964999;
        Tue, 30 May 2023 01:22:44 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id cf6-20020a170906b2c600b0096f272206b3sm6949583ejb.125.2023.05.30.01.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 01:22:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Artur Weber <aweber.kernel@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 0/3] ARM: dts: samsung: Fix some typos in comments
Date:   Tue, 30 May 2023 10:22:36 +0200
Message-Id: <168543493680.14409.2040056469867223710.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519190625.7844-1-aweber.kernel@gmail.com>
References: <20230519190625.7844-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Fri, 19 May 2023 21:06:22 +0200, Artur Weber wrote:
> Change 'specfic' to 'specific', 'optiosn' to 'options' and remove
> duplicated 'are listed' in DTSI heading comments. While we're at it,
> fix the s5pv210-pinctrl.dtsi header (seems like it was copied out of
> the main DTSI file and never changed to match the new contents).
> 
> This patch has been split off from a patch in a separate series:
> "[PATCH v3 11/13] ARM: dts: exynos: Fix some typos in comments"
> https://lore.kernel.org/all/20230501195525.6268-12-aweber.kernel@gmail.com/
> It has been split into 3 separate commits: one for Exynos chips,
> one for s3c64xx and one for s5pv210.
> 
> [...]

Applied, thanks!

[1/3] ARM: dts: exynos: Fix some typos in comments
      https://git.kernel.org/krzk/linux/c/2f6905307a7bb998e819c03097f3cc54a51b015a
[2/3] ARM: dts: s3c64xx: Fix some typos in comments
      https://git.kernel.org/krzk/linux/c/316c31fba6eda4543d5e234b13d0c0605a83a643
[3/3] ARM: dts: s5pv210: Fix typo in comments, fix pinctrl header
      https://git.kernel.org/krzk/linux/c/6a988251c4e53da33107c1975f578904c0635b43

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
