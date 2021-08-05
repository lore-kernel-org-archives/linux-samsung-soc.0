Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9FDC4320A
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Aug 2021 11:08:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D0AA61004
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Aug 2021 11:08:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240861AbhHELJD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Aug 2021 07:09:03 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:54234 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240878AbhHELJD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Aug 2021 07:09:03 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20210805110847epoutp011a915fbd51556f92c439501022234ad9~YZHbjmdqX3169231692epoutp01P
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Aug 2021 11:08:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20210805110847epoutp011a915fbd51556f92c439501022234ad9~YZHbjmdqX3169231692epoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1628161727;
        bh=H6syL4VRLzK7l64DJTfxmh2aCEfTjHZlaLtZUIrNZ2M=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=vKIUhxkSNfinzh/OOnr/gDbAXhG3Pwccvl5l61ftq+E71bJ5qPe2SBZy+Y0tbfQ2j
         TERar82vYhNg99s4BoGq+sVQVCG0FTKODqTql7dFhrpV4QkFpRXyVf6HGqVYy8FlR9
         xM0cY0Y5CT3w+oUKDNX+7vyPxqp6qBqvhb1cQTvA=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTP id
        20210805110846epcas5p3123988b64f661ce62847e461baf6c02b~YZHbCBhbL1465314653epcas5p3x;
        Thu,  5 Aug 2021 11:08:46 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.178]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4GgQpJ2j0Sz4x9Pp; Thu,  5 Aug
        2021 11:08:40 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
        epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
        D3.3B.41701.5B6CB016; Thu,  5 Aug 2021 20:08:37 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
        20210805105132epcas5p3c86e8632df051dee2997025c6b95b3ce~YY4YMWwWX2611626116epcas5p3t;
        Thu,  5 Aug 2021 10:51:32 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210805105132epsmtrp2982cdb9f5b2b427bbe265d0f1292cbdc~YY4YLcfRr1954419544epsmtrp2k;
        Thu,  5 Aug 2021 10:51:32 +0000 (GMT)
