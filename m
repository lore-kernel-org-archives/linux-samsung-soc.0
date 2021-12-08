Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6F0C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Dec 2021 09:25:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbhLHJ3J (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Dec 2021 04:29:09 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:37777 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbhLHJ3I (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Dec 2021 04:29:08 -0500
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20211208092535epoutp03deed781664767036cc07b41bc2c7d41b~_vWBVh8w_3089930899epoutp03m
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Dec 2021 09:25:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20211208092535epoutp03deed781664767036cc07b41bc2c7d41b~_vWBVh8w_3089930899epoutp03m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1638955535;
        bh=NsaMsjpNaXM0FwIn/q1w4TSjNPFpoWk6NAX1ftxvWl8=;
        h=From:To:Cc:Subject:Date:References:From;
        b=hHk8EUZxUHIDH3p6cCABKC/KROGZX+XsBs8ybNnPizxcvTUsWdRnXha4YZ2rhWpqK
         0xvoPOXUF8WVvyKZMVCcEna1pnR8TjvB9PfOLj7oZ0ZqtFI09esRkQXxVFicdOd+rg
         yig3QYdnosu2WtLQZSShw0GoCAlYyNZSe//0F3wY=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211208092535epcas2p420f0b7cb3c6cbefbbd207fa1ed793f49~_vWAsYP5l2628126281epcas2p4_;
        Wed,  8 Dec 2021 09:25:35 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.97]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4J8BbX08gfz4x9Pv; Wed,  8 Dec
        2021 09:25:28 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        D0.63.51767.70A70B16; Wed,  8 Dec 2021 18:25:27 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20211208092527epcas2p28f6688d5a2742c03cf474d8b2fa773cd~_vV5hE2sd1805618056epcas2p29;
        Wed,  8 Dec 2021 09:25:27 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211208092527epsmtrp2fab32a60f22c965a836fb08782189cf5~_vV5gWxO82145921459epsmtrp2n;
        Wed,  8 Dec 2021 09:25:27 +0000 (GMT)
X-AuditID: b6c32a45-447ff7000000ca37-98-61b07a07c83a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        79.72.29871.70A70B16; Wed,  8 Dec 2021 18:25:27 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211208092527epsmtip1cc220e4bdff9f9d5e11c88aff6c21167~_vV5Ua0WS0762607626epsmtip1S;
        Wed,  8 Dec 2021 09:25:27 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH v2] arm64: dts: exynosautov9: convert serial_0 for USI
Date:   Wed,  8 Dec 2021 18:18:53 +0900
Message-Id: <20211208091853.8557-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmk+LIzCtJLcpLzFFi42LZdljTVJe9akOiwbSjJhaX92tbzD9yjtVi
        49sfTBabHl9jtZhxfh+TReveI+wWz/v2MTmwe8xq6GXz2LSqk83jzrU9bB6bl9R79G1Zxejx
        eZNcAFtUtk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO
        0CVKCmWJOaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMj
        U6DChOyM9j8T2QteilVM+PKeuYHxiVAXIyeHhICJxNO+N4xdjFwcQgI7GCU6tq1lgnA+MUpM
        6LgO5XxjlPi3YR4TTMvzw3+hWvYySsx9uR7K+cgo8WDedRaQKjYBXYktz18xgtgiAvESV9e3
        soEUMQscYJRYseo3K0hCWMBNYv2FFrCxLAKqEn92XQCL8wrYSvy+f4kFYp28xP6DZ5kh4oIS
        J2c+AYszA8Wbt85mBhkqIXCJXWJz90RWiAYXie8X+tkhbGGJV8e3QNlSEp/f7WWDaOhmlGh9
        9B8qsZpRorPRB8K2l/g1fQvQIA6gDZoS63fpg5gSAsoSR25B7eWT6Dj8lx0izCvR0QYNSHWJ
        A9unQ50sK9E95zPUNR4Sv5d/ZgMpFxKIlVj8RnICo/wsJM/MQvLMLIS1CxiZVzGKpRYU56an
        FhsVGMJjNTk/dxMjODVque5gnPz2g94hRiYOxkOMEhzMSiK8ag/XJgrxpiRWVqUW5ccXleak
        Fh9iNAUG70RmKdHkfGByziuJNzSxNDAxMzM0NzI1MFcS5/VK2ZAoJJCeWJKanZpakFoE08fE
        wSnVwCQUFyf04G5Bj5vU0WWXbr5L9VjzRuGTbIPkBe7lHhxzfjaLWnJfTigO97qyfMV5q5+S
        Vw0yv9RtumYnzvbexOn1SafozldT9fv6W5of6ce3X9lkxmKnd6RBWTWicuom8+r7N57v+HF7
        5fX2vo8yb1+19DzYzbTTZmXE385NquYp9utmNv4Mez2ZfWZsyo7p7558SJp4eZHsKlnW1r22
        0ZybXptWzU5glUz0XLrhl9bE7s5ytaNGahsf5d3+ymx+aiHX7q7a7Mo/5favRStnl3GWSvC8
        13oluFRx1qUrTif9PUJYhH04DP4dYnkiXMaQlnj4zrlSnvDj/rfkT/6OOnJqx+srfdYfLH4G
        iOw4aafEUpyRaKjFXFScCACWa/d2FgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMLMWRmVeSWpSXmKPExsWy7bCSnC571YZEg1tTxS0u79e2mH/kHKvF
        xrc/mCw2Pb7GajHj/D4mi9a9R9gtnvftY3Jg95jV0MvmsWlVJ5vHnWt72Dw2L6n36NuyitHj
        8ya5ALYoLpuU1JzMstQifbsEroz2PxPZC16KVUz48p65gfGJUBcjJ4eEgInE88N/GbsYuTiE
        BHYzSvzZ+Z0RIiEr8ezdDnYIW1jifssRVoii94wSu56cZgJJsAnoSmx5/gqsQUQgXmLmpg1s
        IEXMAkcYJR5N72ADSQgLuEmsv9AC1sAioCrxZ9cFVhCbV8BW4vf9SywQG+Ql9h88ywwRF5Q4
        OfMJWJwZKN68dTbzBEa+WUhSs5CkFjAyrWKUTC0ozk3PLTYsMMxLLdcrTswtLs1L10vOz93E
        CA5XLc0djNtXfdA7xMjEwXiIUYKDWUmEV+3h2kQh3pTEyqrUovz4otKc1OJDjNIcLErivBe6
        TsYLCaQnlqRmp6YWpBbBZJk4OKUamDq6ar1U+xyPHZ1RWsoUbctXufGkpjqvQuybneqnP31j
        yZ91rJsrZG2s34Y6ztwFsctOpWsGdc7etcPK/vdGY0cGke37Und8mBFeds5egu9TnPDEQO2i
        N0xPhesZrlaW9ext1BdW9JsxYcpB+aIVZ78Ybd7wTcZamelD2rlJi7uL47988GRJO+PUuedc
        pMImjzPGXlcvzDxfyDY3vaTLZvvP2RGrbu54ZmJ5rfZOVjIH2zbVOS8NO157Lf97PmhiY73C
        AdeJnjslkoN0LtbzFWs/8i397O6ywP/whSmhc865y6V3nyjIS5rrxznj2bSLJgd+OsR0LNVe
        fvrolkdHZY7ME9obLy7Yyi0rKVkkp8RSnJFoqMVcVJwIAOX1PSbGAgAA
