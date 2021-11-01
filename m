Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA161C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 04:58:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFC3660F4F
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 04:58:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbhKAFBP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 1 Nov 2021 01:01:15 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:31248 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbhKAFBO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 1 Nov 2021 01:01:14 -0400
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20211101045839epoutp0187dadec288edda2df289cbc266a9f539~zU1Yg3xMx1121211212epoutp01N
        for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Nov 2021 04:58:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20211101045839epoutp0187dadec288edda2df289cbc266a9f539~zU1Yg3xMx1121211212epoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1635742719;
        bh=IJ8BEhRakEjtjgjClZJy5PcZ8sx14ybuUNY2BjRZzQA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gNVJ3xs+KkLOctBuF8hP1zooRIzdmcEwE4UYZuQwLBVEMD4EJ7mfPLKjAe/1qvMeM
         ApQZnEVLVu06ADB7QuXq7vs96TqfMrq05KPhqAN80fVlOu7UPzPhtTwuFEkud+flwU
         kGxkfq3veaThIEhIB+LwmDJKcM7YP+AUMCXGIIaw=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211101045838epcas2p4882c3fbaa3bf3c63b22491524ba4e42f~zU1XybeLY0577405774epcas2p4T;
        Mon,  1 Nov 2021 04:58:38 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.92]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4HjLQg2Ck4z4x9Qd; Mon,  1 Nov
        2021 04:58:35 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        FC.8D.10014.6F37F716; Mon,  1 Nov 2021 13:58:30 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20211101045829epcas2p37b38a4e4fd0af4a72a62bdeba46daf17~zU1P5Un942895128951epcas2p3A;
        Mon,  1 Nov 2021 04:58:29 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211101045829epsmtrp1d2e3061320d8978940771ce158c53dff~zU1P4jeDH1809618096epsmtrp1N;
        Mon,  1 Nov 2021 04:58:29 +0000 (GMT)
