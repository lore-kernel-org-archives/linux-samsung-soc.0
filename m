Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF59DCCA473
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  1 Jul 2022 01:55:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232504AbiGABzB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Jun 2022 21:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232479AbiGABzB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Jun 2022 21:55:01 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9470757242
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 18:54:57 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220701015453epoutp0217afc1fd80c5925921024984f77aa3c1~9kcBX-02X1132411324epoutp024
        for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Jul 2022 01:54:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220701015453epoutp0217afc1fd80c5925921024984f77aa3c1~9kcBX-02X1132411324epoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656640493;
        bh=GX0KhdgQdYmQS5rfrx7wkO2OYNcdwsxmMT8rLLs9M7Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n41aUMQhtLJFZMEHkPxpDmkcjSC2UyGf+UGhRxpdQ+GLWNOs8UvanUktFjt3sGYAL
         eTrkx3wwFRe8GvwRdf3L19qsUaMIhass64+NJTGaVRagoj8OjwH1d2ksnitOdbeNUC
         237LhRJlUc3EO2CPs9iu8oHTTFJPbnXhzcDeGAlA=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220701015452epcas2p1b6f823720af829cdc7cfb6a0ab529508~9kcA2dqCH2287322873epcas2p1M;
        Fri,  1 Jul 2022 01:54:52 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.88]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4LYyv002ldz4x9QH; Fri,  1 Jul
        2022 01:54:52 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        5A.97.09666.BE35EB26; Fri,  1 Jul 2022 10:54:51 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220701015451epcas2p2d3f57de43762d78269bd7981b22ea987~9kb-0dacs0447304473epcas2p2D;
        Fri,  1 Jul 2022 01:54:51 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220701015451epsmtrp27ffa54e45c0df07302ab9f1a2965bf86~9kb-y_ABI1047610476epsmtrp2T;
        Fri,  1 Jul 2022 01:54:51 +0000 (GMT)
X-AuditID: b6c32a45-471ff700000025c2-7a-62be53eb2bc5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        1B.E4.08905.BE35EB26; Fri,  1 Jul 2022 10:54:51 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220701015451epsmtip25ed36f5f4189b6f1a3f36db7922aed05~9kb-hTiWL0264602646epsmtip2i;
        Fri,  1 Jul 2022 01:54:51 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 4/5] arm64: dts: exynosautov9: prepare usi0 changes
