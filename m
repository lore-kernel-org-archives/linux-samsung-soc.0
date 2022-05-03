Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F8BC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 11:27:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234686AbiECLbS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 07:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234682AbiECLbR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 07:31:17 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D84FC31933
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 04:27:43 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220503112741epoutp01a28601b45ed296e9870a50324d0586a3~rlMTuR4C50459104591epoutp01E
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 11:27:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220503112741epoutp01a28601b45ed296e9870a50324d0586a3~rlMTuR4C50459104591epoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651577261;
        bh=ghNC0qkUCOHjJVo+t527XG/rfNRRR2IWMdSjbOavcv8=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=oipu3GsH2grwQ3LFfs7VuTyeH4nHOurs9Vr3nRZRCyJcsF9T3zKl5TLk3WK4sDbdp
         gDOraMj0zIRXqBp09D9oBP3lWBuE9rPqoUhFJURGcIaKhdoXDtnKCHAt1RMMekxhTp
         g3xqZ9q51NRboP6lJVsGfDzwzNW+U5/TzYijz5ok=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220503112740epcas2p1cc69c16996099719a2f0cf8ee44599d0~rlMSk6bZR1404014040epcas2p1U;
        Tue,  3 May 2022 11:27:40 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.98]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4KsyP453X5z4x9Q7; Tue,  3 May
        2022 11:27:36 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        9F.33.09764.8A111726; Tue,  3 May 2022 20:27:36 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220503112736epcas2p18b0a2b8bc0bab3c8eaafff0ce2021ab1~rlMOPDnU71404014040epcas2p1E;
        Tue,  3 May 2022 11:27:36 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220503112735epsmtrp176fbcc224d3b5dc9b4fc51accad01131~rlMOOPCGa2045720457epsmtrp1l;
        Tue,  3 May 2022 11:27:35 +0000 (GMT)
X-AuditID: b6c32a46-f75ff70000002624-00-627111a8cdba
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        61.B4.08924.7A111726; Tue,  3 May 2022 20:27:35 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20220503112735epsmtip189e60bbe319820da98c7def5313831a5~rlMOCc7Cs0661806618epsmtip1F;
        Tue,  3 May 2022 11:27:35 +0000 (GMT)
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
In-Reply-To: <814dc408-3ede-1223-7fd7-e7e0b1c1530b@linaro.org>
Subject: RE: [PATCH v2 10/12] arm64: dts: exynosautov9: add initial cmu
 clock nodes
