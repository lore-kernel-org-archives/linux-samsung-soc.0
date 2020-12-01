Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2B1C64E7B
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Dec 2020 17:10:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3D39206D8
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Dec 2020 17:10:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gMpTLYc8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgLARKS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Dec 2020 12:10:18 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36765 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgLARKR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Dec 2020 12:10:17 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201201170926euoutp01bc45792fab25e8a5456fa7accbc43c6f~Mpsz6Kw5m0957409574euoutp01B
        for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Dec 2020 17:09:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201201170926euoutp01bc45792fab25e8a5456fa7accbc43c6f~Mpsz6Kw5m0957409574euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1606842566;
        bh=NPMkD6/Q0Muv1M+CSpsjnHFPPlCoDbr9wI/5HpKE+A4=;
        h=From:To:Cc:Subject:Date:References:From;
        b=gMpTLYc8MoO9/iCtHVXNDL+TMXI0dg2CIu7jEP6VxS1+0Lw5K7nEsFh4cTTRHAlzc
         heFja8qUhsEJUIk1GHWX2TxeCJgvr3/bDfJDIIOSvAUZ3W9ULzX9MzM8ii6WiRsIsl
         Nfhm1OLFVDgYJ5XPtUDxhpR220cbp2sgj8z0cgjc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201201170918eucas1p1bcbc04a509acf78cf5d32e77017363ed~Mpss1O6-i2105421054eucas1p1B;
        Tue,  1 Dec 2020 17:09:18 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 23.FF.27958.EB876CF5; Tue,  1
        Dec 2020 17:09:18 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201201170918eucas1p2a34ca6e90ec710400a7a5d7121197d85~MpssL2bP-1983619836eucas1p2q;
        Tue,  1 Dec 2020 17:09:18 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201201170918eusmtrp21d5a92fc0caf7cf34ead7b64fba05760~MpssLNWgf1803918039eusmtrp2Z;
        Tue,  1 Dec 2020 17:09:18 +0000 (GMT)
X-AuditID: cbfec7f2-f15ff70000006d36-69-5fc678bec080
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 06.45.21957.DB876CF5; Tue,  1
        Dec 2020 17:09:17 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201201170917eusmtip19aac7cc6cb0cea2649eaf8999919f735~MpsrkbNCF3128531285eusmtip1K;
        Tue,  1 Dec 2020 17:09:17 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Willy Wolff <willy.mh.wolff.ml@gmail.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Markus Reichl <m.reichl@fivetechno.de>
Subject: [PATCH] phy: samsung: Fix build break in USB2 PHY driver for
 Exynos5420 SoCs
Date:   Tue,  1 Dec 2020 18:09:05 +0100
Message-Id: <20201201170905.16153-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJIsWRmVeSWpSXmKPExsWy7djP87r7Ko7FG/y+qWqxccZ6VosLT3vY
        LM6f38BucXnXHDaLGef3MVm8PPKD0WLtkbvsFuun/WS1OPymndVi550TzBbfTjxidOD2uHWn
        3mPnrLvsHptWdbJ59G1Zxehx/MZ2Jo/Pm+QC2KK4bFJSczLLUov07RK4Ms6en8hYcIm/4sT9
        88wNjAt5uxg5OSQETCTWzX3K1MXIxSEksIJR4t7NZywQzhdGifs/XkA5nxklpv3tBHI4wFpO
        r+GFiC9nlJj89AIjXMfJ7fuZQOayCRhKdL3tYgOxRQRUJT63LWAHKWIWWMks8bujA6xIWCBc
        YuHy22wgU1mAijZsigMJ8wrYSjz72MMCcZ+8xOoNB5hBeiUElnJInHn+ggki4SLxbM8iZghb
        WOLV8S3sELaMxP+d85kgGpoZJR6eW8sO4fQwSlxumsEIUWUtcefcL7DNzAKaEut36UO85ijR
        c7MMwuSTuPFWEKSYGcictG06M0SYV6KjTQhihprErOPr4LYevHAJ6hoPiV1Td4FdKSQQK/F5
        7lLWCYxysxBWLWBkXMUonlpanJueWmyYl1quV5yYW1yal66XnJ+7iRGYOk7/O/5pB+PcVx/1
        DjEycTAeYpTgYFYS4WX5dyReiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+q2WvihQTSE0tSs1NT
        C1KLYLJMHJxSDUysF8qC719ez3uax6djAWvDnVBml/yn9mKOR7++fOVzWV39JAuflapGw+3y
        nzxSktvtc1b2BzrUi2aZasTPur7OtC9jbt1Pn47s9rN151y+5bPzZRw6rnOq6tQVhWn9FR4l
        Pk8PnmBV2v858nHu8fIKnZvZnZ2SP5ef+P9shfb7eRue3FH4st9tb8aOqQct3fVWpHQzzj8o
        b76CbU7Mk7Rql3lXtNUiy9/9kEny4/6W+dSyZvUD0dc/o00OHr+sNp8l+3u/be3qJ+3MAvW/
        KibY15XNydtkExB26vVt4bXR6sULbc1tyhgFd/FKPkpmiHzeczTZ0zcru39J+3dP41VB83Pa
        tn7pUBHsme2xQ4mlOCPRUIu5qDgRAPAQDKSMAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPLMWRmVeSWpSXmKPExsVy+t/xu7p7K47FG3xfaWOxccZ6VosLT3vY
        LM6f38BucXnXHDaLGef3MVm8PPKD0WLtkbvsFuun/WS1OPymndVi550TzBbfTjxidOD2uHWn
        3mPnrLvsHptWdbJ59G1Zxehx/MZ2Jo/Pm+QC2KL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxM
        LPUMjc1jrYxMlfTtbFJSczLLUov07RL0Ms6en8hYcIm/4sT988wNjAt5uxg5OCQETCROrwEy
        uTiEBJYySpx5N5Wli5ETKC4jcXJaAyuELSzx51oXG0TRJ0aJ8w09zCAJNgFDia63IAlODhEB
        VYnPbQvYQYqYBdYzS7z8/x8sISwQKtE/5yUjyDYWoKINm+JAwrwCthLPPvZALZOXWL3hAPME
        Rp4FjAyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAkN227Gfm3cwznv1Ue8QIxMH4yFGCQ5m
        JRFeln9H4oV4UxIrq1KL8uOLSnNSiw8xmgKtm8gsJZqcD4yavJJ4QzMDU0MTM0sDU0szYyVx
        3q1z18QLCaQnlqRmp6YWpBbB9DFxcEo1MK0VyIjLOsjJdn7eRKETh+05Wo+uEN80sUTM7bbw
        TI7tF7vlH0nP8/14pPSpjtiRmIb6Fwq7hTPvNh7b/qWuiu98vtnc0us3FToyrAX+JT9iuLSf
        4+xrieu3f71VOz8/+dOsg+51p6bvjl5hofT32OVdBrb2nUp8hSLdyqnLU08YpKxbMH9T8lZW
        g7234o9dZBDId5szI/2Kel5YM5P+1KSoS1vd+zx3Zjtn/rTrefBSc6daoEJBfkbB5DRp81ex
        h+/qTksVNZaSjyziu5cuuZ5NiLd31uRNswV5eHSe7U2ds6T4PNtqL/HpM7/Xx5jNOXX43d5z
        B15Jz0ia9GRJvufeGv3EW9nzLiZp3mWWclBiKc5INNRiLipOBAAXvfpe4gIAAA==