X-AuditID: b6c32a4b-0abff7000001a2e5-75-610bc6b58851
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        C9.F6.08289.4B2CB016; Thu,  5 Aug 2021 19:51:32 +0900 (KST)
Received: from alimakhtar02 (unknown [107.122.12.5]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210805105131epsmtip2c05cadd8b524a1bd9c8147c2708f43ae~YY4WqT0cU1591815918epsmtip2r;
        Thu,  5 Aug 2021 10:51:30 +0000 (GMT)
From:   "Alim Akhtar" <alim.akhtar@samsung.com>
To:     "'Marc Zyngier'" <maz@kernel.org>
Cc:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>,
        "'Rob Herring'" <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "'Chanwoo Choi'" <cw00.choi@samsung.com>,
        "'Pankaj Dubey'" <pankaj.dubey@samsung.com>,
        "'Sam Protsenko'" <semen.protsenko@linaro.org>
In-Reply-To: <87tuk4b47s.wl-maz@kernel.org>
Subject: RE: [PATCH] arm64: dts: exynos: correct GIC CPU interfaces address
 range on Exynos7
Date:   Thu, 5 Aug 2021 16:21:29 +0530
Message-ID: <044601d789e7$da54a4f0$8efdeed0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGqCsm6I7l6cIRsiJEa3ZtJxO0jtAJYiPTmAtVSVZgBZ8MakQDSnYq9q4R3vDA=
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDJsWRmVeSWpSXmKPExsWy7bCmhu62Y9yJBnukLK5/ec5qMf/IOVaL
        jW9/MFlsenyN1eLyrjlsFjPO72Oy2DnnJKvFoq1f2C1a9x5ht3jet4/JgctjVkMvm8emVZ1s
        Hneu7WHz2Lyk3qNvyypGj8+b5ALYorJtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1DS0t
        zJUU8hJzU22VXHwCdN0yc4AOU1IoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQUmBTo
        FSfmFpfmpevlpZZYGRoYGJkCFSZkZ/RciC1YIVCx5dhBtgbGnbxdjJwcEgImEhtuHmbuYuTi
        EBLYzSjR8/MRC4TziVFi7cIWJgjnM6PE8ylLgTIcYC1rj3tAxHcxSqz8vIkVwnnJKPFq3l8m
        kLlsAroSOxa3sYHYIgKqEu2LutlAipgFGpklpj/cDFbEKaAt8XBVHyuILSwQJzHnz2ywOIuA
        ikR381V2EJtXwFLi8cK7LBC2oMTJmU/AbGYBeYntb+cwQzyhIPHz6TJWiGV+EivmPICqEZc4
        +rMH7DkJgR0cElvb3rJBNLhIfLvwgB3CFpZ4dXwLlC0l8fndXjaIN7MlenYZQ4RrJJbOO8YC
        YdtLHLgyBxwSzAKaEut36UOEZSWmnlrHBLGWT6L39xMmiDivxI55MLaqRPO7q1BjpCUmdnez
        TmBUmoXks1lIPpuF5INZCNsWMLKsYpRMLSjOTU8tNi0wzksth8d3cn7uJkZwstXy3sH46MEH
        vUOMTByMhxglOJiVRHiTF3MlCvGmJFZWpRblxxeV5qQWH2I0BQb3RGYp0eR8YLrPK4k3NLE0
        MDEzMzOxNDYzVBLnZY//miAkkJ5YkpqdmlqQWgTTx8TBKdXAFG27YfE/Za+9TPWrd/++/f/9
        bwcO85T9M9tndPFd3N33yOWqU/WrxUfqJZ5euuF37I3wg8gzszrOaX69eOZ6zczXRx8+8Vfa
        +WeveFrAtIAqhtlsxrcefKjeXhnssdxctYrrdqmB9/slqzsda7bkB0WWN4Sv35x8ZtKi7c6v
        SuUn8djlXdwTwr5OrcWmffcUFXbr1+uNH55leDqndN3bb7yMl59E/ZvxeWvxRe6An2k6Ow8z
        zco+VbBux2W1rLzYT9cuxm+1+LvTNH3/osUCez+0uf1Pk93y+fMC/+lK8Y5yjlavlu3q72xQ
        btaqXyTRxldQ1jQt4xb7QR9Pk4WiyTpc71XavPbtdeBqthItnqvEUpyRaKjFXFScCADTySZn
        PwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRmVeSWpSXmKPExsWy7bCSvO6WQ9yJBqteyllc//Kc1WL+kXOs
        Fhvf/mCy2PT4GqvF5V1z2CxmnN/HZLFzzklWi0Vbv7BbtO49wm7xvG8fkwOXx6yGXjaPTas6
        2TzuXNvD5rF5Sb1H35ZVjB6fN8kFsEVx2aSk5mSWpRbp2yVwZfRciC1YIVCx5dhBtgbGnbxd
        jBwcEgImEmuPe3QxcnEICexglPhxaS9bFyMnUFxa4vrGCewQtrDEyn/P2SGKnjNK7Dq2lREk
        wSagK7FjcRtYg4iAqkT7om42kCJmgXZmiY8LVzFCdMxkkpj0sBesilNAW+Lhqj5WEFtYIEai
        deksJhCbRUBForv5Ktg6XgFLiccL77JA2IISJ2c+YQE5lVlAT6JtI9hiZgF5ie1v5zBDXKcg
        8fPpMlaII/wkVsx5wAJRIy5x9GcP8wRG4VlIJs1CmDQLyaRZSDoWMLKsYpRMLSjOTc8tNiww
        ykst1ytOzC0uzUvXS87P3cQIjjgtrR2Me1Z90DvEyMTBeIhRgoNZSYQ3eTFXohBvSmJlVWpR
        fnxRaU5q8SFGaQ4WJXHeC10n44UE0hNLUrNTUwtSi2CyTBycUg1MnLwadQLam64xGddt+JQU
        F1z318t43t79oR84P2X8jDY6qvljpm5YxFwxngMKGQoScT8OK9pwmGXM6XJg16lWbmmLXRzB
        mzor7l/A09J/1y57MqycHSsv2fhBYoOW0GzJm6pd/QYPbKQ6t8ub3V35y2D+eeuNG9UYJ552
        DwyI/PJO2Xxh/83rgTEnK2cm5R3VNcg8oMF5r9j5jXKFqUXmNN33mveiuoXiRHXW5ZT+/b/q
        xC0thrTjdeqGlgerNney8U87dO8ZQ8/K+/MOOXMnb4vhYQo/rHl1p0rwt/V7ri05IWLPsXsK
        r58nwwTZCI3zHkzrrGQvtx7Y+97l9sYNjfxJ6vfNL39u++Da0qDEUpyRaKjFXFScCAC//Yyo
        JwMAAA==
X-CMS-MailID: 20210805105132epcas5p3c86e8632df051dee2997025c6b95b3ce
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
        <03d701d789db$f275d290$d76177b0$@samsung.com> <87tuk4b47s.wl-maz@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



> -----Original Message-----
> From: Marc Zyngier <maz@kernel.org>
> Sent: 05 August 2021 15:31
> To: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: 'Krzysztof Kozlowski' <krzysztof.kozlowski@canonical.com>; 'Rob
Herring'
> <robh+dt@kernel.org>; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org; 'Chanwoo Choi' <cw00.choi@samsung.com>;
> 'Pankaj Dubey' <pankaj.dubey@samsung.com>; 'Sam Protsenko'
> <semen.protsenko@linaro.org>
> Subject: Re: [PATCH] arm64: dts: exynos: correct GIC CPU interfaces
address
> range on Exynos7
> 
> On Thu, 05 Aug 2021 10:26:14 +0100,
> "Alim Akhtar" <alim.akhtar@samsung.com> wrote:
> >
> > Hi Krzysztof,
> >
> > > -----Original Message-----
> > > From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > > Sent: 05 August 2021 13:07
> > > To: Rob Herring <robh+dt@kernel.org>; devicetree@vger.kernel.org;
> > > linux- arm-kernel@lists.infradead.org;
> > > linux-samsung-soc@vger.kernel.org; linux- kernel@vger.kernel.org
> > > Cc: Alim Akhtar <alim.akhtar@samsung.com>; Chanwoo Choi
> > > <cw00.choi@samsung.com>; Pankaj Dubey
> <pankaj.dubey@samsung.com>;
> > > Sam Protsenko <semen.protsenko@linaro.org>; Marc Zyngier
> > > <maz@kernel.org>
> > > Subject: Re: [PATCH] arm64: dts: exynos: correct GIC CPU interfaces
> > > address range on Exynos7
> > >
> > > On 05/08/2021 09:21, Krzysztof Kozlowski wrote:
> > > > The GIC-400 CPU interfaces address range is defined as
> > > > 0x2000-0x3FFF (by ARM).
> > > >
> > >
> > Looking at DDI0471B_gic400_r0p1_trm.pdf, CPU interface range is
> > 0x0000 ~ 0x10000
> 
> I don't where you are getting this range from. The only 64kB range I'm
aware
> of is the optional integration trick to cope with 64kB pages that was
> documented in the initial SBSA spec. The HW itself only decodes 8kB for
the
> CPU interface.
> 
There was a typo in above range, thanks for the clarification. Got it.

> 	M.
> 
> --
> Without deviation from the norm, progress is not possible.

