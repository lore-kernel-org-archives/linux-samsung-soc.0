Return-Path: <SRS0=OVUx=EK=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2DBC2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 10:51:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4D0C20786
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 10:51:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728508AbgKDKvm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Nov 2020 05:51:42 -0500
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:50410 "EHLO
        wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728066AbgKDKvm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 05:51:42 -0500
Received: from [2003:a:659:3f00:1e6f:65ff:fe31:d1d5] (helo=hermes.fivetechno.de); authenticated
        by wp126.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1kaFjc-0007qg-O5; Wed, 04 Nov 2020 11:09:44 +0100
X-Virus-Scanned: by amavisd-new 2.11.1 using newest ClamAV at
        linuxbbg.five-lan.de
Received: from odroid.fritz.box (HOSTNAME.fritz.box [192.168.34.133])
        (authenticated bits=0)
        by hermes.fivetechno.de (8.15.2/8.14.5/SuSE Linux 0.8) with ESMTPSA id 0A4A9hja008724
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Wed, 4 Nov 2020 11:09:44 +0100
From:   Markus Reichl <m.reichl@fivetechno.de>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Markus Reichl <m.reichl@fivetechno.de>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: exynos: Assign a fixed index to mmc devices on ODROID XU3/4 boards
Date:   Wed,  4 Nov 2020 11:08:53 +0100
Message-Id: <20201104100855.2337-1-m.reichl@fivetechno.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;m.reichl@fivetechno.de;1604487101;30f1027a;
X-HE-SMSGID: 1kaFjc-0007qg-O5
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Recently introduced async probe on mmc devices can shuffle block IDs.
Pin them to fixed values to ease booting in evironments where UUIDs
are not practical. Use newly introduced aliases for mmcblk devices from [1].

[1]
https://patchwork.kernel.org/patch/11747669/

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
---
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index e35af40a55cb..91d2840ac8ca 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -13,6 +13,11 @@
 #include "exynos5422-odroid-core.dtsi"
 
 / {
+	aliases {
+		mmc0 = &mmc_2;
+		mmc1 = &mmc_0;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
-- 
2.20.1

