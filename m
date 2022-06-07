Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6B1C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 17:08:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243574AbiFGRIZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 13:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243302AbiFGRIY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 13:08:24 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77979527F1
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 10:08:16 -0700 (PDT)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220607170813epoutp04718eee49712ad511ea612e0f30c6f51e~2Zanu1i0g0170401704epoutp04T
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 17:08:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220607170813epoutp04718eee49712ad511ea612e0f30c6f51e~2Zanu1i0g0170401704epoutp04T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654621693;
        bh=2PoVpUPEyTutMZxXuSNEqRgVo4Iqln//JqN+F4j2apw=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=m1YTrd7nbz5OvVpHKEE5CiHihA3PRYeeF5CnSOS1TvJa0rdBbnFWPTKhywaqxfKGx
         XcM+1j+fHhuG9hAjH3QbDlJzB/+4uKTDzJENnOL4og7GzW3sxSpwSH99DA4DyD40hL
         ZQz72oaHBQ6+8W+Du1C219+qFs59dHHqPM6lA1fA=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTP id
        20220607170812epcas5p40f9cc2ca9bd3b437102af28a4907818d~2ZamX4jfT1805918059epcas5p4m;
        Tue,  7 Jun 2022 17:08:12 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.180]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LHcHs1ykvz4x9Pp; Tue,  7 Jun
        2022 17:08:09 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
        epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        23.89.10063.9F58F926; Wed,  8 Jun 2022 02:08:09 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
        20220607170808epcas5p37a7a58921bc2c804ba84b4dedfac779f~2Zai4SfGt1312313123epcas5p3G;
        Tue,  7 Jun 2022 17:08:08 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220607170808epsmtrp1e084461163b12f832b3d6fca6bb2e616~2Zai3HslW2137221372epsmtrp18;
        Tue,  7 Jun 2022 17:08:08 +0000 (GMT)
