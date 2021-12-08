Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7CDC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Dec 2021 00:46:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234887AbhLHAtx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Dec 2021 19:49:53 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:35307 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234859AbhLHAtv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 19:49:51 -0500
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20211208004618epoutp016e54d600b0deb430b81054e0c35a7883~_oQn99Vt60753507535epoutp01R
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Dec 2021 00:46:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20211208004618epoutp016e54d600b0deb430b81054e0c35a7883~_oQn99Vt60753507535epoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1638924378;
        bh=tuFbGFhELyilz/bf0UDgiX4X5oOjHV6AIspL4h3G3r4=;
        h=From:To:Cc:Subject:Date:References:From;
        b=MxkIpwx7X3job34naOqcqT/gVQDLCCSAGzgviPxEoNkMReHomZ6mMzzkk8ub3tDeR
         hLCpOJSo1IpLFk+vl0MdtvMWxXyRWpdDSZEdD/AZ0S4yFy9/JSWy/9BunmLPpZnJKT
         FAPGJUQrkUlsDvyvJRBuwtU9dZi5HggwvSvNRNf4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211208004618epcas2p403faed6ea0baab88c34371e83a65c1de~_oQnZspbh1590815908epcas2p4t;
        Wed,  8 Dec 2021 00:46:18 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.89]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4J7z4P2VN8z4x9QY; Wed,  8 Dec
        2021 00:46:13 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        70.84.51767.15000B16; Wed,  8 Dec 2021 09:46:09 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20211208004609epcas2p11185399272e994c19fd8ce8cfd18cc7d~_oQfBPQyX0734207342epcas2p1W;
        Wed,  8 Dec 2021 00:46:09 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211208004609epsmtrp23800cfb081f75e0f89e907f745c5c866~_oQfAlRvh0662306623epsmtrp2W;
        Wed,  8 Dec 2021 00:46:09 +0000 (GMT)
X-AuditID: b6c32a45-447ff7000000ca37-f7-61b000510b9f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        92.35.08738.14000B16; Wed,  8 Dec 2021 09:45:53 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211208004608epsmtip26c45c47c6195ea25816698d6d8e52a78~_oQe0twCS2024820248epsmtip2x;
        Wed,  8 Dec 2021 00:46:08 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH] arm64: dts: exynosautov9: convert serial_0 for USI
