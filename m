Return-Path: <SRS0=uzqe=4O=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E0CC4BA0E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 Feb 2020 10:57:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D48024689
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 Feb 2020 10:57:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="s83xa8hM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbgBZK5X (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 Feb 2020 05:57:23 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36535 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbgBZK5W (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 05:57:22 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200226105721euoutp02623818c166058c452adbce15d113a245~27pSqfSj01466714667euoutp02_
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2020 10:57:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200226105721euoutp02623818c166058c452adbce15d113a245~27pSqfSj01466714667euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582714641;
        bh=yhCb4nqJK2pQpRkTNXZwaxxOlqjh9ZFDb+zRuAVe9Ps=;
        h=From:To:Cc:Subject:Date:References:From;
        b=s83xa8hMa9kbDO0Ll/rclUI/Iu6r/wfaAjsndKztGocmCbymutFgN7qS4lBuryXku
         y2435zyU21uetSWhuyo+CDmvzZ/55WBIXNR3hRFVMpZk+i3nemjREhQ9zQL6A3NgKS
         /5z2WB1eGl4Ng1uBlPvxqugd5Mj7IVs4KLsJ1VCk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200226105721eucas1p263cc2d8ff47f0f2279cebff0108c3e20~27pSaxaZs2934229342eucas1p2P;
        Wed, 26 Feb 2020 10:57:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 99.35.60698.01F465E5; Wed, 26
        Feb 2020 10:57:20 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200226105720eucas1p183b65dcbc29d25cc8599d7e2ca050e01~27pR9IGX32552825528eucas1p1p;
        Wed, 26 Feb 2020 10:57:20 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200226105720eusmtrp1d1034d9e97406ff01c1e601ad5833fcb~27pR8mQHL1379013790eusmtrp1G;
        Wed, 26 Feb 2020 10:57:20 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-2a-5e564f10d3ae
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id D0.24.08375.01F465E5; Wed, 26
        Feb 2020 10:57:20 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200226105720eusmtip252a85da1a2ad008c5970db067c8e6cfc~27pRqu8G20223702237eusmtip2A;
        Wed, 26 Feb 2020 10:57:20 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: exynos_defconfig: Add more drivers for GalaxyS3/Trats2
