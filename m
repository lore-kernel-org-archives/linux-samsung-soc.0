Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 313AAC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Nov 2021 23:54:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B5CD6113B
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Nov 2021 23:54:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbhKCX4y (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 3 Nov 2021 19:56:54 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:44303 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhKCX4x (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 3 Nov 2021 19:56:53 -0400
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20211103235415epoutp0316ae9cd88506a63eccfa4c8124241943~0LneDBK8s1658816588epoutp03K
        for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Nov 2021 23:54:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20211103235415epoutp0316ae9cd88506a63eccfa4c8124241943~0LneDBK8s1658816588epoutp03K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1635983655;
        bh=OVv4jZn/9pTdUg42ZmDLrWXSti6Hsh3qLDnEAgGhi/Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FEy/CF6m7S9HUS9dNwmjzWC/351Qqr7Ta2XSP7IlKBaPeUukyf6Kb1Wxn5CTxkIqt
         Ryyh0AeKgnzc+EbZ0JuoQ27tYTfid4tBr7qSvdUQRfnT1NtDsvNGi3XcEcwOqRNzcW
         DkuRsxAIKbqVyiNwhb0AZufDylGBSzMeJwKy0aws=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20211103235414epcas2p330fd12a8b533acf77425fcf2040619e2~0LndidPqq1003110031epcas2p3E;
        Wed,  3 Nov 2021 23:54:14 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.100]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4Hl3Wm4WrWz4x9Pr; Wed,  3 Nov
        2021 23:53:56 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        07.47.51767.D0123816; Thu,  4 Nov 2021 08:53:49 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20211103235348epcas2p229a7c76e601f7f4a0ff3ea5bfa891bab~0LnE7qYgb1817018170epcas2p2H;
        Wed,  3 Nov 2021 23:53:48 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211103235348epsmtrp1a992d030333fcc2ff44084f5f4de7c39~0LnE60_iR1238012380epsmtrp1i;
        Wed,  3 Nov 2021 23:53:48 +0000 (GMT)
X-AuditID: b6c32a45-447ff7000000ca37-49-6183210d6cf9
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        95.36.08738.C0123816; Thu,  4 Nov 2021 08:53:48 +0900 (KST)
Received: from perf (unknown [12.36.155.123]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20211103235348epsmtip14583ae3532e7d763099705ca919ced68~0LnEuRwlu1286412864epsmtip1O;
        Wed,  3 Nov 2021 23:53:48 +0000 (GMT)
Date:   Thu, 4 Nov 2021 09:21:02 +0900
From:   Youngmin Nam <youngmin.nam@samsung.com>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        will@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, kgene@kernel.org
Subject: Re: [PATCH v2 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Message-ID: <20211104002102.GA29618@perf>
MIME-Version: 1.0
In-Reply-To: <20211103100407.GA35817@C02TD0UTHF1T.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEJsWRmVeSWpSXmKPExsWy7bCmhS6vYnOiwY07XBbzPstaNO2/xGxx
        fO1rVov+x6+ZLTa+/cFksenxNVaLy7vmsFnMOL+PyWLp9YtMFosfr2Cy+Nd7kNFi86apzBYt
        d0wdeD3WzFvD6DGroZfNY9OqTjaPO9f2sHm8O3eO3WPzknqPvi2rGD0+b5IL4IjKtslITUxJ
        LVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wBOlhJoSwxpxQoFJBY
        XKykb2dTlF9akqqQkV9cYquUWpCSU2BeoFecmFtcmpeul5daYmVoYGBkClSYkJ1xYvEpxoLp
        qhX3d9g2MP6R7WLk5JAQMJH4segeSxcjF4eQwA5GiQ3LO5lAEkICnxglLjVoQCQ+AyVermeG
        6TjyvIMRIrGLUeLd6/PMEM4jRomPSz+wg1SxCKhILP7UDNbBJqArse3EP0YQW0RAXaJn1xew
        fcwC95gkJt9pBNsnLFAl8W3TTzCbV0BTYnPDQjYIW1Di5MwnLCA2p4CFxJ/bz8AGiQooSxzY
        dpwJZJCEwB4Oie2zrrFB3OciceP0BSYIW1ji1fEt7BC2lMTL/jYou15i8balzBDNExgl5m/6
        AJUwlpj1rB1sA7NAhsTWNw+BbA6guLLEkVssEGE+iY7Df9khwrwSHW1CEJ1qEr+mbGCEsGUk
        di9eAQ0uD4neZQvYICH0ilnix7Z2lgmM8rOQ/DYLyTYIW0diwe5PbLOAVjALSEss/8cBYWpK
        rN+lv4CRdRWjWGpBcW56arFRgSE8tpPzczcxghOzlusOxslvP+gdYmTiYDzEKMHBrCTC+3xD
        U6IQb0piZVVqUX58UWlOavEhRlNgTE1klhJNzgfmhrySeEMTSwMTMzNDcyNTA3MlcV5L0exE
        IYH0xJLU7NTUgtQimD4mDk6pBqa+1p1zc3be3hHDXtD8qffdpS17Om4xfeTyc4/9H/BuzcQl
        9mU3pXZtmbHQwvfqpc40d7t7JhWX3q25IjmFz5/JRuSWTcNTGd7XL9uPTQtq4d3N8ObhnOZc
        0dk6j3rPBrQ1pVw+UzFdfcb/l4bP5n+Q6HYuahduzV6/2uqvw5QVHjE6Hd+SRWZmsswPNDp/
        3VPqTpgkf/CvlAXujlPUsz/4Ld07RyDyVMBPz48imx8tPiHuOHv+vtusLtvT1Nc+0VE3L5Bz
        +RLg3me4Re/Wad4LTEf7rzS8aUjvWtL56GpiL+9q7Tlnpy/+0RsyaYZjEcdJ9hsP+N303137
        e13ddrGGFnNO9I07Fkz8U+32ZsQpsRRnJBpqMRcVJwIAOm+IGlUEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42LZdlhJTpdHsTnR4NJDKYt5n2UtmvZfYrY4
        vvY1q0X/49fMFhvf/mCy2PT4GqvF5V1z2CxmnN/HZLH0+kUmi8WPVzBZ/Os9yGixedNUZouW
        O6YOvB5r5q1h9JjV0MvmsWlVJ5vHnWt72DzenTvH7rF5Sb1H35ZVjB6fN8kFcERx2aSk5mSW
        pRbp2yVwZSzcOZ+p4LpSxaars5kaGK9KdzFyckgImEgced7BCGILCexglGhaJQcRl5G4vfIy
        K4QtLHG/5QiQzQVU84BR4t6MGWwgCRYBFYnFn5qZQWw2AV2JbSf+gQ0SEVCX6Nn1hQWkgVng
        HpPEoX8HWUASwgJVEt82/WQCsXkFNCU2Nyxkg5j6jlni6++bUAlBiZMzn4A1MAtoSdz49xIo
        zgFkS0ss/8cBEuYUsJD4c/sZ2DJRAWWJA9uOM01gFJyFpHsWku5ZCN0LGJlXMUqmFhTnpucW
        GxYY5aWW6xUn5haX5qXrJefnbmIER5aW1g7GPas+6B1iZOJgPMQowcGsJML7fENTohBvSmJl
        VWpRfnxRaU5q8SFGaQ4WJXHeC10n44UE0hNLUrNTUwtSi2CyTBycUg1M/Ymx+823fhe5w7cu
        ec3MW+80rG6nfG7rVYtaf3Xv25ST36aXyfCHT21bLts11fa95+W1VvMuLzL8OvvZfpH5E2zN
        n3i8FZPrrivjf78/prbp6Fs5/izfmOwrcy7uan103cN7JtOhhe97f1xWXvr8qXO12VfNKs/z
        DPX8V5KDQppdfk3auTbjBpNdtG6Ox6XdLjt2lD6eP3m2e5BA5z//fKFLMT5rmC9v2zArSt7N
        Zn2JwCWJ2WlLQta8+R2vdj7ixJ2MBc8W3DmbluhzK+X1s0em7az1EWfUDzca5lketLKXulyq
        m9pt7lLNcjYycZdlX9z3lNbea1zTdNRNF+WvzZq9Kifred7EW8xC6ae5lViKMxINtZiLihMB
        wNqTchsDAAA=
X-CMS-MailID: 20211103235348epcas2p229a7c76e601f7f4a0ff3ea5bfa891bab
X-Msg-Generator: CA
Content-Type: multipart/mixed;
        boundary="----Rk3zsqjqUKweF24zVwdvtl2y71nmD2FrmK.R7ke11MfHQlfJ=_ba61f_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211101234500epcas2p2d0e5bc54615b635f6694bc1be4c89fb5
References: <20211102001122.27516-1-youngmin.nam@samsung.com>
        <CGME20211101234500epcas2p2d0e5bc54615b635f6694bc1be4c89fb5@epcas2p2.samsung.com>
        <20211102001122.27516-2-youngmin.nam@samsung.com>
        <20211102102802.GA16545@C02TD0UTHF1T.local> <20211103000945.GA48132@perf>
        <83f6574b-bbab-f0c3-7198-f773c3dcfc63@canonical.com>
        <20211103092444.GA7013@perf>
        <f7871718-f244-8a9e-9302-c27bdb2d3cc1@canonical.com>
        <20211103095727.GA19093@perf> <20211103100407.GA35817@C02TD0UTHF1T.local>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

------Rk3zsqjqUKweF24zVwdvtl2y71nmD2FrmK.R7ke11MfHQlfJ=_ba61f_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 03, 2021 at 10:04:18AM +0000, Mark Rutland wrote:
> On Wed, Nov 03, 2021 at 06:57:28PM +0900, Youngmin Nam wrote:
> > On Wed, Nov 03, 2021 at 10:04:36AM +0100, Krzysztof Kozlowski wrote:
> > > On 03/11/2021 10:24, Youngmin Nam wrote:
> > > > On Wed, Nov 03, 2021 at 09:18:07AM +0100, Krzysztof Kozlowski wrote:
> > > >> On 03/11/2021 01:09, Youngmin Nam wrote:
> > > >>> On Tue, Nov 02, 2021 at 10:28:10AM +0000, Mark Rutland wrote:
> > > >>>> On Tue, Nov 02, 2021 at 09:11:21AM +0900, Youngmin Nam wrote:
> 
> > > >>>>> +	evt->rating = 500;	/* use value higher than ARM arch timer */
> > > >>>>
> > > >>>> Previously Will asked you to try CLOCK_EVT_FEAT_PERCPU here, and to set
> > > >>>> the C3STOP flag on the arch timer via the DT when necessary, rather than
> > > >>>> trying to override the arch timer like this:
> > > >>>>
> > > >>>>   https://protect2.fireeye.com/v1/url?k=72526080-2dc9598b-7253ebcf-002590f5b904-ca603717c6462908&q=1&e=be56aa83-dbac-4639-913d-d388620fe3fc&u=https%3A%2F%2Flore.kernel.org%2Fr%2F20211027073458.GA22231%40willie-the-truck
> 
> > > >>> Hi Mark.
> > > >>> It looks like you missed my previous mail.
> > > >>> https://protect2.fireeye.com/v1/url?k=ab15817a-cbf71c27-ab140a35-000babd9f1ba-123b7f313b1b1ccc&q=1&e=34c8716e-6d2e-4d8e-82fe-04777ebc5eb3&u=https%3A%2F%2Flore.kernel.org%2Fall%2F20211029035422.GA30523%40perf%2F%23t
> > > >>>
> > > >>> Yes, I believe Will's suggestion definitely will work.
> 
> Then please do so.
> 
> > > >>> But that is for performance not functionality.
> 
> No; it's about *consistency*, and avoiding unnecssary special cases. The
> whole point is that marking the generic timer as C3STOP *accurately*
> describes how the timer behaves on your platform, and marking the MCTv2
> as a percpu timer which *can* act as a back-up also aligns with that.
> 
> That approach leaves the policy in the kernel, and we can play about
> with that later without functional breakage.
> 
> > > >>> As a driver for new H/W IP I would like to confirm functionality first.
> > > >>> We need more time to test this feature with our exynos core power down feature.
> > > >>> And we need to do a various regression test whether there is another corner case or not.
> > > >>> So, how about we apply Will's suggetion later after the current patchset is merged first?
> > > >>> After doing our regression test with our exynos core power down feature, we can confirm this.
> > > >>
> > > >> Not really, because once it is merged there is no incentive to fix it or
> > > >> simply changing it can be forgotten. Also similarly to commit
> > > >> 6282edb72bed ("clocksource/drivers/exynos_mct: Increase priority over
> > > >> ARM arch timer"), there should be a valid and serious reason to
> > > >> prioritize Exynos MCT.
> 
> It's also worth nothing that the case described for 6282edb72bed is
> really a system design erratum, since the counter is supposed to be in
> an always-on power domain and should be counting well before a regular
> OS kernel boots. The arm64 kernel requires the architected counter to be
> running before it is entered, or there will be subtle breakage.
> 
> > > > No, it's not. I also want to decrease MCTv2 timer rating so that we want to use arm arch timer as a default.
> > > > But this feature has to be confirmed with core power down feature enabled.
> > > > Without core power down feature, we can't comfirm this.
> > > > Ater that we need to check whether there is regression or not related power, stability, and so on.
> > > > I'm not saying I will not apply Will's suggestion but I just want to apply later after some hard test.
> > > 
> > > You repeat the same argument, the same words. Nothing new. Repeating the
> > > same won't change it, use the lower priority. This is a patch for new
> > > kernel, so there is a plenty of time to test it and it won't affect your
> > > production environment.
> > > 
> > So, how about we control timer rating value with DT ?
> > Of course the default rating value should be lower than arm arch timer's.
> > Do you agree with this?
> 
> No; placing a rating value in the DT is a hack. That should *not* live
> in the DT because it's linux-internal detail and not a description of
> the HW.
> 

So, how do we use MCTv2 only for clock event device if there are some limitations caused by SoC design implemention ?

> Thanks,
> Mark.
> 

------Rk3zsqjqUKweF24zVwdvtl2y71nmD2FrmK.R7ke11MfHQlfJ=_ba61f_
Content-Type: text/plain; charset="utf-8"


------Rk3zsqjqUKweF24zVwdvtl2y71nmD2FrmK.R7ke11MfHQlfJ=_ba61f_--
