Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1712BC7EE2D
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 26 Feb 2023 03:46:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbjBZDqd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 25 Feb 2023 22:46:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbjBZDqL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 25 Feb 2023 22:46:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A1CC14EA5;
        Sat, 25 Feb 2023 19:45:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C509A60BDE;
        Sun, 26 Feb 2023 03:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F1FC4339C;
        Sun, 26 Feb 2023 03:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677383052;
        bh=e7Wi9xAhBC9rRNX2BkeGXxNt0F5/IqirjVvf2P0AfnM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HrjFVf/MVr9HeDtH/oZDhXcO6e2LrwBpxwdfg+5JOUo5QlDW3gt9O9S8VVE/uFOyt
         iRcKD6szu2fP870ZrJmvt5kA3vOa5KEiqM1GGuOCnsrAHWedCNJRygefx19m2+Husx
         eqlScdOTmnmX+ogCLOK/ldE68pyL5izMPD9j7jwszbDovBfLOuxw6kHQZdkIC9gwL3
         7Z1vD8UW+zhILo/BOmSD2QXqX5RRtOXGNatLSHRucm5671RE85F5JSxIw90Rclp84Y
         xuOMr/v3Bw187alqINviRNzrnOwYhy914herfaL72ZDyZQM4DaTIw+DWi+hACvN7fh
         73itxy5R6cA2A==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Markuss Broks <markuss.broks@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sasha Levin <sashal@kernel.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 2/5] ARM: dts: exynos: Use Exynos5420 compatible for the MIPI video phy
Date:   Sat, 25 Feb 2023 22:44:05 -0500
Message-Id: <20230226034408.774670-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230226034408.774670-1-sashal@kernel.org>
References: <20230226034408.774670-1-sashal@kernel.org>
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
index 83580f076a587..34886535f8477 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -605,7 +605,7 @@ dp_phy: dp-video-phy {
 		};
 
 		mipi_phy: mipi-video-phy {
-			compatible = "samsung,s5pv210-mipi-video-phy";
+			compatible = "samsung,exynos5420-mipi-video-phy";
 			syscon = <&pmu_system_controller>;
 			#phy-cells = <1>;
 		};
-- 
2.39.0

