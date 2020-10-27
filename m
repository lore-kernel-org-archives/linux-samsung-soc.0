Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3BCC55179
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:10:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8313D22258
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603818645;
	bh=ZL6dS0ZIL5MIus3mLIuBj007hhplP2qwa/EX69zIdAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=WPIVrwsFZ5l86LSxUZNF7pZGOzqZtcx5OiDdYMtvoeZlCJQWOpBmcbnvSzdq40CuK
	 JG2CDua5YDudGAjAkDS4ahIMZrRIsrAlaRvbTFffeV13tYqoTt0QTeD3Xp9sK/cOdn
	 fW+7rkOL7ACstbiKBBQhzOcJUNW2b1K7NCCMpG9U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1816930AbgJ0RKf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 27 Oct 2020 13:10:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:38802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1809591AbgJ0RKd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:10:33 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 27C8621D24;
        Tue, 27 Oct 2020 17:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603818633;
        bh=ZL6dS0ZIL5MIus3mLIuBj007hhplP2qwa/EX69zIdAg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jm9MLqdnprMEmlnAsYdxPbK0HC9S6Q/f6Qqr+Nm4fpfrLhYf4hrP1jRN+PMcIWc3R
         3bE9/9dcvx7G+4/j80FeAOPSBOWXcYsJ7QQuvHSnveRoZwzAEkNsBnrI+fs9dmS30O
         FccNM1/yzEdeXcCuxVm5r2JI5i3xqJg4ypdRTUMY=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2 12/12] arm64: dts: exynos: remove redundant status=okay in Exynos5433 TM2
Date:   Tue, 27 Oct 2020 18:09:47 +0100
Message-Id: <20201027170947.132725-13-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027170947.132725-1-krzk@kernel.org>
References: <20201027170947.132725-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

New nodes are enabled by default, so status=okay is not needed for them.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Not actually tested on the HW, just checked the output DTB.
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 01ab886fd3e9..97a2f0c7c0cf 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -92,7 +92,6 @@ i2c_max98504: i2c-gpio-0 {
 		i2c-gpio,delay-us = <2>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		status = "okay";
 
 		max98504: amplifier@31 {
 			compatible = "maxim,max98504";
-- 
2.25.1