X-AuditID: b6c32a47-473ff7000000271e-a8-617f73f6715f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        5A.C2.08738.5F37F716; Mon,  1 Nov 2021 13:58:29 +0900 (KST)
Received: from perf (unknown [12.36.155.123]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20211101045829epsmtip1e168ff4e9d4430798a70171f70b1099b~zU1PrIXNn2432424324epsmtip1J;
        Mon,  1 Nov 2021 04:58:29 +0000 (GMT)
Date:   Mon, 1 Nov 2021 14:25:42 +0900
From:   Youngmin Nam <youngmin.nam@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com
Subject: Re: [PATCH v1 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Message-ID: <20211101052542.GA35671@perf>
MIME-Version: 1.0
In-Reply-To: <117dfec8-e417-642b-7647-9d17592826ad@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFJsWRmVeSWpSXmKPExsWy7bCmhe634vpEg6s7BCzmfZa1aNp/idni
        +NrXrBYb3/5gstj0+BqrxeVdc9gsZpzfx2Sx+PEKJot/vQcZLTZvmsrswOUxq6GXzePOtT1s
        Hu/OnWP32Lyk3qNvyypGj8+b5ALYorJtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1DS0t
        zJUU8hJzU22VXHwCdN0yc4AOU1IoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQUmBfo
        FSfmFpfmpevlpZZYGRoYGJkCFSZkZ/xZN4uloJ23omnGAdYGxltcXYwcHBICJhKNi/K6GDk5
        hAR2MEr8XeDUxcgFZH9ilOj+cp0NwvnMKLFp1koWkCqQhobWnUwQiV2MEkcWToZyHjFKrPmx
        hxmkikVARaLl6QqwDjYBXYltJ/4xgtgiAtYSR7fOZwZpYBb4xyjRMHUNE0hCWKBK4trTBWwg
        Nq+ApkTju5MsELagxMmZT8BsTgFHicXb94INEhVQljiw7TjYZgmBmRwSK8+dZIa4z0XiyvPr
        ULcKS7w6voUdwpaSeNnfBmXXSyzetpQZonkCo8T8TR+gEsYSs561g21gFsiQ6Ft8lR0SSsoS
        R26xQIT5JDoO/4UK80p0tAlBdKpJ/JqygRHClpHYvXgF1DkeEru2HGSEhNAfRonZF04yT2CU
        n4Xkt1lItkHYOhILdn9imwW0gllAWmL5Pw4IU1Ni/S79BYysqxjFUguKc9NTi40KjOGxnZyf
        u4kRnGi13Hcwznj7Qe8QIxMH4yFGCQ5mJRHeiAs1iUK8KYmVValF+fFFpTmpxYcYTYExNZFZ
        SjQ5H5jq80riDU0sDUzMzAzNjUwNzJXEeS1FsxOFBNITS1KzU1MLUotg+pg4OKUamNK6D96f
        rzyDM1Px6cbFoYsefitmsEvakdZvpjLrfLF97KP7fNsXb1Y50+D37nTEBuGLmv5KrH1dYfyf
        5okEJjOfCNlmWjspNmBf9k6lhSUFE7Y3u/Ao11c2Rzcelt18uEkxcJfTvAd3i43Kd7A//+az
        p2KTBk8SB5/P5TUvnu4xXCKotVbg0/ylpw6YNc8Rv6ZSV+Qz/SMTU8PU4g5Tx2sGfoddcyer
        ndrY3Oof911hW52O/83vr4+Ja+o0P3KbZTp1WWfUuRUs04WfXN2t5S66QWW/7pWZ5gbhUqxr
        1LzuZWdue7Y7v8GMaUXHQf6J0mmrr3fwK0nseyBh4uN5dfIkuc6wzZyi3kaVMybWKrEUZyQa
        ajEXFScCAAwM0bM9BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRmVeSWpSXmKPExsWy7bCSnO7X4vpEg0UrtC3mfZa1aNp/idni
        +NrXrBYb3/5gstj0+BqrxeVdc9gsZpzfx2Sx+PEKJot/vQcZLTZvmsrswOUxq6GXzePOtT1s
        Hu/OnWP32Lyk3qNvyypGj8+b5ALYorhsUlJzMstSi/TtErgyLq1Yx1ZwnKti88vTjA2Mmzm6
        GDk5JARMJBpadzJ1MXJxCAnsYJQ49X0NG0RCRuL2ysusELawxP2WI6wQRQ8YJTb+m88IkmAR
        UJFoebqCBcRmE9CV2HbiH1hcRMBa4ujW+cwgDcwCDUwSB67MBEsIC1RJXHu6AGwDr4CmROO7
        kywQU/8wSnyd2cIOkRCUODnzCdhUZgEtiRv/XgLdxwFkS0ss/wd2NqeAo8Ti7XvBZooKKEsc
        2HacaQKj4Cwk3bOQdM9C6F7AyLyKUTK1oDg3PbfYsMAoL7Vcrzgxt7g0L10vOT93EyM4VrS0
        djDuWfVB7xAjEwfjIUYJDmYlEd6ICzWJQrwpiZVVqUX58UWlOanFhxilOViUxHkvdJ2MFxJI
        TyxJzU5NLUgtgskycXBKNTDNuKJ4s8xwW23aTzaeqSpxHgpFC4wcThzc86z++OQJIaa2/ncP
        sIr4dOQL3X2SVeaaKcC4p2fPk7YFwsoz/27fXrtP9KVNWiWHkmrL+cXb/awM7UN2TBaWu7lP
        qP7UzAiG/HJeo48VQkIicl9k5RL/7JO5rb7sYuF/nZI99orfA14vf6Qic3xOzfOiXXskdCsT
        tuakbJlXfLr8Y8EF1bxXWV6Rb6zeyArG3V4wY96WAquYC0lrIpb+vXDpbqmZ4n3p3sKdD3qm
        zp58493FmIBUO+7Z0wMXm5w1nWNb5bfkSb9q0QSO5ArO0rI5D5gFMiLc5H2+rN/HLLY6r3K/
        aYiX8WlTgVvsx3b+X5RislSJpTgj0VCLuag4EQAFM9T5BAMAAA==
X-CMS-MailID: 20211101045829epcas2p37b38a4e4fd0af4a72a62bdeba46daf17
X-Msg-Generator: CA
Content-Type: multipart/mixed;
        boundary="----cdUjzaOTU1RPrvxdiax6HhSlBq1jqBVFQM-mWLfQP3CdA8rT=_96e4a_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211021055112epcas2p278145beb21cd6cc4217813a41c1e1407
References: <20211021061804.39118-1-youngmin.nam@samsung.com>
        <CGME20211021055112epcas2p278145beb21cd6cc4217813a41c1e1407@epcas2p2.samsung.com>
        <20211021061804.39118-2-youngmin.nam@samsung.com>
        <117dfec8-e417-642b-7647-9d17592826ad@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

------cdUjzaOTU1RPrvxdiax6HhSlBq1jqBVFQM-mWLfQP3CdA8rT=_96e4a_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 27, 2021 at 10:38:09AM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2021 08:18, Youngmin Nam wrote:
> > Exynos MCT version 2 is composed of 1 FRC and 12 comparators.
> > The 12 comparators can produces interrupts independently,
> > so they can be used as local timer of each CPU.
> > 
> 
> ...
> 
> > +
> > +static void exynos_mct_comp_start(struct mct_clock_event_device *mevt,
> > +				  bool periodic, unsigned long cycles)
> > +{
> > +	unsigned int index = mevt->comp_index;
> > +	unsigned int comp_enable;
> > +	unsigned int loop_cnt = 0;
> > +
> > +	comp_enable = readl_relaxed(reg_base + EXYNOS_MCT_COMP_ENABLE(index));
> > +	if (comp_enable == MCT_COMP_ENABLE)
> > +		exynos_mct_comp_stop(mevt);
> > +
> > +	if (periodic)
> > +		writel_relaxed(MCT_COMP_CIRCULAR_MODE, reg_base + EXYNOS_MCT_COMP_MODE(index));
> > +
> > +	writel_relaxed(cycles, reg_base + EXYNOS_MCT_COMP_PERIOD(index));
> 
> This is unsigned long, so 64-bit on your platform. Use writeq_relaxed or
> handle it somehow.

Thanks for your review.
I checked again and data sheet of MCTv2 shows compartor period has 32-bit data width.
Once we write 32bit value to comp_period register, H/W will produce interrupt when increasing FRC
is the same with the value of "current FRC + comp_period".

> 
> 
> Best regards,
> Krzysztof
> 

------cdUjzaOTU1RPrvxdiax6HhSlBq1jqBVFQM-mWLfQP3CdA8rT=_96e4a_
Content-Type: text/plain; charset="utf-8"


------cdUjzaOTU1RPrvxdiax6HhSlBq1jqBVFQM-mWLfQP3CdA8rT=_96e4a_--
