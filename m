Return-Path: <SRS0=ufbU=D3=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9763AC54FB2
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Oct 2020 12:01:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 599C322283
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Oct 2020 12:01:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404863AbgJTMBo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Oct 2020 08:01:44 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:52058 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394036AbgJTMA1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Oct 2020 08:00:27 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id B054F8030171;
        Tue, 20 Oct 2020 12:00:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8ch5ML-j4Lm6; Tue, 20 Oct 2020 15:00:25 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kukjin Kim <kgene@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>
Subject: [PATCH 19/29] arm: dts: exynos: Harmonize DWC USB3 DT nodes name
Date:   Tue, 20 Oct 2020 14:59:49 +0300
Message-ID: <20201020115959.2658-20-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

In accordance with the DWC USB3 bindings the corresponding node
name is suppose to comply with the Generic USB HCD DT schema, which
requires the USB nodes to have the name acceptable by the regexp:
"^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
named.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 arch/arm/boot/dts/exynos5250.dtsi | 2 +-
 arch/arm/boot/dts/exynos54xx.dtsi | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 6daeba7d6b49..4983f8192822 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -629,7 +629,7 @@ usb_dwc3 {
 			#size-cells = <1>;
 			ranges;
 
-			usbdrd_dwc3: dwc3@12000000 {
+			usbdrd_dwc3: usb@12000000 {
 				compatible = "snps,dwc3";
 				reg = <0x12000000 0x10000>;
 				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index 8aa5117e58ce..339243d19a80 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -148,7 +148,7 @@ usbdrd3_0: usb3-0 {
 			#size-cells = <1>;
 			ranges;
 
-			usbdrd_dwc3_0: dwc3@12000000 {
+			usbdrd_dwc3_0: usb@12000000 {
 				compatible = "snps,dwc3";
 				reg = <0x12000000 0x10000>;
 				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
@@ -170,7 +170,7 @@ usbdrd3_1: usb3-1 {
 			#size-cells = <1>;
 			ranges;
 
-			usbdrd_dwc3_1: dwc3@12400000 {
+			usbdrd_dwc3_1: usb@12400000 {
 				compatible = "snps,dwc3";
 				reg = <0x12400000 0x10000>;
 				phys = <&usbdrd_phy1 0>, <&usbdrd_phy1 1>;
-- 
2.27.0

