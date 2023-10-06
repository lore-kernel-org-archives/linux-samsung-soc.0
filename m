Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C57E81DE2
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Oct 2023 11:21:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbjJFLVd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Oct 2023 07:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231992AbjJFLV1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Oct 2023 07:21:27 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C711DE
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Oct 2023 04:21:25 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231006112123euoutp01ee43b79b80fad95da6b5345744963731~LgMib5rkQ1966419664euoutp01f
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Oct 2023 11:21:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231006112123euoutp01ee43b79b80fad95da6b5345744963731~LgMib5rkQ1966419664euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1696591283;
        bh=v3Q9bA3RhSZaR/GB05TYNGxGtgxu/x1Q/vRn+oxpKeA=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Tjc6TBvwXZ92vorko9gReYD9gYkx7+hWMfukGaBLpq+xxaDP7k5aIoEsw27t8zqIt
         nqM3yFBVyJM9+ajfqpmAVHtA/UAZgCTtjxkPx8rGGpA39FMw8z149KPFkhND5ysZ8X
         Sm5JhI75eawtZlXFpMimfoBI+f3cmQIb+xJZbS6I=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20231006112123eucas1p16d2f80fbb2f15065d9ace33ee2b29085~LgMiKNBjK2637726377eucas1p1t;
        Fri,  6 Oct 2023 11:21:23 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id F5.04.42423.3BDEF156; Fri,  6
        Oct 2023 12:21:23 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20231006112123eucas1p18923904c9290ace8fe5240bd76867429~LgMh0z7cF2638126381eucas1p1e;
        Fri,  6 Oct 2023 11:21:23 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231006112123eusmtrp2e9b015014d657383ec1454577802bb1c~LgMh0JDiG1073410734eusmtrp2x;
        Fri,  6 Oct 2023 11:21:23 +0000 (GMT)
X-AuditID: cbfec7f2-a51ff7000002a5b7-fd-651fedb38bf0
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id D7.1D.10549.2BDEF156; Fri,  6
        Oct 2023 12:21:22 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20231006112122eusmtip113fd3625f33379724980b882e8da358d~LgMhYTxh51501515015eusmtip1V;
        Fri,  6 Oct 2023 11:21:22 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ARM: multi_v7_defconfig: add drivers for S5C73M3 & S5K6A3
 camera sensors
