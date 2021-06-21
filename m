Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1ED4C4743C
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Jun 2021 14:16:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7D0A6124B
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Jun 2021 14:16:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbhFUOSj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 21 Jun 2021 10:18:39 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:56978 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbhFUOSj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 10:18:39 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20210621141623epoutp022634b030abb3d882ac0de6a765ec6b1a~KnpY-mcCy2247122471epoutp02O
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jun 2021 14:16:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20210621141623epoutp022634b030abb3d882ac0de6a765ec6b1a~KnpY-mcCy2247122471epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1624284983;
        bh=+YOZQIA0VYLmb++HUK8eQxJhK0ZldtwTJ1UJlu/gxuQ=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=aJEvoUS7rsAA9EX+k+05F8oECZKEjpvkDDGrtLJd3C09KOTnOCrcc1inaMrZH3Pq8
         gWMK4PILO6KhfPyDI2d38fH0mLP8yD0sQrSRHeWjPwtSv8pngOSZESxctGGYYwCBNC
         WQT3cTP/0blOUyq+GMPQiU6KXikLdS378tQcLxfA=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTP id
        20210621141623epcas5p2ce06f8c1a37f4e6b4c88af58c41409d3~KnpYfGD3t1669816698epcas5p2T;
        Mon, 21 Jun 2021 14:16:23 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
        epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        DA.D0.09595.73F90D06; Mon, 21 Jun 2021 23:16:23 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
        20210621134650epcas5p4a7771105cae63643c2594247f238441e~KnPlu42U71120611206epcas5p4P;
        Mon, 21 Jun 2021 13:46:50 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210621134650epsmtrp1364841447030c424da91aaa50c87139a~KnPluQ8M11006210062epsmtrp1O;
        Mon, 21 Jun 2021 13:46:50 +0000 (GMT)
