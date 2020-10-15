Return-Path: <SRS0=zMHd=DW=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6065C43457
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 15 Oct 2020 18:21:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DEE5221EB
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 15 Oct 2020 18:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602786060;
	bh=VYr8Sqzwnfa56rvjh8Ds51QFdE9eDRUJ9RiTDEzNIuk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=QL7HozUv4JywTb6owWPVY/S/LUPlorN7xbJPTWiOl9HTbKHCKpOUJUUFUFfY0ix2h
	 SNy//jdU7Ob56SNfUchGoU+fOpe7pMyt6dfxVPaf4HBgW6MxVeZgSE5bX2+AhkI4Zd
	 mdIlkkb88suKVu7zQxJwD3cOGdhWxP4lZXP0Xlkg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732943AbgJOSU7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 15 Oct 2020 14:20:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:56372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732918AbgJOSU7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 15 Oct 2020 14:20:59 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D73AB22255;
        Thu, 15 Oct 2020 18:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602786058;
        bh=VYr8Sqzwnfa56rvjh8Ds51QFdE9eDRUJ9RiTDEzNIuk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rywNHvPTOEuOipVbVbmJpSY43ma9l9ixLchRWsaQm7dlZPFEYDShSd0F9Q9O+aKp7
         qxPmKQWem2PMabnrrfo01vSar5bF7UhrXTUJTP70KDBX1CT05Vz151vGjgaYNPoq3x
         19Drpy3XxnJqKmGyNFI3JiYyWP4/8te9pirJXQ8E=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Gabriel Ribba Esteva <gabriel.ribbae@gmail.com>,
        stable@vger.kernel.org
Subject: [PATCH 2/4] ARM: dts: exynos: fix USB 3.0 VBUS control and over-current pins on Exynos5410
Date:   Thu, 15 Oct 2020 20:20:42 +0200
Message-Id: <20201015182044.480562-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201015182044.480562-1-krzk@kernel.org>
References: <20201015182044.480562-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The VBUS control (PWREN) and over-current pins of USB 3.0 DWC3
controllers are on Exynos5410 regular GPIOs.  This is different than for
example on Exynos5422 where these are special ETC pins with proper reset
values (pulls, functions).

Therefore these pins should be configured to enable proper USB 3.0
peripheral and host modes.  This also fixes over-current warning:

    [    6.024658] usb usb4-port1: over-current condition
    [    6.028271] usb usb3-port1: over-current condition

Fixes: cb0896562228 ("ARM: dts: exynos: Add USB to Exynos5410")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5410-pinctrl.dtsi | 28 +++++++++++++++++++++++
 arch/arm/boot/dts/exynos5410.dtsi         |  4 ++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5410-pinctrl.dtsi b/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
index e5d0a2a4f648..d0aa18443a69 100644
--- a/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
@@ -560,6 +560,34 @@ gpk3: gpk3 {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
+
+	usb3_1_oc: usb3-1-oc {
+		samsung,pins = "gpk2-4", "gpk2-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	usb3_1_vbusctrl: usb3-1-vbusctrl {
+		samsung,pins = "gpk2-6", "gpk2-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	usb3_0_oc: usb3-0-oc {
+		samsung,pins = "gpk3-0", "gpk3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	usb3_0_vbusctrl: usb3-0-vbusctrl {
+		samsung,pins = "gpk3-2", "gpk3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
 };
 
 &pinctrl_2 {
diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index abe75b9e39f5..060b8696d24d 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -390,6 +390,8 @@ &trng {
 &usbdrd3_0 {
 	clocks = <&clock CLK_USBD300>;
 	clock-names = "usbdrd30";
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb3_0_oc>, <&usb3_0_vbusctrl>;
 };
 
 &usbdrd_phy0 {
@@ -401,6 +403,8 @@ &usbdrd_phy0 {
 &usbdrd3_1 {
 	clocks = <&clock CLK_USBD301>;
 	clock-names = "usbdrd30";
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb3_1_oc>, <&usb3_1_vbusctrl>;
 };
 
 &usbdrd_dwc3_1 {
-- 
2.25.1

