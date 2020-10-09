Return-Path: <SRS0=q3lv=DQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1A0C433E7
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 13:05:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EB6C222D5
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 13:05:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tWiWfWpK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388149AbgJINFp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Oct 2020 09:05:45 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:44405 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732468AbgJINFo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Oct 2020 09:05:44 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201009130532euoutp019986aceb3840f9ebfd96a8e6fe08ba5d~8VLuoSCkD1482314823euoutp01N
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2020 13:05:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201009130532euoutp019986aceb3840f9ebfd96a8e6fe08ba5d~8VLuoSCkD1482314823euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1602248732;
        bh=BMbyOgKgnhqWB0hHzkx3EdjifEKrLwNecg/HFM+MhEU=;
        h=From:To:Cc:Subject:Date:References:From;
        b=tWiWfWpKXHxIAuoNHrtihNFaYBvalu0F9+6tEX+f7OusUdhuJk1u+wJqldVvPlBsV
         A01hdJ+9wnzVIWsQlaWTnfVlDQrvLkB97Vgb23OE1GQFkR8WxZ/awTk2v5uyf1L7wZ
         6ftmwDRfLVkdcCrFxLixZbIi7jKVOiDE1eyg29N8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201009130532eucas1p280b9de4691fefea512ce90a2a737638e~8VLueJ9Zg3177031770eucas1p2P;
        Fri,  9 Oct 2020 13:05:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id C2.5F.06318.C10608F5; Fri,  9
        Oct 2020 14:05:32 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201009130531eucas1p25ba0c17803bd0647c65603feb3180799~8VLuHvKdY2597425974eucas1p2z;
        Fri,  9 Oct 2020 13:05:31 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201009130531eusmtrp1baaf660e15d40f2818fff9d028ade697~8VLuHLOVa0217802178eusmtrp1W;
        Fri,  9 Oct 2020 13:05:31 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-6f-5f80601c1170
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 50.E1.06017.B10608F5; Fri,  9
        Oct 2020 14:05:31 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201009130531eusmtip13e11c335afcab17257691894fad251b2~8VLtswgww1454614546eusmtip1Z;
        Fri,  9 Oct 2020 13:05:31 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/exynos/hdmi: add support for 1920x1200@60Hz mode
Date:   Fri,  9 Oct 2020 15:05:24 +0200
Message-Id: <20201009130524.30828-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRmVeSWpSXmKPExsWy7djPc7oyCQ3xBv+ucVncWneO1eLK1/ds
        FpPuT2CxmHF+H5PF2iN32S1mTH7J5sDmcb/7OJNH35ZVjB6fN8kFMEdx2aSk5mSWpRbp2yVw
        ZWxb8YGp4DRHxeWp/1gaGJvZuxg5OSQETCTuTV3J1MXIxSEksIJR4v2fPnYI5wujxPRf69gg
        nM+MEt/W32OEaVl4ejULRGI5o8S+qVtZ4Fr6zq8CG8wmYCjR9baLDcQWEXCTaDo8kxWkiFlg
        IaPE/pY2JpCEsICrRO/JZWANLAKqEo82X2IGsXkFbCWmTNzGBLFOXmL1hgPMEPYBNon/G1gh
        bBeJzu3foOLCEq+Ob4H6SEbi9OQesIskBJoZJR6eW8sO4fQwSlxumgH1hLXEnXO/gM7jADpJ
        U2L9Ln2IsKNE0/K77CBhCQE+iRtvBUHCzEDmpG3TmSHCvBIdbUIQ1WoSs46vg1t78MIlqHM8
        JJZfOAe2SEggVmLSxMssExjlZiHsWsDIuIpRPLW0ODc9tdg4L7Vcrzgxt7g0L10vOT93EyMw
        4k//O/51B+O+P0mHGAU4GJV4eBmE6uOFWBPLiitzDzFKcDArifA6nT0dJ8SbklhZlVqUH19U
        mpNafIhRmoNFSZzXeNHLWCGB9MSS1OzU1ILUIpgsEwenVANj0vu1fRvuZe4Q2/buzLku5mJ1
        FcslWvc+Rn1nO5t6RtHrRALf/P9akbYn2eNjHEW98vaV9zIzzzGSWrH3GH9codm1p5Uik57+
        v7piid+t1owKgdblclE6835aHDugun7ygqawRwG2wT//+zqqlLYncR65xmjX+yGh597vD+cW
        /umTOKMawcGhxFKckWioxVxUnAgAYuzNH/QCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOLMWRmVeSWpSXmKPExsVy+t/xu7rSCQ3xBpcn6lncWneO1eLK1/ds
        FpPuT2CxmHF+H5PF2iN32S1mTH7J5sDmcb/7OJNH35ZVjB6fN8kFMEfp2RTll5akKmTkF5fY
        KkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZWxb8YGp4DRHxeWp/1gaGJvZ
        uxg5OSQETCQWnl7N0sXIxSEksJRRYmPnBaiEjMTJaQ2sELawxJ9rXWwQRZ8YJdYde8AMkmAT
        MJToeguS4OQQEfCQaP52nB2kiFlgMaPEsz+XGEESwgKuEr0nl4FNZRFQlXi0+RJYM6+ArcSU
        iduYIDbIS6zecIB5AiPPAkaGVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIGBtu3Yzy07GLve
        BR9iFOBgVOLhXcFfHy/EmlhWXJl7iFGCg1lJhNfp7Ok4Id6UxMqq1KL8+KLSnNTiQ4ymQMsn
        MkuJJucDoyCvJN7Q1NDcwtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwfEwenVAOj23Z9
        jTuMJ9zsOBVlfvj8/rlIQuhrtPePCy9uSAobBO5nis/xlG2df7k/4arz028L535K3tmsIFy3
        u3YV4+ptZ58KNOr+kzK9vVKyLNz/uoaur3+lOYeUf/PEzeu6un6JH0w9/a79xY3230L2hlv0
        3L7mJanPMefxr5m0+upJ4+hQn8zuWRZKLMUZiYZazEXFiQBVQIwhSgIAAA==
X-CMS-MailID: 20201009130531eucas1p25ba0c17803bd0647c65603feb3180799
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201009130531eucas1p25ba0c17803bd0647c65603feb3180799
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201009130531eucas1p25ba0c17803bd0647c65603feb3180799
References: <CGME20201009130531eucas1p25ba0c17803bd0647c65603feb3180799@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add clock configuration for 154MHz pixelclock to Exynos542x HDMIPHY,
which is required for 1920x1200@60Hz mode. The PLL configuration data
has been taken from the vendor's kernel tree for the Odroid XU4 board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index dc01c188c0e0..39fa5d3b01ef 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -522,6 +522,15 @@ static const struct hdmiphy_config hdmiphy_5420_configs[] = {
 			0x54, 0x4B, 0x25, 0x03, 0x00, 0x80, 0x01, 0x80,
 		},
 	},
+	{
+		.pixel_clock = 154000000,
+		.conf = {
+			0x01, 0xD1, 0x20, 0x01, 0x40, 0x30, 0x08, 0xCC,
+			0x8C, 0xE8, 0xC1, 0xD8, 0x45, 0xA0, 0xAC, 0x80,
+			0x08, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x86,
+			0x54, 0x3F, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
 };
 
 static const struct hdmiphy_config hdmiphy_5433_configs[] = {
-- 
2.17.1