Date:   Fri,  6 Oct 2023 13:21:06 +0200
Message-Id: <20231006112106.3205618-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduzned3Nb+VTDTadELd4MG8bm8XfScfY
        Lfa+3spusenxNVaLGef3MVmsPXKX3YHN4/evSYwed67tYfPYvKTeo2/LKkaPz5vkAlijuGxS
        UnMyy1KL9O0SuDIOd8xmK1jIVvGh7TRTA+Mu1i5GTg4JAROJYyemsHQxcnEICaxglGia84oN
        wvnCKHFr11Z2COczo8SFJTfZYFr2n54KVbWcUeL1vUPsIAmwlskbjUFsNgFDia63XUBFHBwi
        At4Sy68pgtQzC6xnlLj0ZRbYbmGBaImzHcdYQGwWAVWJxmtLwOK8AvYSr2b9hVomL7H/4Flm
        iLigxMmZT8DqmYHizVtnM4MMlRCYyCFxZt1VFogGF4mXfzYxQdjCEq+Ob2GHsGUk/u+czwTR
        0M4oseD3fShnAqNEw/NbjBBV1hJ3zv0CO5tZQFNi/S59iLCjxPnWRewgYQkBPokbbwUhjuCT
        mLRtOjNEmFeio00IolpNYtbxdXBrD164xAxhe0h0z9vOCgmrWIlfuz4yTWBUmIXktVlIXpuF
        cMMCRuZVjOKppcW56anFhnmp5XrFibnFpXnpesn5uZsYgQnm9L/jn3Ywzn31Ue8QIxMH4yFG
        CQ5mJRHe9AaZVCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8qinyqUIC6YklqdmpqQWpRTBZJg5O
        qQam2DUR+3nWz1nszM23s3BrQe3t8OuWlivX6Tpe/HReTn+quORhh943Txb5dcfPmL7l3T15
        Q4VP1Q9fOFwKmbv3pdj+VRc/87YuOz/xxF/tLT5zVJOENNvTGw991XuzRq/y5F/fwhV51w1n
        Xtf7+Sq/LFZJ2IHlc5uDsOmZSZdVYyaVF2QJn02a3xnxaC5bs7yoR8Kqeo8IqW3GK6ce+13x
        Ju970nN7j3kW0xWcLCP713xROF0nv/G3YZSs9bE8xdAp7TPY5nJ01suIc75JEr3K9fKnQbPX
        4moPI+eJ9UtapdWm6Me4dDe6RV+MWWzGHv6umqeyePcek4dHQjn6f4q0Rv5zuaZoO+X07jdH
        taSUWIozEg21mIuKEwFJ526rnwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsVy+t/xu7qb38qnGrTrWjyYt43N4u+kY+wW
        e19vZbfY9Pgaq8WM8/uYLNYeucvuwObx+9ckRo871/aweWxeUu/Rt2UVo8fnTXIBrFF6NkX5
        pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GYc7ZrMVLGSr
        +NB2mqmBcRdrFyMnh4SAicT+01PZuhi5OIQEljJKXOifzgiRkJE4Oa0BqkhY4s+1LqiiT4wS
        N7acAitiEzCU6HoLkuDkEBHwlWj+uoEVpIhZYCOjxP6FLSwgCWGBSInVp++B2SwCqhKN15aA
        TeUVsJd4NesvG8QGeYn9B88yQ8QFJU7OfAJWzwwUb946m3kCI98sJKlZSFILGJlWMYqklhbn
        pucWG+oVJ+YWl+al6yXn525iBAb2tmM/N+9gnPfqo94hRiYOxkOMEhzMSiK86Q0yqUK8KYmV
        ValF+fFFpTmpxYcYTYHum8gsJZqcD4ytvJJ4QzMDU0MTM0sDU0szYyVxXs+CjkQhgfTEktTs
        1NSC1CKYPiYOTqkGpvmHOmTU/Ws+KbCtv7L1B0vT1r53LSE/Xu1rdNi+VHR7SsLXZ6sOds2/
        HvmK6c900XjN9ndyL/na7ljzfpKd+uroQRvVf15JwRJHu9U3d617cenEC1d3Nv6uK6ISl51k
        boedP3+4LFfeq175p3n12X/HJ67fHxJWqv7DsupknZRqkkDF0qk+S/MuJy01v/HqwqHTT/d1
        70j8H63EdXa1mPGxm8ILxOp3Vyjcm9iyf1vt5zl6UlVf1028kvPzrlbv5cuM9ZV+KVNLOrVX
        ZXVp3Oz9uHyXmrM8p3DjwW9NEm42VjJqv75P8K/yKy2YqfXnyhEDAbWdusGKfCK2M/2jpN/u
        mLFObpfSTLuyKx91nJVYijMSDbWYi4oTATAcHKj1AgAA
X-CMS-MailID: 20231006112123eucas1p18923904c9290ace8fe5240bd76867429
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231006112123eucas1p18923904c9290ace8fe5240bd76867429
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231006112123eucas1p18923904c9290ace8fe5240bd76867429
References: <CGME20231006112123eucas1p18923904c9290ace8fe5240bd76867429@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung S5C73M3 8Mp camera ISP and S5K6A3 RAW sensors are available on
Exynos4412-based Midas family boards, so enable the driver for them to
increase testing coverage.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index af064a4b73e1..10fd74bf85f9 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -693,6 +693,8 @@ CONFIG_VIDEO_STI_HVA=m
 CONFIG_VIDEO_STM32_DCMI=m
 CONFIG_V4L_TEST_DRIVERS=y
 CONFIG_VIDEO_VIVID=m
+CONFIG_VIDEO_S5C73M3=m
+CONFIG_VIDEO_S5K6A3=m
 CONFIG_VIDEO_ADV7180=m
 CONFIG_VIDEO_ADV7604=m
 CONFIG_VIDEO_ADV7604_CEC=y
-- 
2.34.1

