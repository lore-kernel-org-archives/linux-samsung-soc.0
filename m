Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C806C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 23 Jan 2022 19:15:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234863AbiAWTPV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 23 Jan 2022 14:15:21 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:44704
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229533AbiAWTPV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 14:15:21 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EE3F33F4B6
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 19:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642965319;
        bh=kttBDEdyIUQqupR/U1rqVQBMHSd3WLkJ4zI9eGg9wQQ=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=YO0xAS1j9zOoLmb6YoDfrPLh2cTRb4hmsAP4bYooJHOLgKLKhq41gcg2pZ1KkflNl
         Otrd4EeE9BVwZeSnH9Ln5QtcXgtmekCHe5ddxRg7zgqj7lgRQTxsV+VNcEB6Y3DwGQ
         D/rCHDl1no6RUW6mg9G/1bmQMOuE4XAl0ODsNNtK6D2rzaPtSf1PgG9oCnf8D8a/dB
         1t2BuSuGKpl3ew78JjZz8Il99NmXHolHGlCQnutIdIrP8h48WNPskMx5iqUdB9lBvL
         k0Gs5EsIAsl4ajJ3uiqTUBiXmKaGrr95G7B4vwmgSFasI7DIdWmAcg45NUbgCyHLhb
         FINMYXwCGL+jg==
Received: by mail-ed1-f69.google.com with SMTP id h11-20020a05640250cb00b003fa024f87c2so11722353edb.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 11:15:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kttBDEdyIUQqupR/U1rqVQBMHSd3WLkJ4zI9eGg9wQQ=;
        b=vCxhoZdEjRj77z+nIwietLu8veljp0yBm7zxQaHPgcln4Lzgitr3kPXsOaagiarqzb
         JZsRpdwU4/4eVLq/jRqf8NJWioNCG4BnhLEQlC2MtTboLpB2KykytcqR1EqysnwOwobn
         o5lW1V2SUKRgPN3umc+vxocfiGUn9o5cc02o7Rzz/+kJr5APPXvWhhvlJeF3OSFMoYFP
         NhZUbJESk9M+E1PrucF7gtYFh1u78D3r5QA5iP630ca0g9Y/mtnBnFEdb2UGdrvzdOKL
         jkEwfSCFNuU2wCp3CesuB37YYnCNHIWuUnvFB9JWC2kzsj+5aMgWxtm5w+oKJzULs5eC
         pk3g==
X-Gm-Message-State: AOAM531dR0mlEbZ8FrpfT3WPTAKIwV9zkoXwE2mDeFd0yC2FYbm3dQnQ
        0TfwcbcQ3MXZSwXhX3Yp2sMIc4FZuE84ME+e9FDjtsgxiySA2iBkaU3Fajkju/clLZ7ZzW5sypz
        ta699oHNAMAfp9qMZemGINLeeOSv2vwsnL7VTIavM2H7Z0dtf
X-Received: by 2002:a17:907:3e23:: with SMTP id hp35mr10799026ejc.760.1642965319177;
        Sun, 23 Jan 2022 11:15:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrMCE5tnqRZTbX68vFuTajb/35wJ5WKt4eGBj0OadG/VHHPHLxoIH7afhLw/1dm8/A/bhcVg==
X-Received: by 2002:a17:907:3e23:: with SMTP id hp35mr10799006ejc.760.1642965318935;
        Sun, 23 Jan 2022 11:15:18 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id oz18sm4063910ejb.106.2022.01.23.11.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 11:15:18 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     semen.protsenko@linaro.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Henrik Grimler <henrik@grimler.se>, cw00.choi@samsung.com,
        linux-kernel@vger.kernel.org, virag.david003@gmail.com,
        ~postmarketos/upstreaming@lists.sr.ht, robh+dt@kernel.org,
        m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org,
        martin.juecker@gmail.com, alim.akhtar@samsung.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 0/3] Add initial support for exynos5420-chagall-wifi
Date:   Sun, 23 Jan 2022 20:15:16 +0100
Message-Id: <164296530944.41526.610812018359584856.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220118185746.299832-1-henrik@grimler.se>
References: <20220118185746.299832-1-henrik@grimler.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 18 Jan 2022 19:57:43 +0100, Henrik Grimler wrote:
> Samsung's tablet Galaxy Tab S 10.5" (wifi) has codename Chagall WiFi
> and is one of several tablets released in 2014 based on Exynos 5420.
> This initial devicetree adds support for accessing device over USB or
> UART, and allows using a rootfs in either the internal eMMC or an
> external sdcard.  4 out of 8 CPUs are brought up when device boots,
> which is the same as on the somewhat similar board
> exynos5420-arndale-octa.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: samsung: document Chagall WiFi board binding
      commit: 9998104515d4197d774e5384df750c6384915707
[2/3] ARM: exynos: only do SMC_CMD_CPU1BOOT call on Exynos4
      commit: 534aaa1802eae339d0439feafe3c1217f5643b20
[3/3] ARM: dts: Add support for Samsung Chagall WiFi
      commit: 535f7fffed880312830c72d9c593b59ec741dd8e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
