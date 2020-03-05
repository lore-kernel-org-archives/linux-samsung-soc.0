Return-Path: <SRS0=g11O=4W=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984F8C3F2CD
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Mar 2020 15:21:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 406102073D
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Mar 2020 15:21:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="nj201T8s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbgCEPVV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Mar 2020 10:21:21 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53930 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726243AbgCEPVU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Mar 2020 10:21:20 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200305152119euoutp01f7aba00cb171796af360cdc01515d967~5caC50-Qy2783727837euoutp01h
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2020 15:21:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200305152119euoutp01f7aba00cb171796af360cdc01515d967~5caC50-Qy2783727837euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1583421679;
        bh=bt7xLz5BTo2Y6L+7t3B71ND6twW9CSFVDvvc2h8PpEI=;
        h=From:To:Cc:Subject:Date:References:From;
        b=nj201T8s7R8WPqa3VeYBwEyeQKZg2Ll9mLSd+JZaiM9qSQX2J/QR0K9dZkEngwbHd
         b32kbT46YeEfjUVr7CZ4MZU4f3cr+pNkzL1xGe8XtDdyAb7EaRRkgGWcVYHTukkMoI
         HEGmS9waiLbLfMH099UnHXxXz4g3j9NsYrVXsN2Q=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200305152118eucas1p106a84b486ed5b972358ae8ee0997aadd~5caCpWxRF1033110331eucas1p1G;
        Thu,  5 Mar 2020 15:21:18 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id A1.C4.60698.EE8116E5; Thu,  5
        Mar 2020 15:21:18 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200305152118eucas1p1fef92cacb91612ee5ddc3e6ffd2378d8~5caCVbu2l1157311573eucas1p17;
        Thu,  5 Mar 2020 15:21:18 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200305152118eusmtrp1e80858c17edfdc35fc9a8357ee8acb04~5caCUwm8P3221932219eusmtrp1a;
        Thu,  5 Mar 2020 15:21:18 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-ee-5e6118ee37bd
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 50.33.07950.EE8116E5; Thu,  5
        Mar 2020 15:21:18 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200305152118eusmtip24cd9518caa807a4a8916d112ee680873~5caB9ot4G2568325683eusmtip2F;
        Thu,  5 Mar 2020 15:21:18 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>,
        Simon Shields <simon@lineageos.org>
Subject: [PATCH] ARM: dts: exynos: Fix regulator node aliasing on
 Midas-based boards
Date:   Thu,  5 Mar 2020 16:21:08 +0100
Message-Id: <20200305152108.20688-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRmVeSWpSXmKPExsWy7djP87rvJBLjDDb/MLDYOGM9q0Xr9cfs
        FufPb2C3mHF+H5PF2iN32S22nLnN5sDmcfRAI7PHplWdbB4t6zexefRtWcXo8XmTXABrFJdN
        SmpOZllqkb5dAlfGitunWAomC1Qc+JXYwHiet4uRk0NCwETi2oNpbF2MXBxCAisYJS6eeckG
        khAS+MIocb/fAiLxmVHiTs9TdpiObbs/s0MkljNKrD26mxXCAepo6r0CVsUmYCjR9bYLbJSI
        gKrE57YFYB3MAq8ZJZZOW8gKkhAWCJN42PyQBcRmASq6//0bWDOvgK3Enb2XWSHWyUus3nCA
        GaRZQuAEm0TPycssEAkXiVWP5zBC2MISr45vgbpPRuL05B4WiIZmRomH59ayQzg9jBKXm2ZA
        dVhL3Dn3C+g+DqCbNCXW79IHMSUEHCWa5jlAmHwSN94KghQzA5mTtk1nhgjzSnS0CUHMUJOY
        dXwd3NaDFy4xQ9geEmsfTmSCBGOsxIbNh5kmMMrNQli1gJFxFaN4amlxbnpqsXFearlecWJu
        cWleul5yfu4mRmACOP3v+NcdjPv+JB1iFOBgVOLhVficECfEmlhWXJl7iFGCg1lJhFfYND5O
        iDclsbIqtSg/vqg0J7X4EKM0B4uSOK/xopexQgLpiSWp2ampBalFMFkmDk6pBsazjq+duBNu
        X9UxX/7Byin7ui1P5izugzdnH8srz9oX3iK72cLxmvhaoZhpJ+euXmG4as3RHytXHr6yYIZG
        fmhYuo1b5r0fOvnbf3FOnrB34hGPoOjiGfseOhv7RkwUW/fLZd/u0x2ztohc+Bzw6+7M7szp
        /Y9OPFqTspzB+eXP3Fs9O9tzH5yerMRSnJFoqMVcVJwIADnFsYD8AgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrALMWRmVeSWpSXmKPExsVy+t/xe7rvJBLjDF42SVlsnLGe1aL1+mN2
        i/PnN7BbzDi/j8li7ZG77BZbztxmc2DzOHqgkdlj06pONo+W9ZvYPPq2rGL0+LxJLoA1Ss+m
        KL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS9jxe1TLAWT
        BSoO/EpsYDzP28XIySEhYCKxbfdn9i5GLg4hgaWMEju2P2eFSMhInJzWAGULS/y51sUGUfSJ
        UWLmjV9sIAk2AUOJrrddYLaIgKrE57YFYJOYBd4ySkxZ84odJCEsECLR0niYCcRmASq6//0b
        WJxXwFbizt7LUBvkJVZvOMA8gZFnASPDKkaR1NLi3PTcYiO94sTc4tK8dL3k/NxNjMDQ23bs
        55YdjF3vgg8xCnAwKvHwKnxOiBNiTSwrrsw9xCjBwawkwitsGh8nxJuSWFmVWpQfX1Sak1p8
        iNEUaPlEZinR5HxgXOSVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCU
        amDU3curyjR9+wq/GUpB20qWyOSy/Om/p8X56OGSY/rfp7K2i7g/XaypbT0vWlDsvvw67iNe
        Hzf1HuHe6CeSeDrwbOPMgN6tlc28tycI3ur+dc/xzL3nXvMnNO9g/ff/YnLnsrrWh0yiMvFP
        uX52lh6NmfQp4+uhEI06DeWZfcIzVM7cP3Tv/b0mJZbijERDLeai4kQAPSFiklMCAAA=
