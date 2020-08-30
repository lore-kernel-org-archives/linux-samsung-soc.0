Return-Path: <SRS0=9Nct=CI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECF6C433E2
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 30 Aug 2020 14:02:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F01D3206FA
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 30 Aug 2020 14:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598796178;
	bh=3FhkzB8eUbDw5OZXgkgtTSdvcFxjQ0d9pdGTQZ8lJHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Kdy9uvhW/p7+ery5JPYJRpZ9VVwDTrDxoykKA50zs7HHEkWne3RUayruMKkM33+dh
	 6H5EsXLQbTh5jBBUVvDdRF30RAbRHSNhtPOz5XxNVC98fCso96bSK8bgDYrlyDMvyB
	 xZdaStvrVdHxMEIdZZwQjrL8t5WnwNZ29A+bLquE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgH3OCs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 30 Aug 2020 10:02:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:56702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728970AbgH3NzT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 30 Aug 2020 09:55:19 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C88CD21532;
        Sun, 30 Aug 2020 13:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598795719;
        bh=3FhkzB8eUbDw5OZXgkgtTSdvcFxjQ0d9pdGTQZ8lJHg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qa5H5kaNR7SwNDX+HWw+ZABj28S0HUfxCbI0Q8a+TDyMzby3Pq1nVT8VGAlVcd+9d
         3XVIQ8nVceVBGnfF0jG2y+ZImvJs+h0Z036JVjUsUOHt0rsWUrKbkADZpWadfjKszH
         lk2jVQidDmSKlYEiFQewwwLuhBk1mZsXofnb4oJk=
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
Subject: [PATCH 28/33] ARM: dts: exynos: Add CPU cooling in Exynos4412 Origen
Date:   Sun, 30 Aug 2020 15:51:55 +0200
Message-Id: <20200830135200.24304-28-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200830135200.24304-1-krzk@kernel.org>
References: <20200830135200.24304-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add missing cooling devices for CPU thermal zones in Exynos4412 Origen
board.  This allows to scale down CPU frequency (and voltage) in case of
thermal pressure.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4412-origen.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 4c52ca6dbe57..c2e793b69e7d 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -75,6 +75,21 @@
 	cpu0-supply = <&buck2_reg>;
 };
 
+&cpu_thermal {
+	cooling-maps {
+		cooling_map0: map0 {
+			/* Corresponds to 800MHz at freq_table */
+			cooling-device = <&cpu0 7 7>, <&cpu1 7 7>,
+					 <&cpu2 7 7>, <&cpu3 7 7>;
+		};
+		cooling_map1: map1 {
+			/* Corresponds to 200MHz at freq_table */
+			cooling-device = <&cpu0 13 13>, <&cpu1 13 13>,
+					 <&cpu2 13 13>, <&cpu3 13 13>;
+		};
+	};
+};
+
 &exynos_usbphy {
 	status = "okay";
 };
-- 
2.17.1

