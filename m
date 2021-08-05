Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1021DC432BE
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Aug 2021 09:32:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3CC760230
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Aug 2021 09:32:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238317AbhHEJcr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Aug 2021 05:32:47 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:53673 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238126AbhHEJcr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Aug 2021 05:32:47 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20210805093231epoutp031c657bb5563d1cb5f7ac64371dc49a7d~YXzYQdwOO2724427244epoutp03x
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Aug 2021 09:32:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20210805093231epoutp031c657bb5563d1cb5f7ac64371dc49a7d~YXzYQdwOO2724427244epoutp03x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1628155951;
        bh=4Sj9w1KreodUtPW30Wow7JUe/4/3NIZ0abD2ZJDPwPo=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=tDIw7ASSO6dWyWyVah9MZxvyk1Kv0ub4bU+rLifcyHExg2gn5PRz8b2KdpbfzzqK/
         1WE5KF5LpKCrD/tVpEDkupgTy/DqfdrE4+xP/atABv8/2Xkdko82pc5vEk9LT38q01
         dA1OQSYdQwYsAcFDf/u9puoZmj7f63McWyJnc3Gs=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTP id
        20210805093226epcas5p306cecb152db385353bbbe48bca790502~YXzT5i7Jp0150801508epcas5p3K;
        Thu,  5 Aug 2021 09:32:26 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.181]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4GgNg73zHNz4x9Pt; Thu,  5 Aug
        2021 09:32:19 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
        epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
        3D.D6.41701.D10BB016; Thu,  5 Aug 2021 18:32:13 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
        20210805092619epcas5p165c3a064056e0979cb8178e92fa7d206~YXt92jbe-0733707337epcas5p15;
        Thu,  5 Aug 2021 09:26:19 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210805092619epsmtrp255a4faeb5a8ecf0536c8dc21e9ad673e~YXt91tgJ90817208172epsmtrp24;
        Thu,  5 Aug 2021 09:26:19 +0000 (GMT)
