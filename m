Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DC7C43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 07:08:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237462AbiFGHIO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 03:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237433AbiFGHIN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 03:08:13 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 070781CB09
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 00:08:12 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id kq6so20234914ejb.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2022 00:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mb0/PMTGMQy3Na2869mfuqbTj/3GcTnr3aGmpc78Eck=;
        b=IZLKzweiKBdxrwzjteGorWJ1vA012Sio7Z8Ef6jh+u2MdHogCNRN6r4+2yZxTsmmIc
         Lhh2RpHsbc6WxYNwo+XhhpCGFz3VRrAjOaeDY2boeo26QoPN5HSaFDKQJ6b72OeuZee8
         EOC9e/abLSKaNQrg+2rma0mCxpHFpTl+6HhjVaJ6NcArfginA+g/0mmOh2jthbiRN2NM
         jSnDf12/+B5lMX+waAirzzaefn93gMY4g+ZbT8NWF4JTpIcv1j4t2YxHWOaloHM5Guei
         RfLn/gP1Gm9w6WzjN1EAvPxSYAG6KfEb3bktqK4ELSuOUBy6jK8kBUNAkwC8foBkAtYS
         5HdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mb0/PMTGMQy3Na2869mfuqbTj/3GcTnr3aGmpc78Eck=;
        b=mDEnt1QrfMnN2zT1siuQBqSeGeE2XBtUbSrPEqOB7JowkbC/9hjwQ+P4HQpYv5FNpe
         EhefZodeNIBeByJ+zoeLz9xvdAGdbEo0EzUgsZkz7EjB0nnsOteCMmtFNZaEGfwpGYik
         cSXYKQ2i9rfkKZ/PHuS9MigrCoaplqaOO3tmokxAeJGXgrPogiJ4oD2Il82yCn0cLumY
         xhnYg+dhAE7phCIyjFZZEqPpf/ScXk8wUoFr5ik39TcEh8vR6DWPgbHbwVszvzZlWvxS
         qz8VZyg00yBpqUWorjx1stazayKnndVti38Qg2a8dXl7sTmtyYYG2mSBoD+T+igmJCX/
         STwg==
X-Gm-Message-State: AOAM531w/Ki09nr6zndW7181GmCTtRoxqDr+w7xEl2W3zTut0G9GNYBd
        YN9Rq33qOEw8iPV+OJRew3QXlw==
X-Google-Smtp-Source: ABdhPJy2cG+JIliyyhkdvQCz9LAlzzyTwcyUyJnsGdgfd0dlt3UyTd4BjZFPaNGaNy0W6v/4nheEHQ==
X-Received: by 2002:a17:906:3a92:b0:6fe:9029:b62c with SMTP id y18-20020a1709063a9200b006fe9029b62cmr24860078ejd.569.1654585690576;
        Tue, 07 Jun 2022 00:08:10 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 12-20020a170906058c00b006fed787478asm7104671ejn.92.2022.06.07.00.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 00:08:09 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH RESEND v3 0/2] support secondary ufs for Exynos Auto v9 SoC
Date:   Tue,  7 Jun 2022 09:08:08 +0200
Message-Id: <165458568291.38369.11561110977575494734.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607070251.15795-1-chanho61.park@samsung.com>
References: <CGME20220607070324epcas2p388a932021107d9fff9dc133df0e2b389@epcas2p3.samsung.com> <20220607070251.15795-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 7 Jun 2022 16:02:49 +0900, Chanho Park wrote:
> This is for resending DTS patches of the v2 patchset[1] on top of
> next/dt64 branch.
> 
> [1] https://lore.kernel.org/linux-samsung-soc/20220602053250.62593-1-chanho61.park@samsung.com/
> 
> Changes from v2:
> - Rebase on top of next/dt64 branch after addressing conflicts due to
>   watchdog patches.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: exynosautov9: add secondary ufs devices
      https://git.kernel.org/krzk/linux/c/fddb7928464d05f3d46852a801aa9ec57be5e74f
[2/2] arm64: dts: exynosautov9-sadk: enable secondary ufs devices
      https://git.kernel.org/krzk/linux/c/5c4a99cf5d254e12295de5d9077f6594966679f4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
