Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDE0C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 May 2022 09:01:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384034AbiEBJEy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 May 2022 05:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384033AbiEBJEr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 May 2022 05:04:47 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A07A58399
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 02:01:16 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220502090107epoutp0330d0b762445bbecc72c1f53cdcfe9fcb~rPjDe4nXQ0216702167epoutp03S
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 09:01:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220502090107epoutp0330d0b762445bbecc72c1f53cdcfe9fcb~rPjDe4nXQ0216702167epoutp03S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651482068;
        bh=T2JauvfewMudmLLRm7r8XiMVNk/0eciJQS0k85in388=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U6Ev5Mm/NHm85ss+XOjpGh3nPN23c/eFq2x/F8+3OwQ0cM9VycdOv1qkP7PQNWzmj
         QMRc2AJj748Ph8H8w/se9nwdt7WOGVaXS/EDyO/RS3PjZ4SUSbazpjTLwNfq76OLNU
         cAaNcrmilWFw1EeUKvawMDl60I7dbsVGzaguhYtU=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220502090107epcas2p47e290df36aa2004d4a072862d2c2cce3~rPjCsFDwd0033600336epcas2p4-;
        Mon,  2 May 2022 09:01:07 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.91]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4KsHBQ49fTz4x9Q5; Mon,  2 May
        2022 09:01:02 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        CD.7D.10069.DCD9F626; Mon,  2 May 2022 18:01:01 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220502090101epcas2p20aa0bd49b9f55de390267aa3b450b3f5~rPi9TL-E10428104281epcas2p2r;
        Mon,  2 May 2022 09:01:01 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220502090101epsmtrp2eb2b097b78e49dffd75c5b2e8cccd18a~rPi9Q86_C3259032590epsmtrp2D;
        Mon,  2 May 2022 09:01:01 +0000 (GMT)
