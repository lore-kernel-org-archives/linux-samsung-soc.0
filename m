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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37BDC64E8A
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Dec 2020 06:49:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A88722202
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Dec 2020 06:49:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728673AbgLBGtH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Dec 2020 01:49:07 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50973 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728588AbgLBGtG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Dec 2020 01:49:06 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201202064815euoutp0269f77a9f08653241f1df73b421d3db9d~M03u3P3Oq1491214912euoutp02U
        for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Dec 2020 06:48:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201202064815euoutp0269f77a9f08653241f1df73b421d3db9d~M03u3P3Oq1491214912euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1606891695;
        bh=9ovn9JFtBCo1MPpfzJwcl+vEgamQPJqwqNu7w6wshpc=;
        h=From:To:Cc:Subject:Date:References:From;
        b=LWnfsESDK3PbaYFPaHanpvy3nksFJ9o0KbwesWep79ndhKd1hJQx98zUI4v/M23ko
         uFuiUCJ1SuPGy/3FG/LUqrMG2sy/lhQMlyNcnXV34hhVl4pU1xNRb1Ayslp3K0wEfh
         Lb4aYHox4eZgb+dKB7U8tvtZ6y6pLRYv0Zp4K3Dc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201202064807eucas1p28206d47669ef9bc81fd832184b894e48~M03n8AtMd1112011120eucas1p2V;
        Wed,  2 Dec 2020 06:48:07 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 94.F8.27958.7A837CF5; Wed,  2
        Dec 2020 06:48:07 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201202064807eucas1p124fbd6237538e9ba01c7981891e7a082~M03nXeoNS2527425274eucas1p1t;
        Wed,  2 Dec 2020 06:48:07 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201202064807eusmtrp2fa2f4e8e648afd966c5da00bb5462cae~M03nWypZU2913329133eusmtrp22;
        Wed,  2 Dec 2020 06:48:07 +0000 (GMT)
X-AuditID: cbfec7f2-f15ff70000006d36-35-5fc738a7e26e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 59.46.21957.7A837CF5; Wed,  2
        Dec 2020 06:48:07 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201202064806eusmtip22d0ed016b3d4c26ebd04aefcb40d4cdc~M03m1uim82440024400eusmtip2o;
        Wed,  2 Dec 2020 06:48:06 +0000 (GMT)
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
Subject: [PATCH v2] phy: samsung: Merge Kconfig for Exynos5420 and
 Exynos5250
