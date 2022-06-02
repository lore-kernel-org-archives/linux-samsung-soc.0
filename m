Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DB9C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jun 2022 13:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbiFBNEX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 09:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235133AbiFBNEW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 09:04:22 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E660D8088
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 06:04:20 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220602130417epoutp029f35a3a97ed3004e00524b09f2c0dbe4~0z3Nt7ie-0450604506epoutp02m
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 13:04:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220602130417epoutp029f35a3a97ed3004e00524b09f2c0dbe4~0z3Nt7ie-0450604506epoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654175057;
        bh=7429YeZ9Hyu90o3eIAgz56jiehI3KDgsZbfulkTdugI=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=caob5pWVeCEYuGImGjDoUsA+i6qr0nlCQu564YAgQCltWCY7B3qQmp5Q74jaQ+lo7
         TkcJNug1Ts0t5QVBlrOk9Si1jWql6QP/wV6yEqLBEFNA5MyZ/xqn8OEluqWhOoEp9P
         yK3DHsgf8YOzoW04jVjgwy4gzF3QJR/hmRse4Fgo=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220602130416epcas2p24b4c67e69d3a4d93a7ab3585db29c2f9~0z3M689mY1685816858epcas2p2V;
        Thu,  2 Jun 2022 13:04:16 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.92]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LDR6l6YzFz4x9Pv; Thu,  2 Jun
        2022 13:04:15 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        23.F7.10028.F45B8926; Thu,  2 Jun 2022 22:04:15 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220602130415epcas2p22dd936d7686731681a22fe6cfd6c0173~0z3LcyOUD2782627826epcas2p2s;
        Thu,  2 Jun 2022 13:04:15 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220602130415epsmtrp112e0bc2d5e6f547bc288b40feb4efb4f~0z3Lb58kV2151821518epsmtrp1g;
        Thu,  2 Jun 2022 13:04:15 +0000 (GMT)
X-AuditID: b6c32a47-589ff7000000272c-26-6298b54fefa3
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        BF.0F.08924.F45B8926; Thu,  2 Jun 2022 22:04:15 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20220602130415epsmtip2c7027309bcdd4b51a6ac04812825f005~0z3LQm-Qj1820818208epsmtip2R;
        Thu,  2 Jun 2022 13:04:15 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Kishon Vijay Abraham I'" <kishon@ti.com>,
        "'Vinod Koul'" <vkoul@kernel.org>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>