X-AuditID: b6c32a4b-0abff7000001a2e5-08-610bb01da1f7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        8B.E7.08394.ABEAB016; Thu,  5 Aug 2021 18:26:19 +0900 (KST)
Received: from alimakhtar02 (unknown [107.122.12.5]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210805092617epsmtip19e4d2b50513b28b095bafeee586bc2d9~YXt8Wtl-10330303303epsmtip1F;
        Thu,  5 Aug 2021 09:26:17 +0000 (GMT)
From:   "Alim Akhtar" <alim.akhtar@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>,
        "'Rob Herring'" <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Cc:     "'Chanwoo Choi'" <cw00.choi@samsung.com>,
        "'Pankaj Dubey'" <pankaj.dubey@samsung.com>,
        "'Sam Protsenko'" <semen.protsenko@linaro.org>,
        "'Marc Zyngier'" <maz@kernel.org>
In-Reply-To: <b0d6ff2a-24af-96c1-62a1-8b920c63e05a@canonical.com>
Subject: RE: [PATCH] arm64: dts: exynos: correct GIC CPU interfaces address
 range on Exynos7
Date:   Thu, 5 Aug 2021 14:56:14 +0530
Message-ID: <03d701d789db$f275d290$d76177b0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGqCsm6I7l6cIRsiJEa3ZtJxO0jtAJYiPTmAtVSVZirljKmUA==
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAJsWRmVeSWpSXmKPExsWy7bCmhq7sBu5Eg4udmhbXvzxntZh/5Byr
        xca3P5gsNj2+xmpxedccNosZ5/cxWeycc5LVYtHWL+wWrXuPsFs879vH5MDlMauhl81j06pO
        No871/aweWxeUu/Rt2UVo8fnTXIBbFHZNhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaW
        FuZKCnmJuam2Si4+AbpumTlAlykplCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCkwK
        9IoTc4tL89L18lJLrAwNDIxMgQoTsjOOHW1mKVgjWHHx4g/mBsY1fF2MnBwSAiYSx/vnMHcx
        cnEICexmlJh0ZB8jhPOJUaLpxH1WCOcbo8TGlkZGmJbWqdfZIBJ7GSVmde+Acl4yStya/gqs
        ik1AV2LH4jawhAhI+/LPK8AGMwtsYJTYt/ITWBWngKPEig8T2UBsYYE4iTl/ZjOB2CwCKhJn
        XmwAs3kFLCVuf//GDGELSpyc+YQFxGYW0JZYtvA1M8RNChI/ny5jBbFFBJwkLj25xgRRIy5x
        9GcP2HsSAls4JDZ9+8MG0eAi8eDxe6iHhCVeHd/CDmFLSXx+txeohgPIzpbo2WUMEa6RWDrv
        GAuEbS9x4MocFpASZgFNifW79CHCshJTT62DWssn0fv7CRNEnFdixzwYW1Wi+d1VqDHSEhO7
        u1knMCrNQvLZLCSfzULywSyEbQsYWVYxSqYWFOempxabFhjnpZbDozw5P3cTIzjpannvYHz0
        4IPeIUYmDsZDjBIczEoivMmLuRKFeFMSK6tSi/Lji0pzUosPMZoCg3sis5Rocj4w7eeVxBua
        WBqYmJmZmVgamxkqifOyx39NEBJITyxJzU5NLUgtgulj4uCUamB68aFq7+FPXglzAuvfr++1
        O59waPXMoi4Tf+n5lb8y87KSJh239RcovPX4SOXX5Vb1ov6bN+qGfVjYk/L2XIK7aulTL4nb
        f1h2lXH+ap1ru/ry8fUdq/59T/yQOa1W8jaD8YVVbkYnDTtUGPawFHWZG6729T1h5fzrqRoH
        +9w9fpyrz6y9ZRVqPat+r+nFz/0ZAfndOfI3zwkuWhv17G+Q0J9NPO3XzBtqP5ww4Mp+eOwk
        f0PTetENn4ImTD5ro83oIf5EZduGRKeA6wpb83mnrF00Od/6x6FW12t11iIvr74o41n6ySFn
        59H+xavfpDdGLvj+YKHV+QCJV/Nf/gyaM+HXPCM3owjXmAXaV8UPKLEUZyQaajEXFScCAB5W
        P/hDBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsWy7bCSnO7uddyJBp8fM1pc//Kc1WL+kXOs
        Fhvf/mCy2PT4GqvF5V1z2CxmnN/HZLFzzklWi0Vbv7BbtO49wm7xvG8fkwOXx6yGXjaPTas6
        2TzuXNvD5rF5Sb1H35ZVjB6fN8kFsEVx2aSk5mSWpRbp2yVwZVzbeoa94LtAxfPWl+wNjF95
        uxg5OSQETCRap15nA7GFBHYzSmz8WAIRl5a4vnECO4QtLLHy33Mgmwuo5jmjxLQHD8Ea2AR0
        JXYsbmMDSYgI/GKUmHPuHzOIwyywiVHi1+OtrBAtZxglvvafYAVp4RRwlFjxYSJYu7BAjETr
        0llMIDaLgIrEmRcbwGxeAUuJ29+/MUPYghInZz5hAbGZBbQleh+2MsLYyxa+Zoa4T0Hi59Nl
        YPNFBJwkLj25xgRRIy5x9GcP8wRG4VlIRs1CMmoWklGzkLQsYGRZxSiZWlCcm55bbFhgmJda
        rlecmFtcmpeul5yfu4kRHHlamjsYt6/6oHeIkYmD8RCjBAezkghv8mKuRCHelMTKqtSi/Pii
        0pzU4kOM0hwsSuK8F7pOxgsJpCeWpGanphakFsFkmTg4pRqYLkhzci0LXCX/wUOFw6/9xNxI
        86Obj16s2OculiO0QnvTy7O+mT8/zlpcZBfAWiIt2/Xcq/f+VsnzVfcW17Pu/9F2tqJpi2rz
        ueypwUJKCpMObmH3f30gJO5cVRGPx7m/sq5RT6I/cGz0C+Ppa9zzUOq79t8TbDfXcQW+/qpq
        Nqn3TbX50ZmXNzaLsuWrGonx2Wzd6zd90Y1X6SJSdgLnjwgwOV9csmr2hElriw1cud95aPPu
        uFGRqKAx7a6aR7m01TW7u9rmK47cObRL4Q1PWeCEDQVlsz49eW+z3Db9n3BM7onK057TmF5l
        tdhFHXi/4XQBf36/9u7K7Sf5Dd9sZtj34f/l0iMr3d1UHe95KbEUZyQaajEXFScCAEu+D2cr
        AwAA
X-CMS-MailID: 20210805092619epcas5p165c3a064056e0979cb8178e92fa7d206
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
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40canonical.com>
> Sent: 05 August 2021 13:07
> To: Rob Herring <robh+dt=40kernel.org>; devicetree=40vger.kernel.org; lin=
ux-
> arm-kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org; li=
nux-
> kernel=40vger.kernel.org
> Cc: Alim Akhtar <alim.akhtar=40samsung.com>; Chanwoo Choi
> <cw00.choi=40samsung.com>; Pankaj Dubey <pankaj.dubey=40samsung.com>;
> Sam Protsenko <semen.protsenko=40linaro.org>; Marc Zyngier
> <maz=40kernel.org>
> Subject: Re: =5BPATCH=5D arm64: dts: exynos: correct GIC CPU interfaces a=
ddress
> range on Exynos7
>=20
> On 05/08/2021 09:21, Krzysztof Kozlowski wrote:
> > The GIC-400 CPU interfaces address range is defined as 0x2000-0x3FFF
> > (by ARM).
> >
>=20
Looking at DDI0471B_gic400_r0p1_trm.pdf, CPU interface range is 0x0000 =7E =
0x10000

> I underestimated the issue - this is actually bug as there is a GICC_DIR
> register at offset 0x1000. Therefore:
>=20
Looking at the exynos7 and exynos5433 UMs looks like GICC_DIR is at offset =
0x2100 (from 0x1100_0000 GIC base)
It is possible for you to cross check once?

> Fixes: b9024cbc937d (=22arm64: dts: Add initial device tree support for
> exynos7=22)
>=20
> > Reported-by: Sam Protsenko <semen.protsenko=40linaro.org>
> > Reported-by: Marc Zyngier <maz=40kernel.org>
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski=40canonical.com=
>
> > ---
> >  arch/arm64/boot/dts/exynos/exynos7.dtsi =7C 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi
> > b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> > index 8b06397ba6e7..c73a597ca66e 100644
> > --- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> > =40=40 -137,7 +137,7 =40=40 gic: interrupt-controller=4011001000 =7B
> >  			=23address-cells =3D <0>;
> >  			interrupt-controller;
> >  			reg =3D	<0x11001000 0x1000>,
> > -				<0x11002000 0x1000>,
> > +				<0x11002000 0x2000>,
> >  				<0x11004000 0x2000>,
> >  				<0x11006000 0x2000>;
> >  		=7D;
> >
>=20
>=20
> Best regards,
> Krzysztof