X-AuditID: b6c32a45-a8fff70000002755-71-626f9dcda286
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        CE.EB.08853.DCD9F626; Mon,  2 May 2022 18:01:01 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220502090101epsmtip202425611b5be02297b3d6bd502930aa7~rPi9FugrF1980019800epsmtip2R;
        Mon,  2 May 2022 09:01:01 +0000 (GMT)
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
Subject: [PATCH 11/12] arm64: dts: exynosautov9: switch usi clocks
Date:   Mon,  2 May 2022 18:02:29 +0900
Message-Id: <20220502090230.12853-12-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220502090230.12853-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRmVeSWpSXmKPExsWy7bCmue7ZuflJBjdbzC0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxR2TYZqYkpqUUKqXnJ
        +SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QMcqKZQl5pQChQISi4uV9O1s
        ivJLS1IVMvKLS2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7Iztn3/xFiwgLdi44Gj
        LA2Mh7m6GDk5JARMJF7f/8DcxcjFISSwg1FiQ/98KOcTo8SWxZtYIJxvjBJHO9cAZTjAWvrv
        pkPE9zJKnLn1hBFklJDAR0aJ+5ONQGw2AV2JLc9fMYIUiQh0MUtc7LsHNolZYCujxPEbs5hA
        qoQFnCTO7jjADmKzCKhKPN64mRnE5hWwl5jRu5sVYpu8xL/FoSBhTqDwma3PGSFKBCVOznzC
        AmIzA5U0b50NdraEwFIOid2/X7JCPOciMePpbkYIW1ji1fEt7BC2lMTnd3vZIOxiiaWzPjFB
        NDcwSlze9gsqYSwx61k7I8gRzAKaEut36UPcoyxx5BbUXj6JjsN/2SHCvBIdbUIQjeoSB7ZP
        Z4GwZSW653yGusZDYtWrHWyQgJvEKPG0ZzfbBEaFWUjemYXknVkIixcwMq9iFEstKM5NTy02
        KjCEx3Byfu4mRnDi1XLdwTj57Qe9Q4xMHIyHGCU4mJVEeNs25CQJ8aYkVlalFuXHF5XmpBYf
        YjQFhvVEZinR5Hxg6s8riTc0sTQwMTMzNDcyNTBXEuf1StmQKCSQnliSmp2aWpBaBNPHxMEp
        1cDkEnj907V/pTzs6pxTLUo0ud6azV7QuE8oTOhle2TNx2WiVa0Zl1K709teSU5mZstwOc1w
        Y8eJ5Mldiff+29fNvLVTqn3fYWuN/N015Qft/f65iOr/l39++m4lC8NNuU0KXqsYrh51XFeo
        ZrCc/bn/dEGzh38/nZm5MHpX0B/Hgmbfvw1V+xl3dixbeHHy8+T/Bs6l2QXX7oS9UNq0bMsW
        ocXp61vtWVLWnJo+a4Gdz1pdkxll2Y6q7H+U204K+Eum2ao12L5tjav+mvDGcbKQUEtGpv02
        n+erTvV0Bi9wjPjGWBxV+uyniOmFJK7fZw2379e90ubr8VrwnMKj/Q/P6W/VWDh3w3vp6euX
        sD1VYinOSDTUYi4qTgQAPBj2bEUEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLLMWRmVeSWpSXmKPExsWy7bCSvO7ZuflJBj/b+SwezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxRXDYpqTmZZalF+nYJ
        XBnbvn9iLFjAW7HxwFGWBsbDXF2MHBwSAiYS/XfTuxi5OIQEdjNKXH/4mqmLkRMoLivx7N0O
        dghbWOJ+yxFWiKL3jBKbDrYygiTYBHQltjx/xQiSEBGYwCzx5soHdhCHWWAno8SdV6fYQKqE
        BZwkzu44ADaKRUBV4vHGzcwgNq+AvcSM3t2sEGfIS/xbHAoS5gQKn9n6HGyBkICdxI8T96HK
        BSVOznzCAmIzA5U3b53NPIFRYBaS1CwkqQWMTKsYJVMLinPTc4sNCwzzUsv1ihNzi0vz0vWS
        83M3MYJjREtzB+P2VR/0DjEycTAeYpTgYFYS4W3bkJMkxJuSWFmVWpQfX1Sak1p8iFGag0VJ
        nPdC18l4IYH0xJLU7NTUgtQimCwTB6dUA9OMQKPlczz7jV2ExJfYH/043/jA1KSdQjOj9h1b
        IDn5p2VEcrTwutfG7jWdDSdzszyc25XLF+rlFe5dc+fbzt9Kxlt2GvUulz33ps/+V7DLg3vS
        k65Mz5/inHbskEbXNZvMxN3XpmdN2Z4jEFT2+nRFxeEPDRG9x/gM/s/cdOZkm2it31TmNQ7t
        09kX5K+bdcf2vFJIdfn6pTJX1dw/6mzr42Ndf+fa1ezIiQLsU3s5Zqfl/7IrC7JJ77vQwsEl
        ITZD7EvZtgOc25bfK4k+68dhe6pr4fpsRUFpD7enXQvsFOazp2/7XlchKJ4/xYupYlfJ5mdP
        C8oXn05ZKO/DFr38y8OKx9oqUq7736fut1JiKc5INNRiLipOBAAe7AhbAAMAAA==
X-CMS-MailID: 20220502090101epcas2p20aa0bd49b9f55de390267aa3b450b3f5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220502090101epcas2p20aa0bd49b9f55de390267aa3b450b3f5
References: <20220502090230.12853-1-chanho61.park@samsung.com>
        <CGME20220502090101epcas2p20aa0bd49b9f55de390267aa3b450b3f5@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This changes to use cmu clock nodes instead of dummy fixed-rate-clock.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 6f181632267b..149cf8c2a797 100644
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
@@ -343,7 +332,8 @@ usi_0: usi@103000c0 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
-			clocks = <&uart_clock>, <&uart_clock>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>;
 			clock-names = "pclk", "ipclk";
 			status = "disabled";
 
@@ -354,7 +344,8 @@ serial_0: serial@10300000 {
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

