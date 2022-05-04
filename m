Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBC3C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 07:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345813AbiEDHy2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 03:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345760AbiEDHxz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 03:53:55 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B367BEAD
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 00:50:18 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220504075010epoutp022d6a4fe973b9ca2508bce97cfa35d044~r13qohx3o1785117851epoutp02m
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 07:50:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220504075010epoutp022d6a4fe973b9ca2508bce97cfa35d044~r13qohx3o1785117851epoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651650610;
        bh=HodClS1k14+uc9X5o05QVdW4Sa/93KrEwsKJ7K+H47c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FkDD2GcDQwyN8lCHuaUoU1/sNtv2OCM2BHrRIu0BZmwfyog532SPNWE1QolEBKxIC
         aUUDWE/FtqpnstDZ50+qqpHwnd/WU/LJpWMrQlPKKvMgkW88CoHV9XIhtubN8ChPwI
         qYkXFLJokvtdWNNOe5qr3qQ20F8vyzd/Jr1ECeUI=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220504075009epcas2p2e151a5639fdfd25cf2fd7263d661c94e~r13p0ryd22519725197epcas2p21;
        Wed,  4 May 2022 07:50:09 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.97]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4KtTWf4xgYz4x9Pp; Wed,  4 May
        2022 07:50:06 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        6B.1F.09764.C2032726; Wed,  4 May 2022 16:50:05 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220504075004epcas2p2fafaa565e78bfdbbf55c2b4da31743a9~r13lglQ7A2949029490epcas2p2m;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220504075004epsmtrp16d5c64a1551604ef9f6ee1f137240817~r13lfibno2992129921epsmtrp1a;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
