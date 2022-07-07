Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A483CCCA479
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Jul 2022 06:23:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233004AbiGGGXm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Jul 2022 02:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbiGGGXl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Jul 2022 02:23:41 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D113167F6
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 23:23:38 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220707062336epoutp047e5a9f834334cb433cad10eacc75814a~-d_XDSjsQ0521405214epoutp04E
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Jul 2022 06:23:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220707062336epoutp047e5a9f834334cb433cad10eacc75814a~-d_XDSjsQ0521405214epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1657175016;
        bh=7f5L4DjEO+aLa77Hxcn9O/EuxcRk5cu7K0kzE1Vb0ec=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=ux4LbWA/7ER97nECaaLuE7PbK24+X5uCPRC4nrHxvmvUCvtMSPf8cCUa9ZG6EJLCE
         jtvjH87tkOQSv5bqQNL+DAFs1010DlaGTaGdT9STM5ToMlNHuEwBlsEx5mZmIltZm7
         ERaVubCJW+4uMq8Dku/PHpt2E8MklEXO0xZJsk2Y=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220707062335epcas2p3f8348c61754f3b0c13371b3410ea7294~-d_WeVOM12269922699epcas2p3s;
        Thu,  7 Jul 2022 06:23:35 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.100]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4LdmZH2kRmz4x9Q4; Thu,  7 Jul
        2022 06:23:35 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        19.05.09666.7EB76C26; Thu,  7 Jul 2022 15:23:35 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220707062334epcas2p1c84d526f35b01cf659563aadbc6ace88~-d_VXd4go2180621806epcas2p1Z;
        Thu,  7 Jul 2022 06:23:34 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220707062334epsmtrp1a609aeb173d4d701b5554ccb2dd887b5~-d_VWsO5m1292212922epsmtrp1V;
        Thu,  7 Jul 2022 06:23:34 +0000 (GMT)
X-AuditID: b6c32a45-45bff700000025c2-1f-62c67be7b457
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        06.8B.08802.6EB76C26; Thu,  7 Jul 2022 15:23:34 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20220707062334epsmtip1bd1edf21f1f3959623fdef8026858f35~-d_VNJnCJ1715817158epsmtip1h;
        Thu,  7 Jul 2022 06:23:34 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>,
        "'Rob Herring'" <robh+dt@kernel.org>
Cc:     "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        <devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <f8107455-7bf0-2bc7-2fcd-4d0bb65ffd58@linaro.org>
Subject: RE: [PATCH] dt-bindings: phy: samsung,ufs-phy: match clock items
Date:   Thu, 7 Jul 2022 15:23:34 +0900
Message-ID: <013601d891ca$160b4bd0$4221e370$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHzy3gpe7LD6AksYEbZ6FU5PMJ83gJaHwwMAiFmYmGtGCBWwA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmqe7z6mNJBk1fBCwezNvGZjH/yDlW
        i74XD5kt9r7eym6x6fE1VosZ5/cxWbTuPcLuwO6xaVUnm8eda3vYPDYvqffo27KK0ePzJrkA
        1qhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygK5QU
        yhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BeYFesWJucWleel6eaklVoYGBkamQIUJ
        2Rl7Vh5gL1glXnGubQZjA+NxwS5GTg4JAROJBc/vMHcxcnEICexglFh2vx3K+cQoMaHxCCuE
        85lR4uaON0AOB1jL3n4biPguRolZW5rYIJwXjBIvZx9iB5nLJqAv8bJjG1i3iMBiRom+yx/B
        qpgFZjFK3HrTClbFKWAncWvxQqYuRnYOYQFPiQd8IFEWARWJOecegFXwClhKHDi6EMoWlDg5
        8wkLiM0soC2xbOFrZogfFCR+Pl3GCmKLCDhJPP7awQhRIyIxu7MN7B0JgakcEl3Tf7JBNLhI
        PL48gRXCFpZ4dXwLO4QtJfGyvw3KLpZYOusTE0RzA6PE5W2/oJqNJWY9a2cEBQWzgKbE+l36
        kFBRljhyC+o2PomOw3/ZIcK8Eh1tQhCN6hIHtk9ngbBlJbrnfGadwKg0C8lns5B8NgvJB7MQ
        di1gZFnFKJZaUJybnlpsVGAIj+zk/NxNjOAEquW6g3Hy2w96hxiZOBgPMUpwMCuJ8Oa2H00S
        4k1JrKxKLcqPLyrNSS0+xGgKDOuJzFKiyfnAFJ5XEm9oYmlgYmZmaG5kamCuJM7rlbIhUUgg
        PbEkNTs1tSC1CKaPiYNTqoFJ8XVFiAqbyAy7r5eKonj/n82ef8l0uezWRw8P2nwX7Jge3rfv
        mr+ab/+VjOcM+5/Y2/vOPHR52eLW5cIeO9Jsyu0vSwqFVPG9vcLbZFLD1WJ586rcpMfy34P5
        gmyTA6bHPfDML5nz+1BF+RvDsytM9hvPMpt91/1l034f/tXnOyVydpx0tag6YphYnzJNlaFW
        geXm4oT22FsCnQcXqIV8f9dmurs2+4ftilOfHaWuvdSRvR/GEf8mZSPf1YsPnqT9X6FT0XuO
        58/lYMZmM54fAW2vs87u2Ht++ozmaWxvtaJmMYUuKzdz+6by1Wqb+aLX6YtmT4io6z5+f/Pb
        /tdfuOQ91qjZfI6RmMur0bVKiaU4I9FQi7moOBEA6mzNfykEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpikeLIzCtJLcpLzFFi42LZdlhJTvdZ9bEkgy1XtS0ezNvGZjH/yDlW
        i74XD5kt9r7eym6x6fE1VosZ5/cxWbTuPcLuwO6xaVUnm8eda3vYPDYvqffo27KK0ePzJrkA
        1igum5TUnMyy1CJ9uwSujF+/rjMVtIpXbPnxj6mBcYFgFyMHh4SAicTefpsuRi4OIYEdjBLT
        9k1l7mLkBIrLSjx7t4MdwhaWuN9yhBWi6BmjROu7iWAJNgF9iZcd28ASIgKLGSUObp/HBOIw
        C8xjlDjds58NouUQo8Sh6w8ZQVo4Bewkbi1eCFTFziEs4CnxgA8kyiKgIjHn3AOwobwClhIH
        ji6EsgUlTs58wgJiMwtoSzy9+RTOXrbwNdSlChI/ny5jBbFFBJwkHn/tYISoEZGY3dnGPIFR
        eBaSUbOQjJqFZNQsJC0LGFlWMUqmFhTnpucWGxYY5aWW6xUn5haX5qXrJefnbmIER5OW1g7G
        Pas+6B1iZOJgBHqRg1lJhDe3/WiSEG9KYmVValF+fFFpTmrxIUZpDhYlcd4LXSfjhQTSE0tS
        s1NTC1KLYLJMHJxSDUwCTW0T/7sJl0effOXG/piFc0Xf1P41SVV5a+earBFXvS1y5HD4h7xH
        Oz81TJ7rbxe1xjqKt3WRjYaS99NvOWnpj5fNY2ftuy0SdurnwYoLhgJC+1bus81vWJf2M25j
        +tJgzVnbc7OsL+cbXheP53Y677o7ekvvj1/fhU/MOPRtxkrNdBm2W/0H847PWxbLuf/BQY2G
        eyZt/0oTn/55eyb4Y7sEowz7xUuat1rfiv3XmfHL7HHn5fjL0mVHV/S+l4qfkcmwfOOe0gzG
        OaqpnExCdX0OsuEcDVzH5Tw6+ys4c3tDFW8yl8+d371E/T8nb8sVYy7haw/m3J68a5LpqaYP
        F1dG6tpJ1lx32Zg25bISS3FGoqEWc1FxIgD6U/7eFQMAAA==
