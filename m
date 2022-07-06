Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8974C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jul 2022 10:54:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbiGFKyt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jul 2022 06:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbiGFKys (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 06:54:48 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB66327CD4
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 03:54:43 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220706105438epoutp024c47c7cd0b00736f9bfcb6a966c55671~-OBtZS9ST2677826778epoutp02Q
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 10:54:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220706105438epoutp024c47c7cd0b00736f9bfcb6a966c55671~-OBtZS9ST2677826778epoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1657104878;
        bh=45CRPTknghTnvkMmbK4QInqopdYFGDiIkZOU15RznLY=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=E6SgKRW5wt319fK471cbsllK01i/BJdnZLSCsIHMFnUp5LtOa0h2/TVzu+/D2n6BO
         aRTKe0nCzVsZnikbk9dExYhhrUZ0Xi0w/g8xh0fyKi/9rjX83FvnvttSkoo6vRBL4F
         xHMwdtyWahUhMjY3R7VJyToWR69zIlLMWqcG1Mmk=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220706105436epcas2p3c6dd47caa0775b928b49c6bacb2cf926~-OBsQJu0_1494614946epcas2p3j;
        Wed,  6 Jul 2022 10:54:36 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.92]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4LdGdS1s0Rz4x9Pq; Wed,  6 Jul
        2022 10:54:36 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        14.95.09650.AE965C26; Wed,  6 Jul 2022 19:54:34 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220706105434epcas2p251c818e61041fc0b37e0397c98f310b5~-OBpxKzq-1754917549epcas2p2U;
        Wed,  6 Jul 2022 10:54:34 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220706105434epsmtrp1740ac46097fc60e6d1c3b412224d7e1b~-OBpttD1f0340803408epsmtrp1V;
        Wed,  6 Jul 2022 10:54:34 +0000 (GMT)
X-AuditID: b6c32a46-0b9ff700000025b2-2e-62c569ea90c2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        4C.69.08905.9E965C26; Wed,  6 Jul 2022 19:54:33 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20220706105433epsmtip279be50fdbba478d815711eeec4aaa258~-OBpjqbVf2000720007epsmtip2N;
        Wed,  6 Jul 2022 10:54:33 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>
Cc:     <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <f1e03b78-f844-6eec-2ace-d177af59f0c9@linaro.org>
Subject: RE: ExynosAutov9 SDAK UFS phy dtbs check error
Date:   Wed, 6 Jul 2022 19:54:33 +0900
Message-ID: <021701d89126$c6e8f410$54badc30$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJm4VubqEIWt0Qo4Lng+N+g3AcGPQJcMJCiAj3WOLWsL7lvsA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJKsWRmVeSWpSXmKPExsWy7bCmme6rzKNJBu86NS0ezNvGZrH39VZ2
        ixnn9zE5MHvcubaHzaNvyypGj8+b5AKYo7JtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1
        DS0tzJUU8hJzU22VXHwCdN0yc4AWKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIK
        zAv0ihNzi0vz0vXyUkusDA0MjEyBChOyM7q2r2IruCJY0dazkrmBcQtvFyMnh4SAicTa+ecZ
        uxi5OIQEdjBKvG85xAbhfGKU2D1/CzuE841RYu7G72wwLWf697NAJPYySuzb+pYZwnnBKNG6
        Yx4LSBWbgL7Ey45trCC2iECmxPJLb8G6mQXUJZ4eeQgW5xSwk3hxfxrQCg4OYQFziQ0N8iBh
        FgEViZVr1zGB2LwClhKHt1xghbAFJU7OfMICMUZbYtnC18wQBylI/Hy6DGqVk8SWx5sYIWpE
        JGZ3toHdJiHwiF2i8/RWqA9cJN7+OMkKYQtLvDoO8iaILSXxsr8Nyi6WWDrrExNEcwOjxOVt
        v6CajSVmPWtnBDmaWUBTYv0ufRBTQkBZ4sgtqNv4JDoO/2WHCPNKdLQJQTSqSxzYPp0FwpaV
        6J7zmXUCo9IsJJ/NQvLZLCQfzELYtYCRZRWjWGpBcW56arFRgRE8spPzczcxgtOgltsOxilv
        P+gdYmTiYDzEKMHBrCTCu2rSwSQh3pTEyqrUovz4otKc1OJDjKbAsJ7ILCWanA9MxHkl8YYm
        lgYmZmaG5kamBuZK4rxeKRsShQTSE0tSs1NTC1KLYPqYODilGpgcT1x0ndzw8GpL/N2zu6Q9
        zhzIY7evMDvi0C7vFmTE12p/PUvmN0tYmOECm1eN5XNLnZZrKDQ4V/P1an3/+2lxVYC+T/iE
        WeH7j//+H1wkvyumT4FVbu4C+cX7mHdyl+mvOzDT/Odn+3fdtjO/Or4LcV1+RPKYg9BSaye7
        h+JVt5q+8Ql2rWCRXPHiudKhn65fmjo3vjzKvOSSlfObqzqTNXJcdvgv++39qJ/r5Q8plgoG
        lR3BK17+2KK7Y/73ZaXShxKqj7plvVVdcNU5l9eOc6FHDgsnq8YpFoUJvW/bmV+u2iqwsXir
        /sm++sdPrzF8drmmInnq5Oy+eXOLEn9KPemW45oQknB6v3yiCocSS3FGoqEWc1FxIgAnTC3D
        DAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKLMWRmVeSWpSXmKPExsWy7bCSvO7LzKNJBuv7rC0ezNvGZrH39VZ2
        ixnn9zE5MHvcubaHzaNvyypGj8+b5AKYo7hsUlJzMstSi/TtErgy9t45x1qwUbDi3e4fLA2M
        /bxdjJwcEgImEmf697N0MXJxCAnsZpT4e243M0RCVuLZux3sELawxP2WI6wQRc8YJa4caAQr
        YhPQl3jZsY0VxBYRyJS4t6eLCcRmFlCXeHrkIVTDQUaJXy1/wIo4BewkXtyfBjSVg0NYwFxi
        Q4M8SJhFQEVi5dp1YL28ApYSh7dcYIWwBSVOznzCAjFTW6L3YSsjjL1s4WuoQxUkfj5dBnWD
        k8SWx5ugakQkZne2MU9gFJ6FZNQsJKNmIRk1C0nLAkaWVYySqQXFuem5xYYFhnmp5XrFibnF
        pXnpesn5uZsYwTGhpbmDcfuqD3qHGJk4GA8xSnAwK4nwrpp0MEmINyWxsiq1KD++qDQntfgQ
        ozQHi5I474Wuk/FCAumJJanZqakFqUUwWSYOTqkGpsIQ5rV7byYZWknl2JVfX5e3snzbzB87
        l9q/vX9qcvCtvUlr2zY+j1kid0/rvszWn41rA47lTj8RIbD9UNtM4y0NNUGG3/7eXD5rmdMZ
        US6x50szGkqNn6zpuGEn4OZwutlny6PtRoUvq/oerlp52ZX/WJXEk69/GEWP8TwIrwy0TC67
        XenAJfzEYwZHzallQtuqS2YXHO9x0a76kvNJyvBeUPxBk7X13wOmZ5zYvfC6dYlV3Hez73NL
        JtWlBdfvSj2jY39+e1SBj8GbQ357V0zqdD0qvUDoyP95r/YofRHXW+0rfbPuXfQhh33qyjVF
        POr2v2sO7nZR2vVeYfuLR/E/xTgmpMpXKzxnTJl+SFeJpTgj0VCLuag4EQDxYODI+AIAAA==
