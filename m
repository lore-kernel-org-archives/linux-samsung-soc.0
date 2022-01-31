Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D085C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Jan 2022 14:35:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236924AbiAaOfq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Jan 2022 09:35:46 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47648
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236910AbiAaOfq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Jan 2022 09:35:46 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3F3F63F043
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jan 2022 14:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643639739;
        bh=mN1fqbFpMzpoEmtDuIC6Dm/iTWIjedREVpcgBANl36k=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=v34Oew5qCDIwwmEhPjtMinFxId7UG7xobhvEKyqWKyxjGjeQZnh7Jgaes+YLIJS18
         It5D9yX/+mxuOHC/KlGKiN6SGIyO1CCA5TLbhoXfs55NlvLHWdqZR7JhhjqWjdBSV7
         XEE2Egb8ZkoZySepjye3gZE/bgGSpU8vUe86l3EVDMGH/St3PPZvxlqhLSshzLKJ36
         EpJFHy7BmAWdg9aqcabyITZX2T5USHsCmrWBPrUkQ8Vm89cfP685d27KXj21lNZibl
         hxsf35B2TAhGMcz7KdIHvbHuPifE/dUa4LyR7zqOndCGEoZChg99w69UaZE1JlO2Py
         RWCI6XJAr4lDQ==
Received: by mail-ed1-f72.google.com with SMTP id o5-20020a50c905000000b00403bbdcef64so6568319edh.14
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jan 2022 06:35:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mN1fqbFpMzpoEmtDuIC6Dm/iTWIjedREVpcgBANl36k=;
        b=RFwfA3wE4pOucD3LzI37lj6L+ci4PQKcqzJm8Qm4c25sejWc6df/FVJdfLVD3+ua6x
         HnqnHUBWQ9zvCs2AllIAeYBW750HzoAXtCrjF2bAfvTwIkq1/H+7dCEyfcOUkSLpIkpl
         Navwkr08NTgBRXj/PKi0FTfMJX2YN9jUi4TuLDplg4ugMMTepsFQtms5cXh4RF2k9sbs
         mp2cS9b56HmfYqskKOSXurP6XRJ0eypmSlPLWD5QDerKFyh+2whUIDhlMJS8WfM33Fg5
         8f0JyT7L0Njm8sO6MAPk683zRhCc6UOKYaJ0NYxG4PhupzIyhShS5mt3OUqKHRGKvkFU
         Of4Q==
X-Gm-Message-State: AOAM531HsjJqXMoXZZ0IM0vbXq2wHAQTpURjlX32kc7JFUFE9Ow/kUQL
        OwO+D7T6iXTxNbBna372jDSoyWxJilveVFoQ7KOyCuWGuMTFfeNJpBm72Wy9rbLYDhxbr/aYVny
        m0szuaWU8XqDHJtYKq0EMzArBpyl0Y5bbfFjqdVG6QmCLXv++
X-Received: by 2002:a17:907:3da1:: with SMTP id he33mr16949203ejc.603.1643639738964;
        Mon, 31 Jan 2022 06:35:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4GNJxyhqwfB03F6E6tsE1hPORTToge8FEFloC2ibh4V7CNNEKMKGR1HGsnKFgfIpvlFrbiw==
X-Received: by 2002:a17:907:3da1:: with SMTP id he33mr16949190ejc.603.1643639738818;
        Mon, 31 Jan 2022 06:35:38 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m16sm9971298eji.110.2022.01.31.06.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 06:35:37 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        David Virag <virag.david003@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Youngmin Nam <youngmin.nam@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v6 0/2] arm64: dts: exynos: Add E850-96 board support
Date:   Mon, 31 Jan 2022 15:35:00 +0100
Message-Id: <164363969164.158734.10738186621268035629.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220131130849.2667-1-semen.protsenko@linaro.org>
References: <20220131130849.2667-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 31 Jan 2022 15:08:47 +0200, Sam Protsenko wrote:
> WinLink's E850-96 is a dev board based on Exynos850 SoC [1]. The board's
> design follows 96boards specifications, hence it's compatible with
> 96boards mezzanines [2].
> 
> This patch series adds the initial support for E850-96 board and
> Exynos850 SoC. Only basic platform components are enabled at the moment
> (like serial, I2C, eMMC, RTC, WDT, clock driver, etc). Right now with
> this patch series it's possible to run the kernel with BusyBox rootfs as
> a RAM disk. More features are coming soon.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: exynos: Add initial Exynos850 SoC support
      commit: bfb3c7fa3950f2dece0bfec1df5fbce7117345af
[2/2] arm64: dts: exynos: Add initial E850-96 board support
      commit: 363e52998c839ce77d7d5dd6f3e575bb68449afd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