Date:   Wed, 26 Feb 2020 11:57:10 +0100
Message-Id: <20200226105710.18023-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRmVeSWpSXmKPExsWy7djP87oC/mFxBhPWW1tsnLGe1eL8+Q3s
        FjPO72OyWHvkLrsDi8emVZ1sHn1bVjF6fN4kF8AcxWWTkpqTWZZapG+XwJWxu+sbU0Ebd0X3
        zT3MDYyXOLsYOTkkBEwk3n9eytLFyMUhJLCCUaJj0U4WkISQwBdGiUdvkiESnxkleo5dZoXp
        aJl5jBEisZxRYsXs6awQDlDHvBc72EGq2AQMJbredrGB2CICqhKf2xawgxQxC/QxSlzfO5e5
        i5GDQ1jAR2LdSwGQGhagmjszXoCt5hWwlTj94z0TxDZ5idUbDjCD9EoIbGCTmH90BVTCRaJz
        +wYWCFtY4tXxLewQtozE6ck9LBANzYwSD8+tZYdwehglLjfNYISospa4c+4XG8gVzAKaEut3
        6UOEHSV2/drLAhKWEOCTuPFWECTMDGRO2jadGSLMK9HRJgRRrSYx6/g6uLUHL1xihrA9JH53
        n4AGY6zEvJMzGScwys1C2LWAkXEVo3hqaXFuemqxcV5quV5xYm5xaV66XnJ+7iZGYGyf/nf8
        6w7GfX+SDjEKcDAq8fC+4AyNE2JNLCuuzD3EKMHBrCTCu/ErUIg3JbGyKrUoP76oNCe1+BCj
        NAeLkjiv8aKXsUIC6YklqdmpqQWpRTBZJg5OqQbGBbsdr/Za3JsmG1jimmW+3yF2x2Wl+nyJ
        xmlCfbt/qZ2Vm2U088KBG135O9YIR5904Nd1M02Y+HXxjx8TDGzNnKoe90yXrJ22vT1yt3x+
        ruM9R9U/8b+36C2duGl5Rwfz+7f6mxXiOFJe2p3xyHPlW95X9enVGeXdKhddZh8WfTTvUPni
        b4FflViKMxINtZiLihMBr+XDXOkCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDLMWRmVeSWpSXmKPExsVy+t/xe7oC/mFxBgd+yltsnLGe1eL8+Q3s
        FjPO72OyWHvkLrsDi8emVZ1sHn1bVjF6fN4kF8AcpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFn
        ZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJexu+sbU0Ebd0X3zT3MDYyXOLsYOTkkBEwkWmYe
        Y+xi5OIQEljKKPG/rY8NIiEjcXJaAyuELSzx51oXG0TRJ0aJC0t2sIMk2AQMJbredoE1iAio
        SnxuW8AOUsQsMIFR4nznDKAEB4ewgI/EupcCIDUsQDV3ZrxgAbF5BWwlTv94zwSxQF5i9YYD
        zBMYeRYwMqxiFEktLc5Nzy021CtOzC0uzUvXS87P3cQIDKltx35u3sF4aWPwIUYBDkYlHt4X
        nKFxQqyJZcWVuYcYJTiYlUR4N34FCvGmJFZWpRblxxeV5qQWH2I0BVo+kVlKNDkfGO55JfGG
        pobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYKyKO99cYlxZ33FdRVrF/
        firkw8wpJVWemYvu8zeXrd97eWe814kWBcHrCxLOPK/cx8h2soTjBXO7vffCMPMlT4pXfHvr
        d/LKl/xj+dfEiptVnzxsmHgvT/Ad5978Q/83cdhcX75xGXONQ82EUs77bb9OzS/uKz8dxnDp
        08FlR+9Mc3917eqKx0osxRmJhlrMRcWJAEmvM24/AgAA
X-CMS-MailID: 20200226105720eucas1p183b65dcbc29d25cc8599d7e2ca050e01
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200226105720eucas1p183b65dcbc29d25cc8599d7e2ca050e01
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200226105720eucas1p183b65dcbc29d25cc8599d7e2ca050e01
References: <CGME20200226105720eucas1p183b65dcbc29d25cc8599d7e2ca050e01@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Enable drivers for S5K6A3 and S5C73M3 camera sensors, AAT1290 flash LED,
Midas-TouchKey and BRCMFMAC SDIO-WIFI modules used on Samsung Galaxy S3
and Trats2 boards.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index c92cab0cfee3..ff82f5d9d71e 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -112,11 +112,13 @@ CONFIG_USB_LAN78XX=m
 CONFIG_USB_USBNET=y
 CONFIG_USB_NET_SMSC75XX=y
 CONFIG_USB_NET_SMSC95XX=y
+CONFIG_BRCMFMAC=m
 CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_SDIO=m
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SAMSUNG=y
+CONFIG_KEYBOARD_TM2_TOUCHKEY=y
 CONFIG_KEYBOARD_CROS_EC=y
 # CONFIG_MOUSE_PS2 is not set
 CONFIG_MOUSE_CYAPA=y
@@ -205,6 +207,9 @@ CONFIG_V4L_TEST_DRIVERS=y
 CONFIG_VIDEO_VIVID=m
 CONFIG_CEC_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_SAMSUNG_S5P_CEC=m
+# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
+CONFIG_VIDEO_S5K6A3=m
+CONFIG_VIDEO_S5C73M3=m
 CONFIG_DRM=y
 CONFIG_DRM_EXYNOS=y
 CONFIG_DRM_EXYNOS_FIMD=y
@@ -277,6 +282,7 @@ CONFIG_MMC_DW_EXYNOS=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_CLASS_FLASH=y
+CONFIG_LEDS_AAT1290=y
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_PWM=y
 CONFIG_LEDS_MAX77693=y
-- 
2.17.1

