Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15942C4320A
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Aug 2021 09:59:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC24E61029
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Aug 2021 09:59:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239957AbhHEKAE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Aug 2021 06:00:04 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:39454 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240004AbhHEKAD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Aug 2021 06:00:03 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210805095948epoutp0456fa425086aad309171c9377b899d021~YYLM639_n0061100611epoutp04D
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Aug 2021 09:59:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210805095948epoutp0456fa425086aad309171c9377b899d021~YYLM639_n0061100611epoutp04D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1628157588;
        bh=CHAPGstxC+TDjJP5V8Gm/7yEvXUbbl/ZgdEEnyEgR/E=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=haCirjAaVWk4ygVwv1AmTmXl5WP7JwZ3m+lOATrZbdgA1Pev5auT2WfOP4mkdRDPz
         DVEdLUqXcTpZ5787DxgJoHtQnedZsRI+JbYGOwMyJKDF0+Y52HUfXdSlByvJM9LOph
         JHbGV9LRm90+obZ5rGfRxcTGjSs+ggmhjXPeYVR0=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTP id
        20210805095947epcas5p37a2a943873d88d220808bd34b0ff5fe7~YYLMl7iH22405524055epcas5p39;
        Thu,  5 Aug 2021 09:59:47 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.177]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4GgPGl67w5z4x9Q2; Thu,  5 Aug
        2021 09:59:43 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
        epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        2A.3F.09595.886BB016; Thu,  5 Aug 2021 18:59:36 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
        20210805095435epcas5p3a9aba4509a1521f611b9bc057e8c053b~YYGp3T4Pu1625916259epcas5p3E;
        Thu,  5 Aug 2021 09:54:35 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210805095435epsmtrp2a1e6d9877a124cd8313d23c3ef781509~YYGp2Yxfb2255722557epsmtrp2L;
        Thu,  5 Aug 2021 09:54:35 +0000 (GMT)
