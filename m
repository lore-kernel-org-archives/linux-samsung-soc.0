Return-Path: <SRS0=2c9Z=DI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607EBC4727F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  1 Oct 2020 13:53:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1198B2087D
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  1 Oct 2020 13:53:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LujKwJDa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732274AbgJANxO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 1 Oct 2020 09:53:14 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36521 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732263AbgJANxO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Oct 2020 09:53:14 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201001135311euoutp022d522bce900dd8032ab62a6d6848bb28~54rCyz6Zu2991429914euoutp02S
        for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Oct 2020 13:53:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201001135311euoutp022d522bce900dd8032ab62a6d6848bb28~54rCyz6Zu2991429914euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601560391;
        bh=o2OieOCErYwF4vaRZx9PrnzL7vNtwUFAVGR02dGc/tE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LujKwJDawP9qFP9w2ASUmccOJPIJqJDq5DmaJBMf8PUHucvNuEbjtHg6Iai+qig6d
         nZ6r55/o5I0CpipJgjMq17HzTCvI7tsOE8VGm1diUlVpGyb5YDWO7crvM6t8V+FnFb
         MAPUe0MnL6G9QIwqCr8vUJP3DMx+Azpj/bPpZSWQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201001135310eucas1p21de7e324abb657c75d41dd98a18f0755~54rCYnd340349203492eucas1p2s;
        Thu,  1 Oct 2020 13:53:10 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id EC.40.06456.64FD57F5; Thu,  1
        Oct 2020 14:53:10 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201001135310eucas1p273e3799cec0ebb29891c1b7db38685e0~54rCFS3qw1341513415eucas1p2S;
        Thu,  1 Oct 2020 13:53:10 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201001135310eusmtrp10725b48943082a6c944cfa8a3d597182~54rCEjtRc0704807048eusmtrp1E;
        Thu,  1 Oct 2020 13:53:10 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-c7-5f75df46ef94
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 17.09.06017.64FD57F5; Thu,  1
        Oct 2020 14:53:10 +0100 (BST)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20201001135310eusmtip2cf5c25dd545693f9e67423a02487fdb5~54rB6wWf01924719247eusmtip2p;
        Thu,  1 Oct 2020 13:53:10 +0000 (GMT)
From:   =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     b.zolnierkie@samsung.com, m.szyprowski@samsung.com,
        =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH v2] ARM: dts: exynos: Add a placeholder for a MAC address
