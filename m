Return-Path: <SRS0=9Nct=CI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C0CC433E6
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 30 Aug 2020 14:10:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A24952078D
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 30 Aug 2020 14:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598796600;
	bh=NOBhlq6ryk8xSFNoYiENoIebYUcdXst8K3M7id276H4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=TKzMxYdu4RJ0raembY8prIqopvbZqglRamqaW2cDuspGDsKupvaMlvtIi2zJXx3oN
	 fvf4bBiTYieb6ylfZzNMt7xy2SOqeiddg4nr8OyTm0k11SVV/vbbE/VxOPlbk8t1FR
	 oXqz0YTg09h6j87mTdWXew0o+41NuTWbPZkEASd4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgH3OJl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 30 Aug 2020 10:09:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:55338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728903AbgH3Nyh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 30 Aug 2020 09:54:37 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA45B2087D;
        Sun, 30 Aug 2020 13:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598795677;
        bh=NOBhlq6ryk8xSFNoYiENoIebYUcdXst8K3M7id276H4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XZSUcDJtpyt5TRXcxkB8OxyRn+jBeocmi6PqHxDJ43cD+UBwJ60KbaszpeIQyhgpo
         A6FrimnR5G6EOljn7JKq45IbjCoNhzGlbxFbsFZ4FPzVrQ2rM2HV+nJ4LjYiYS2W/p
         EjjRrlu4ltU3IThMvt+iGBg37Tdf24BBC+r6PFS4=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Denis GNUtoo Carikli" <GNUtoo@cyberdimension.org>,
        Simon Shields <simon@lineageos.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [RFT 14/33] ARM: dts: exynos: Replace deprecated GPIO spi-gpio properties in Universal C210
Date:   Sun, 30 Aug 2020 15:51:41 +0200
Message-Id: <20200830135200.24304-14-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200830135200.24304-1-krzk@kernel.org>
References: <20200830135200.24304-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

"gpio-sck" and "gpio-mosi" are deprecated so update the DTS to fix
dtbs_checks warnings like:

  arch/arm/boot/dts/exynos4210-universal_c210.dt.yaml: spi-lcd:
    gpio-sck: False schema does not allow [[85, 1, 0]]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 3509fdf8f245..279f0f8f86ed 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -124,8 +124,8 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		gpio-sck = <&gpy3 1 GPIO_ACTIVE_HIGH>;
-		gpio-mosi = <&gpy3 3 GPIO_ACTIVE_HIGH>;
+		sck-gpios = <&gpy3 1 GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpy3 3 GPIO_ACTIVE_HIGH>;
 		num-chipselects = <1>;
 		cs-gpios = <&gpy4 3 GPIO_ACTIVE_LOW>;
 
-- 
2.17.1

