Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905E5E743C0
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Sep 2023 20:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232178AbjI1U1g (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Sep 2023 16:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbjI1U1f (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Sep 2023 16:27:35 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA838180
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Sep 2023 13:27:32 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20230928202730euoutp02231de7377ab56009d60711d894497566~JKfFD188g0612906129euoutp02J
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Sep 2023 20:27:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20230928202730euoutp02231de7377ab56009d60711d894497566~JKfFD188g0612906129euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1695932850;
        bh=qHVZtxOvVfnkh5gF6bX/+HrWDHgKU7GLHI8Jw8U5I/0=;
        h=From:To:Cc:Subject:Date:References:From;
        b=RFZu1Aw9i2YeWOZclNAzKQqLkEwSkiKdIuJ3Ns/bJjzkghQxPo9xEz5yul+Of6AOs
         OSc7y9Cp2GGPD+GA9WC9CBPcuTHtp6PysczcnJF8o8QDvENoL6PsbKz9WeLr6u9EZR
         SFYtyw+yxZnrIPXuTgf2Eq+RKdnkb9WH5U6gMeZ8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20230928202729eucas1p299c5b08e32faa37df2eaac6b6a6ed42a~JKfEEReSr0305803058eucas1p2-;
        Thu, 28 Sep 2023 20:27:29 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 19.A6.42423.1B1E5156; Thu, 28
        Sep 2023 21:27:29 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20230928202728eucas1p11a2f2850382ec2327bdd3514837123ec~JKfC3icfY1254012540eucas1p1F;
        Thu, 28 Sep 2023 20:27:28 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20230928202728eusmtrp21dd47d7293d92091e4f8abe4765febea~JKfC3Eafe3232032320eusmtrp2U;
        Thu, 28 Sep 2023 20:27:28 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-8c-6515e1b1224a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 34.AA.25043.0B1E5156; Thu, 28
        Sep 2023 21:27:28 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20230928202728eusmtip2b833a4acafb2c07f4c8a059698929211~JKfCah4IE2907129071eusmtip2i;
        Thu, 28 Sep 2023 20:27:28 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ARM: exynos_defconfig: replace SATA_AHCI_PLATFORM with
 AHCI_DWC driver
Date:   Thu, 28 Sep 2023 22:27:24 +0200
Message-Id: <20230928202724.340420-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduznOd2ND0VTDXat1rN4MG8bm8XfScfY
        Lfa+3spusenxNVaLGef3MVmsPXKX3YHN4/evSYwed67tYfPYvKTeo2/LKkaPz5vkAlijuGxS
        UnMyy1KL9O0SuDKmb8gr2M1W8XPFEuYGxuOsXYycHBICJhJrH81h7mLk4hASWMEosfrMUlYI
        5wujROPpbywQzmdGie9zGplhWtof9EK1LGeU+LNmF0JL34Y+FpAqNgFDia63XWxdjBwcIgLe
        EsuvKYLUMAusZ5S49GUW2HJhgUiJV11HwKayCKhKfG/exgZi8wrYSTz7+Axqm7zE/oNnmSHi
        ghInZz4Bm88MFG/eOhvsCgmBqRwSWx7dZ4JocJHY+mwJC4QtLPHq+BZ2CFtG4v/O+UwQDe2M
        Egt+34dyJjBKNDy/xQhRZS1x59wvsLOZBTQl1u/Shwg7Ssy6u5QJJCwhwCdx460gxBF8EpO2
        TWeGCPNKdLQJQVSrScw6vg5u7cELl6B+8ZA4NWM52GlCArESB+b1M01gVJiF5LVZSF6bhXDD
        AkbmVYziqaXFuempxYZ5qeV6xYm5xaV56XrJ+bmbGIEJ5vS/4592MM599VHvECMTB+MhRgkO
        ZiUR3oe3hVKFeFMSK6tSi/Lji0pzUosPMUpzsCiJ82rbnkwWEkhPLEnNTk0tSC2CyTJxcEo1
        MLnZSOav87Q4X9/2heuS8v2Nq08veBh/9loXf7v6KfnzEn9nZ1mc7HXd+zLo4sSPFasZ5jyZ
        Mul4/bm38bF1nwx1+jcl9/vXNLF7zjnIYl168/Q2kQr1n0lb4v5c3Bhh3/ppGxsTw7obxhd8
        uxPUp7VvXj795bJ9Ef9NUpZvV7O4dqAp9FONiUwd+61HN+MmJTyNCX+bu7t+Ngt3I8NZ+4MF
        u32kWeK3pLo2ir7aOT304klVCW61gzf+HGjf/mhdhQnbngvpcov+TSqVr2c9LJpcOY3DRDfq
        /vK1+u4pE12vJP01W8547pekzrWj9aWz+iz1jE50GbxjrVEy++Wt8fDn2nkJJ3dPk7q36q+N
        toESS3FGoqEWc1FxIgBNQ0t1nwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsVy+t/xe7obHoqmGjw+L2XxYN42Nou/k46x
        W+x9vZXdYtPja6wWM87vY7JYe+QuuwObx+9fkxg97lzbw+axeUm9R9+WVYwenzfJBbBG6dkU
        5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GVM35BXsJut
        4ueKJcwNjMdZuxg5OSQETCTaH/QydzFycQgJLGWU2HrvLTtEQkbi5LQGqCJhiT/Xutggij4x
        SnRv7WEGSbAJGEp0vQVJcHKICPhKNH/dwApSxCywkVFi/8IWFpCEsEC4xJWHM8GKWARUJb43
        bwOzeQXsJJ59fMYMsUFeYv/Bs8wQcUGJkzOfgPUyA8Wbt85mnsDINwtJahaS1AJGplWMIqml
        xbnpucVGesWJucWleel6yfm5mxiBgb3t2M8tOxhXvvqod4iRiYPxEKMEB7OSCO/D20KpQrwp
        iZVVqUX58UWlOanFhxhNge6byCwlmpwPjK28knhDMwNTQxMzSwNTSzNjJXFez4KORCGB9MSS
        1OzU1ILUIpg+Jg5OqQam4mXK1VP8g853SfcwGQtqP5lck9Di7F9okl+wexWrzaKQCc0PP356
        23u/9yS3/rKt9Y8fix5r1e4ykn+4cenER2sLXGWtJzruiFTVSvhq5c7qM/c6V8ard9JSt+XC
        V3Pf4CueVqHVv+NY0Yo/1ZzNZRsqs12nnHs7r+9Mp/q9+W/6Plxfdkwr7+/Zg1aZk/o1+M3V
        lrB9/ZDczrzV7cUSFvM/KtqPJaZtvSj3qX/ijYY7m7vcnX9+3B53Pt2An3nT501eT1cWVNvf
        SH91+c5l1o398i27L7aJbL1hWfK75HoHS/Bj2yLGVc/unbqierp2f8QLtay9DiZCN/1eCD9p
        39nUcPBgge3vApHIfsvzSizFGYmGWsxFxYkAu0ZKVvUCAAA=
X-CMS-MailID: 20230928202728eucas1p11a2f2850382ec2327bdd3514837123ec
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230928202728eucas1p11a2f2850382ec2327bdd3514837123ec
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230928202728eucas1p11a2f2850382ec2327bdd3514837123ec
References: <CGME20230928202728eucas1p11a2f2850382ec2327bdd3514837123ec@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Commit 33629d35090f ("ata: ahci: Add DWC AHCI SATA controller support")
moved support for "snps,dwc-ahci" compatible (present in exynos5250.dtsi)
to separate DWC AHCI driver, so reflect this change in exynos_defconfig.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 53b1d41b4a8b..66ebb761126c 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -93,7 +93,7 @@ CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_SG=y
 CONFIG_ATA=y
 # CONFIG_SATA_PMP is not set
-CONFIG_SATA_AHCI_PLATFORM=y
+CONFIG_AHCI_DWC=y
 # CONFIG_ATA_SFF is not set
 CONFIG_MD=y
 CONFIG_BLK_DEV_DM=y
-- 
2.34.1

