Return-Path: <SRS0=ufbU=D3=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D733FC43467
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Oct 2020 12:03:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CD0322253
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Oct 2020 12:03:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394022AbgJTMC4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Oct 2020 08:02:56 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:51956 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393962AbgJTMAT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Oct 2020 08:00:19 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 6F67D803073D;
        Tue, 20 Oct 2020 12:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Sg3fMQROG6FQ; Tue, 20 Oct 2020 15:00:17 +0300 (MSK)
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
Subject: [PATCH 04/29] arm: dts: exynos: Correct DWC USB3 compatible string
Date:   Tue, 20 Oct 2020 14:59:34 +0300
Message-ID: <20201020115959.2658-5-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Syonpsys IP cores are supposed to be defined with "snps" vendor-prefix.
Use it instead of the deprecated "synopsys" one.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 arch/arm/boot/dts/exynos5250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index e3dbe4166836..6daeba7d6b49 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -630,7 +630,7 @@ usb_dwc3 {
 			ranges;
 
 			usbdrd_dwc3: dwc3@12000000 {
-				compatible = "synopsys,dwc3";
+				compatible = "snps,dwc3";
 				reg = <0x12000000 0x10000>;
 				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usbdrd_phy 0>, <&usbdrd_phy 1>;
-- 
2.27.0