Date:   Tue, 3 May 2022 20:27:35 +0900
Message-ID: <02f101d85ee0$c9cfe580$5d6fb080$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMcfGQjducrjg82yZLd2yrtgk3Y7gKFSJruAqrbKbgBOR3j/KpRfmyg
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBJsWRmVeSWpSXmKPExsWy7bCmhe4KwcIkg86vKhYP5m1js7j+5Tmr
        xfwj51gt+l48ZLbY+3oru8XHnnusFjPO72OyuHjK1aJ17xF2i8Nv2lkt/l3byGLxvA8ovmrX
        H0YHXo/3N1rZPXbOusvusWlVJ5vHnWt72Dz6tqxi9Pi8SS6ALSrbJiM1MSW1SCE1Lzk/JTMv
        3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfoUCWFssScUqBQQGJxsZK+nU1RfmlJ
        qkJGfnGJrVJqQUpOgXmBXnFibnFpXrpeXmqJlaGBgZEpUGFCdsbPa4vYClolKyZuWMTYwNgs
        3MXIySEhYCJxdNtvJhBbSGAHo8TybcldjFxA9idGiZafv9kgnM+MEjPuTmCB6fjZdZkFomMX
        o8Tjj0wQRS8YJc7+fgmWYBPQl3jZsY0VJCEisIFZYuOum2CjmAWmMUosnvyFvYuRg4NTwE5i
        zvUKkAZhgVCJz0cusoPYLAIqEj9v7WEGKeEVsJRYu5ATJMwrIChxcuYTsPnMAvIS29/OYYY4
        SEHi59NlrCC2iICbRHfPFDaIGhGJ2Z1tzCBrJQQucEi8WfCZDaLBRWLPlW4oW1ji1fEt7BC2
        lMTL/jYou1hi6axPTBDNDYwSl7f9gmowlpj1rJ0R5DhmAU2J9bv0QUwJAWWJI7egbuOT6Dj8
        lx0izCvR0SYE0agucWD7dGgYykp0z/nMOoFRaRaSz2Yh+WwWkg9mIexawMiyilEstaA4Nz21
        2KjACB7Xyfm5mxjBSVjLbQfjlLcf9A4xMnEwHmKU4GBWEuF1XlqQJMSbklhZlVqUH19UmpNa
        fIjRFBjUE5mlRJPzgXkgryTe0MTSwMTMzNDcyNTAXEmc1ytlQ6KQQHpiSWp2ampBahFMHxMH
        p1QDU/oS6aDm7UZik+K+dN0/5/spov1TcutzbesXqxz2ab7Ndz/DfWFe6j5H/WshbS+vJviH
        TXv6+P/azkeShu/DpuVkLvzQm98Yx2sUluJvnLV+7jffqa0hn1IanvyzEVgS+evQTdZzS29M
        mJc271T+VB2OfR9f7OqfvXhDmM7Poie8AofdRaMXsSvY/zaLaLqf8vmKxG2bymeXNn9/MW0f
        s89chQ1rpMRZmaqq7jK9/nzj/fO5H9duuOIgdOhi346yyxrTWOYwl33oktMVXnBPgfOiQvvF
        d+eWvuZp9fzQ4/R84r1l5taWje1qrzqmcel6ulYYs2kYxMk22nLLT79X9rslNlxC5K1H9v2f
        nDPrZZVYijMSDbWYi4oTAbXYjiJLBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsWy7bCSnO5ywcIkg81rzC0ezNvGZnH9y3NW
        i/lHzrFa9L14yGyx9/VWdouPPfdYLWac38dkcfGUq0Xr3iPsFofftLNa/Lu2kcXieR9QfNWu
        P4wOvB7vb7Sye+ycdZfdY9OqTjaPO9f2sHn0bVnF6PF5k1wAWxSXTUpqTmZZapG+XQJXxs9r
        i9gKWiUrJm5YxNjA2CzcxcjJISFgIvGz6zJLFyMXh5DADkaJE8f+skIkZCWevdvBDmELS9xv
        OcIKUfSMUeLt3QMsIAk2AX2Jlx3bwBIiAluYJY5P+MoE4jALzGCUOHBqKxtEyw9GiSvzvgFl
        ODg4Bewk5lyvAOkWFgiWmDH3Jdg6FgEViZ+39jCDlPAKWEqsXcgJEuYVEJQ4OfMJ2DJmAW2J
        pzefQtnyEtvfzmGGuE5B4ufTZWBjRATcJLp7prBB1IhIzO5sY57AKDwLyahZSEbNQjJqFpKW
        BYwsqxglUwuKc9Nziw0LjPJSy/WKE3OLS/PS9ZLzczcxgqNSS2sH455VH/QOMTJxMB5ilOBg
        VhLhdV5akCTEm5JYWZValB9fVJqTWnyIUZqDRUmc90LXyXghgfTEktTs1NSC1CKYLBMHp1QD
        k6jt3Rl9X2v8wra8LuRZzVBx1nOjUYhh8Ur1C8yLVvcLqS2d/Pf5VAfPA79m1l7jylv7pbLc
        c4ZH2kWr1HNr9D7ouuwUFNxVp94cmn1ghf+ii8k+iZv+uVzrWfjC/+KaxofsXzsWvVi5f2YQ
        m8W2vcZ8/cGTje4fkPjlZ2Z+I/Xp5pv+E+dvPul04QVT4IGFJuv0floFLGmvW8f6fdfD15Uu
        nKEzuVinTdW9V9g+f+qc+6bhtnefLCgKnqm8K0Jgiuc8WZWZpvGt+/c82iKYv81G1M9+t/RF
        M1ehX/mL1P79lk54Nv9Ke82b2lO8P4L1XC7ynsuc5hubd/t7XsUW53t9S1+YRbsI7EjhqFhy
        440SS3FGoqEWc1FxIgBDtrM2OQMAAA==