Date:   Wed,  8 Dec 2021 09:39:46 +0900
Message-Id: <20211208003946.139423-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphk+LIzCtJLcpLzFFi42LZdljTVDeQYUOiwbTPEhaX92tbzD9yjtVi
        49sfTBabHl9jtZhxfh+TReveI+wWz/v2MTmwe8xq6GXz2LSqk83jzrU9bB6bl9R79G1Zxejx
        eZNcAFtUtk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO
        0CVKCmWJOaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMj
        U6DChOyMO3c3shRsEat4s/w1awPjJqEuRk4OCQETibZdP5i7GLk4hAR2MEqc6JoL5XxilPjY
        dBTK+cwocfPCPGaYlgd7n0EldjFKHFr7mh3C+cgocXvLQ7AqNgFdiS3PXzGC2CIC8RJX17ey
        gRQxCxxglFix6jcrSEJYwFlibfdxNhCbRUBV4vTU32DNvAL2Ens+fWWEWCcvsf/gWai4oMTJ
        mU9YQGxmoHjz1tlgZ0gIXGKXeDf7AztEg4vEjY8NrBC2sMSr41ug4lISn9/tZYNo6GaUaH30
        HyqxmlGis9EHwraX+DV9C1AzB9AGTYn1u/RBTAkBZYkjt6D28kl0HP7LDhHmlehogwakusSB
        7dNZIGxZie45n6Eu8JDYcGQt2PlCArES03ZsY5rAKD8LyTezkHwzC2HvAkbmVYxiqQXFuemp
        xUYFhvBoTc7P3cQITo5arjsYJ7/9oHeIkYmD8RCjBAezkgiv2sO1iUK8KYmVValF+fFFpTmp
        xYcYTYHhO5FZSjQ5H5ie80riDU0sDUzMzAzNjUwNzJXEeT/4T08UEkhPLEnNTk0tSC2C6WPi
        4JRqYDpvvipegqGk9PSmPY+fvBe+1tTsUpF9/fLtrk1MMc7Zu/vnhwo/ZQ++Y3J3/ouUlNby
        Q/fluFr4Jhb9CXkZuavm111O58zbOcsKKzSVp37v/dWblZBa/m8r7/c9T1LUCuS23W7LqOMt
        ctvhKKt3SKKJ57m0vW8jY/6pGMXHEw1vWkUJzi3Y7hLuu9VI48fS+Q/ebDqyI/GZyavj02ad
        EP6z69Dxm3sOcYbLX+lJFk93PzxbLKz92dHpOpeLdylpzZuZ+qZW7/wK96VMSf++eVmtWnNV
        PVV1Xfmi8xOO/6qccMj2tLvHs+svuH48ENmfuDU849vcOQG/fq9ois3jWW/X+Zxl56aZLLaM
        Ea5v9i5QYinOSDTUYi4qTgQAutX1uhcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMLMWRmVeSWpSXmKPExsWy7bCSvK4jw4ZEgzOreS0u79e2mH/kHKvF
        xrc/mCw2Pb7GajHj/D4mi9a9R9gtnvftY3Jg95jV0MvmsWlVJ5vHnWt72Dw2L6n36NuyitHj
        8ya5ALYoLpuU1JzMstQifbsErow7dzeyFGwRq3iz/DVrA+MmoS5GTg4JAROJB3ufMXcxcnEI
        CexglFi06wILREJW4tm7HewQtrDE/ZYjrBBF7xklbi5ZwAaSYBPQldjy/BUjiC0iEC8xc9MG
        NpAiZoEjjBKPpneAFQkLOEus7T4OZrMIqEqcnvqbGcTmFbCX2PPpKyPEBnmJ/QfPQsUFJU7O
        fAJ2BTNQvHnrbOYJjHyzkKRmIUktYGRaxSiZWlCcm55bbFhglJdarlecmFtcmpeul5yfu4kR
        HK5aWjsY96z6oHeIkYmD8RCjBAezkgiv2sO1iUK8KYmVValF+fFFpTmpxYcYpTlYlMR5L3Sd
        jBcSSE8sSc1OTS1ILYLJMnFwSjUw2fDdmcQz89nGkFtx13yiVp998ZP/eZh+37cS1cKIC5VZ
        0bFzzzpyPZqXF8tywHE268SFE7i/d+7f+iF6Tc5Jtu+cIpMtzQ4usNy7/ltig9/FqmJGx7NL
        N6ib/07cs03zqktU32en6cmVhhtkW6sPCiyTyj2fdmpFfUPrrSDb3byyF2cqTL3evtHi7pOU
        mKot2vOUu4T4P9+tFMnsLI45mrLe18WnMcrytWzwpag191ZOvTTdwCYyY/rhf//nLtqXll4f
        pbZ1lfKZowuCHuRczOu9daXXcd8x3zlmnMV7jiVvvpyxSyx6V/OZyUevXQ7Z2d7+4UMqD6fe
        a5WE/yf5uV0Pa05yZdgxe0OAvLDPFSWW4oxEQy3mouJEAGbS5UbGAgAA
X-CMS-MailID: 20211208004609epcas2p11185399272e994c19fd8ce8cfd18cc7d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211208004609epcas2p11185399272e994c19fd8ce8cfd18cc7d
References: <CGME20211208004609epcas2p11185399272e994c19fd8ce8cfd18cc7d@epcas2p1.samsung.com>
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
 .../boot/dts/exynos/exynosautov9-sadk.dts     |  4 +++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 36 ++++++++++++++-----
 2 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
index ef46d7aa6e28..6cc903443809 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
@@ -41,6 +41,10 @@ ufs_0_fixed_vcc_reg: regulator-0 {
 	};
 };
 
+&usi_0 {
+	status = "okay";
+};
+
 &serial_0 {
 	status = "okay";
 };
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

