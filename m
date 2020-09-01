Return-Path: <SRS0=7h8a=CK=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49D8C433E7
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Sep 2020 07:54:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96C0B215A4
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Sep 2020 07:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598946875;
	bh=Wzk6xLOgHb+dXZ9e8xdTgf21ZeEp2hdbShXIFp7iY5c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=hZvZ+MEQVU2qUtnRpuY7so09a/GX9C2FR43R+CaPzHIBm5BAgPg86zhfw+WixkuEg
	 fXA6T55AKhvz9Nt1BUV6dOyF4zxXEpOa+/iz+kRL5/Is/2CoA+4g/Sk0UtPefyJiX8
	 jQbuJj3/vESoSKAFvU0TG32i0sQnSdHGGgdpwlnI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgIAHye (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Sep 2020 03:54:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:45060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727028AbgIAHyd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Sep 2020 03:54:33 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C59FB2083B;
        Tue,  1 Sep 2020 07:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598946872;
        bh=Wzk6xLOgHb+dXZ9e8xdTgf21ZeEp2hdbShXIFp7iY5c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D0nacYYLsErONf/QrX1zO3CYTxtB/k6Yet4oEYUst5DcWQkzXfOCFkPZyH38zaXIx
         AzXbW+lu7Ufu0jpBcuwNIEZlnUtAr5tesyNkRA359gaR822MHKADFx6Km03kLdYT4U
         OVzX9fKJ/byrrhX0j9Q+xZ07XyjOfw0hLQ9LfDFU=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 01/13] ARM: dts: exynos: Correct compatible for Exynos5 GIC
Date:   Tue,  1 Sep 2020 09:54:05 +0200
Message-Id: <20200901075417.22481-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901075417.22481-1-krzk@kernel.org>
References: <20200901075417.22481-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos5250 and Exynso54xx SoCs have ARM GIC 400.  Correct the
compatibles to match dtschema and fix the dtbs_check warnings like:

  arch/arm/boot/dts/exynos5420-peach-pit.dt.yaml: interrupt-controller@10481000:
    compatible: ['arm,gic-400', 'arm,cortex-a15-gic', 'arm,cortex-a9-gic']
    is not valid under any of the given schemas

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 22eb951c614c..9660104be4c9 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -86,7 +86,7 @@
 		};
 
 		gic: interrupt-controller@10481000 {
-			compatible = "arm,gic-400", "arm,cortex-a15-gic", "arm,cortex-a9-gic";
+			compatible = "arm,gic-400", "arm,cortex-a15-gic";
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			reg =	<0x10481000 0x1000>,
-- 
2.17.1