Cc:     <devicetree@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <58e06727-a9ae-7466-6bc3-feee92bd9bf1@linaro.org>
Subject: RE: [PATCH v2 2/6] phy: samsung: ufs: constify samsung_ufs_phy_cfg
Date:   Thu, 2 Jun 2022 22:04:15 +0900
Message-ID: <050401d87681$42e6cb70$c8b46250$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLWkTnA63V9WykH3rm22/0hqLdk6gLx1W7JAUiDJCwCxuJ30qsH1R0w
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBJsWRmVeSWpSXmKPExsWy7bCmua7/1hlJBs9vGls8mLeNzWL+kXOs
        Fhee9rBZ9L14yGyx9/VWdotNj6+xWkxY9Y3FYsb5fUwWrXuPsFvsvHOC2YHLY9OqTjaPO9f2
        sHlsXlLv0bdlFaPH8RvbmTw+b5ILYIvKtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0
        tDBXUshLzE21VXLxCdB1y8wBukxJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2Be
        oFecmFtcmpeul5daYmVoYGBkClSYkJ3RtiCh4DdLxZFJb1gbGLtZuhg5OSQETCQ2H/jK1MXI
        xSEksINR4v7vm2wQzidGibktfewQzmdGicfH5gKVcYC1zHjEAxHfxSix6ekuRpBRQgIvGCUu
        LBMGsdkE9CVedmxjBSkSEZjPJPG08yoTSIJZYAKjxMpP3iA2p4CdxOVpp9lAhgoLeEus7gkH
        CbMIqEgs/vkF7DxeAUuJo69eQtmCEidnPmGBGKMtsWzha2aIFxQkfj5dxgpiiwi4STTfvs0K
        USMiMbuzjRnkBgmBLRwSSzedZIVocJHYvf0JI4QtLPHq+BZ2CFtK4mV/G5RdLLF01icmiOYG
        RonL236xQSSMJWY9a2cEOZpZQFNi/S59SKAoSxy5BXUbn0TH4b/sEGFeiY42IYhGdYkD26dD
        Q11WonvOZ9YJjEqzkHw2C8lns5B8MAth1wJGllWMYqkFxbnpqcVGBcbwqE7Oz93ECE6yWu47
        GGe8/aB3iJGJg/EQowQHs5IIb8muqUlCvCmJlVWpRfnxRaU5qcWHGE2BYT2RWUo0OR+Y5vNK
        4g1NLA1MzMwMzY1MDcyVxHm9UjYkCgmkJ5akZqemFqQWwfQxcXBKNTAZRH0oEiiu3SbNJBW8
        8PcxnoXxC7y/vzm547ndE5GOXdn3p70Vc+d5nrhwtrGIek1RxcroJfWVezfYXfrxYvdCrbte
        YlP7Vr439jvQ0Prlr37OUuPquON20rvT/77ftmv7tqDqnjk6/yNeJBtnLj1jsHf21twNHtrf
        5++Z2H2/6+wm5fcGsaK8FksXuLdoJYkVORf1u+///m9q90crq88Fmi4Llua1hMocb7h43jHu
        ptl0HsUr8rpuU03qPRtaSl71xXQV/ubXdlr5SfzAglfJAqrn43KTZj4/ldqped8hWdBLZ2tP
        5K3ARb8q9A3T/RsU1EpDN76XltR4yeYiXqKyqntm1NEry6/Jcjd9favEUpyRaKjFXFScCABa
        9peuOwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsWy7bCSvK7/1hlJBk+vCVo8mLeNzWL+kXOs
        Fhee9rBZ9L14yGyx9/VWdotNj6+xWkxY9Y3FYsb5fUwWrXuPsFvsvHOC2YHLY9OqTjaPO9f2
        sHlsXlLv0bdlFaPH8RvbmTw+b5ILYIvisklJzcksSy3St0vgyli66wlLwUeWig1dXYwNjI0s
        XYwcHBICJhIzHvF0MXJxCAnsYJRYNOE0WxcjJ1BcVuLZux3sELawxP2WI6wQRc8YJS5damAE
        SbAJ6Eu87NgGlhARWMwk0X/iLBuIwywwhVHi8tWXLBAtXxkl/u5qAZvLKWAncXkayA4ODmEB
        b4nVPeEgYRYBFYnFP7+wgNi8ApYSR1+9hLIFJU7OfAJmMwtoSzy9+RTOXrbwNTPEeQoSP58u
        YwWxRQTcJJpv32aFqBGRmN3ZxjyBUXgWklGzkIyahWTULCQtCxhZVjFKphYU56bnFhsWGOWl
        lusVJ+YWl+al6yXn525iBMedltYOxj2rPugdYmTiYDzEKMHBrCTCW7JrapIQb0piZVVqUX58
        UWlOavEhRmkOFiVx3gtdJ+OFBNITS1KzU1MLUotgskwcnFINTGJtZ266fN+rt3C3eiBPIUes
        eN1d36nJIiWVcsqJjtUK27obrt6aubyEe/c5Udut6rUqYf3bp/m/mvLBaumSLq9V0exXlU+7
        SSqell9X+ut257G+13sDnMPnZc3685H3xqFtusW6frZ8SUFf/pSJJn5IO/jw58MfcjVhD07c
        PPCZ+aNZQaOyxGXLbWus2yZaW7N5L9Gz1WCZ31vh+tXGee6d/guxTF7fmb5bnc5f2Zk8oWay
        voA197poUa/HHJeTo32TGCwdSu5/3H/IVnjXAuXLzmGcqmYn/a+eCFmy7fHanR5RE6RUKzNX
        d058cWb/0hsz534QkHjg/y+Cr3yyU8aG/xt0Axa1fdu6ofx6tRJLcUaioRZzUXEiAGem2cgq
        AwAA
X-CMS-MailID: 20220602130415epcas2p22dd936d7686731681a22fe6cfd6c0173
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220602053329epcas2p238f5019ff98e4d9fcf5fea0001a773a9
References: <20220602053250.62593-1-chanho61.park@samsung.com>
        <CGME20220602053329epcas2p238f5019ff98e4d9fcf5fea0001a773a9@epcas2p2.samsung.com>
        <20220602053250.62593-3-chanho61.park@samsung.com>
        <58e06727-a9ae-7466-6bc3-feee92bd9bf1@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> > =40=40 -75,7 +75,7 =40=40 static int samsung_ufs_phy_wait_for_lock_acq(=
struct
> > phy *phy)  static int samsung_ufs_phy_calibrate(struct phy *phy)  =7B
> >  	struct samsung_ufs_phy *ufs_phy =3D get_samsung_ufs_phy(phy);
> > -	struct samsung_ufs_phy_cfg **cfgs =3D ufs_phy->cfg;
> > +	const struct samsung_ufs_phy_cfg **cfgs =3D ufs_phy->cfg;
>=20
> This should be rather array of const pointers to const data.

The prototype of ufs_phy->cfg is 'const struct samsung_ufs_phy_cfg **' by t=
his patch.
So, it should be,

const struct samsung_ufs_phy_cfg ** const cfgs =3D ufs_phy->cfg;

Best Regards,
Chanho Park

