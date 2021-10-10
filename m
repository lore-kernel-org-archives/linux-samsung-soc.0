Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A68C43217
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 10 Oct 2021 17:17:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74A7C61105
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 10 Oct 2021 17:17:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232469AbhJJRTd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 10 Oct 2021 13:19:33 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33688
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232455AbhJJRTb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 10 Oct 2021 13:19:31 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 77E9C3FFEE
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Oct 2021 17:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633886249;
        bh=Phy4YUGiXXNnIfej/qm+UgEqsE13FrbaWnOMgVpEl7A=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=lbH/cU/GKbceiD+tuKQ+HhSGmfdSB8szKutVcmN8cyEdta1jG6tyIVqEtb3dVXEEl
         Qs74ONDv5cpsOgLEl3G2Fs95GUnKq3xvhJl508oijCvFiYYO2hbcVnhP8adG6g5z+/
         Uca71+bK4ALJgermbpX6tOszhLNNV/bSUUP0hvgk111o7x6Pwk934FBUGCpHKiOK+z
         hTdrC3DTjz0lw+tDcBifrXLYOGEfcrlttY+Y+1Kqaneio8IFyPueclHg2L4sjOF0Bg
         Pu+G5ViyxUaAvE1Qeu8K2T74s3KETo3ZeEoMkeb14Bfy6ljqU5qKXz8z58fV2U2iHs
         BXAZk+erh2qZQ==
Received: by mail-ed1-f70.google.com with SMTP id r11-20020aa7cfcb000000b003d4fbd652b9so11641725edy.14
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Oct 2021 10:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Phy4YUGiXXNnIfej/qm+UgEqsE13FrbaWnOMgVpEl7A=;
        b=lDZkiWDPqiOTEUc//LPhxBNtjX38MMnS0aDd3D+epmhvg6nhMR/j9egWBDqfBeXXVJ
         7YSUyEEk6jLv2kDtVv2g69tfW2D3htoK78QC2EyOcl0ENdh7Y9P8IqKiNYLWb2TcOq41
         GR3bdt5fyD6Ry8fZG3PhVZw1baltadYEQNdgkgNA2Vg8/ogWcmthD5RIMtb+yrkdfLRY
         HipdA9DxuTVazdHhHrJWIg/Hrxxz6x55Qinj2xUIsbhr7eouHO7i2dUH99I8LjuRusG+
         6k7+LDsx8HjwiLucffrFicV4BNnEbSeuyJvDBQpyfBVHpDordiMzvZBn1KGafdKKQJ8v
         v3mg==
X-Gm-Message-State: AOAM530lwqMa0JB6fvPALTtkoGWl+othx3M42EUZx5jBTkCg1D0Bf6EP
        U0C5510vTHSklQQ9gtilA0Ne2Ucyk00YJE6AW0TqoKTnHiGY4x5VJdo+JrLmWrDphqlJ/bewY9P
        KFsru5Edt69TU6QyCZLksbnlsHjALjMB+ynXa+ATMuJdvg5hn
X-Received: by 2002:a17:906:f747:: with SMTP id jp7mr18605045ejb.530.1633886249236;
        Sun, 10 Oct 2021 10:17:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZfk0fBPB7lQu0MT/UScLbQskwZaO9LGJV6qJrztarBeWMopspd1QHjPDf7HNih9VZ3QnilA==
X-Received: by 2002:a17:906:f747:: with SMTP id jp7mr18605027ejb.530.1633886249067;
        Sun, 10 Oct 2021 10:17:29 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p6sm2792009edi.18.2021.10.10.10.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 10:17:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: (subset) [PATCH v3 2/3] arm64: dts: exynos: add initial support for exynosautov9 SoC
Date:   Sun, 10 Oct 2021 19:17:25 +0200
Message-Id: <163388622664.8712.13686604427243111750.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211010032246.146939-3-chanho61.park@samsung.com>
References: <20211010032246.146939-1-chanho61.park@samsung.com> <CGME20211010032456epcas2p29de8e098493cbe21a08db86d8253787e@epcas2p2.samsung.com> <20211010032246.146939-3-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 10 Oct 2021 12:22:45 +0900, Chanho Park wrote:
> Add minimal support for ExynosAuto v9 SoC[1].
> 
> - Enumarate all pinctrl nodes
> - UART with exynos850 compatible
> - UFS0 HCI + Phy
> 
> Like exynos850, this also uses fixed-rate clock nodes until clock driver
> has been supported. The clock nodes are initialized on bootloader stage
> thus we don't need to control them so far.
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: exynos: add initial support for exynosautov9 SoC
      commit: f695b3f4c45d0051416fa7315cf553bec70198d8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
