Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2EEC3F6B0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 07:53:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbiG0Hx6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Jul 2022 03:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiG0Hx5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 03:53:57 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B76F422E1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2022 00:53:55 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220727075353epoutp018e7ad02f694f47e0c18d9d0ddb91739d~FoG5Yxjhj3110631106epoutp014
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2022 07:53:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220727075353epoutp018e7ad02f694f47e0c18d9d0ddb91739d~FoG5Yxjhj3110631106epoutp014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1658908433;
        bh=ZFuAEt2AsYWFEFX5DaZU4QMQYWY1k8O2MmbkLH2XzXQ=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=tOyrEFB6FqYad5LvUd6+p2PTOvY+7Yi2UgBwDjM5V8erQFkagqgq/hG2Yy+0tUe1n
         Fy3K7eiCfKy98E7r9OFMNgUU2qatCPA65x892TbJCzBo1vHdxexFdjuufC8AiyPXVx
         is4r0A3Uwa+4WcQpEXvM1GGgpkXyhO9FYue6EDzk=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220727075353epcas2p19946fb2c7adcd6a9e327a1b98b634c3d~FoG452n4i2997029970epcas2p1G;
        Wed, 27 Jul 2022 07:53:53 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.92]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4Lt5dD4xC5z4x9Pw; Wed, 27 Jul
        2022 07:53:52 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        40.BB.09650.01FE0E26; Wed, 27 Jul 2022 16:53:52 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220727075352epcas2p1458d9036ead4cfcdb53f157477d760da~FoG4DBkca2997029970epcas2p1F;
        Wed, 27 Jul 2022 07:53:52 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220727075352epsmtrp1b8094f1f473a00931c9c3cacb4ce9bd5~FoG4B6Uef0394903949epsmtrp1h;
        Wed, 27 Jul 2022 07:53:52 +0000 (GMT)
X-AuditID: b6c32a46-8bff9a80000025b2-05-62e0ef100581
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        94.B9.08905.F0FE0E26; Wed, 27 Jul 2022 16:53:51 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20220727075351epsmtip17829a445cb327f8cd45457e751071e0a~FoG304_ab2865328653epsmtip1O;
        Wed, 27 Jul 2022 07:53:51 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Chanwoo Choi'" <cwchoi00@gmail.com>,
        "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
        "'Tomasz Figa'" <tomasz.figa@gmail.com>,
        "'Chanwoo Choi'" <cw00.choi@samsung.com>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Stephen Boyd'" <sboyd@kernel.org>,
        "'Michael Turquette'" <mturquette@baylibre.com>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>
Cc:     "'Sam Protsenko'" <semen.protsenko@linaro.org>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <7aac0100-5f45-4586-b13e-df0f8bd95060@gmail.com>
Subject: RE: [PATCH 2/6] dt-bindings: clock: exynosautov9: add fsys1 clock
 definitions