X-CMS-MailID: 20200305152118eucas1p1fef92cacb91612ee5ddc3e6ffd2378d8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200305152118eucas1p1fef92cacb91612ee5ddc3e6ffd2378d8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200305152118eucas1p1fef92cacb91612ee5ddc3e6ffd2378d8
References: <CGME20200305152118eucas1p1fef92cacb91612ee5ddc3e6ffd2378d8@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Commit d4ec0cb05064 ("ARM: dts: exynos: Add support for the
touch-sensitive buttons on Midas family") added a new fixed regulator
("voltage-regulator-6") to base "midas" .dtsi, but it didn't update the
clients of that .dtsi, which define their own fixed regulators starting
from the "voltage-regulator-6". This results in aliasing of the regulator
dt nodes and breaks operation of OLED panel due to lack of power supply.
Fix this by increasing the numbers in the fixed regulator names for those
boards.

Fixes: d4ec0cb05064 ("ARM: dts: exynos: Add support for the touch-sensitive buttons on Midas family")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 4 ++--
 arch/arm/boot/dts/exynos4412-n710x.dts      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
index 31719c079d67..44f97546dd0a 100644
--- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
@@ -33,7 +33,7 @@
 		};
 	};
 
-	lcd_vdd3_reg: voltage-regulator-6 {
+	lcd_vdd3_reg: voltage-regulator-7 {
 		compatible = "regulator-fixed";
 		regulator-name = "LCD_VDD_2.2V";
 		regulator-min-microvolt = <2200000>;
@@ -42,7 +42,7 @@
 		enable-active-high;
 	};
 
-	ps_als_reg: voltage-regulator-7 {
+	ps_als_reg: voltage-regulator-8 {
 		compatible = "regulator-fixed";
 		regulator-name = "LED_A_3.0V";
 		regulator-min-microvolt = <3000000>;
diff --git a/arch/arm/boot/dts/exynos4412-n710x.dts b/arch/arm/boot/dts/exynos4412-n710x.dts
index 98cd1284cd90..4189e1fb204c 100644
--- a/arch/arm/boot/dts/exynos4412-n710x.dts
+++ b/arch/arm/boot/dts/exynos4412-n710x.dts
@@ -13,7 +13,7 @@
 
 	/* bootargs are passed in by bootloader */
 
-	cam_vdda_reg: voltage-regulator-6 {
+	cam_vdda_reg: voltage-regulator-7 {
 		compatible = "regulator-fixed";
 		regulator-name = "CAM_SENSOR_CORE_1.2V";
 		regulator-min-microvolt = <1200000>;
-- 
2.17.1