X-CMS-MailID: 20220503112736epcas2p18b0a2b8bc0bab3c8eaafff0ce2021ab1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220503105729epcas2p37342dc05e91c9007aa61d950c2bfe447
References: <20220503105914.117625-1-chanho61.park@samsung.com>
        <CGME20220503105729epcas2p37342dc05e91c9007aa61d950c2bfe447@epcas2p3.samsung.com>
        <20220503105914.117625-11-chanho61.park@samsung.com>
        <814dc408-3ede-1223-7fd7-e7e0b1c1530b@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> On 03/05/2022 12:59, Chanho Park wrote:
> > Add cmu_top, cmu_busmc, cmu_core, cmu_fsys and peric0/c1/s clock nodes.
> >
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> > ---
> >  arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 84 ++++++++++++++++++++
> >  1 file changed, 84 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> > index 807d500d6022..32c670b8a9b8 100644
> > --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> > @@ -6,6 +6,7 @@
> >   *
> >   */
> >
> > +#include <dt-bindings/clock/samsung,exynosautov9.h>
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/soc/samsung,exynos-usi.h>
> >
> > @@ -190,6 +191,89 @@ chipid@10000000 {
> >  			reg = <0x10000000 0x24>;
> >  		};
> >
> > +		cmu_peris: clock-controller@10020000 {
> > +			compatible = "samsung,exynosautov9-cmu-peris";
> > +			reg = <0x10020000 0x8000>;
> > +			#clock-cells = <1>;
> > +
> > +			clocks = <&xtcxo>,
> > +				 <&cmu_top DOUT_CLKCMU_PERIS_BUS>;
> > +			clock-names = "oscclk",
> > +				      "dout_clkcmu_peris_bus";
> > +		};
> > +
> > +		cmu_peric0: clock-controller@10200000 {
> > +			compatible = "samsung,exynosautov9-cmu-peric0";
> > +			reg = <0x10200000 0x8000>;
> > +			#clock-cells = <1>;
> > +
> > +			clocks = <&xtcxo>,
> > +				 <&cmu_top DOUT_CLKCMU_PERIC0_BUS>,
> > +				 <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
> > +			clock-names = "oscclk",
> > +				      "dout_clkcmu_peric0_bus",
> > +				      "dout_clkcmu_peric0_ip";
> > +		};
> > +
> > +		cmu_peric1: clock-controller@10800000 {
> > +			compatible = "samsung,exynosautov9-cmu-peric1";
> > +			reg = <0x10800000 0x8000>;
> > +			#clock-cells = <1>;
> > +
> > +			clocks = <&xtcxo>,
> > +				 <&cmu_top DOUT_CLKCMU_PERIC1_BUS>,
> > +				 <&cmu_top DOUT_CLKCMU_PERIC1_IP>;
> > +			clock-names = "oscclk",
> > +				      "dout_clkcmu_peric1_bus",
> > +				      "dout_clkcmu_peric1_ip";
> > +		};
> > +
> > +		cmu_core: clock-controller@1b030000 {
> > +			compatible = "samsung,exynosautov9-cmu-core";
> > +			reg = <0x1b030000 0x8000>;
> > +			#clock-cells = <1>;
> > +
> > +			clocks = <&xtcxo>,
> > +				 <&cmu_top DOUT_CLKCMU_CORE_BUS>;
> > +			clock-names = "oscclk",
> > +				      "dout_clkcmu_core_bus";
> > +		};
> > +
> > +		cmu_busmc: clock-controller@1b200000 {
> > +			compatible = "samsung,exynosautov9-cmu-busmc";
> > +			reg = <0x1b200000 0x8000>;
> > +			#clock-cells = <1>;
> > +
> > +			clocks = <&xtcxo>,
> > +				 <&cmu_top DOUT_CLKCMU_BUSMC_BUS>;
> > +			clock-names = "oscclk",
> > +				      "dout_clkcmu_busmc_bus";
> > +		};
> > +
> > +		cmu_top: clock-controller@1b240000 {
> > +			compatible = "samsung,exynosautov9-cmu-top";
> > +			reg = <0x1b240000 0x8000>;
> > +			#clock-cells = <1>;
> > +
> > +			clocks = <&xtcxo>;
> > +			clock-names = "oscclk";
> > +		};
> > +
> > +		cmu_fsys2: clock-controller@17c00000 {
> 
> This should go before 1b030000.

Oops. Why did I think 1bx < 17c. I'll update them again.

Best Regards,
Chanho Park