Date:   Wed, 27 Jul 2022 16:53:51 +0900
Message-ID: <00ba01d8a18e$0345be80$09d13b80$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGvHdiJRxrKvfr9COO4ztLuF0RMcAHzpheBAcYwLosCFfdsLq22X/Nw
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGJsWRmVeSWpSXmKPExsWy7bCmma7A+wdJBrPOKFk8mLeNzeL6l+es
        Fs+OalvMP3KO1aLvxUNmi72vt7JbbHp8jdXiY889VosZ5/cxWVw85WrRuvcIu8XhN+2sFv+u
        bWSxeN4HFF+16w+jA7/H+xut7B47Z91l99i0qpPN4861PWwem5fUe/RtWcXo8XmTXAB7VLZN
        RmpiSmqRQmpecn5KZl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtDVSgpliTml
        QKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwC8wK94sTc4tK8dL281BIrQwMDI1OgwoTsjN8/
        rrIVLOesmLell62B8TR7FyMHh4SAicTaLxVdjFwcQgI7GCXWfW1ih3A+MUrM/rOIBcL5xihx
        8cl71i5GTrCOez+OsUEk9jJKnD37jRnCecEoMWnGWbAqNgF9iZcd21hBEiICa5glDj7+DDaL
        WeA1o8S/1rvMINs5BWwlJp3gAmkQFoiQWPR8GiOIzSKgKrHuVy8bSAmvgKVE/zEWkDCvgKDE
        yZlPwGxmAW2JZQtfM0NcpCDx8+kysL0iAm4SMzbMZoSoEZGY3dkGdpyEwB0OiaM9c6AaXCTO
        HlnJBmELS7w6voUdwpaSeNnfBmUXSyyd9YkJormBUeLytl9QDcYSs561M4IcxyygKbF+lz4k
        IJUljtyCuo1PouPwX2j48kp0tAlBNKpLHNg+nQXClpXonvOZdQKj0iwkn81C8tksJB/MQti1
        gJFlFaNYakFxbnpqsVGBETyyk/NzNzGCE7SW2w7GKW8/6B1iZOJgPMQowcGsJMKbEH0/SYg3
        JbGyKrUoP76oNCe1+BCjKTCoJzJLiSbnA3NEXkm8oYmlgYmZmaG5kamBuZI4r1fKhkQhgfTE
        ktTs1NSC1CKYPiYOTqkGppqP6ZzXnKuuG1hceMe54FxSsGiawW+397JXzIwu7DdQbb2Uc/CJ
        8L3Sl4v8pjfvnxTA1nHKsINN2exAdzTnptW1B8N+aMsXZroy7j/poJVllrvIalP1+z8sc7d8
        v2KVY3oq4uCyVeHqT/OXnEwSNFs02YWPPebu2nvGYT2+81a85rFecrzr+aO/186E3eRfOG+3
        9cYlfxM4A4L6r0Q9du1sYp4VqZhs6f6+8PEivRbtu9Ns9wv7p1T1qk+uZjSImn/i/HftHtnz
        0a2rjdecL/d9VLiD5f6Nw6U3Z1ddSH5w9A6HxrRLKXv8tz6e57j4h8H6nxLqobYCSvbXZu2O
        kLJdsJvp/p/PFX/qjTl76pVYijMSDbWYi4oTARUnUdNZBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsWy7bCSnK7A+wdJBifjLR7M28Zmcf3Lc1aL
        Z0e1LeYfOcdq0ffiIbPF3tdb2S02Pb7GavGx5x6rxYzz+5gsLp5ytWjde4Td4vCbdlaLf9c2
        slg87wOKr9r1h9GB3+P9jVZ2j52z7rJ7bFrVyeZx59oeNo/NS+o9+rasYvT4vEkugD2KyyYl
        NSezLLVI3y6BK+PYie/MBf2cFb1XZ7A3MG5m72Lk5JAQMJG49+MYWxcjF4eQwG5Gidt/vzJB
        JGQlnr3bAVUkLHG/5QgrRNEzRokfj3pYQBJsAvoSLzu2gSVEBDYwS8y8fpAdxGEWeM8osW/N
        XUaQKiGBT4wS25cIdDFycHAK2EpMOsEFEhYWCJOYPuU22CAWAVWJdb962UBKeAUsJfqPgYV5
        BQQlTs58AmYzC2hLPL35FM5etvA1M8RxChI/ny5jBbFFBNwkZmyYzQhRIyIxu7ONeQKj8Cwk
        o2YhGTULyahZSFoWMLKsYpRMLSjOTc8tNiwwzEst1ytOzC0uzUvXS87P3cQIjlUtzR2M21d9
        0DvEyMTBeIhRgoNZSYQ3Ifp+khBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeC10n44UE0hNLUrNT
        UwtSi2CyTBycUg1MaeLeQvLdb7rDg1YsPOW522qL/oIzDZsz5M77bzh3XV5mqxdnh5NPb8Q3
        H88bbbtneUrckgn+4t5Q+Gyiw9Wb/M9sO3Ye8AhwePOZ4ZHi5Xmf83atiI+/8JUzZt4JNeFl
        gfWVuqUW61ZsSFsTZM4jNf/87OQQ4RV37P2+xryLYjabOss7i+/tQy3m1Tz9+ydo/vjLsfRx
        W6l4ntnShGknltZvSL+48NXkG/L2wknPBfsKq/7cWKDrFv9ksu7M8nfr04I6O5essfbPeVfp
        saMwR0b10/lFU2cX862Oriw44O8buXK/a8HbZOtj+03uqFz5Y+/5IvnSoXJX1X0/PqZsj/t3
        scTUT539l2Bx4fRQJZbijERDLeai4kQAHkJxhUQDAAA=
X-CMS-MailID: 20220727075352epcas2p1458d9036ead4cfcdb53f157477d760da
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220727060612epcas2p34e861279ece7fbd3c7c87ce02c7d795c
References: <20220727060146.9228-1-chanho61.park@samsung.com>
        <CGME20220727060612epcas2p34e861279ece7fbd3c7c87ce02c7d795c@epcas2p3.samsung.com>
        <20220727060146.9228-3-chanho61.park@samsung.com>
        <7aac0100-5f45-4586-b13e-df0f8bd95060@gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> Subject: Re: =5BPATCH 2/6=5D dt-bindings: clock: exynosautov9: add fsys1 =
clock
> definitions
>=20
> On 22. 7. 27. 15:01, Chanho Park wrote:
> > Add fsys1(for usb and mmc) clock definitions.
> >
> > Signed-off-by: Chanho Park <chanho61.park=40samsung.com>
> > ---
> >  .../dt-bindings/clock/samsung,exynosautov9.h  =7C 25 +++++++++++++++++=
++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h
> b/include/dt-bindings/clock/samsung,exynosautov9.h
> > index 6305a84396ce..7e11e681da5c 100644
> > --- a/include/dt-bindings/clock/samsung,exynosautov9.h
> > +++ b/include/dt-bindings/clock/samsung,exynosautov9.h
> > =40=40 -228,6 +228,31 =40=40
> >
> >  =23define FSYS0_NR_CLK			37
> >
> > +/* CMU_FSYS1 */
> > +=23define FOUT_MMC_PLL				1
> > +
> > +=23define CLK_MOUT_FSYS1_BUS_USER			2
> > +=23define CLK_MOUT_MMC_PLL			3
>=20
> nitpik. This clock id doesn't have 'FSYS1' word. Is it right?

Nice catch. I copied it from the SoC User manual but it should have the FSY=
S1 prefix because it's definitely included in the FSYS1 cmu block
I'll update it next patchset.

Best Regards,
Chanho Park

