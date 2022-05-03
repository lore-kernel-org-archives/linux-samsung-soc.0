Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85DBC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 11:26:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233389AbiECLaA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 07:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232064AbiECL37 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 07:29:59 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8712F237DC
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 04:26:26 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220503112624epoutp03ce3621838886c1a0a05efbc1feb15dd1~rlLLVoIkd2643126431epoutp03g
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 11:26:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220503112624epoutp03ce3621838886c1a0a05efbc1feb15dd1~rlLLVoIkd2643126431epoutp03g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651577184;
        bh=wkdi+04nbXG8jZobmRDKEis/9gQAKurb/wrFpXS1a1c=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=oFDKc0YMu9SbDZBxXlXSuY3w6Bj/dkE8YgzQoWnAwpmwXDkCTodD2Dz+po48YDlw1
         TL1yP/eoWFzo7Q+MIl7OI/tJpFyaogehcoKV7Ytz8aQNjwVYTCV/PTeqh8JnvuOMU6
         pIK6Ab+IXW1jKyDiptB/osRKeqOduh7pspWih9/I=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220503112623epcas2p4a798098bad9a473b7c1e0de45be124f6~rlLKsKwe92921729217epcas2p4b;
        Tue,  3 May 2022 11:26:23 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.89]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4KsyMZ30ZRz4x9Px; Tue,  3 May
        2022 11:26:18 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        7F.62.09694.A5111726; Tue,  3 May 2022 20:26:18 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220503112617epcas2p2b3ca48c84976697296b286d114c6d958~rlLFjjslx2648526485epcas2p2r;
        Tue,  3 May 2022 11:26:17 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220503112617epsmtrp20075f9fd662eb05e737d74e48e46ae77~rlLFioFJN2629026290epsmtrp2z;
        Tue,  3 May 2022 11:26:17 +0000 (GMT)
X-AuditID: b6c32a48-47fff700000025de-af-6271115aa3dc
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        20.43.08853.95111726; Tue,  3 May 2022 20:26:17 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20220503112617epsmtip190e034e81f4f1c2330c9d658347bada0~rlLFWGKZa0083500835epsmtip1f;
        Tue,  3 May 2022 11:26:17 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
        "'Tomasz Figa'" <tomasz.figa@gmail.com>,
        "'Chanwoo Choi'" <cw00.choi@samsung.com>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        "'Michael Turquette'" <mturquette@baylibre.com>,
        "'Stephen Boyd'" <sboyd@kernel.org>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>
Cc:     "'Sam Protsenko'" <semen.protsenko@linaro.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <9f71aebf-d30d-9ecd-0e24-3f504bbaa705@linaro.org>
Subject: RE: [PATCH v2 02/12] dt-bindings: clock: add Exynos Auto v9 SoC CMU
 bindings