X-AuditID: b6c32a4a-eebff7000000257b-45-60d09f37a97c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        4F.A1.08289.A4890D06; Mon, 21 Jun 2021 22:46:50 +0900 (KST)
Received: from alimakhtar02 (unknown [107.122.12.5]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210621134649epsmtip1d4a2c2eb4e0ab3043bd4668e2a4cefd6~KnPkz49Od0293502935epsmtip1f;
        Mon, 21 Jun 2021 13:46:49 +0000 (GMT)
From:   "Alim Akhtar" <alim.akhtar@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>
Cc:     <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <0120db2f-e25e-a4ae-669b-a404dbfae05b@canonical.com>
Subject: RE: [PATCH 2/2] arm64: dts: exynos5433: Add cpu cache information
Date:   Mon, 21 Jun 2021 19:16:38 +0530
Message-ID: <000001d766a3$e2ff6610$a8fe3230$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHEo7zAfNlKfaR4gq1MTeAlf4A8nwIz090JAp9BlrYBinVXX6sRE1QQ
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAKsWRmVeSWpSXmKPExsWy7bCmuq75/AsJBkeuclhsfPuDyWLT42us
        Fpd3zWGzmHF+H5NF694j7A6sHrMaetk8Nq3qZPPYvKTe4/MmuQCWKC6blNSczLLUIn27BK6M
        Y18PsxXM16w4PXETawPjD7kuRk4OCQETiWffrrJ3MXJxCAnsZpT4srmTFcL5xCgx/89lqMxn
        RollLWtZYVrOHlrDCJHYxSix6M9lKOclUNWSTYwgVWwCuhI7FrexgSREBBYySszZuZANJMEs
        oC7x9MhDsFGcAo4Su+9tZOpi5OAQFvCSuNpsBhJmEVCVOLv4MguIzStgKTH3435WCFtQ4uTM
        JywQY+Qltr+dwwxxkYLEz6fLwGpEBNwkbm/Zyg5RIy5x9GcPM8gNEgKtHBKLjj5gg2hwkXhx
        5y8ThC0s8er4FnYIW0riZX8bO8g9EgLZEj27jCHCNRJL5x1jgbDtJQ5cmcMCUsIsoCmxfpc+
        RFhWYuqpdUwQa/kken8/gZrOK7FjHoytKtH87irUGGmJid3drBMYlWYh+WwWks9mIflgFsK2
        BYwsqxglUwuKc9NTi00LjPJSy/WKE3OLS/PS9ZLzczcxghONltcOxocPPugdYmTiYDzEKMHB
        rCTCezPlQoIQb0piZVVqUX58UWlOavEhRmkOFiVx3qXshxKEBNITS1KzU1MLUotgskwcnFIN
        TCv+Pk7c/mWRVZdgsdrnHvvCh3e3dN2T2v3fiMvpf6/NjQa5yCkvJ74+01S8N32Kx85FRrO/
        OvOdqz43T/b0pH+TfRefY7Raes3t9obbb2Nzc3Y7HWV6vds9214x+VzpSrmtAYLz1hy5nXnF
        IHeKx7fsRYeCLPq5duzsLH4Z/jHVLktm1nn7nIfiG5JY92nEuB09FrE26QDvl1UOx/aeX53y
        /oLWhjMSX+6lvNjf+eqNAcfMY2s647s16vQZ094J6P3OklzQyj1l92t3k9iDX5ce/LNS9XNY
        ilvY23uFSYdd530x2eoi3H1k5xZ3hbeTLP/u4+KsLze6cojVn4tTIPpaotjFkmc78vbbvbov
        ly+sxFKckWioxVxUnAgAD4brhaMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMLMWRmVeSWpSXmKPExsWy7bCSnK7XjAsJBjc2qFhsfPuDyWLT42us
        Fpd3zWGzmHF+H5NF694j7A6sHrMaetk8Nq3qZPPYvKTe4/MmuQCWKC6blNSczLLUIn27BK6M
        Y18PsxXM16w4PXETawPjD7kuRk4OCQETibOH1jB2MXJxCAnsYJRo+fSZHSIhLXF94wQoW1hi
        5b/n7BBFzxkl1n+dzwKSYBPQldixuI0NJCEisJhR4s2EOWwgCWYBdYmnRx6ygthCAl8YJaZ9
        dACxOQUcJXbf28jUxcjBISzgJXG12QwkzCKgKnF28WWwmbwClhJzP+5nhbAFJU7OfMICMVJb
        4unNp1C2vMT2t3OYIY5TkPj5dBlYvYiAm8TtLVvZIWrEJY7+7GGewCg8C8moWUhGzUIyahaS
        lgWMLKsYJVMLinPTc4sNC4zyUsv1ihNzi0vz0vWS83M3MYLjRUtrB+OeVR/0DjEycTAeYpTg
        YFYS4b2ZciFBiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+FrpPxQgLpiSWp2ampBalFMFkmDk6p
        BqauxYUJ+8+tdDi42p3bN6eX+eoNkbuXnZPto9JK5vt5v/kd+1tystS8p3uS911avPB8s1ZF
        vaPy6WlXXx15dVLp4h1X2wl+v+Y0bz595K+yd1iuClt9D3fG0kediusT80o+3XoSU3mq+bG5
        c4JNfELjL7uFxyQErjxX3jnvmerH+KtqZ0/kGrpMnT29eOX0dqNJxtndMfpTij4Kv209Nk1/
        4rXgyecz8yt4rGf+M4nfuJJNYYrLtpcCWVceCUrNNrYNK2e6+luOZ41tvd+UHJE1zaqs1tFf
        HW/eY78gIHRze7fRzj1rLqhnf+p3WHVeIuhqv8pSU4mWBQlHU34lnu78foR5bnZK+KvDJx97
        T9+pxFKckWioxVxUnAgA00jeRAYDAAA=
X-CMS-MailID: 20210621134650epcas5p4a7771105cae63643c2594247f238441e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210617113314epcas5p4652e98d24d7f56a7c8461175bbb25456
References: <20210617113739.66911-1-alim.akhtar@samsung.com>
        <CGME20210617113314epcas5p4652e98d24d7f56a7c8461175bbb25456@epcas5p4.samsung.com>
        <20210617113739.66911-2-alim.akhtar@samsung.com>
        <0120db2f-e25e-a4ae-669b-a404dbfae05b@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hello Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Sent: 21 June 2021 14:22
> To: Alim Akhtar <alim.akhtar@samsung.com>; linux-kernel@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; robh+dt@kernel.org
> Cc: linux-samsung-soc@vger.kernel.org
> Subject: Re: [PATCH 2/2] arm64: dts: exynos5433: Add cpu cache information
> 
> On 17/06/2021 13:37, Alim Akhtar wrote:
> > This patch adds cpu caches information to its dt nodes so that the
> > same is available to userspace via sysfs.
> > This SoC has 48/32 KB I/D cache for each A57 cores with 2MB L2 cache.
> > And 32/32 KB I/D cache for each A53 cores with 256KB L2 cache.
> >
> > Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> > ---
> >  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 70
> > ++++++++++++++++++++++
> >  1 file changed, 70 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> > b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> > index 18a912eee360..8183a59e9046 100644
> > --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> > @@ -62,6 +62,13 @@
> >  			clock-names = "apolloclk";
> >  			operating-points-v2 = <&cluster_a53_opp_table>;
> >  			#cooling-cells = <2>;
> > +			i-cache-size = <0x8000>;
> > +			i-cache-line-size = <64>;
> > +			i-cache-sets = <256>;
> > +			d-cache-size = <0x8000>;
> > +			d-cache-line-size = <64>;
> > +			d-cache-sets = <128>;
> > +			next-level-cache = <&apollo_l2>;
> >  		};
> >
> >  		cpu1: cpu@101 {
> > @@ -72,6 +79,13 @@
> >  			clock-frequency = <1300000000>;
> >  			operating-points-v2 = <&cluster_a53_opp_table>;
> >  			#cooling-cells = <2>;
> > +			i-cache-size = <0x8000>;
> > +			i-cache-line-size = <64>;
> > +			i-cache-sets = <256>;
> > +			d-cache-size = <0x8000>;
> > +			d-cache-line-size = <64>;
> > +			d-cache-sets = <128>;
> > +			next-level-cache = <&apollo_l2>;
> >  		};
> >
> >  		cpu2: cpu@102 {
> > @@ -82,6 +96,13 @@
> >  			clock-frequency = <1300000000>;
> >  			operating-points-v2 = <&cluster_a53_opp_table>;
> >  			#cooling-cells = <2>;
> > +			i-cache-size = <0x8000>;
> > +			i-cache-line-size = <64>;
> > +			i-cache-sets = <256>;
> > +			d-cache-size = <0x8000>;
> > +			d-cache-line-size = <64>;
> > +			d-cache-sets = <128>;
> > +			next-level-cache = <&apollo_l2>;
> >  		};
> >
> >  		cpu3: cpu@103 {
> > @@ -92,6 +113,13 @@
> >  			clock-frequency = <1300000000>;
> >  			operating-points-v2 = <&cluster_a53_opp_table>;
> >  			#cooling-cells = <2>;
> > +			i-cache-size = <0x8000>;
> > +			i-cache-line-size = <64>;
> > +			i-cache-sets = <256>;
> > +			d-cache-size = <0x8000>;
> > +			d-cache-line-size = <64>;
> > +			d-cache-sets = <128>;
> > +			next-level-cache = <&apollo_l2>;
> >  		};
> >
> >  		cpu4: cpu@0 {
> > @@ -104,6 +132,13 @@
> >  			clock-names = "atlasclk";
> >  			operating-points-v2 = <&cluster_a57_opp_table>;
> >  			#cooling-cells = <2>;
> > +			i-cache-size = <0xc000>;
> > +			i-cache-line-size = <64>;
> > +			i-cache-sets = <256>;
> > +			d-cache-size = <0x8000>;
> > +			d-cache-line-size = <64>;
> > +			d-cache-sets = <256>;
> > +			next-level-cache = <&atlas_l2>;
> >  		};
> >
> >  		cpu5: cpu@1 {
> > @@ -114,6 +149,13 @@
> >  			clock-frequency = <1900000000>;
> >  			operating-points-v2 = <&cluster_a57_opp_table>;
> >  			#cooling-cells = <2>;
> > +			i-cache-size = <0xc000>;
> > +			i-cache-line-size = <64>;
> > +			i-cache-sets = <256>;
> > +			d-cache-size = <0x8000>;
> > +			d-cache-line-size = <64>;
> > +			d-cache-sets = <256>;
> > +			next-level-cache = <&atlas_l2>;
> >  		};
> >
> >  		cpu6: cpu@2 {
> > @@ -124,6 +166,13 @@
> >  			clock-frequency = <1900000000>;
> >  			operating-points-v2 = <&cluster_a57_opp_table>;
> >  			#cooling-cells = <2>;
> > +			i-cache-size = <0xc000>;
> > +			i-cache-line-size = <64>;
> > +			i-cache-sets = <256>;
> > +			d-cache-size = <0x8000>;
> > +			d-cache-line-size = <64>;
> > +			d-cache-sets = <256>;
> > +			next-level-cache = <&atlas_l2>;
> >  		};
> >
> >  		cpu7: cpu@3 {
> > @@ -134,6 +183,27 @@
> >  			clock-frequency = <1900000000>;
> >  			operating-points-v2 = <&cluster_a57_opp_table>;
> >  			#cooling-cells = <2>;
> > +			i-cache-size = <0xc000>;
> > +			i-cache-line-size = <64>;
> > +			i-cache-sets = <256>;
> > +			d-cache-size = <0x8000>;
> > +			d-cache-line-size = <64>;
> > +			d-cache-sets = <256>;
> > +			next-level-cache = <&atlas_l2>;
> > +		};
> > +
> > +		atlas_l2: l2-cache0 {
> 
> Few other nodes (PMU, OPP tables) use a57/a53 names instead of
> codenames, so I would prefer to stay with them (so cluster_a57_l2).
> 
Thanks for review, will update in next patch set.

> For Exynos7 it's fine as it uses Atlas already in labels.
> 
> > +			compatible = "cache";
> > +			cache-size = <0x200000>;
> > +			cache-line-size = <64>;
> > +			cache-sets = <2048>;
> > +		};
> > +
> > +		apollo_l2: l2-cache1 {
> > +			compatible = "cache";
> > +			cache-size = <0x40000>;
> > +			cache-line-size = <64>;
> > +			cache-sets = <256>;
> >  		};
> >  	};
> >
> >
> 
> 
> Best regards,
> Krzysztof