X-CMS-MailID: 20201201170918eucas1p2a34ca6e90ec710400a7a5d7121197d85
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201201170918eucas1p2a34ca6e90ec710400a7a5d7121197d85
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201201170918eucas1p2a34ca6e90ec710400a7a5d7121197d85
References: <CGME20201201170918eucas1p2a34ca6e90ec710400a7a5d7121197d85@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos5420 variant of USB2 PHY is handled by the same code as the
Exynos5250 one. Introducing a separate Kconfig symbol for it was an
over-engineering, which turned out to cause build break for certain
configurations:

ERROR: modpost: "exynos5420_usb2_phy_config" [drivers/phy/samsung/phy-exynos-usb2.ko] undefined!

Fix this by removing PHY_EXYNOS5420_USB2 symbol and using
PHY_EXYNOS5250_USB2 also for Exynos5420 SoCs.

Reported-by: Markus Reichl <m.reichl@fivetechno.de>
Fixes: 81b534f7e9b2 ("phy: samsung: Add support for the Exynos5420 variant of the USB2 PHY")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Vinod: this a fix to the patch merged yesterday. If you want me to resend
a fixed initial patch, let me know.
---
 drivers/phy/samsung/Kconfig            | 7 +------
 drivers/phy/samsung/phy-samsung-usb2.c | 2 --
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index 0f51d3bf38cc..e20d2fcc9fe7 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -64,12 +64,7 @@ config PHY_EXYNOS4X12_USB2
 config PHY_EXYNOS5250_USB2
 	bool
 	depends on PHY_SAMSUNG_USB2
-	default SOC_EXYNOS5250
-
-config PHY_EXYNOS5420_USB2
-	bool
-	depends on PHY_SAMSUNG_USB2
-	default SOC_EXYNOS5420
+	default SOC_EXYNOS5250 || SOC_EXYNOS5420
 
 config PHY_S5PV210_USB2
 	bool "Support for S5PV210"
diff --git a/drivers/phy/samsung/phy-samsung-usb2.c b/drivers/phy/samsung/phy-samsung-usb2.c
index 3908153f2ce5..ec2befabeea6 100644
--- a/drivers/phy/samsung/phy-samsung-usb2.c
+++ b/drivers/phy/samsung/phy-samsung-usb2.c
@@ -127,8 +127,6 @@ static const struct of_device_id samsung_usb2_phy_of_match[] = {
 		.compatible = "samsung,exynos5250-usb2-phy",
 		.data = &exynos5250_usb2_phy_config,
 	},
-#endif
-#ifdef CONFIG_PHY_EXYNOS5420_USB2
 	{
 		.compatible = "samsung,exynos5420-usb2-phy",
 		.data = &exynos5420_usb2_phy_config,
-- 
2.17.1