Date:   Thu,  1 Oct 2020 15:52:54 +0200
Message-Id: <20201001135254.28178-1-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200930143151.23961-1-l.stelmach@samsung.com>
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djPc7pu90vjDU5sULbYOGM9q8X8I+dY
        Lfofv2a2OH9+A7vFzUMrGC02Pb7GanF51xw2ixnn9zFZrD1yl92ide8Rdgcuj02rOtk8Ni+p
        9+jbsorR4/MmuQCWKC6blNSczLLUIn27BK6MdSvvMhWs5ahouHyLpYHxIVsXIyeHhICJxMqu
        84xdjFwcQgIrGCWa101lh3C+MEqc2v0HyvnMKHHu4zNWmJZva99DJZYzSjTuncAE4TxnlJh+
        +hNYFZuAo0T/0hOsIAkRkPaZcycxgSSYBUolth5/ywxiCwt4Sixq2w92CYuAqsTUWyvAmnkF
        rCU+/p4JdaG8RPvy7WA2p4CNxKIfmxkhagQlTs58wgJi8wtoSaxpus4CMV9eonnrbGaQxRIC
        u9glXq86wAgxyEViy8G1ULawxKvjW9ghbBmJ05N7gJo5gOx6icmTzCB6exglts35wQJRYy1x
        59wvNpAaZgFNifW79CHCjhLtV7ewQrTySdx4KwhxAp/EpG3TmSHCvBIdbUIQ1SoS6/r3QA2U
        kuh9tYJxAqPSLCTPzELywCyEXQsYmVcxiqeWFuempxYb5qWW6xUn5haX5qXrJefnbmIEpp/T
        /45/2sH49VLSIUYBDkYlHt6MQ6XxQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1J
        LT7EKM3BoiTOa7zoZayQQHpiSWp2ampBahFMlomDU6qB0XfGX1c+Q+YZM/vtWu53PCo7fYr/
        2oeu8wUu91lcjkbrdopvVD/EpCLBIDFLaUd8g/fp40tWfzztvsyMVd+t/5672rFje1S/C37q
        WbcqfJHZE904AUbTj7tesXixv+jX3mnlmrRjbm3y818LDcVNJvdK+uvLxxn9E7srkcOlYPk9
        zLHveFS2EktxRqKhFnNRcSIAwiYP+TsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRmVeSWpSXmKPExsVy+t/xe7pu90vjDWZO4LfYOGM9q8X8I+dY
        Lfofv2a2OH9+A7vFzUMrGC02Pb7GanF51xw2ixnn9zFZrD1yl92ide8Rdgcuj02rOtk8Ni+p
        9+jbsorR4/MmuQCWKD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSc
        zLLUIn27BL2MdSvvMhWs5ahouHyLpYHxIVsXIyeHhICJxLe179m7GLk4hASWMkrceTETyOEA
        SkhJrJybDlEjLPHnWhcbRM1TRokLF/pYQBJsAo4S/UtPsILYIgI/GSW2nXUE6WUWKJd4cTAQ
        JCws4CmxqG0/2C4WAVWJqbdWgJXzClhLfPw9E+oGeYn25dvBbE4BG4lFPzYzgowRAqpZsjEP
        olxQ4uTMJywQ09Ul1s8TAgnzC2hJrGm6DnYMM9CU5q2zmScwCs1C0jELoWMWkqoFjMyrGEVS
        S4tz03OLjfSKE3OLS/PS9ZLzczcxAqNs27GfW3Ywdr0LPsQowMGoxMMrcKA0Xog1say4MvcQ
        owQHs5IIr9PZ03FCvCmJlVWpRfnxRaU5qcWHGE2BvpzILCWanA9MAHkl8YamhuYWlobmxubG
        ZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhi1Cj+e0JZVf35dMHXq7EluRU3B94SruYr2
        6X1eoOX8a/+7/gNFzukv73N99WE66HBYe2nkjGUahXM+3yuPKY2o4Nr1YDrrhMN3gi5Ge7jv
        N3l9SMDczrY75tA/kR7ZTZ8W/XuYd0RCndXuilyBhuqGAzOmVPBZLLs2LbSdO5clcO4v0bc6
        /YFKLMUZiYZazEXFiQDgwfYxyAIAAA==
X-CMS-MailID: 20201001135310eucas1p273e3799cec0ebb29891c1b7db38685e0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201001135310eucas1p273e3799cec0ebb29891c1b7db38685e0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201001135310eucas1p273e3799cec0ebb29891c1b7db38685e0
References: <20200930143151.23961-1-l.stelmach@samsung.com>
        <CGME20201001135310eucas1p273e3799cec0ebb29891c1b7db38685e0@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add a placeholder for a MAC address. A bootloader may fill it
to set the MAC address and override EEPROM settings.

Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
Changes in v2:
 - use local-mac-address and leave mac-address to be added by a bootloader

 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index db0bc17a667b..d0f6ac5fa79d 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -70,3 +70,21 @@ &pwm {
 &usbdrd_dwc3_1 {
 	dr_mode = "peripheral";
 };
+
+&usbhost2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub@1 {
+		compatible = "usb8087,0024";
+		reg = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethernet: usbether@1 {
+			compatible = "usb0c45,6310";
+			reg = <1>;
+			local-mac-address = [00 00 00 00 00 00]; /* Filled in by a bootloader */
+		};
+	};
+};
-- 
2.26.2

