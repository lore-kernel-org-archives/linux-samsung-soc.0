Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C984C4708F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 May 2021 15:56:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F9836128A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 May 2021 15:56:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231997AbhEaP6K (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 May 2021 11:58:10 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42788 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233023AbhEaP4B (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 May 2021 11:56:01 -0400
Received: from mail-wm1-f71.google.com ([209.85.128.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lnkF8-0001Fw-GL
        for linux-samsung-soc@vger.kernel.org; Mon, 31 May 2021 15:54:18 +0000
Received: by mail-wm1-f71.google.com with SMTP id n127-20020a1c27850000b02901717a27c785so4848724wmn.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 May 2021 08:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sBsy4F7jKH3SpIbmGFnwxwge6ODZS5L/G/FMfomXAiA=;
        b=h4zsPv6mIzfAmPD//OxEGP4eDAEtmc3/trVoEjvP6eylnWA+0pDOg+jCLcwVWweBDp
         1HtwNa/+MIjFb26CyiiPG6JHAH3k9FO8Jek1f1oF8upCcaaTwbEv3+p7LRFY7Tr/27w4
         tugvG4eIEDWsAUDGZgbKRSpj30Kzk+ffC5T4PAzOLQvTBLkGvucEgbLGaytZYf+ufrMD
         lePWGuTf9G8bh77b6g1r/WyGWf24OCy6zQ+rSFZsUZoJC8SbJzZEvJghLEyYgmXZT/2N
         f2XpoA8KBs26qR7kn6//wUJXbIP1+kWZOL/tkJkAIRLN2x3CYCZps1dz9ckzJRzTO2E8
         t0hw==
X-Gm-Message-State: AOAM531obudtxnbKBdHm1y/wirubI6Zx5bzdKiEFvKoXU6wjV76VKP5V
        7zr2t8h0Muep5i7Pn9KdBe8rUWB79iN42M+zUUxAslDziobtoZILCHT2zHuKAhh4/21+Sc2Mqz7
        JKAt55mWf6mTdKvZ1DX/VlnXI3UUZSmKBMw0kr4aZW3rRua5K
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr22526592wrz.256.1622476458294;
        Mon, 31 May 2021 08:54:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxc5/XqtsAvzunerv9scOT0vi0T+fqQgLaptB/fTaUryshQ2AateJkvN0M3O1eK/oaFSwSLqg==
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr22526580wrz.256.1622476458147;
        Mon, 31 May 2021 08:54:18 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id u18sm15309089wmj.15.2021.05.31.08.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 08:54:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Timon Baetz <timon.baetz@protonmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: exynos: Disable unused camera input for I9100
Date:   Mon, 31 May 2021 17:54:13 +0200
Message-Id: <162247639430.59481.5717460828748837476.b4-ty@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210530105535.4165-1-timon.baetz@protonmail.com>
References: <20210530105535.4165-1-timon.baetz@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 30 May 2021 10:55:44 +0000, Timon Baetz wrote:
> As the back camera is not implemented disable the second pair of fimc
> child nodes as they are not functional. This prevents creating the
> associated /dev/videoX devices.

Applied, thanks!

[1/1] ARM: dts: exynos: Disable unused camera input for I9100
      commit: 135adbbee4c66f89b57519633cbf8c3c35b6c4da

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
