Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38091C55178
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 18:45:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD41D2078E
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 18:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604601931;
	bh=+Dt16E8Ek5gVL25Y/McPO/BHqpKp4fHskfY27/LJOhw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-ID:From;
	b=K27M4CGr9TfKw5wMURwx/Nu+WYA0F1q0n9bfvWrOfznO5dY+HXUhvLTF2iotzjuR7
	 gqyDneAA91M2gBZqU9/kzH/STQYfGiIsEI0Vn5bTCG837e/iwG3hi+T115/7xttfEQ
	 vjMaspuT5KyE7t7uJpa4KkKaj21AyCIOkIDE63go=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731867AbgKESp2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 13:45:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:50340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731972AbgKESpU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 13:45:20 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D9CB2087D;
        Thu,  5 Nov 2020 18:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604601919;
        bh=+Dt16E8Ek5gVL25Y/McPO/BHqpKp4fHskfY27/LJOhw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SgTF1/qYntz9h5MCzTCGL7Xf6I/jpTqvr6MYMJrc/4JeXFmwML1Gn7kPVhA7vy0/v
         MIC3XdnfZqse4mRiduKcT1zORdJdkLTe8JjGwTIjvjX2iSrftEIjnkbrToxShD0bcr
         JYl7kBx6vVEPC9BiPmFV68h+Eux2fx4+sJfIrJnQ=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] ARM: dts: exynos: use hyphens in MFC reserved memory node names
Date:   Thu,  5 Nov 2020 19:45:05 +0100
Message-Id: <20201105184506.215648-5-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105184506.215648-1-krzk@kernel.org>
References: <20201105184506.215648-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use hyphens instead of underscores in the MFC reserved memory node names
which is expected by naming convention, multiple dtschema files and
pointed out by dtc W=2 builds.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos-mfc-reserved-memory.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos-mfc-reserved-memory.dtsi b/arch/arm/boot/dts/exynos-mfc-reserved-memory.dtsi
index 1dbf3bbff8d3..597ade3e252f 100644
--- a/arch/arm/boot/dts/exynos-mfc-reserved-memory.dtsi
+++ b/arch/arm/boot/dts/exynos-mfc-reserved-memory.dtsi
@@ -11,14 +11,14 @@ reserved-memory {
 		#size-cells = <1>;
 		ranges;
 
-		mfc_left: region_mfc_left {
+		mfc_left: region-mfc-left {
 			compatible = "shared-dma-pool";
 			no-map;
 			size = <0x2400000>;
 			alignment = <0x100000>;
 		};
 
-		mfc_right: region_mfc_right {
+		mfc_right: region-mfc-right {
 			compatible = "shared-dma-pool";
 			no-map;
 			size = <0x800000>;
-- 
2.25.1

