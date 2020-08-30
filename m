Return-Path: <SRS0=9Nct=CI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDEBC433E2
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 30 Aug 2020 13:54:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C711D20757
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 30 Aug 2020 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598795642;
	bh=n6ISBKgyXGjN5UhUaUmHsRkq7VLueawe87DSKZRjw5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=T4Z+WNfcy4x9fkBEFkh5fYF6sRb1GZis/mPTg5vLgAARsVujW48vK3o+0Nwfzd99i
	 w8jkKX8qEqol8X4wCPfEBQr+0RNXxVPqpM8NglGOPpdnILho0158ybNtMLj8qQp2bw
	 x0pTsP88qkxLF473bLaf43CIrEgTColYAaoT3Xjk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgH3NyB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 30 Aug 2020 09:54:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:54742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728780AbgH3NyA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 30 Aug 2020 09:54:00 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D580620757;
        Sun, 30 Aug 2020 13:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598795640;
        bh=n6ISBKgyXGjN5UhUaUmHsRkq7VLueawe87DSKZRjw5I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2IM1dodOxeoK3mlXjngrFkSGEQsFR40NGYcQ/P0VKyocwfPA/rMhzQCSo2PziXwp2
         EdChq4sypvse9ikVZCbBWHDENZEYmvB7HB+72LTx7SoING5lghJCFpVkd/r921UHkk
         pQ3tI26y5TU+QuCyPSYVHPpuLEjvQFSLQ635V/iM=
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
Subject: [PATCH 02/33] ARM: dts: exynos: Correct GPU regulator properties in Galaxy I9100
Date:   Sun, 30 Aug 2020 15:51:29 +0200
Message-Id: <20200830135200.24304-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200830135200.24304-1-krzk@kernel.org>
References: <20200830135200.24304-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The regulator property 'regulator-microvolt-offset' should be put next
to regulator definition, not consumer.

The property 'regulator-microsecs-delay' is not valid at all.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4210-i9100.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-i9100.dts b/arch/arm/boot/dts/exynos4210-i9100.dts
index 3eb11cc2c3c5..6fa57d1fa1d7 100644
--- a/arch/arm/boot/dts/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/exynos4210-i9100.dts
@@ -304,8 +304,6 @@
 	status = "okay";
 
 	mali-supply = <&vg3d_breg>;
-	regulator-microvolt-offset = <50000>;
-	regulator-microsecs-delay = <50>;
 };
 
 &hsotg {
@@ -524,6 +522,7 @@
 				regulator-name = "G3D_1.1V";
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1200000>;
+				regulator-microvolt-offset = <50000>;
 				regulator-always-on;
 			};
 
-- 
2.17.1

