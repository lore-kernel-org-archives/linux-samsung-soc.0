Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C4EC4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:16:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB55E2224E
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603736175;
	bh=KApyVe39+tX3pYLnAPgNjOWbYuqQ5EG8GIfyKGGv2YQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ugCFG14nuZG2NQFAY9xd5yYknLDMiHC2dMZucx6dA2AVTsYCWXkl31ntEmxt9AAZ3
	 xL2eOOGYmNEup1H1QfnROJeDSezhg9eeDXAhaGGofv95OLkt5G3mYeiyEWP4SDmRdt
	 tOql58a4E4qgNoFpc+nizffjGBd1aF2GFOWYMoOA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1789422AbgJZSQO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 14:16:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:59830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1789441AbgJZSQN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 14:16:13 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7C7782224E;
        Mon, 26 Oct 2020 18:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603736173;
        bh=KApyVe39+tX3pYLnAPgNjOWbYuqQ5EG8GIfyKGGv2YQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k8aYr6neRIghVzvMhJUHYP5XNqKtYtiyNMvPdbFAyx4j3NC9PCl7vm8Lyp/HWHja7
         G2qm3xlTHjWI+7WD9BRwlC0ZZn4RYA4WQ4JEsnKhO9wBOaimkhmR3P6/fsd7ejtKq3
         ZEp0I+BdH1mIGQGmjvxZiax2P6YrngQp1ULxUhsw=
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
Subject: [PATCH 11/12] arm64: dts: exynos: adjust node names to DT spec in Exynos7 Espresso
Date:   Mon, 26 Oct 2020 19:15:27 +0100
Message-Id: <20201026181528.163143-12-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026181528.163143-1-krzk@kernel.org>
References: <20201026181528.163143-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Devicetree specification expects device node names to have a generic
name, representing the class of a device.  Also the convention for node
names is to use hyphens, not underscores.

No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index 92fecc539c6c..695d4c140646 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -87,7 +87,7 @@ &hsi2c_4 {
 	samsung,i2c-max-bus-freq = <200000>;
 	status = "okay";
 
-	s2mps15_pmic@66 {
+	pmic@66 {
 		compatible = "samsung,s2mps15-pmic";
 		reg = <0x66>;
 		interrupts = <2 IRQ_TYPE_NONE>;
-- 
2.25.1

