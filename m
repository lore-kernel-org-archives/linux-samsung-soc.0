Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F067C48BE0
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Jun 2021 10:02:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65A3F613D9
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Jun 2021 10:02:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbhFKKET (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Jun 2021 06:04:19 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36295 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhFKKEL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Jun 2021 06:04:11 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210611100211euoutp02c42540c36d76ac4dd266372ebb9abbac~HfulykYbf0661306613euoutp023
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jun 2021 10:02:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210611100211euoutp02c42540c36d76ac4dd266372ebb9abbac~HfulykYbf0661306613euoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1623405731;
        bh=DjmZWdnFfFqC9Q2lLHxyn+VU0DlPp2vCtfc1zrda64U=;
        h=From:To:Cc:Subject:Date:References:From;
        b=NQut6wG3o2lKn/wOtmRAGBm7wnDbMjKGvahuIvKD6T/8pR5IpJTzMGZzGxKXvY+NN
         AImjRSDiy11yVZlbMnQ/4t3WVHxr0M2cY80UFevZxM18MDpvCNwocmR1xXXprOTPO3
         MXR+luuQyw27LnnTCi26BhT5ccwYsr0p4r1S822U=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210611100211eucas1p2dab3f6ceb89e9e70b674b78c8b46fbc0~Hfulbur693189931899eucas1p2b;
        Fri, 11 Jun 2021 10:02:11 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 06.DB.09444.3A433C06; Fri, 11
        Jun 2021 11:02:11 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210611100210eucas1p148dd8d15360269eeb8fb9eace94ba3b4~Hfuk5C7dC2326223262eucas1p18;
        Fri, 11 Jun 2021 10:02:10 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210611100210eusmtrp10e07a1610d79674906388d2be0081c71~Hfuk4RRtb2112621126eusmtrp1S;
        Fri, 11 Jun 2021 10:02:10 +0000 (GMT)
X-AuditID: cbfec7f4-dd5ff700000024e4-d5-60c334a327be
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id AF.3D.08705.2A433C06; Fri, 11
        Jun 2021 11:02:10 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210611100210eusmtip1c4c45684116c67ed0e731ec79598acb4~Hfukig7E52317423174eusmtip1O;
        Fri, 11 Jun 2021 10:02:10 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: exynos_defconfig: restore framebuffer support
Date:   Fri, 11 Jun 2021 12:02:04 +0200
Message-Id: <20210611100204.6240-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsWy7djP87qLTQ4nGKxfK2yxccZ6Vovz5zew
        W8w4v4/JYu2Ru+wOLB6bVnWyefRtWcXo8XmTXABzFJdNSmpOZllqkb5dAlfGrfXTmQoa2StW
        LVrB3sDYydbFyMkhIWAicav/OWsXIxeHkMAKRon2pk3MEM4XRonmb82MEM5nRomvF98wdTFy
        gLV8eRgDEV/OKLFoxWSEjkvtM5lB5rIJGEp0ve0C2yEioCrxuW0BO0gRs0Afo8T1vXPBioQF
        nCV+/53JCmKzABW1vO9iAdnAK2AjcftSFMR98hKrNxwAWyAhcI9dYu66s8wQV7hInHtaCVEj
        LPHq+BZ2CFtG4vTkHhaI+mZGiYfn1rJDOD2MEpebZjBCVFlL3Dn3iw1kELOApsT6XfoQMx0l
        nm1WhDD5JG68FQQpZgYyJ22bDrWVV6KjTQhihprErOPr4LYevHCJGcL2kOjZtw8sLiQQK/Fs
        8SKWCYxysxBWLWBkXMUonlpanJueWmyUl1quV5yYW1yal66XnJ+7iREY16f/Hf+yg3H5q496
        hxiZOBgPMUpwMCuJ8O5ceShBiDclsbIqtSg/vqg0J7X4EKM0B4uSOG/SljXxQgLpiSWp2amp
        BalFMFkmDk6pBiaT+yuVGw9FVsp4rJWO/ZElFrlhkmVextNT38++f/PX/JKDYMek5X1K7Dd2
        mnJ2H/5xaAHfzAafHn8zeT+PmbtOqxzcZNj01bNOw/G1kH1U+SKZhgP/84qD9s7LeJZfb916
        bFG/b8gDB33lK+cYwoI2H6neZfzymLLn7/rb2pN3S6yy3sclPMvxxO1n6+Y83VcgKMzaMm9T
        7BtHsc8F8+tVtzOo/l81Uypwe8KJlABmNvfelJW71ir5nJKKr31/U/JdfSjr93lTp775MCHx
        ntDCa6FS3Cmbc9QLj3PxvrPO+utS2OzDu7aZS/HjvcjNX+fE+HIpn7U8FP5u8oqVhgIie6/+
        eHR5jvytMl2roL9KLMUZiYZazEXFiQD45C9OWgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHLMWRmVeSWpSXmKPExsVy+t/xu7qLTA4nGGz9oWOxccZ6Vovz5zew
        W8w4v4/JYu2Ru+wOLB6bVnWyefRtWcXo8XmTXABzlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWe
        kYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7GrfXTmQoa2StWLVrB3sDYydbFyMEhIWAi8eVh
        TBcjF4eQwFJGif7njxm7GDmB4jISJ6c1sELYwhJ/rnWxQRR9YpToXvSMCSTBJmAo0fUWJMHJ
        ISKgKvG5bQE7SBGzwARGifOdM8ASwgLOEr//zgSbxAJU1PK+iwVkM6+AjcTtS1EQC+QlVm84
        wDyBkWcBI8MqRpHU0uLc9NxiQ73ixNzi0rx0veT83E2MwIDaduzn5h2M81591DvEyMTBeIhR
        goNZSYR358pDCUK8KYmVValF+fFFpTmpxYcYTYHWTWSWEk3OB4Z0Xkm8oZmBqaGJmaWBqaWZ
        sZI479a5a+KFBNITS1KzU1MLUotg+pg4OKUamBg/rlermXr6n8IlxkOtCmkNLjJq078WGL5/
        o8OllTblwbfCdR/k3X/tOmsy6arRJbaDX7PnXjm7yebUyQSjn6unMGy82XJq+YMZmxap7RLv
        9proxfY5l+GxUFJXUeWdV4djv3F2+y7urpQz3sSr/vJIYdueE2/8Tk9sKSvml97bEPtFQ+PF
        4ukxPwKuqiuECCXnsAk+nr/xcOOCorZkjraSadvZ2q6E73ze1KH4SnXumlrdieFH81L2ljwK
        l2x1unPkh798o8btCxtOy6+9umFOv2PWPwaVpHe7GCdNOyPDtOX3R48tzur3525SC3eSc5Ix
        7qvninwma7zQ69I2Uy5N/krLRka2wuPLJ4RsalZiKc5INNRiLipOBADUSy2tsQIAAA==
X-CMS-MailID: 20210611100210eucas1p148dd8d15360269eeb8fb9eace94ba3b4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210611100210eucas1p148dd8d15360269eeb8fb9eace94ba3b4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210611100210eucas1p148dd8d15360269eeb8fb9eace94ba3b4
References: <CGME20210611100210eucas1p148dd8d15360269eeb8fb9eace94ba3b4@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Commit f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
changed the Kconfig dependencies, so COFNIG_FB is no longer selected in
defconfigs. Restore support for it in exynos_defconfig, because most
Exynos platforms had graphical console running on framebuffer device
emulated on the Exynos DRM drivers.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 513f56b3c059..f4e1873912a3 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -236,6 +236,7 @@ CONFIG_DRM_SII9234=y
 CONFIG_DRM_TOSHIBA_TC358764=y
 CONFIG_DRM_LIMA=y
 CONFIG_DRM_PANFROST=y
+CONFIG_FB=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_PLATFORM=y
 CONFIG_BACKLIGHT_PWM=y
-- 
2.17.1