X-AuditID: b6c32a49-4b5ff7000000274f-0b-629f85f90342
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        CE.BA.11276.8F58F926; Wed,  8 Jun 2022 02:08:08 +0900 (KST)
Received: from alimakhtar03 (unknown [107.122.12.5]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20220607170806epsmtip12de158f4e6f211188713a7961e01ad51~2ZahUG8kS2262422624epsmtip1-;
        Tue,  7 Jun 2022 17:08:06 +0000 (GMT)
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
In-Reply-To: <20220607072907.127000-3-chanho61.park@samsung.com>
Subject: RE: [PATCH v4 2/5] phy: samsung: ufs: rename cfg to cfgs for
 clarification
Date:   Tue, 7 Jun 2022 22:38:05 +0530
Message-ID: <00a801d87a91$28d6ec10$7a84c430$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ2i5m4q1cxa8jD2OFuvpyrHOG1RgHRq7q5ARilyfWr8Lhd8A==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNJsWRmVeSWpSXmKPExsWy7bCmpu7P1vlJBitbeC0u79e2mH/kHKvF
        hac9bBZ9Lx4yW+x9vZXdYtPja6wWE1Z9Y7GYcX4fk0Xr3iPsFjvvnGB24PLYtKqTzePOtT1s
        HpuX1Hv0bVnF6HH8xnYmj8+b5ALYorJtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1DS0t
        zJUU8hJzU22VXHwCdN0yc4AOU1IoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQUmBTo
        FSfmFpfmpevlpZZYGRoYGJkCFSZkZ8z438Va8EKxYv+ud6wNjDtkuxg5OSQETCTenfzG2MXI
        xSEksJtR4saznWwQzidGiXPf/7KBVAkJfGOUmHNGEqZj7bEtUEV7GSWmTFzOBOG8ZJRon/Ie
        rINNQFdix+I2MFtEYCGTxLQWHxCbWWACo8TKT94gNqeAg8SRj33sILawQKjE9m1bwWwWARWJ
        pR/fgNm8ApYSJ9ZMZYawBSVOznzCAjFHW2LZwtfMEBcpSPx8uowVYpeTxJtZPxkhasQlXh49
        wg5ynITAFg6JCx8/MUI0uEgsaX3KBGELS7w6voUdwpaSeNnfBmRzANkeEov+SEGEMyTeLl8P
        1WovceDKHBaQEmYBTYn1u/QhVvFJ9P5+wgTRySvR0SYEUa0q0fzuKguELS0xsbubFcL2kLj1
        dBvzBEbFWUgem4XksVlIHpiFsGwBI8sqRsnUguLc9NRi0wLDvNRyeHQn5+duYgSnWi3PHYx3
        H3zQO8TIxMF4iFGCg1lJhFcyfH6SEG9KYmVValF+fFFpTmrxIUZTYGhPZJYSTc4HJvu8knhD
        E0sDEzMzMxNLYzNDJXFegf+NSUIC6YklqdmpqQWpRTB9TBycUg1MK1YErGq+HdXbFDffsWXn
        /QnfFc/l/rxaci9c7dAZ3YL5Z+/u/7A02n9DQWsmSy17f3BYiV7RuxtNikybzyobzX+tsyfM
        82OorOJnxVUqwtlHdiZtubTaTr5YbIG/gnKQB1+30A47ybZQF0t1zqNKXtGH98dbRszUz31V
        W+ZwopYjQvbkxn89Vh4h7+Q6swJ1DyxTvX/s1SuDX67qKySm2s52nOd3c6tf9bZJm8VqVoa5
        sDRalU258v1wRd/aNdI1gv87dm9nid4Rvua+3bQANcvXC+8nLlo+9eZKeX/V43u2WsQKFml6
        dR4smVdgIem0kGOLlFFvsFJ+xlw5vzK1T7IneE/uWWwn8PnrsxlKLMUZiYZazEXFiQDI/6dT
        PgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsWy7bCSnO6P1vlJBmc7BSwu79e2mH/kHKvF
        hac9bBZ9Lx4yW+x9vZXdYtPja6wWE1Z9Y7GYcX4fk0Xr3iPsFjvvnGB24PLYtKqTzePOtT1s
        HpuX1Hv0bVnF6HH8xnYmj8+b5ALYorhsUlJzMstSi/TtErgy7m2/xVrwVKHi6sST7A2M22W6
        GDk5JARMJNYe28LWxcjFISSwm1Fi/6peRoiEtMT1jRPYIWxhiZX/nrNDFD1nlHg66QobSIJN
        QFdix+I2sG4RgaVMEh13ZjKDOMwCUxglLl99yQJSJSRwlFFi8wInEJtTwEHiyMc+sLHCAsES
        j+deA5vEIqAisfTjG7A4r4ClxIk1U5khbEGJkzOfgM1hFtCW6H3YyghjL1v4mhniPAWJn0+X
        sYLYIgJOEm9m/YSqEZd4efQI+wRG4VlIRs1CMmoWklGzkLQsYGRZxSiZWlCcm55bbFhgmJda
        rlecmFtcmpeul5yfu4kRHHdamjsYt6/6oHeIkYmD8RCjBAezkgivZPj8JCHelMTKqtSi/Pii
        0pzU4kOM0hwsSuK8F7pOxgsJpCeWpGanphakFsFkmTg4pRqYmJ9tUr+TeWNxxbGshLjDj+On
        N5vysnxv79i+/l23jFznhMIPdssElvGeNkn2TXv/tk84mO/5Pf07wjKJZ48dSJ3IIOrC/0w0
        KUVx3crzjRf4tH5scMhwX7f5Lwsr8ynNpVOcvn7XCzIP/MF7yc/11s2GZsknsgsaMuT+uFYH
        Pw3P+rk83lvdZfZF2aU2AXF8JRumHvc9KfPgjNOU7Ivvtk+befLGv+8piXfudAk6TPqfyGN9
        K8KmKpFl7+G8z9Eiln92fZv9TU+PWbH/4dNHUvOMGV9t9Eu1tJ0xQUxb9jbn0o8yHtqxwd/P
        cCXciJa7HLXazPLebfFFj3nNYlreVkulRGrVzzqx0L0ywuCOEktxRqKhFnNRcSIACVyHQyoD
        AAA=
X-CMS-MailID: 20220607170808epcas5p37a7a58921bc2c804ba84b4dedfac779f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220607072938epcas2p2bdb46daf95668223a07431433d91868f
References: <20220607072907.127000-1-chanho61.park@samsung.com>
        <CGME20220607072938epcas2p2bdb46daf95668223a07431433d91868f@epcas2p2.samsung.com>
        <20220607072907.127000-3-chanho61.park@samsung.com>
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
>Subject: =5BPATCH v4 2/5=5D phy: samsung: ufs: rename cfg to cfgs for clar=
ification
>
>Rename **cfg to **cfgs to clarify the naming.
>
>Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
>Signed-off-by: Chanho Park <chanho61.park=40samsung.com>
>---

Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

> drivers/phy/samsung/phy-exynos7-ufs.c      =7C 2 +-
> drivers/phy/samsung/phy-exynosautov9-ufs.c =7C 2 +-
> drivers/phy/samsung/phy-samsung-ufs.c      =7C 4 ++--
> drivers/phy/samsung/phy-samsung-ufs.h      =7C 4 ++--
> 4 files changed, 6 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/phy/samsung/phy-exynos7-ufs.c
>b/drivers/phy/samsung/phy-exynos7-ufs.c
>index 7c9008e163db..d1e9d0ae5c1d 100644
>--- a/drivers/phy/samsung/phy-exynos7-ufs.c
>+++ b/drivers/phy/samsung/phy-exynos7-ufs.c
>=40=40 -67,7 +67,7 =40=40 static const struct samsung_ufs_phy_cfg
>*exynos7_ufs_phy_cfgs=5BCFG_TAG_MAX=5D =3D =7B  =7D;
>
> const struct samsung_ufs_phy_drvdata exynos7_ufs_phy =3D =7B
>-	.cfg =3D exynos7_ufs_phy_cfgs,
>+	.cfgs =3D exynos7_ufs_phy_cfgs,
> 	.isol =3D =7B
> 		.offset =3D EXYNOS7_EMBEDDED_COMBO_PHY_CTRL,
> 		.mask =3D EXYNOS7_EMBEDDED_COMBO_PHY_CTRL_MASK,
>diff --git a/drivers/phy/samsung/phy-exynosautov9-ufs.c
>b/drivers/phy/samsung/phy-exynosautov9-ufs.c
>index d043dfdb598a..fa4d2983eec6 100644
>--- a/drivers/phy/samsung/phy-exynosautov9-ufs.c
>+++ b/drivers/phy/samsung/phy-exynosautov9-ufs.c
>=40=40 -57,7 +57,7 =40=40 static const struct samsung_ufs_phy_cfg
>*exynosautov9_ufs_phy_cfgs=5BCFG_TAG_MAX=5D
> =7D;
>
> const struct samsung_ufs_phy_drvdata exynosautov9_ufs_phy =3D =7B
>-	.cfg =3D exynosautov9_ufs_phy_cfgs,
>+	.cfgs =3D exynosautov9_ufs_phy_cfgs,
> 	.isol =3D =7B
> 		.offset =3D EXYNOSAUTOV9_EMBEDDED_COMBO_PHY_CTRL,
> 		.mask =3D
>EXYNOSAUTOV9_EMBEDDED_COMBO_PHY_CTRL_MASK,
>diff --git a/drivers/phy/samsung/phy-samsung-ufs.c
>b/drivers/phy/samsung/phy-samsung-ufs.c
>index 602ddef259eb..ed272631e8aa 100644
>--- a/drivers/phy/samsung/phy-samsung-ufs.c
>+++ b/drivers/phy/samsung/phy-samsung-ufs.c
>=40=40 -75,7 +75,7 =40=40 static int samsung_ufs_phy_wait_for_lock_acq(str=
uct
>phy *phy)  static int samsung_ufs_phy_calibrate(struct phy *phy)  =7B
> 	struct samsung_ufs_phy *ufs_phy =3D get_samsung_ufs_phy(phy);
>-	struct samsung_ufs_phy_cfg **cfgs =3D ufs_phy->cfg;
>+	struct samsung_ufs_phy_cfg **cfgs =3D ufs_phy->cfgs;
> 	const struct samsung_ufs_phy_cfg *cfg;
> 	int err =3D 0;
> 	int i;
>=40=40 -327,7 +327,7 =40=40 static int samsung_ufs_phy_probe(struct
>platform_device *pdev)
> 	drvdata =3D match->data;
> 	phy->dev =3D dev;
> 	phy->drvdata =3D drvdata;
>-	phy->cfg =3D (struct samsung_ufs_phy_cfg **)drvdata->cfg;
>+	phy->cfgs =3D (struct samsung_ufs_phy_cfg **)drvdata->cfgs;
> 	phy->isol =3D &drvdata->isol;
> 	phy->lane_cnt =3D PHY_DEF_LANE_CNT;
>
>diff --git a/drivers/phy/samsung/phy-samsung-ufs.h
>b/drivers/phy/samsung/phy-samsung-ufs.h
>index 91a0e9f94f98..1788b356cf56 100644
>--- a/drivers/phy/samsung/phy-samsung-ufs.h
>+++ b/drivers/phy/samsung/phy-samsung-ufs.h
>=40=40 -102,7 +102,7 =40=40 struct samsung_ufs_phy_cfg =7B  =7D;
>
> struct samsung_ufs_phy_drvdata =7B
>-	const struct samsung_ufs_phy_cfg **cfg;
>+	const struct samsung_ufs_phy_cfg **cfgs;
> 	struct pmu_isol =7B
> 		u32 offset;
> 		u32 mask;
>=40=40 -121,7 +121,7 =40=40 struct samsung_ufs_phy =7B
> 	struct clk *rx0_symbol_clk;
> 	struct clk *rx1_symbol_clk;
> 	const struct samsung_ufs_phy_drvdata *drvdata;
>-	struct samsung_ufs_phy_cfg **cfg;
>+	struct samsung_ufs_phy_cfg **cfgs;
> 	const struct pmu_isol *isol;
> 	u8 lane_cnt;
> 	int ufs_phy_state;
>--
>2.36.1