Date:   Wed,  2 Dec 2020 07:47:59 +0100
Message-Id: <20201202064759.24300-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBIsWRmVeSWpSXmKPExsWy7djPc7rLLY7HG8z6bWKxccZ6VosLT3vY
        LM6f38BucXnXHDaLGef3MVm8PPKD0WLtkbvsFuun/WS1OPymndVi550TzBbfTjxidOD2uHWn
        3mPnrLvsHptWdbJ59G1Zxehx/MZ2Jo/Pm+QC2KK4bFJSczLLUov07RK4Mk6/+s9c8JC/YkPr
        VMYGxh28XYycHBICJhLTDu9nAbGFBFYwSvQ/5epi5AKyvzBK/Jl2hRUi8ZlRYvsOhS5GDrCG
        9pN+EDXLGSVunmpihms4+uA32CQ2AUOJrrddbCC2iICqxOe2BewgRcwCK5klfnd0MIEkhAX8
        Jf6sPgjWwAJUtP/aJ7AGXgFbiWn3HzBDnCcvsXrDAbANEgJLOSTaO66xQZzhIrHlUhpEjbDE
        q+Nb2CFsGYn/O+czQdQ3M0o8PLeWHcLpYZS43DSDEaLKWuLOuV9gg5gFNCXW79KHCDtK9J/6
        ygIxn0/ixltBkDAzkDlp23RmiDCvREebEES1msSs4+vg1h68cAnqZA+JhkcXmSEBFyvxbVcP
        8wRGuVkIuxYwMq5iFE8tLc5NTy02zEst1ytOzC0uzUvXS87P3cQITByn/x3/tINx7quPeocY
        mTgYDzFKcDArifCy/DsSL8SbklhZlVqUH19UmpNafIhRmoNFSZx31ew18UIC6YklqdmpqQWp
        RTBZJg5OqQYmVw2DFXMUGCLeHXK5xhz/t7i6eKdem8T877+DhFekNRUXLI0zseB6djHJw75Z
        65Hb4TUtE/Wdlq0VZz0xb4OOAWdTvun5ba0/j1t9mcz5XPfiJzFNrcApOpYnr09rT2L6+XZi
        4N9rYRVCEosD+Lsr0z9F7HrCOr9tWX+XlU7YL1/2d9Ica3XPL9d59vLozHy15b3HwoSepNVP
        unUkgGlmWE5T16tf53g0XmlN+/1I0uS0owZTlEy4tOx/A55Vh6RVeypV2PczSz08afS1+JnC
        qgOPeu0Y+H4pP5Q+YcD1d/8/k9aEg49LJGdpTdzaynp6xbF5f8/u6j8dHZf77uftmIsv+1Q2
        hO+5/qjg10tDJZbijERDLeai4kQAJ31PW4sDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrALMWRmVeSWpSXmKPExsVy+t/xe7rLLY7HG+xfyG+xccZ6VosLT3vY
        LM6f38BucXnXHDaLGef3MVm8PPKD0WLtkbvsFuun/WS1OPymndVi550TzBbfTjxidOD2uHWn
        3mPnrLvsHptWdbJ59G1Zxehx/MZ2Jo/Pm+QC2KL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxM
        LPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mk6/+s9c8JC/YkPrVMYGxh28XYwcHBICJhLtJ/26
        GLk4hASWMkpcnPqJsYuREyguI3FyWgMrhC0s8edaFxtE0SdGie7XD5hBEmwChhJdb0ESnBwi
        AqoSn9sWsIMUMQusZ5Z4+f8/WEJYwFdi1bTpYJNYgIr2X/sEFucVsJWYdh9ikISAvMTqDQeY
        JzDyLGBkWMUoklpanJueW2yoV5yYW1yal66XnJ+7iREYtNuO/dy8g3Heq496hxiZOBgPMUpw
        MCuJ8LL8OxIvxJuSWFmVWpQfX1Sak1p8iNEUaN9EZinR5Hxg3OSVxBuaGZgamphZGphamhkr
        ifNunbsmXkggPbEkNTs1tSC1CKaPiYNTqoHJ4NVFk7bsKxVcr5g+Pb5Wx8ZhNeGxeptVbojI
        ghtpnFd2+JUH/E77btCbohWsO0NLMJI5t9pK6c3LE42mMWUKC+z+b792UbB3a91j3k17C08a
        2AgYcr318/i6oUzr0B51MxFTmYZZfr7vqw99ZHH8U6jZJznpUZrh2tUG2wNOPbmWfJHpt71h
        rPfap0K6zz92LFTsSW8K7Xsa45J+SG+eUKIAq65tuMDDo1ci+8SOT7V/4lrnyKI++dTXmdHT
        V75YIDN/5dPCo29VZp/ee8mW+8a+thThy/H7+xZdZzr6o+fJqpdnSktmFNxzsm4TmLIuhOd4
        /W8j8Rfn+DWFi4/01f76/SvhzcZDO6Y6nbqmxFKckWioxVxUnAgARDrgLeMCAAA=
X-CMS-MailID: 20201202064807eucas1p124fbd6237538e9ba01c7981891e7a082
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201202064807eucas1p124fbd6237538e9ba01c7981891e7a082
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201202064807eucas1p124fbd6237538e9ba01c7981891e7a082
References: <CGME20201202064807eucas1p124fbd6237538e9ba01c7981891e7a082@eucas1p1.samsung.com>
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
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>
---
v2:
- reworded subject
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