X-CMS-MailID: 20211208092527epcas2p28f6688d5a2742c03cf474d8b2fa773cd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211208092527epcas2p28f6688d5a2742c03cf474d8b2fa773cd
References: <CGME20211208092527epcas2p28f6688d5a2742c03cf474d8b2fa773cd@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

According to USI v2 driver change[1], serial_0 node should be converted to
use the USI node hierarchy. syscon_peric0 will be used as a syscon node
to control the USI00_USI_SW_CONF register.
This also changes the serial node name from uart@ to serial@.

[1]: https://lore.kernel.org/linux-samsung-soc/20211204195757.8600-2-semen.protsenko@linaro.org/

Cc: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
Change from v1:
- Put usi_0 node alphabetically in sadk.dts

 .../boot/dts/exynos/exynosautov9-sadk.dts     |  4 +++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 36 ++++++++++++++-----
 2 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
index ef46d7aa6e28..57518cb5e8c4 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
@@ -54,3 +54,7 @@ &ufs_0 {
 	vcc-supply = <&ufs_0_fixed_vcc_reg>;
 	vcc-fixed-regulator;
 };
+
+&usi_0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index a960c0bc2dba..de8fcb82eaec 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -7,6 +7,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/samsung,exynos-usi.h>
 
 / {
 	compatible = "samsung,exynosautov9";
@@ -256,16 +257,35 @@ syscon_fsys2: syscon@17c20000 {
 			reg = <0x17c20000 0x1000>;
 		};
 
-		/* USI: UART */
-		serial_0: uart@10300000 {
-			compatible = "samsung,exynos850-uart";
-			reg = <0x10300000 0x100>;
-			interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&uart0_bus_dual>;
+		syscon_peric0: syscon@10220000 {
+			compatible = "samsung,exynosautov9-sysreg", "syscon";
+			reg = <0x10220000 0x2000>;
+		};
+
+		usi_0: usi@103000c0 {
+			compatible = "samsung,exynos850-usi";
+			reg = <0x103000c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1000>;
+			samsung,mode = <USI_V2_UART>;
+			samsung,clkreq-on; /* needed for UART mode */
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
 			clocks = <&uart_clock>, <&uart_clock>;
-			clock-names = "uart", "clk_uart_baud0";
+			clock-names = "pclk", "ipclk";
 			status = "disabled";
+
+			/* USI: UART */
+			serial_0: serial@10300000 {
+				compatible = "samsung,exynos850-uart";
+				reg = <0x10300000 0xc0>;
+				interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart0_bus_dual>;
+				clocks = <&uart_clock>, <&uart_clock>;
+				clock-names = "uart", "clk_uart_baud0";
+				status = "disabled";
+			};
 		};
 
 		ufs_0_phy: ufs0-phy@17e04000 {
-- 
2.34.1