X-CMS-MailID: 20220706105434epcas2p251c818e61041fc0b37e0397c98f310b5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220706095505epcas2p36afb722aa84d41c6d13c825280467258
References: <140c1c89-49a7-45bd-7f01-8a3ed1343437@linaro.org>
        <CGME20220706095505epcas2p36afb722aa84d41c6d13c825280467258@epcas2p3.samsung.com>
        <f1e03b78-f844-6eec-2ace-d177af59f0c9@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> > When running dtbs_check I found:
> > arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb: phy=4017e04000: clock=
s:
> > =5B=5B10=5D=5D is too short
> >
> > 	From schema: Documentation/devicetree/bindings/phy/samsung,ufs-
> phy.yaml
> >
> > arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb: phy=4017e04000:
> > clock-names: =5B'ref_clk'=5D is too short
> >
> > 	From schema: Documentation/devicetree/bindings/phy/samsung,ufs-
> phy.yaml
> >
> >
> > and so on. It seems you miss there clocks.
>=20
> +Cc Alim.
>=20
> Tesla FSD has the same problem:
> tesla/fsd-evb.dtb: ufs-phy=4015124000: clocks: =5B=5B35, 2=5D=5D is too s=
hort
>=20

Thanks for the report.
Ufs-phy clock of Fsd and Exynos Auto v9 shall be 'ref' clock only unlike pr=
evious exynos7's ufs-phy.

I'm looking into how I can fix the warning.
I simply made below patch but I'm not sure which is better between minItems=
/maxItems and oneOf selection.

--- a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
=40=40 -28,17 +28,23 =40=40 properties:=20

   clocks:
     items:
-      - description: PLL reference clock
-      - description: symbol clock for input symbol ( rx0-ch0 symbol clock)
-      - description: symbol clock for input symbol ( rx1-ch1 symbol clock)
-      - description: symbol clock for output symbol ( tx0 symbol clock)
+      minItems: 1
+      maxItems: 4
+      items:
+        - description: PLL reference clock
+        - description: symbol clock for input symbol ( rx0-ch0 symbol cloc=
k)
+        - description: symbol clock for input symbol ( rx1-ch1 symbol cloc=
k)
+        - description: symbol clock for output symbol ( tx0 symbol clock)=
=20

   clock-names:
-    items:
-      - const: ref_clk
-      - const: rx1_symbol_clk
-      - const: rx0_symbol_clk
-      - const: tx0_symbol_clk
+    oneOf:
+      - items:
+          - const: ref_clk
+          - const: rx1_symbol_clk
+          - const: rx0_symbol_clk
+          - const: tx0_symbol_clk
+      - items:
+          - const: ref_clk=20

   samsung,pmu-syscon:
     =24ref: '/schemas/types.yaml=23/definitions/phandle-array'

Best Regards,
Chanho Park

