Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1FA8CCA47C
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 17:13:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244555AbiFGRNF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 13:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345457AbiFGRNE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 13:13:04 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81B831DDA
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 10:12:58 -0700 (PDT)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220607171256epoutp01a79d3bc6c2e9615acc6520584dab2fba~2Zeu8IcUk0557305573epoutp01G
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 17:12:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220607171256epoutp01a79d3bc6c2e9615acc6520584dab2fba~2Zeu8IcUk0557305573epoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654621976;
        bh=bw0dnRnFhOp/hyNEeOjIOUIosfP7U3oYs375oSGOr0c=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=ALHOsnECqLpPMr0+sHLKb9NSkUHbL2+qfJdfmgdd6bpwOj+nUFUl+oRlAE0p6wVRE
         EQO45E4dR0GwtVFpXhQEKMeFSqBcUHUhfCQeiZ6JJPKp8pOIDcRC+raaQhT+26MeKw
         fbSOUje3303y8gjeOLwNGpWOatw12JidBZL+G2pA=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTP id
        20220607171255epcas5p12df538b8b023131aac1d0f9fa09d9c98~2ZeuT8U-72595125951epcas5p1g;
        Tue,  7 Jun 2022 17:12:55 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.177]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LHcPJ1dJ5z4x9Ps; Tue,  7 Jun
        2022 17:12:52 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
        epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        F7.E9.10063.4178F926; Wed,  8 Jun 2022 02:12:52 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
        20220607171251epcas5p15fe34a9e43a05855ee63cec91bded620~2ZeqpsSqw2595225952epcas5p1g;
        Tue,  7 Jun 2022 17:12:51 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220607171251epsmtrp266fb65f35eeffb9c6fbd9a4e49716706~2ZeqoV7l40886008860epsmtrp2Y;
        Tue,  7 Jun 2022 17:12:51 +0000 (GMT)