Date:   Fri,  1 Jul 2022 10:52:25 +0900
Message-Id: <20220701015226.32781-5-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701015226.32781-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCJsWRmVeSWpSXmKPExsWy7bCmqe7r4H1JBjOarSwezNvGZnF5v7bF
        /CPnWC12NBxhteh78ZDZYtPja6wWM87vY7Jo3XuE3eJ53z4mB06PTas62TzuXNvD5rF5Sb1H
        35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4
        BOi6ZeYAnaOkUJaYUwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0st
        sTI0MDAyBSpMyM540nSUpeCHYMWuDfNYGxiP8nUxcnJICJhIHPm1gKmLkYtDSGAHo8SHiSdZ
        IZxPjBJTWrcwglQJCXxjlHiySQOm4/7P+VBFexklml7PZIdwPjJKzPrwEKyDTUBXYsvzV2C2
        iEC8xPML71lAipgFJjFJnO9oZgZJCAu4SZx838cGYrMIqErcW/gI6BAODl4BO4kndzghtslL
        bJjfC1bOKWAv8W//XHYQm1dAUOLkzCcsIDYzUE3z1tnMIPMlBL6yS/y/9pEJotlFouXnRFYI
        W1ji1fEt7BC2lMTnd3vZIOxiiaWzPjFBNDcwSlze9gsqYSwx61k7I8hBzAKaEut36YOYEgLK
        EkduQe3lk+g4/JcdIswr0dEmBNGoLnFg+3QWCFtWonvOZ6gLPCQmLe1mhITVJEaJ3iUHWSYw
        KsxC8s4sJO/MQli8gJF5FaNYakFxbnpqsVGBITyGk/NzNzGCk6eW6w7GyW8/6B1iZOJgPMQo
        wcGsJMLLNm9vkhBvSmJlVWpRfnxRaU5q8SFGU2BYT2SWEk3OB6bvvJJ4QxNLAxMzM0NzI1MD
        cyVxXq+UDYlCAumJJanZqakFqUUwfUwcnFINTN4WNT0KnEviy9JU074u8nP68Ix13XbR/WYH
        Kx7MP7KinLV6d0akcn7RrVnTnr+qyat3699mmn50s9qdV27/+bKk7Iu3fpj8isnq18up7i9P
        BMWLscXwbguuWpJYtrls7vpqxyAXxlDmXWknu+fZv9bu1v2gpvXm12rVoGUuG+ex1zyrimCX
        llvYdfCfrtFaU67AK0eLC4Rqry2bPFeIqYBv99RrgS6Ll/5KDl1s/iD3NhOH8u6Q4/OS49t2
        c0s2n6ysbTqu4HD9yuIPZw08pB4+mPU859frlVbBbNmVykwh0c8//ygzLDv288XT8MVfeV3N
        rrZ9qLQsuXDZP26W6/UPqY/Tq5Kevhe4r6bwTYmlOCPRUIu5qDgRAM7nwdInBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPLMWRmVeSWpSXmKPExsWy7bCSvO7r4H1JBk9eSFo8mLeNzeLyfm2L
        +UfOsVrsaDjCatH34iGzxabH11gtZpzfx2TRuvcIu8Xzvn1MDpwem1Z1snncubaHzWPzknqP
        vi2rGD0+b5ILYI3isklJzcksSy3St0vgynjSdJSl4Idgxa4N81gbGI/ydTFyckgImEjc/zmf
        tYuRi0NIYDejxN1tfWwQCVmJZ+92sEPYwhL3W45AFb1nlFi2fh1Ygk1AV2LL81eMILaIQLzE
        5i8LWUCKmAWmMUl0PJ4BViQs4CZx8j3EVBYBVYl7Cx8xdTFycPAK2Ek8ucMJsUBeYsP8XmYQ
        m1PAXuLf/rlgrUJAJavf3QaL8woISpyc+YQFxGYGqm/eOpt5AqPALCSpWUhSCxiZVjFKphYU
        56bnFhsWGOallusVJ+YWl+al6yXn525iBIe5luYOxu2rPugdYmTiYDzEKMHBrCTCyzZvb5IQ
        b0piZVVqUX58UWlOavEhRmkOFiVx3gtdJ+OFBNITS1KzU1MLUotgskwcnFINTLEW7IVT5139
        fcr3otvuCsVnCfObZkdeb07hV407/PI+0/P+S73FzYnOleIuk+7P/D85aoLwndgTzJuV5bhX
        Tff72h0eeac751bfUsUdOov+qK5N7DTvDLm4wPbnGYuo7U/OB10R7JJ09zg8mTminCHYX+jH
        0RjpW0UxZev/W29aHb9PeI94qNapjD028X0lM9KqP7I8F10/SZRPTtmjOtb7mXLcTCdHg/sW
        twNmJ7x/VHku+Yf/ma76/p2fS+WNXl6LeR0bo+65Ic7+XaGCviWn5NEfCWZdTEXOs+SamE7M
        0Jwz6SPr/wyOmbJh4TwnisRV+WwbisNcdk1VTvDh2zFt65TPOt6N3BK73vxVYinOSDTUYi4q
        TgQAdoGxROICAAA=
X-CMS-MailID: 20220701015451epcas2p2d3f57de43762d78269bd7981b22ea987
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220701015451epcas2p2d3f57de43762d78269bd7981b22ea987
References: <20220701015226.32781-1-chanho61.park@samsung.com>
        <CGME20220701015451epcas2p2d3f57de43762d78269bd7981b22ea987@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Before adding whole USI nodes, this applies the changes of usi0 in
advance. To be the usi0 and serian_0 nodes as SoC default, some
properties should be moved to exynosautov9-sadk.dts.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts |  2 ++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi     | 10 +++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
index 2b30a7458297..eec3192c0631 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
@@ -50,6 +50,7 @@ ufs_1_fixed_vcc_reg: regulator-1 {
 };
 
 &serial_0 {
+	pinctrl-0 = <&uart0_bus_dual>;
 	status = "okay";
 };
 
@@ -74,6 +75,7 @@ &ufs_1 {
 };
 
 &usi_0 {
+	samsung,clkreq-on; /* needed for UART mode */
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index c4cfa93e4c2e..dbe0819b44c2 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -352,11 +352,11 @@ syscon_peric0: syscon@10220000 {
 		};
 
 		usi_0: usi@103000c0 {
-			compatible = "samsung,exynos850-usi";
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
 			reg = <0x103000c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1000>;
 			samsung,mode = <USI_V2_UART>;
-			samsung,clkreq-on; /* needed for UART mode */
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -365,13 +365,13 @@ usi_0: usi@103000c0 {
 			clock-names = "pclk", "ipclk";
 			status = "disabled";
 
-			/* USI: UART */
 			serial_0: serial@10300000 {
-				compatible = "samsung,exynos850-uart";
+				compatible = "samsung,exynosautov9-uart",
+					     "samsung,exynos850-uart";
 				reg = <0x10300000 0xc0>;
 				interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&uart0_bus_dual>;
+				pinctrl-0 = <&uart0_bus>;
 				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>,
 					 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>;
 				clock-names = "uart", "clk_uart_baud0";
-- 
2.36.1

