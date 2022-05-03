Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326B3C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 10:58:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234519AbiECLBm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 07:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234639AbiECLBg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 07:01:36 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D534B27FE5
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 03:57:56 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220503105735epoutp03a3f2831f56c01ab7c40e1bfb0217c995~rkyBRJ7sH0801108011epoutp03T
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 10:57:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220503105735epoutp03a3f2831f56c01ab7c40e1bfb0217c995~rkyBRJ7sH0801108011epoutp03T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651575455;
        bh=OEXDn1mE/RoxJCxoxMPOxtLzgjLeIzAYbQmQDkeqAQ8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OWKV0NGD2efZq7ic9hxJDL7b1uAlp7oWPt0UhQNUk9kA/s4iyUfMLROZzhiKsnQ0X
         w+C/Kj8w8MzM6qrQysYr/BE+SBzzBJokAUfd6VX/bOg5+Rr+7F3UN8BqgrAsrvVmSo
         w+Czo3qAZZOVlWqLvlD62ap1NlxrFtW+ckC2Arck=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220503105734epcas2p2563639c5d751a52c34c176a28c9da0f4~rkyASOQ441964019640epcas2p2L;
        Tue,  3 May 2022 10:57:34 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.88]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4KsxkM2Xgsz4x9Q7; Tue,  3 May
        2022 10:57:31 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        6A.DA.09764.B9A01726; Tue,  3 May 2022 19:57:31 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220503105730epcas2p1513c35f3652dbcb2f4aa3839790d10ec~rkx8UOqmH1880618806epcas2p1U;
        Tue,  3 May 2022 10:57:30 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220503105730epsmtrp141fe9dae718216166bdd4160dfc51f5f~rkx8Sl_BO0279502795epsmtrp1i;
        Tue,  3 May 2022 10:57:30 +0000 (GMT)
X-AuditID: b6c32a46-f75ff70000002624-33-62710a9b8996
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        74.42.08853.99A01726; Tue,  3 May 2022 19:57:29 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220503105729epsmtip27fe0fe42b34be18fabcdfde977fe7e86~rkx8EuKcO0549905499epsmtip2W;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
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
Subject: [PATCH v2 11/12] arm64: dts: exynosautov9: switch usi clocks
Date:   Tue,  3 May 2022 19:59:13 +0900
Message-Id: <20220503105914.117625-12-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220503105914.117625-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMJsWRmVeSWpSXmKPExsWy7bCmqe5srsIkg9PbBCwezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxR2TYZqYkpqUUKqXnJ
        +SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QMcqKZQl5pQChQISi4uV9O1s
        ivJLS1IVMvKLS2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7IzDr5cyFKwgLeibWYL
        SwPjYa4uRk4OCQETiRPX2hm7GLk4hAR2MEp09s5khXA+MUp86vsA5XxjlFg9Zw8bTMvZ2cfZ
        IBJ7GSVOXn3IDOF8ZJTY0HeKCaSKTUBXYsvzV2CDRQS6mCUu9t1jAXGYBbYyShy/MQusSljA
        VeLVqTOMIDaLgKrEjQ1XmEFsXgEHic2TNgDVcADtk5f4tzgUJMwJFL6+6xwTRImgxMmZT1hA
        bGagkuats8GukBBYyiGxrus9I8StLhKvvv5igrCFJV4d38IOYUtJvOxvg7KLJZbO+sQE0dzA
        KHF52y+oR40lZj0DhQ0H0AZNifW79CHuUZY4cgtqL59Ex+G/7BBhXomONiGIRnWJA9uns0DY
        shLdcz6zQpR4SCxbFgEJq8mMEg2TT7JPYFSYheSbWUi+mYWwdwEj8ypGsdSC4tz01GKjAiN4
        FCfn525iBKdeLbcdjFPeftA7xMjEwXiIUYKDWUmE13lpQZIQb0piZVVqUX58UWlOavEhRlNg
        UE9klhJNzgcm/7ySeEMTSwMTMzNDcyNTA3MlcV6vlA2JQgLpiSWp2ampBalFMH1MHJxSDUzn
        Pu1PqGbaNHejDZc8l8Pt6NLPctd4C294XPuw7fSFcvk9X/P1jvtvclnTZZn1cEF0OfO1FdO+
        fuY7oXvz4CKFubbSPxZUvHqy4+qSX46tFjpxrS8XlQvJzvr9czP/k56EiYWOh+drWubIxxeJ
        lN0SPfu/On9B6IlCDfnCZesWr/3Gtr1qisGE+Ocisx+rToxeIHHY7Lfy08/i6efXuSrVTxOv
        i5ezWy9TLNwyz3MRn1K7fvGaoO7MQxYbb5uV3zGccZqvecPCt/f48h7sPqDaFxF0b0r/g2uR
        O/7lLLHRuv/aQdzr7G3uID6dIkkzz+2/O3XURQ9d4gtU3DfD51L54wM275h4fdu+OV9qTNBQ
        YinOSDTUYi4qTgQAL18aQEYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHLMWRmVeSWpSXmKPExsWy7bCSvO5MrsIkg+UzzS0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxRXDYpqTmZZalF+nYJ
        XBkHXy5kKVjAW9E2s4WlgfEwVxcjJ4eEgInE2dnH2boYuTiEBHYzStx/d4oRIiEr8ezdDnYI
        W1jifssRVoii94wS728sYwNJsAnoSmx5/ooRJCEiMIFZ4s2VD+wgDrPATkaJO69OgVUJC7hK
        vDp1Bmwsi4CqxI0NV5hBbF4BB4nNkzYwdTFyAK2Ql/i3OBQkzAkUvr7rHBOILSRgL7Hz73ao
        ckGJkzOfsIDYzEDlzVtnM09gFJiFJDULSWoBI9MqRsnUguLc9NxiwwLDvNRyveLE3OLSvHS9
        5PzcTYzgKNHS3MG4fdUHvUOMTByMhxglOJiVRHidlxYkCfGmJFZWpRblxxeV5qQWH2KU5mBR
        Eue90HUyXkggPbEkNTs1tSC1CCbLxMEp1cC0YbVgZObv/0xnVNwkbjhfefVONvD46zBn6QRj
        3Z1xnzMdDZKTVK3Fz8qf0dZWkqnS7N/OvnaiY9fVnYdvrtQSmbVtdtL8t9qcKuvEvQxSP24U
        /yd8Oz6ekW/Vr3jmthBr50lTO3XPb8k7ly9qFivb9Ztff9bz/O4EFfnX3K4m3q5pO+bearvA
        0ZMotjbBn+2+Fe+M9Zflpdk5irV25Kfe3TVBne+uXP+79Ij9qnqNjKnNeTzTFATDrzeddFt8
        0KpY93Om1H2FVN3btex/T2zqura8fMPRB8tTi9f9W8PtUv6J6bLhxG2a692WzH2YaFfzZtLl
        dQfaD76OvTFp+8qMXZtnVN26Lf/k8Eq/gwuUWIozEg21mIuKEwEEm7lEAQMAAA==
X-CMS-MailID: 20220503105730epcas2p1513c35f3652dbcb2f4aa3839790d10ec
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220503105730epcas2p1513c35f3652dbcb2f4aa3839790d10ec
References: <20220503105914.117625-1-chanho61.park@samsung.com>
        <CGME20220503105730epcas2p1513c35f3652dbcb2f4aa3839790d10ec@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This changes to use cmu clock nodes instead of dummy fixed-rate-clock.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 32c670b8a9b8..f2f7565ba7cf 100644
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