Date:   Tue, 3 May 2022 20:26:17 +0900
Message-ID: <02f001d85ee0$9b49a610$d1dcf230$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMcfGQjducrjg82yZLd2yrtgk3Y7gJIHPxgAboYiwUBLBGlcapbVJCA
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOJsWRmVeSWpSXmKPExsWy7bCmuW6UYGGSwfOtAhYP5m1js7j+5Tmr
        xfwj51gt+l48ZLbY+3oru8XHnnusFjPO72OyuHjK1aJ17xF2i8Nv2lkt/l3byGLxvA8ovmrX
        H0YHXo/3N1rZPXbOusvusWlVJ5vHnWt72Dz6tqxi9Pi8SS6ALSrbJiM1MSW1SCE1Lzk/JTMv
        3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfoUCWFssScUqBQQGJxsZK+nU1RfmlJ
        qkJGfnGJrVJqQUpOgXmBXnFibnFpXrpeXmqJlaGBgZEpUGFCdsbfy2fYChrFK/bcPMbcwNgi
        3MXIySEhYCKx/t0Lpi5GLg4hgR2MEq8bO5hAEkICnxglzj92gEh8Y5R4cHUOO0zHiq1zmCES
        exklDm1ewQbR8YJR4vnfUhCbTUBf4mXHNlaQIhGBDcwSG3fdZANxmAWmMUosnvwFbBSngJ3E
        4s5tQDYHh7BAuMSyF9wgJouAisSpm64gJq+ApcSXWwUgxbwCghInZz5hAbGZBbQlli18zQxx
        j4LEz6fLWEFsEQE3iRO3DzBB1IhIzO5sA7tTQuAMh8SFgytYIBpcJP7eeMUKYQtLvDq+Beox
        KYnP7/ayQdjFEktnfWKCaG5glLi87RdUwlhi1rN2RpDjmAU0Jdbv0gcxJQSUJY7cgrqNT6Lj
        8F92iDCvREebEESjusSB7dOhLpCV6J7zmXUCo9IsJJ/NQvLZLCQfzELYtYCRZRWjWGpBcW56
        arFRgQk8qpPzczcxglOwlscOxtlvP+gdYmTiYDzEKMHBrCTC67y0IEmINyWxsiq1KD++qDQn
        tfgQoykwpCcyS4km5wOzQF5JvKGJpYGJmZmhuZGpgbmSOK9XyoZEIYH0xJLU7NTUgtQimD4m
        Dk6pBiaLNQ0camJmzv2Hz97tkux+K5115siO9vi11xdHOX3ve71dK0Tyqw6PZnVK/b1Y9wpO
        4dX3Fmnlfb61rJ7l48P5Zq0TZhy/1iavrXOz6mmQwFvPLRzhq85P6Uq4eeyIwgxdg2lZByJv
        ev15evGgz4I0nvWb66/d1gwJdOF7XDDzqF60qWy6yLN3/zl9J5WtSFv86XJIte7NRSHPOu99
        jL5k6q9psGTF/BDx2OwWh+8xGxour5sfY7G0pmOr3RK3zQkWs5QXtKTz90wpVC71S+UUPGCW
        sd52206v09Jdf5NFgyvW5v0LWt65bulfn+IEoc2Ozpuib+jyedmt1Sh42dlU7y2xKCQvt1Dy
        U+mPUiWW4oxEQy3mouJEAKJ5RPhKBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsWy7bCSnG6kYGGSwblLxhYP5m1js7j+5Tmr
        xfwj51gt+l48ZLbY+3oru8XHnnusFjPO72OyuHjK1aJ17xF2i8Nv2lkt/l3byGLxvA8ovmrX
        H0YHXo/3N1rZPXbOusvusWlVJ5vHnWt72Dz6tqxi9Pi8SS6ALYrLJiU1J7MstUjfLoEr49DE
        FSwFjeIVK7auYm9g/CDUxcjJISFgIrFi6xzmLkYuDiGB3YwSh87uZodIyEo8e7cDyhaWuN9y
        hBWi6BmjxJ0JpxlBEmwC+hIvO7aBJUQEtjBLHJ/wlQnEYRaYwShx4NRWNoiW74wSa0+0MIG0
        cArYSSzu3AY2V1ggVGJm6zegOAcHi4CKxKmbriAmr4ClxJdbBSAVvAKCEidnPmEBsZkFtCWe
        3nwKZy9b+JoZ4joFiZ9Pl7GC2CICbhInbh9ggqgRkZjd2cY8gVF4FpJRs5CMmoVk1CwkLQsY
        WVYxSqYWFOem5xYbFhjmpZbrFSfmFpfmpesl5+duYgRHpZbmDsbtqz7oHWJk4mA8xCjBwawk
        wuu8tCBJiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+FrpPxQgLpiSWp2ampBalFMFkmDk6pBqaT
        nz3OcOptyZ42f8PrVV3hVQq3d/O87Mu40aIwz33tj5VTrR47P9c7/qYhVHS539Vl/WZFSTXn
        zR7NX1thutb7+6Sn76smfpxy6+PzIJHrFUsWdnO7F0glHeY7KTRv65api7nm2crvlMysmaQm
        sOHUPqnaoz5dYXKLj7rsOrCTT+YCx+WbLQs43xR9cG1dOlfmNDvP7p6cAykC1YeCVCzl3dyc
        Ah0MEzYv59sotiI3K2/FPWeL3LMW31m5o5ar2jEt0J24rejw86pLFUvyM/v2mjJZ56lXnogr
        5ila5/Xj7ratYnuW59w9/6L5Zcr+721J+wv9ondc1umZkGX6WqHH5MpfpX/LFFbPWp21d8UR
        JZbijERDLeai4kQAnfKKBTkDAAA=
