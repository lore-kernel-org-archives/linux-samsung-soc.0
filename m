Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F701C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 Jan 2022 20:19:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350820AbiAKUTR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 Jan 2022 15:19:17 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:38568
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346599AbiAKUSf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 15:18:35 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5383E40051
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 20:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641932314;
        bh=JHHUBFr6OMR8zM8/i6cAvf5NoFmGRGJHrNiT4tfy3rM=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=QYJrHOKKSlB3cbXm8e5jcJ3GBAYGUW/pUId7h6rBwulI8uH80CQkkqYJMzUPN/cSu
         NWBetcJl0WlsIJFwiEbmkW6/IpxfflQPUiLQpAhY1Zkg9BHFE24eFrXSz1gvTUguEF
         K2Z3FZ8v/wmgf1DSH5lvG7aLr8AxemABlxRyDcmQpAXJgpCtvLJSBjuHnlABT53zs7
         UZELhrBNhWw2Uc5Knp4ukn3heqVR5qvgZQBIV/tUhiOkZYpNtmQnocUlv2iVZSqs1d
         MWA6qxAjgMiflLOYnrAiKDNphNvpI5zX0RKZqHRc7yLTX4xybz3Ye/DnjVjCcITMWd
         pnDD1MbRTsijw==
Received: by mail-ed1-f72.google.com with SMTP id t1-20020a056402524100b003f8500f6e35so200004edd.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 12:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JHHUBFr6OMR8zM8/i6cAvf5NoFmGRGJHrNiT4tfy3rM=;
        b=3OWHsOyEiiH+mooEzpi6T1S8kZfMJp2KY4Vb/MoSzgEJ/NF3WwAEhB6mc4je2woYKv
         9biwAxTrndtguk+fvGAJ/pcEZAKIJWZnszUF8/C1R6qZ8uSTPsQvzl17p3yWSEXPQbwb
         SwLepuNihpxSJGEse6leWF/iZoLV+jnf5xrD7AbOh7EbNqIelL87GXwHbMJSmKqr8eRP
         8B64S+U6B6ts49DwLboQ+o6Gr7PsIfbd2iZ7DGglKtPByh0L+00MFQYMfVt3vBDBP/Qg
         GgBShhERn3jntXyUDC1wjTD9ZZq/4fpUeggDJTHwq4g09hQu+GMtPCp+w2pFUnsG6fMZ
         q04w==
X-Gm-Message-State: AOAM531iqENX1CwyqNFTHpoKRixE+XF9DzMTTRLXgPxutbFQEJb4Zxkb
        K3PXuyGdj6OkVJ5IubwfuoiNb8z1Rmid0i3kPfz0G9uAE29uilzgybjIp/9BtzppCi7faeYyB/X
        dpLmo6dPgaPiKGp87esEZMNPUPE9YBLV3x+GNTFk6w3CxbYhq
X-Received: by 2002:a17:907:9712:: with SMTP id jg18mr5265431ejc.328.1641932310995;
        Tue, 11 Jan 2022 12:18:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxy9/rcIjTsKZFScympQBOQBEOBe9i4BBbC40lJsXnfYnnYR9RgCbIQ5WcOvNKS259ya4jL8g==
X-Received: by 2002:a17:907:9712:: with SMTP id jg18mr5265420ejc.328.1641932310844;
        Tue, 11 Jan 2022 12:18:30 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e4sm4030881ejs.13.2022.01.11.12.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:18:30 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>
Subject: [PATCH v2 27/28] arm64: dts: exynos: use dedicated wake-up pinctrl compatible in Exynos850
Date:   Tue, 11 Jan 2022 21:17:21 +0100
Message-Id: <20220111201722.327219-21-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Older Samsung Exynos SoC pin controller nodes (Exynos3250, Exynos4,
Exynos5, Exynos5433) with external wake-up interrupts, expected to have
one interrupt for multiplexing these wake-up interrupts.  Also they
expected to have exactly one pin controller capable of external wake-up
interrupts.

It seems however that newer ARMv8 Exynos SoC like Exynos850 and
ExynosAutov9 have differences:
1. No multiplexed external wake-up interrupt, only direct,
2. More than one pin controller capable of external wake-up interrupts.

Use dedicated Exynos850 compatible for its external wake-up interrupts
controller to indicate the differences.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 4f0a40de5e67..bcae772e8d91 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -346,7 +346,7 @@ pinctrl_alive: pinctrl@11850000 {
 			reg = <0x11850000 0x1000>;
 
 			wakeup-interrupt-controller {
-				compatible = "samsung,exynos7-wakeup-eint";
+				compatible = "samsung,exynos850-wakeup-eint";
 			};
 		};
 
@@ -355,7 +355,7 @@ pinctrl_cmgp: pinctrl@11c30000 {
 			reg = <0x11c30000 0x1000>;
 
 			wakeup-interrupt-controller {
-				compatible = "samsung,exynos7-wakeup-eint";
+				compatible = "samsung,exynos850-wakeup-eint";
 			};
 		};
 
-- 
2.32.0