X-AuditID: b6c32a4a-eebff7000000257b-8d-610bb68867cb
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        E2.43.08289.B55BB016; Thu,  5 Aug 2021 18:54:35 +0900 (KST)
Received: from alimakhtar02 (unknown [107.122.12.5]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210805095434epsmtip221542ab3aa113e5ea24044bc23daa2ae~YYGoYL_uN2105321053epsmtip2U;
        Thu,  5 Aug 2021 09:54:33 +0000 (GMT)
From:   "Alim Akhtar" <alim.akhtar@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>,
        "'Rob Herring'" <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Cc:     "'Chanwoo Choi'" <cw00.choi@samsung.com>,
        "'Pankaj Dubey'" <pankaj.dubey@samsung.com>,
        "'Sam Protsenko'" <semen.protsenko@linaro.org>,
        "'Marc Zyngier'" <maz@kernel.org>
In-Reply-To: <4fc60199-44cd-41ea-9178-92b131d21b73@canonical.com>
Subject: RE: [PATCH] arm64: dts: exynos: correct GIC CPU interfaces address
 range on Exynos7
Date:   Thu, 5 Aug 2021 15:24:32 +0530
Message-ID: <040901d789df$e5af4420$b10dcc60$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGqCsm6I7l6cIRsiJEa3ZtJxO0jtAJYiPTmAtVSVZgBZ8MakQF0f/XuAkVHGEmrbS6MkA==
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPJsWRmVeSWpSXmKPExsWy7bCmlm7HNu5Eg8YLqhbXvzxntZh/5Byr
        xca3P5gsNj2+xmpxedccNosZ5/cxWeycc5LVYtHWL+wWrXuPsFs879vH5MDlMauhl81j06pO
        No871/aweWxeUu/Rt2UVo8fnTXIBbFHZNhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaW
        FuZKCnmJuam2Si4+AbpumTlAlykplCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCkwK
        9IoTc4tL89L18lJLrAwNDIxMgQoTsjPadx5jK7gsWvHz3meWBsYZQl2MnBwSAiYSO363s3Ux
        cnEICexmlGhofsII4XxilLiz/Rg7hPOZUaJl0wR2mJZzp5+xQCR2MUp8uf0Kqv8lo8SL6TcZ
        QarYBHQldixuA0uICHxjlFj+eQXYYGaBDYwSXRtnMIFUcQo4Skzq6QCzhQXiJOb8mQ1mswio
        SFzcfQXI5uDgFbCU+NTMCRLmFRCUODnzCQuIzSygLbFs4WtmiJMUJH4+XcYKYosIhElcn9LH
        ClEjLnH0Zw8zyF4JgR0cEjumfmCCaHCR6Gw6yAZhC0u8Or4F6jcpic/v9rKB7JUQyJbo2WUM
        Ea6RWDrvGAuEbS9x4MocFpASZgFNifW79CHCshJTT61jgljLJ9H7+wnUJl6JHfNgbFWJ5ndX
        ocZIS0zs7madwKg0C8lns5B8NgvJB7MQti1gZFnFKJlaUJybnlpsWmCUl1oOj/Hk/NxNjOCU
        q+W1g/Hhgw96hxiZOBgPMUpwMCuJ8CYv5koU4k1JrKxKLcqPLyrNSS0+xGgKDO2JzFKiyfnA
        pJ9XEm9oYmlgYmZmZmJpbGaoJM7LHv81QUggPbEkNTs1tSC1CKaPiYNTqoHJ78zntBunJPaW
        9nQwFH2NMjx9seWxbehG4bALpv3S7yJFnknuV5U47Mxp9ehfziTe4rLz71+8mWlQsOx0XXvF
        XNUP9i0LPAolrs2JP/uZz2uv0opJUWsCE9gl/KJj7yRdMK//oS6RXJNrplLL5Zlx7YXuGfXU
        0mievl+njdoSd/Xphhspy6y4dtVdecP87e4J3uuvKxbOvnLjXGSL6HEXvz23Krc4eYZdupqq
        lJPRuLK4+O3cPdwGWywkpQ7KJWrsUTAJ6Z637Ojv5x8Yl/ZsC/lTIrDOcfvfqftl9wlxMLNy
        3FOPsl2Vvj0wxUNqztqyot0rfF7MXVDjLidtNdf15wcO30mpWzMma8hE7FRiKc5INNRiLipO
        BADYLA1bQgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsWy7bCSvG70Vu5Egx8blC2uf3nOajH/yDlW
        i41vfzBZbHp8jdXi8q45bBYzzu9jstg55ySrxaKtX9gtWvceYbd43rePyYHLY1ZDL5vHplWd
        bB53ru1h89i8pN6jb8sqRo/Pm+QC2KK4bFJSczLLUov07RK4Ml690S6YJVrx/uYxtgbGu4Jd
        jJwcEgImEudOP2PpYuTiEBLYwSjR+mw1O0RCWuL6xglQtrDEyn/P2SGKnjNKbHy+iRkkwSag
        K7FjcRsbSEJE4BejxJxz/5hBHGaBTYwSP1e/h2p5wiQx9cIksFmcAo4Sk3o6mEBsYYEYidal
        s8BsFgEViYu7rwDZHBy8ApYSn5o5QcK8AoISJ2c+YQGxmQW0JXoftjLC2MsWvmaGOE9B4ufT
        ZawgtohAmMT1KX2sEDXiEkd/9jBPYBSehWTULCSjZiEZNQtJywJGllWMkqkFxbnpucWGBUZ5
        qeV6xYm5xaV56XrJ+bmbGMFxp6W1g3HPqg96hxiZOBgPMUpwMCuJ8CYv5koU4k1JrKxKLcqP
        LyrNSS0+xCjNwaIkznuh62S8kEB6YklqdmpqQWoRTJaJg1Oqgcn0XcqGyD+62yTjpyh+n6J/
        sGjC9cv32dnkHA4Z5Mt6Zjk0WsSeadBJCZtWe1XkVtSlb74xUXdE8h3f7H0z56PR64Xl5TeN
        DjLM9DfsFKrXOPbOZ5vE7gMv9bevfMifvSa1e0Vf04FvP7Z/T9dfOeGrSfyDNsVFeyckCU9P
        7j3Np63wX7HS2fB4HM+vmz4ZTzau4K3Sz++amSe7ZdOLaR/DtGLPvpnNXnbp7NTI1ofmf0tP
        cNTuyVLc8MZt1abJs88+ubDHKk37wd7/6yKa/ET5Mi5EbPm89ejXtgOS2r9cs00kkl07FGan
        bT65pXz+Lj2vhMknBZdoW1qlcG5msVrpv+Y190XnL3pz8xrC0h4osRRnJBpqMRcVJwIAGJhh
        RCoDAAA=
X-CMS-MailID: 20210805095435epcas5p3a9aba4509a1521f611b9bc057e8c053b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210805073653epcas5p21b4c2358b7de2b3c21dbc357af957137
References: <20210805072110.4730-1-krzysztof.kozlowski@canonical.com>
        <CGME20210805073653epcas5p21b4c2358b7de2b3c21dbc357af957137@epcas5p2.samsung.com>
        <b0d6ff2a-24af-96c1-62a1-8b920c63e05a@canonical.com>
        <03d701d789db$f275d290$d76177b0$@samsung.com>
        <7c019443-6153-f059-418b-3b268750f7a8@canonical.com>
        <4fc60199-44cd-41ea-9178-92b131d21b73@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40canonical.com>
> Sent: 05 August 2021 15:15
> To: Alim Akhtar <alim.akhtar=40samsung.com>; 'Rob Herring'
> <robh+dt=40kernel.org>; devicetree=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org; linux-
> kernel=40vger.kernel.org
> Cc: 'Chanwoo Choi' <cw00.choi=40samsung.com>; 'Pankaj Dubey'
> <pankaj.dubey=40samsung.com>; 'Sam Protsenko'
> <semen.protsenko=40linaro.org>; 'Marc Zyngier' <maz=40kernel.org>
> Subject: Re: =5BPATCH=5D arm64: dts: exynos: correct GIC CPU interfaces a=
ddress
> range on Exynos7
>=20
> On 05/08/2021 11:43, Krzysztof Kozlowski wrote:
> > On 05/08/2021 11:26, Alim Akhtar wrote:
> >> Hi Krzysztof,
> >>
> >>> -----Original Message-----
> >>> From: Krzysztof Kozlowski <krzysztof.kozlowski=40canonical.com>
> >>> Sent: 05 August 2021 13:07
> >>> To: Rob Herring <robh+dt=40kernel.org>; devicetree=40vger.kernel.org;
> >>> linux- arm-kernel=40lists.infradead.org;
> >>> linux-samsung-soc=40vger.kernel.org; linux- kernel=40vger.kernel.org
> >>> Cc: Alim Akhtar <alim.akhtar=40samsung.com>; Chanwoo Choi
> >>> <cw00.choi=40samsung.com>; Pankaj Dubey
> <pankaj.dubey=40samsung.com>;
> >>> Sam Protsenko <semen.protsenko=40linaro.org>; Marc Zyngier
> >>> <maz=40kernel.org>
> >>> Subject: Re: =5BPATCH=5D arm64: dts: exynos: correct GIC CPU interfac=
es
> >>> address range on Exynos7
> >>>
> >>> On 05/08/2021 09:21, Krzysztof Kozlowski wrote:
> >>>> The GIC-400 CPU interfaces address range is defined as
> >>>> 0x2000-0x3FFF (by ARM).
> >>>>
> >>>
> >> Looking at DDI0471B_gic400_r0p1_trm.pdf, CPU interface range is
> >> 0x0000 =7E 0x10000
> >>
> >>> I underestimated the issue - this is actually bug as there is a
> >>> GICC_DIR register at offset 0x1000. Therefore:
> >>>
> >> Looking at the exynos7 and exynos5433 UMs looks like GICC_DIR is at
> >> offset 0x2100 (from 0x1100_0000 GIC base) It is possible for you to cr=
oss
> check once?
> >>
> >
> > That's a mistake in Exynos manual. GICC_DIR is at 0x1000:
>=20
> 0x1000 from CPU base offset, so 0x3000 from GIC base.
>=20
> > https://developer.arm.com/documentation/ddi0471/b/programmers-
> model/cp
> > u-interface-register-summary
> >
> > We have discussion here:
> > https://lore.kernel.org/linux-samsung-soc/0277c701-cc25-cdc5-d3b9-cf2c
> >
> c2ba4de5=40canonical.com/T/=23m1ced9a28bed27f5cf74e281fb68efe1b57d5609
> e
Thanks for pointing to this discussion, I missed this.
Agreed.
Feel Free to add
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

> >
> > Range of 0x10000 is definitely wrong as it overlaps with two other
> > ranges.
>=20
>=20
> Best regards,
> Krzysztof