X-CMS-MailID: 20220503112617epcas2p2b3ca48c84976697296b286d114c6d958
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220503105729epcas2p357a7bfae9731010d7fda00ba78cf8b97
References: <20220503105914.117625-1-chanho61.park@samsung.com>
        <CGME20220503105729epcas2p357a7bfae9731010d7fda00ba78cf8b97@epcas2p3.samsung.com>
        <20220503105914.117625-3-chanho61.park@samsung.com>
        <9f71aebf-d30d-9ecd-0e24-3f504bbaa705@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> On 03/05/2022 12:59, Chanho Park wrote:
> > Add dt-schema for Exynos Auto v9 SoC clock controller.
> >
> > Signed-off-by: Chanho Park <chanho61.park=40samsung.com>
> > ---
> >  .../clock/samsung,exynosautov9-clock.yaml     =7C 219 ++++++++++++++++=
++
> >  1 file changed, 219 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yam
> > l
> >
> > diff --git
> > a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.y
> > aml
> > b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.y
> > aml
> > new file mode 100644
> > index 000000000000..9f9cd8606728
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clo
> > +++ ck.yaml
> > =40=40 -0,0 +1,219 =40=40
> > +=23 SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +=24id:
> > +https://protect2.fireeye.com/v1/url?k=3D68882f86-3713169f-6889a4c9-000=
b
> > +abff3793-6f47dff4d335ab23&q=3D1&e=3D233b57a5-86a2-45a5-a097-eea56e8b5b=
51&
> > +u=3Dhttp%3A%2F%2Fdevicetree.org%2Fschemas%2Fclock%2Fsamsung%2Cexynosau=
t
> > +ov9-clock.yaml%23
> > +=24schema:
> > +https://protect2.fireeye.com/v1/url?k=3Da304fe06-fc9fc71f-a3057549-000=
b
> > +abff3793-cb0414bca8edb007&q=3D1&e=3D233b57a5-86a2-45a5-a097-eea56e8b5b=
51&
> > +u=3Dhttp%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
> > +
> > +title: Samsung Exynos Auto v9 SoC clock controller
> > +
> > +maintainers:
> > +  - Chanho Park <chanho61.park=40samsung.com>
> > +  - Chanwoo Choi <cw00.choi=40samsung.com>
> > +  - Krzysztof Kozlowski <krzk=40kernel.org>
> > +  - Sylwester Nawrocki <s.nawrocki=40samsung.com>
> > +  - Tomasz Figa <tomasz.figa=40gmail.com>
> > +
> > +description: =7C
> > +  Exynos Auto v9 clock controller is comprised of several CMU units,
> > +generating
> > +  clocks for different domains. Those CMU units are modeled as
> > +separate device
> > +  tree nodes, and might depend on each other. Root clocks in that
> > +clock tree are
> > +  two external clocks:: OSCCLK/XTCXO (26 MHz) and RTCCLK/XrtcXTI (3276=
8
> Hz).
> > +  Those external clocks must be defined as fixed-rate clocks in dts.
> > +
> > +  CMU_TOP is a top-level CMU, where all base clocks are prepared
> > + using PLLs and  dividers; all other clocks of function blocks (other
> > + CMUs) are usually  derived from CMU_TOP.
> > +
> > +  Each clock is assigned an identifier and client nodes can use this
> > + identifier  to specify the clock which they consume. All clocks
> > + available for usage  in clock consumer nodes are defined as
> > + preprocessor macros in  'dt-bindings/clock/exynosautov9.h' header.
>=20
> The path is still wrong (and not full).

I forgot the description update.
'dt-bindings/clock/exynosautov9.h' -> 'include/dt-bindings/clock/samsung,ex=
ynosautov9.h'

Best Regards,
Chanho Park

