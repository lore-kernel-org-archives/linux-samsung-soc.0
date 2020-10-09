Return-Path: <SRS0=q3lv=DQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BFAC433E7
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 13:49:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4271A222C3
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 13:49:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="b/bf4b/H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732584AbgJINte (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Oct 2020 09:49:34 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57079 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732456AbgJINtd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Oct 2020 09:49:33 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201009134920euoutp022dad44bb36c64e2d2c3151d9fc1bfcea~8Vx_reRSl1638816388euoutp02f
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2020 13:49:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201009134920euoutp022dad44bb36c64e2d2c3151d9fc1bfcea~8Vx_reRSl1638816388euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1602251361;
        bh=8aSE0aZNq5bpVdOwkTH+3fuvYiJjYgir+RTEtGLMecs=;
        h=From:To:Cc:Subject:Date:References:From;
        b=b/bf4b/He9/zyqXos8r44mcJtcyq1beaVAkdN4X4R1svYaAy8W12iEx7s/SU1NqfM
         eZ5f0hWzRgEjh6N/f1YqqZAONR5vgbc/79THJVtyDpjOI60AJvqLX01EXkQImdgKZH
         DFvHq/LGKcAnQ/Ulses7HDD7VjtOUUtlehPMZdko=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201009134914eucas1p11e4bb44e84d5da7493d7cb38d13ed0bd~8Vx4m6ltx0607806078eucas1p1_;
        Fri,  9 Oct 2020 13:49:14 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 0E.FB.06456.A5A608F5; Fri,  9
        Oct 2020 14:49:14 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201009134913eucas1p26b18e593aaa4dcbf54fcec7218abba3f~8Vx4JrzNv2024120241eucas1p2b;
        Fri,  9 Oct 2020 13:49:13 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201009134913eusmtrp29824bdcdafabda4d821d1856346e4957~8Vx4JHHQi1503315033eusmtrp2H;
        Fri,  9 Oct 2020 13:49:13 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-71-5f806a5a62ea
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 88.FB.06314.95A608F5; Fri,  9
        Oct 2020 14:49:13 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201009134913eusmtip28eff1e4cc31fdca83ef20e71d1064572~8Vx33_N--1928019280eusmtip2I;
        Fri,  9 Oct 2020 13:49:13 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] ARM: multi_v7_defconfig: enable sound driver for Midas
 platform
Date:   Fri,  9 Oct 2020 15:49:07 +0200
Message-Id: <20201009134907.4578-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRmVeSWpSXmKPExsWy7djP87pRWQ3xBotWSFmcP7+B3WLG+X1M
        FmuP3GV3YPbYtKqTzaNvyypGj8+b5AKYo7hsUlJzMstSi/TtErgy2m83MxV0sVWsudfD1MC4
        jLWLkZNDQsBEYv/n7cxdjFwcQgIrGCWmb1vJDpIQEvjCKLF/hidE4jOjxKV7BxlhOrb8XsQE
        kVjOKPH66jeodqCOwws/MoNUsQkYSnS97WIDsUUEVCU+ty0AG8ssECFxr3kiE4gtLBAk8Xfj
        cbCpLEA1W6eeAovzCthIfN7+jxlim7zE6g0HwBZICCxhk9j69SfU4S4Su14cZoKwhSVeHd/C
        DmHLSPzfOZ8JoqGZUeLhubXsEE4Po8TlphlQT1hL3Dn3C+g8DqCTNCXW79KHCDtK3Fu6ghUk
        LCHAJ3HjrSDE0XwSk7ZNZ4YI80p0tAlBVKtJzDq+Dm7twQuXoG72kPh+YSILJBhjJR7/72Cb
        wCg3C2HXAkbGVYziqaXFuempxYZ5qeV6xYm5xaV56XrJ+bmbGIERffrf8U87GL9eSjrEKMDB
        qMTD25DcEC/EmlhWXJl7iFGCg1lJhNfp7Ok4Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzGi17G
        CgmkJ5akZqemFqQWwWSZODilGhjVRa9t9J525+0ht83sLj314gHvOD/UWBbm3eAKemhpU9eu
        /ic8MmuRkcKaVl/D7J+q00pevrq+c6P8zX1Sin0VHX78TyRmcS1yYvEMD2iVuPfE/b+9zs/T
        piquGy8krV/y4PM7+amVV6/s50iZ25Pju/vA2cM3v81+aBnZkKJQ/yvDaXGMSpwSS3FGoqEW
        c1FxIgCYi7lO5AIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOLMWRmVeSWpSXmKPExsVy+t/xe7qRWQ3xBp+nWFicP7+B3WLG+X1M
        FmuP3GV3YPbYtKqTzaNvyypGj8+b5AKYo/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyN
        zWOtjEyV9O1sUlJzMstSi/TtEvQy2m83MxV0sVWsudfD1MC4jLWLkZNDQsBEYsvvRUxdjFwc
        QgJLGSXOve2ESshInJzWAGULS/y51sUGUfSJUeLkni5mkASbgKFE11uQBCeHiICqxOe2Bewg
        NrNAhMSBqYvAmoUFAiR6Hm9jArFZgGq2Tj0FZvMK2Eh83v6PGWKBvMTqDQeYJzDyLGBkWMUo
        klpanJueW2yoV5yYW1yal66XnJ+7iREYSNuO/dy8g/HSxuBDjAIcjEo8vBqJDfFCrIllxZW5
        hxglOJiVRHidzp6OE+JNSaysSi3Kjy8qzUktPsRoCrR8IrOUaHI+MMjzSuINTQ3NLSwNzY3N
        jc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUwLrzx4O+H46/OTrpWabYx74Oaj65Yf5rx
        o6gq95dbG7nuXtjstHV/0TyT9VOcmbybpT3iucOjNq2arq0m8eryBPVPAsGf1S1KeoLvT3t/
        o7juwNbU8OfM9Xyfv75kq6/6dLQrruBod83KsBTu16sipX7OOJq9n+Fi2z5e+9LFac7C6nMb
        D+3sUmIpzkg01GIuKk4EAITUnr06AgAA
X-CMS-MailID: 20201009134913eucas1p26b18e593aaa4dcbf54fcec7218abba3f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201009134913eucas1p26b18e593aaa4dcbf54fcec7218abba3f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201009134913eucas1p26b18e593aaa4dcbf54fcec7218abba3f
References: <CGME20201009134913eucas1p26b18e593aaa4dcbf54fcec7218abba3f@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Sound driver for Midas platform (Exnyos4412 SoC based) has been recently
merged, so enable it for tests like other sound drivers for Exynos based
boards.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index e731cdf7c88c..138a9e8fe35d 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -737,6 +737,7 @@ CONFIG_SND_SOC_SMDK_WM8994_PCM=m
 CONFIG_SND_SOC_SNOW=m
 CONFIG_SND_SOC_ODROID=m
 CONFIG_SND_SOC_ARNDALE=m
+CONFIG_SND_SOC_SAMSUNG_MIDAS_WM1811=m
 CONFIG_SND_SOC_SH4_FSI=m
 CONFIG_SND_SOC_RCAR=m
 CONFIG_SND_SOC_STI=m
-- 
2.17.1