X-CMS-MailID: 20220707062334epcas2p1c84d526f35b01cf659563aadbc6ace88
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220707005844epcas2p474d0ac5ca2d11bb37bc6353b9e7d50bc
References: <CGME20220707005844epcas2p474d0ac5ca2d11bb37bc6353b9e7d50bc@epcas2p4.samsung.com>
        <20220707005554.98268-1-chanho61.park@samsung.com>
        <f8107455-7bf0-2bc7-2fcd-4d0bb65ffd58@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> > Below error is detected from dtbs_check. exynos7-ufs-phy is required
> > symbol clocks otherwise only PLL ref clock is required.
> >
> > clock-names: =5B'ref_clk'=5D is too short
>=20
> Thank you for your patch. There is something to discuss/improve.

Thanks for your review :)=20

>=20
> >
> > Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> > Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> > Suggested-by: Alim Akhtar <alim.akhtar=40samsung.com>
> > Signed-off-by: Chanho Park <chanho61.park=40samsung.com>
> > ---
> >  .../bindings/phy/samsung,ufs-phy.yaml         =7C 47 +++++++++++++++--=
--
> >  1 file changed, 37 insertions(+), 10 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> > b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> > index 8da99461e817..3b04f31d9f21 100644
> > --- a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> > =40=40 -27,18 +27,12 =40=40 properties:
> >        - const: phy-pma
> >
> >    clocks:
> > -    items:
> > -      - description: PLL reference clock
> > -      - description: symbol clock for input symbol ( rx0-ch0 symbol
> clock)
> > -      - description: symbol clock for input symbol ( rx1-ch1 symbol
> clock)
> > -      - description: symbol clock for output symbol ( tx0 symbol clock=
)
> > +    minItems: 1
> > +    maxItems: 4
> >
> >    clock-names:
> > -    items:
> > -      - const: ref_clk
> > -      - const: rx1_symbol_clk
> > -      - const: rx0_symbol_clk
> > -      - const: tx0_symbol_clk
> > +    minItems: 1
> > +    maxItems: 4
> >
> >    samsung,pmu-syscon:
> >      =24ref: '/schemas/types.yaml=23/definitions/phandle-array'
> > =40=40 -53,6 +47,39 =40=40 properties:
> >        It can be phandle/offset pair. The second cell which can represe=
nt
> an
> >        offset is optional.
> >
> > +allOf:
>=20
> The allOf block should go after =22required=22 block.

I wrote the block after required block but I changed the order by referring
https://elixir.bootlin.com/linux/v5.18-rc2/source/Documentation/devicetree/=
bindings/clock/samsung,exynos7885-clock.yaml=23L53
I'll correct the order.

>=20
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: samsung,exynos7-ufs-phy
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: PLL reference clock
> > +            - description: symbol clock for input symbol ( rx0-ch0 sym=
bol
> clock)
> > +            - description: symbol clock for input symbol ( rx1-ch1 sym=
bol
> clock)
> > +            - description: symbol clock for output symbol ( tx0
> > + symbol clock)
>=20
> While moving drop space after '('.

I'll drop the spaces.

Best Regards,
Chanho Park

