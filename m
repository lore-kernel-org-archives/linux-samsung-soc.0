Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45450C7EE30
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 26 Feb 2023 03:42:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjBZDmN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 25 Feb 2023 22:42:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjBZDmJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 25 Feb 2023 22:42:09 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A2614EA5;
        Sat, 25 Feb 2023 19:42:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 56AC4B80B7F;
        Sun, 26 Feb 2023 03:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E524C433A4;
        Sun, 26 Feb 2023 03:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677382922;
        bh=Swp9cal23T3bRtttDRGQ8Yv4EpqIDlMRm6uqrJbkTY4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ifbdSRsi9cvrn/daynrra6hk+vUAgki3709cE6FZguzM5yEsomA3oEVmyqWKnyxZX
         gcNTK3gakJ/ZXLw725DZYxyi0VgnwwG7myVq2rW+6a2XtirQWxkcC/Wc33T65Z+VV6
         CraYUtbqOytuHQb/ZjXfbsmc3uSt6MDkjSn0PUbTKDsEUm5/uRB8keb7x0jFGOKFnv
         jlOYi4h0JICUZw5VeFjhHP6b97YXMEX+/gO1QsyApENK1Ru/I7o1olyoI/mKyN1Cf4
         5Uu8xaOslvofuMdLBduTK3ariK6BIYnKyOJFwm9cZSvIUl0czJinWKfx13uHf4eBlg
         zFjtIo1CK06FQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Markuss Broks <markuss.broks@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sasha Levin <sashal@kernel.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 06/21] ARM: dts: exynos: Use Exynos5420 compatible for the MIPI video phy
Date:   Sat, 25 Feb 2023 22:41:35 -0500
Message-Id: <20230226034150.771411-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230226034150.771411-1-sashal@kernel.org>
References: <20230226034150.771411-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Markuss Broks <markuss.broks@gmail.com>

[ Upstream commit 5d5aa219a790d61cad2c38e1aa32058f16ad2f0b ]

For some reason, the driver adding support for Exynos5420 MIPI phy
back in 2016 wasn't used on Exynos5420, which caused a kernel panic.
Add the proper compatible for it.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
Link: https://lore.kernel.org/r/20230121201844.46872-2-markuss.broks@gmail.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/exynos5420.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 9f2523a873d9d..62263eb91b3cc 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -592,7 +592,7 @@ dp_phy: dp-video-phy {
 		};
 
 		mipi_phy: mipi-video-phy {
-			compatible = "samsung,s5pv210-mipi-video-phy";
+			compatible = "samsung,exynos5420-mipi-video-phy";
 			syscon = <&pmu_system_controller>;
 			#phy-cells = <1>;
 		};
-- 
2.39.0

