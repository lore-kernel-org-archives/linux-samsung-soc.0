Return-Path: <SRS0=a64Z=4G=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A3BFC34031
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 18 Feb 2020 07:43:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9DDD22527
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 18 Feb 2020 07:43:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QvXGBxbR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbgBRHnM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 18 Feb 2020 02:43:12 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50558 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgBRHnM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Feb 2020 02:43:12 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200218074310euoutp0162261bffda5ebab92b33e8f4b5c1d609~0b1d-wioe0431104311euoutp01l
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Feb 2020 07:43:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200218074310euoutp0162261bffda5ebab92b33e8f4b5c1d609~0b1d-wioe0431104311euoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582011790;
        bh=7kA50qvGGXqvviozwVyU2lbIFhMhk+GxUZe/VR7EPGg=;
        h=From:To:Cc:Subject:Date:References:From;
        b=QvXGBxbRZbO3kcFnCeeQDTCV2aWSm/txAesTas+xE1FReUR+T2yJk+s1SOTXu/VvK
         leMn0j1AOg0Z+9mtKzy6HszIVEdEuszPrQt9oj5k2DGoMxHcW/D7x9Ql9OzXzY5csj
         pfh8Zzwsgdsw76wcIPSRC12y9Jv1tysAzG2MUAig=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200218074310eucas1p194d346baa216e7313e3d1ff6f7b188a1~0b1d2TqKg0697406974eucas1p18;
        Tue, 18 Feb 2020 07:43:10 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 45.AD.60698.E859B4E5; Tue, 18
        Feb 2020 07:43:10 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200218074310eucas1p288fe322bfadcff6025aadf7b6d51ffc2~0b1doPvZ_1510815108eucas1p2Z;
        Tue, 18 Feb 2020 07:43:10 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200218074310eusmtrp1545f957e89acfff85b2ad921772712ab~0b1dntqpZ0618206182eusmtrp1o;
        Tue, 18 Feb 2020 07:43:10 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-d5-5e4b958e299d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 9E.2F.07950.E859B4E5; Tue, 18
        Feb 2020 07:43:10 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200218074309eusmtip2bda4f4d805bebae29dd5f94e75a2e216~0b1dSaUEn2727227272eusmtip20;
        Tue, 18 Feb 2020 07:43:09 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: exynos_defconfig: Enable SquashFS and increase RAM
 block device size
Date:   Tue, 18 Feb 2020 08:43:06 +0100
Message-Id: <20200218074306.16824-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRmVeSWpSXmKPExsWy7djPc7p9U73jDDruyVtsnLGe1eL8+Q3s
        FjPO72OyWHvkLrsDi8emVZ1sHn1bVjF6fN4kF8AcxWWTkpqTWZZapG+XwJXxYq14wQSOirdt
        JxkbGJvYuxg5OSQETCQmPnjJ2MXIxSEksIJR4vC0hUwQzhdGiS2zvkBlPjNKfNh8n7mLkQOs
        5UiLLER8OaPE7A/LWOA6njx5AjaXTcBQouttFxuILSKgKvG5bQE7SBGzQB+jxPW9c5lBEsIC
        MRL/pq1iArFZgIp+bdvGCGLzCthKNK/ewApxoLzE6g0HmEGaJQQ2sEns+7KMFeIMF4mek4YQ
        NcISr45vgXpIRuL05B4WiPpmRomH59ayQzg9jBKXm2YwQlRZS9w594sNZBCzgKbE+l36EDMd
        JQ61xUOYfBI33gqCFDMDmZO2TYd6nleio00IYoaaxKzj6+C2HrxwiRnC9pA4sO4w2PVCArES
        C75NZJrAKDcLYdUCRsZVjOKppcW56anFxnmp5XrFibnFpXnpesn5uZsYgXF9+t/xrzsY9/1J
        OsQowMGoxMO7YoJXnBBrYllxZe4hRgkOZiURXm9xoBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe
        40UvY4UE0hNLUrNTUwtSi2CyTBycUg2MyWpeJY1ynw1ZI2+JXBBnzGVqPCy3qfai4zPNQyLJ
        PGvXG5Udd5pTy74u+ITpMZPdF2pVVx2JaGt5/+1S1qrJ/tZzFVeE/pyYlJX8hfVivk7YmflF
        yvP+yPpr6VpvFGHc+ev6sRn7p71ym/qs0u7Uw4nOwtmbSpmsEnY0PH5c/VbbZnrpmfk+SizF
        GYmGWsxFxYkAmbU7OucCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsVy+t/xe7p9U73jDBYt47PYOGM9q8X58xvY
        LWac38dksfbIXXYHFo9NqzrZPPq2rGL0+LxJLoA5Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLP
        yMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/jxVrxggkcFW/bTjI2MDaxdzFycEgImEgcaZHt
        YuTiEBJYyiixbOpBxi5GTqC4jMTJaQ2sELawxJ9rXWwQRZ8YJf61nGQBSbAJGEp0vQVJcHKI
        CKhKfG5bwA5SxCwwgVHifOcMsISwQJRE8+Wd7CA2C1DRr23bwDbwCthKNK/eALVBXmL1hgPM
        Exh5FjAyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAgMqG3Hfm7Zwdj1LvgQowAHoxIP74oJ
        XnFCrIllxZW5hxglOJiVRHi9xYFCvCmJlVWpRfnxRaU5qcWHGE2Blk9klhJNzgcGe15JvKGp
        obmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBsZVFsUz8qd80crVbTz0S2b/
        mnOLd+9i8pp/bfmZ04naGZuMdirWVB9eYDAveyL/f5aO35fCWQ+Y5MmE32769k5IVcPjYctL
        +YKOTcfehBd5vDPw6vqv0OBZv/v2pBu5FfdK7XrY+9Kidu0TL7jskzadpUTyzNKTYvXek/dt
        NJU6e/6WYfPD55JKLMUZiYZazEXFiQAQKTtsPgIAAA==
X-CMS-MailID: 20200218074310eucas1p288fe322bfadcff6025aadf7b6d51ffc2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200218074310eucas1p288fe322bfadcff6025aadf7b6d51ffc2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200218074310eucas1p288fe322bfadcff6025aadf7b6d51ffc2
References: <CGME20200218074310eucas1p288fe322bfadcff6025aadf7b6d51ffc2@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

All modules built from exynos_defconfig occupy about 55M, so enable
squashfs filesystem support and increase default ram block device size
to 32M to enable deploying them on initrd. Such initrd, using squashfs
requires at least 24M.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 9b889590555e..8aa40886476d 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -91,7 +91,7 @@ CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_CRYPTOLOOP=y
 CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_BLK_DEV_RAM_SIZE=32768
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_SG=y
@@ -319,6 +319,7 @@ CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_CRAMFS=y
+CONFIG_SQUASHFS=y
 CONFIG_ROMFS_FS=y
 CONFIG_NFS_FS=y
 CONFIG_NFS_V4=y
-- 
2.17.1