X-AuditID: b6c32a46-f8bff70000002624-34-6272302c4fe4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        BE.EB.08924.C2032726; Wed,  4 May 2022 16:50:04 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220504075004epsmtip1e80736b4bda1c71554b71df6747eb7ae~r13lVbIV42352223522epsmtip1c;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 11/12] arm64: dts: exynosautov9: switch usi clocks
Date:   Wed,  4 May 2022 16:51:53 +0900
Message-Id: <20220504075154.58819-12-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504075154.58819-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmma6uQVGSwZHrTBYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWH3vusVrMOL+PyeLiKVeL1r1H2C0Ov2lntfh3bSOLxfM+
        oPiqXX8YHfg83t9oZffYOesuu8emVZ1sHneu7WHz6NuyitHj8ya5ALaobJuM1MSU1CKF1Lzk
        /JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoGOVFMoSc0qBQgGJxcVK+nY2
        RfmlJakKGfnFJbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZCzdNZS9YwFtxp/0E
        ewPjYa4uRk4OCQETiV3H37N0MXJxCAnsYJQ4u3ETK4TziVFi8ZTTUM5nRoll6ycywbQcerqO
        DSKxi1Fix4XfUFUfGSUe9h5mAaliE9CV2PL8FSNIQkSgi1niYt89sC3MAlsZJY7fmAU2S1jA
        VWLh3itsIDaLgKrEhrefWEFsXgF7if57B4BsDqB98hL/FoeCmJxA4ccbLCAqBCVOznwCtosZ
        qKJ562xmkPESAgs5JH5vOQC0mB3IcZF4oQBxtLDEq+Nb2CFsKYmX/W1QdrHE0lmfmCBaGxgl
        Lm/7xQaRMJaY9aydEWQts4CmxPpd+hDHKEscuQW1lU+i4/Bfdogwr0RHmxBEo7rEge3TWSBs
        WYnuOZ9ZIWwPib5ZS5ghITWJUaKp/xHzBEaFWUiemYXkmVkIixcwMq9iFEstKM5NTy02KjCC
        R3Byfu4mRnDa1XLbwTjl7Qe9Q4xMHIyHGCU4mJVEeJ2XFiQJ8aYkVlalFuXHF5XmpBYfYjQF
        BvREZinR5Hxg4s8riTc0sTQwMTMzNDcyNTBXEuf1StmQKCSQnliSmp2aWpBaBNPHxMEp1cCk
        W1iz1dju82vLVAkBtqY9P/y21T05/OXgnGlLX2jdiwsrkVu46q99vGGk5IptVa83HdpmtTH3
        3bH1czXyBJyYD1xvt3+dNmtp7LuM1+uTRNNXTvhikb+renXsqWmbBBf/vrqwuNni2M3PxWeu
        Xpqu5+OS9YMxyu8Xq6nVBu60w1OLon0t0tXMNG+WNzGUWO5d8vq2+fkFk8/KMzbb19+VS/oV
        UCI+d/WGlzsMPTM4Mme+e+PAE9n1rKtv+7bCRJl7DP6bEqafMOdxaTM9wimYyi87N0F9lvRx
        V6s/yw7pWV4Xj7gluD7McFts4R+W0COb5jgoW3x6NYdXYdfcHd0Tqpyv9fQ8N1tdU1Mb1Zek
        xFKckWioxVxUnAgAeKO3c0QEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsWy7bCSnK6OQVGSwapuVYsH87axWVzer21x
        /ctzVov5R86xWvS9eMhssff1VnaLjz33WC1mnN/HZHHxlKtF694j7BaH37SzWvy7tpHF4nkf
        UHzVrj+MDnwe72+0snvsnHWX3WPTqk42jzvX9rB59G1ZxejxeZNcAFsUl01Kak5mWWqRvl0C
        V8bCTVPZCxbwVtxpP8HewHiYq4uRk0NCwETi0NN1bF2MXBxCAjsYJW4uf8gCkZCVePZuBzuE
        LSxxv+UIK0TRe0aJbQtPgiXYBHQltjx/xQiSEBGYwCzx5soHdhCHWWAno8SdV6fYQKqEBVwl
        Fu69AmazCKhKbHj7iRXE5hWwl+i/dwDI5gBaIS/xb3EoiMkJFH68wQLEFBKwkzg6qQiiWFDi
        5MwnYLcxAxU3b53NPIFRYBaS1CwkqQWMTKsYJVMLinPTc4sNC4zyUsv1ihNzi0vz0vWS83M3
        MYIjREtrB+OeVR/0DjEycTAeYpTgYFYS4XVeWpAkxJuSWFmVWpQfX1Sak1p8iFGag0VJnPdC
        18l4IYH0xJLU7NTUgtQimCwTB6dUA9OKw9rVNu93/D8Z8n61We7amnvfd6W0MmzT6GwNyTzQ
        Xbl86ZVJ9dyKasn+q/S6azlOtsxROfvNbw3L0slBgZvu7hd7PPNS9MRtrqlrJvV8s3SufrVV
        6/Epp5e7p3A+Vv2np3iK98RWSZ1/JRUv1mwwFH5gJcf3Re7m9W3tr29e6thm+Tg258Sqrv89
        zXqCEkrvvj5gsfzSvC/jQ+Qj7ycPFFyXhTG+4eC3LK8vVTXn8990QX+23Hy7ow8vCbGY9UzS
        YA4/Z7tme3FjxsKoU4s4RN7zGG1e1Riqu1Mj99Sfy+5hB5ffuWTwZuo2Z16HD1N7ljHwuPBo
        sS32VczRecTrYZejm7DipXNpg8NfmcdKLMUZiYZazEXFiQDjVXWX/wIAAA==
X-CMS-MailID: 20220504075004epcas2p2fafaa565e78bfdbbf55c2b4da31743a9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220504075004epcas2p2fafaa565e78bfdbbf55c2b4da31743a9
References: <20220504075154.58819-1-chanho61.park@samsung.com>
        <CGME20220504075004epcas2p2fafaa565e78bfdbbf55c2b4da31743a9@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This changes to use cmu clock nodes instead of dummy fixed-rate-clock.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index c9cd3774f298..68335fefa5f3 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -158,17 +158,6 @@ xtcxo: clock {
 			clock-output-names = "oscclk";
 		};
 
-		/*
-		 * Keep the stub clock for serial driver, until proper clock
-		 * driver is implemented.
-		 */
-		uart_clock: uart-clock {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <133250000>;
-			clock-output-names = "uart";
-		};
-
 		/*
 		 * Keep the stub clock for ufs driver, until proper clock
 		 * driver is implemented.
@@ -355,7 +344,8 @@ usi_0: usi@103000c0 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
-			clocks = <&uart_clock>, <&uart_clock>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>;
 			clock-names = "pclk", "ipclk";
 			status = "disabled";
 
@@ -366,7 +356,8 @@ serial_0: serial@10300000 {
 				interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&uart0_bus_dual>;
-				clocks = <&uart_clock>, <&uart_clock>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>;
 				clock-names = "uart", "clk_uart_baud0";
 				status = "disabled";
 			};
-- 
2.36.0