X-AuditID: b6c32a49-4cbff7000000274f-f6-629f8714c0f6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        5B.F6.08924.3178F926; Wed,  8 Jun 2022 02:12:51 +0900 (KST)
Received: from alimakhtar03 (unknown [107.122.12.5]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20220607171249epsmtip2eedef61d838661406e495e2ab88f85c6~2ZepHELVm1261312613epsmtip2W;
        Tue,  7 Jun 2022 17:12:49 +0000 (GMT)
From:   "Alim Akhtar" <alim.akhtar@samsung.com>
To:     "'Chanho Park'" <chanho61.park@samsung.com>,
        "'Kishon Vijay Abraham I'" <kishon@ti.com>,
        "'Vinod Koul'" <vkoul@kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>
Cc:     <devicetree@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20220607072907.127000-6-chanho61.park@samsung.com>
Subject: RE: [PATCH v4 5/5] phy: samsung: ufs: support secondary ufs phy
Date:   Tue, 7 Jun 2022 22:42:48 +0530
Message-ID: <00ab01d87a91$d1af41c0$750dc540$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ2i5m4q1cxa8jD2OFuvpyrHOG1RgINGfN8AmrYMU6r5EzPUA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFJsWRmVeSWpSXmKPExsWy7bCmhq5I+/wkg3PbWC0u79e2mH/kHKvF
        hac9bBZ9Lx4yW+x9vZXdYtPja6wWE1Z9Y7GYcX4fk0Xr3iPsFjvvnGB24PLYtKqTzePOtT1s
        HpuX1Hv0bVnF6HH8xnYmj8+b5ALYorJtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1DS0t
        zJUU8hJzU22VXHwCdN0yc4AOU1IoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQUmBTo
        FSfmFpfmpevlpZZYGRoYGJkCFSZkZzyd942lYJZgxemzK5gbGL/zdTFyckgImEhMn7WRGcQW
        EtjNKNHwhLeLkQvI/sQo0T1/CSOE85lR4sbOC0wwHUen7WeHSOxilLi5az4zhPOSUeLW3t9g
        VWwCuhI7FrexgdgiAguZJKa1+IDYzAITGCVWfvIGsTkFHCQaOq+D7RYW8JB4sO8tUC8HB4uA
        isSZbRwgYV4BS4k3D28wQtiCEidnPmGBGKMtsWzha2aIgxQkfj5dxgqxykmicf46qBpxiZdH
        j4AdKiGwg0PiwqkzUB+4SDx7vZoFwhaWeHV8CzuELSXx+d1eNpAbJIDuWfRHCiKcIfF2+XpG
        CNte4sCVOSwgJcwCmhLrd+lDrOKT6P39hAmik1eio00IolpVovndVahF0hITu7tZIWwPiRdX
        trFPYFScheSxWUgem4XkgVkIyxYwsqxilEwtKM5NTy02LTDMSy2Hx3Zyfu4mRnCi1fLcwXj3
        wQe9Q4xMHIyHGCU4mJVEeCXD5ycJ8aYkVlalFuXHF5XmpBYfYjQFBvZEZinR5Hxgqs8riTc0
        sTQwMTMzM7E0NjNUEucV+N+YJCSQnliSmp2aWpBaBNPHxMEp1cC0bV/4T1kpfYWwH0n3H+zP
        7EhTsrRmTt77bumJWMYLfDubuVLmnbscxRJxfIFLwoHzwjo33q/5F9ojGrxCzSzyluRTf728
        o/yMTgembvxl/+zX/Rf+j1gMd3YvCL4s88BLZ9PSJzan1uXlph3XsvgwxWGlzuPmcyvPZU5T
        rlG/wOsSvGfmeZHDq04ki1fND9iVIn56Qkjg28C/x1kkz9WcmJo/4x7jq+l161me/bgtrGnf
        xrWy/YOc1PtopqxNPrw3DpWJ/ZQSfrPOgnUN18nfK7bsFLJJV1paH18z/eexl5lfuLVsP685
        3KWnJ8oZMcHun2yOfc0R/oVWm3b/Fzi6bqWg6Z8bWdIXrp2bqBu7X4mlOCPRUIu5qDgRAPLL
        gCw9BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsWy7bCSvK5w+/wkg83zFCwu79e2mH/kHKvF
        hac9bBZ9Lx4yW+x9vZXdYtPja6wWE1Z9Y7GYcX4fk0Xr3iPsFjvvnGB24PLYtKqTzePOtT1s
        HpuX1Hv0bVnF6HH8xnYmj8+b5ALYorhsUlJzMstSi/TtErgyNvXcYyy4I1Ax7/U9lgbGnXxd
        jJwcEgImEken7WfvYuTiEBLYwSjx6HUbC0RCWuL6xgnsELawxMp/z6GKnjNKnLw6iQ0kwSag
        K7FjcRsbSEJEYCmTRMedmcwgDrPAFEaJy1dfgo0SEjjKKHHqHzeIzSngINHQeZ0ZxBYW8JB4
        sO8tUxcjBweLgIrEmW0cIGFeAUuJNw9vMELYghInZz4BG8MsoC3R+7CVEcZetvA1M8R1ChI/
        ny5jBbFFBJwkGuevg6oXl3h59Aj7BEbhWUhGzUIyahaSUbOQtCxgZFnFKJlaUJybnltsWGCU
        l1quV5yYW1yal66XnJ+7iREcdVpaOxj3rPqgd4iRiYPxEKMEB7OSCK9k+PwkId6UxMqq1KL8
        +KLSnNTiQ4zSHCxK4rwXuk7GCwmkJ5akZqemFqQWwWSZODilGphONXx57Bd0WypyW5/YqTeC
        5sonOnZ2PU84drnw4KYpJtxFnM65C09cNfljEzk/fI1O7vb6efJxTYdWdLiqJDGLK+84f3m9
        2vcUQRm+azqenIwK2m+XNKy8tOy67Kl7O+pvH5+5xKnfNvJwQdmWW8FF84R1VvXLsEZpGvaH
        ip/j+jbhsfbFuwpcyc/yGpI+hPEnHA4u37Ew6rnbxF+iNRcdnxkX3el+150ovJ13itfb7XvD
        NxzJe9e07/A03ryp5+c3y70zjJb+eDZc794HX5/PmdNPVV4rmnxFK6b85Qs5Dd9va+Xv1T8p
        2Daj9NWpqf94T2qHnPVWL+sw5HU8bul653fFoqCPx76/ZTJVueCkxFKckWioxVxUnAgAMDkn
        3ykDAAA=
X-CMS-MailID: 20220607171251epcas5p15fe34a9e43a05855ee63cec91bded620
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220607072938epcas2p104b9af05f4d4b18337df8bb6dab4964b
References: <20220607072907.127000-1-chanho61.park@samsung.com>
        <CGME20220607072938epcas2p104b9af05f4d4b18337df8bb6dab4964b@epcas2p1.samsung.com>
        <20220607072907.127000-6-chanho61.park@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



>-----Original Message-----
>From: Chanho Park =5Bmailto:chanho61.park=40samsung.com=5D
>Sent: Tuesday, June 7, 2022 12:59 PM
>To: Kishon Vijay Abraham I <kishon=40ti.com>; Vinod Koul
><vkoul=40kernel.org>; Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.or=
g>;
>Alim Akhtar <alim.akhtar=40samsung.com>; Rob Herring
><robh+dt=40kernel.org>; Krzysztof Kozlowski
><krzysztof.kozlowski+dt=40linaro.org>
>Cc: devicetree=40vger.kernel.org; linux-phy=40lists.infradead.org; linux-
>samsung-soc=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; Cha=
nho
>Park <chanho61.park=40samsung.com>
>Subject: =5BPATCH v4 5/5=5D phy: samsung: ufs: support secondary ufs phy
>
>To support secondary ufs phy device, we need to get an offset for phy
>isolation from the syscon DT node. If the first index argument of the node=
 is
>existing, we can read the offset value and set it as isol->offset.
>
>Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
>Signed-off-by: Chanho Park <chanho61.park=40samsung.com>
>---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>


> drivers/phy/samsung/phy-samsung-ufs.c =7C 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/drivers/phy/samsung/phy-samsung-ufs.c
>b/drivers/phy/samsung/phy-samsung-ufs.c
>index 0c933e364064..206a79c69a6c 100644
>--- a/drivers/phy/samsung/phy-samsung-ufs.c
>+++ b/drivers/phy/samsung/phy-samsung-ufs.c
>=40=40 -288,6 +288,7 =40=40 static int samsung_ufs_phy_probe(struct
>platform_device *pdev)
> 	struct phy *gen_phy;
> 	struct phy_provider *phy_provider;
> 	const struct samsung_ufs_phy_drvdata *drvdata;
>+	u32 isol_offset;
> 	int err =3D 0;
>
> 	match =3D of_match_node(samsung_ufs_phy_match, dev->of_node);
>=40=40 -330,6 +331,10 =40=40 static int samsung_ufs_phy_probe(struct
>platform_device *pdev)
> 	phy->has_symbol_clk =3D drvdata->has_symbol_clk;
> 	memcpy(&phy->isol, &drvdata->isol, sizeof(phy->isol));
>
>+	if (=21of_property_read_u32_index(dev->of_node, =22samsung,pmu-
>syscon=22, 1,
>+					&isol_offset))
>+		phy->isol.offset =3D isol_offset;
>+
> 	phy->lane_cnt =3D PHY_DEF_LANE_CNT;
>
> 	phy_set_drvdata(gen_phy, phy);
>--
>2.36.1


