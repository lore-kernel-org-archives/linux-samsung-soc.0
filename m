Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B82CC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Nov 2021 09:30:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 314A561139
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Nov 2021 09:30:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbhKCJdB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 3 Nov 2021 05:33:01 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:54346 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231435AbhKCJdA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 3 Nov 2021 05:33:00 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20211103093022epoutp019ed61c1c48da659cb8cc11ae3e9bd279~z-1MkwyJk1385513855epoutp01E
        for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Nov 2021 09:30:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20211103093022epoutp019ed61c1c48da659cb8cc11ae3e9bd279~z-1MkwyJk1385513855epoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1635931822;
        bh=582kpjCxcjnUr0r4YhuwbHhYwZZUG2C5pdaYMNQ2CHM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TGXDUoDkHdn+jD2/unYKtPPzGOL0WnAjIAy+uXFYPa50LGZm6S9cqN0WTX9ZNs91l
         ASEEmHEJB8XLmpHT8E8EmSO7rGMZhFJ0Wb6Ne+shi8RNX9TNjwc7mEDhJa1bdZakCo
         IpWwFBj0FnJ0JIuWcH7JqlmUQOZZJr07u0LzvmMM=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20211103093021epcas2p153fc850da766c4eab9cc7062f1212a07~z-1MFE7DP0836008360epcas2p1c;
        Wed,  3 Nov 2021 09:30:21 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.91]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4HkhMF1RVGz4x9QF; Wed,  3 Nov
        2021 09:30:17 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        B8.D3.10018.7A652816; Wed,  3 Nov 2021 18:30:15 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20211103093014epcas2p3d39ec4850134640d88aed723a73d64dd~z-1FpmkeN2464124641epcas2p3b;
        Wed,  3 Nov 2021 09:30:14 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211103093014epsmtrp2fc99aa31e3699a63b69804b88d9d6121~z-1Fosqnd0351403514epsmtrp2Z;
        Wed,  3 Nov 2021 09:30:14 +0000 (GMT)
X-AuditID: b6c32a46-a25ff70000002722-2f-618256a702f3
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        4C.45.08738.6A652816; Wed,  3 Nov 2021 18:30:14 +0900 (KST)
Received: from perf (unknown [12.36.155.123]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20211103093014epsmtip2c12f80fde28d28872fb1fd8a9f2653c6~z-1FbtfJy2705127051epsmtip2l;
        Wed,  3 Nov 2021 09:30:14 +0000 (GMT)
Date:   Wed, 3 Nov 2021 18:57:28 +0900
From:   Youngmin Nam <youngmin.nam@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     will@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org,
        tglx@linutronix.de, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, kgene@kernel.org
Subject: Re: [PATCH v2 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Message-ID: <20211103095727.GA19093@perf>
MIME-Version: 1.0
In-Reply-To: <f7871718-f244-8a9e-9302-c27bdb2d3cc1@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIJsWRmVeSWpSXmKPExsWy7bCmme7ysKZEg+NvhS3mfZa1aNp/idni
        +NrXrBb9j18zW2x8+4PJYtPja6wWl3fNYbOYcX4fk8XS6xeZLBY/XsFk8a/3IKPF5k1TmS1a
        7pg68HqsmbeG0WNWQy+bx6ZVnWwed67tYfN4d+4cu8fmJfUefVtWMXp83iQXwBGVbZORmpiS
        WqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkDdLCSQlliTilQKCCx
        uFhJ386mKL+0JFUhI7+4xFYptSAlp8C8QK84Mbe4NC9dLy+1xMrQwMDIFKgwITvj3uqNbAWX
        1SvmdO5gamB8qtDFyMkhIWAiMXnvEfYuRi4OIYEdjBIPf9xmhXA+MUr8udHEDOF8ZpTY8eEH
        UxcjB1jLzePuEPFdjBKdb5dAdTxilOjrXcAKMpdFQEXiy75WRhCbTUBXYtuJf2C2iIC1xNGt
        88GmMgvsZJJ4dW4GG0hCWKBK4tumn2AbeAU0JV6tLAcJ8woISpyc+YQFJMwp4CjRc1UEJCwq
        oCxxYNtxJpAxEgIHOCQ+btjOCPGPi8Shc0dYIGxhiVfHt7BD2FISn9/tZYOw6yUWb1vKDNE8
        gVFi/qYPUEXGErOetYMNYhbIkHg7dSUzxMfKEkdusUCE+SQ6Dv9lhwjzSnS0CUF0qkn8mrIB
        6gQZid2LVzBD2B4SvcsWsEHCZx6zxML7t5gmMMrPQvLaLCTbIGwdiQW7P7HNAlrBLCAtsfwf
        B4SpKbF+l/4CRtZVjGKpBcW56anFRgVG8MhOzs/dxAhOy1puOxinvP2gd4iRiYPxEKMEB7OS
        CG+vTVOiEG9KYmVValF+fFFpTmrxIUZTYDxNZJYSTc4HZoa8knhDE0sDEzMzQ3MjUwNzJXFe
        S9HsRCGB9MSS1OzU1ILUIpg+Jg5OqQamO3M8XEqN2CK+/DxqOmnKd77qzjklB9ym1rY5xew8
        xRu9/OrqJtGdqt/4rfhnZM5j2b+4YHFYsib3snTX32aZ7y12hJ+5Urojnv/jHvW/QTGpjx9P
        XLx6VVeN3ce6CTnCNuUdey9JaT1lWZt85K7jjy287KdSUrummO55nTRlz+lrsze38zG9T9/C
        NL1p4c13u179cH6fenRN7tdFxqeDGjJ9D+syxa3N0GKt1tw582NQj4c/00y2Cg5n07q7XHtU
        BV5rW+u9PcaUqRbw+fqJ8yxNKREtT1lN/HWfngi9c2EN39NNKxuf9eUev5nzLKX/+o1Imzub
        //pncOsWJf6WlexocJK3mfhBUGrmH5tcJZbijERDLeai4kQAYiHThFQEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjkeLIzCtJLcpLzFFi42LZdlhJXndZWFOiweErmhbzPstaNO2/xGxx
        fO1rVov+x6+ZLTa+/cFksenxNVaLy7vmsFnMOL+PyWLp9YtMFosfr2Cy+Nd7kNFi86apzBYt
        d0wdeD3WzFvD6DGroZfNY9OqTjaPO9f2sHm8O3eO3WPzknqPvi2rGD0+b5IL4IjisklJzcks
        Sy3St0vgyvjW84+9YLJqRUdXA0sD4z65LkYODgkBE4mbx927GLk4hAR2MErsnzeTrYuREygu
        I3F75WVWCFtY4n7LEVaIogeMEjtubwErYhFQkfiyr5URxGYT0JXYduIfmC0iYC1xdOt8ZpAG
        ZoHdTBIr226ATRIWqJL4tuknE8hmXgFNiVcryyGGLmCWeP51P9hQXgFBiZMzn7CA2MwCWhI3
        /r0Eq2cWkJZY/o8DxOQUcJTouSoCUiEqoCxxYNtxpgmMgrOQNM9C0jwLoXkBI/MqRsnUguLc
        9NxiwwKjvNRyveLE3OLSvHS95PzcTYzgqNLS2sG4Z9UHvUOMTByMhxglOJiVRHh7bZoShXhT
        EiurUovy44tKc1KLDzFKc7AoifNe6DoZLySQnliSmp2aWpBaBJNl4uCUamCSNLxWt+CcZ0rj
        Sc/s+MtbxZP+h3Nd6X7SLjaFffsXN2VHw7cXDA78f76vXKM0eM6lN9mJ55Y6iDF8PRfa5Cgl
        NNHz1alLP989X/Nqn8atF2yZTCpnMjfsYfDtOluw6pa6YNGKqEfnpCekNYUGvtw1ITh6Rlss
        6+yHr2rTArJqHfZ8ePz2l6X5nGRjfd5dXR/nh5h/yDrLpcO9YJnrErHTDTcVP4hFBtfv02BZ
        KXZL+a2E6efa962TlZbplD6UDj8h/MwuOXXO182HZ2pycbL5t7/p+rM6nlNlb/U/o+dTr866
        Na9HbXL37Pese2arGQg58frrCcYvdJ/zefbpeWv/bfzDZLD0eqYK3/LQyak2SizFGYmGWsxF
        xYkAeOHXJRkDAAA=
X-CMS-MailID: 20211103093014epcas2p3d39ec4850134640d88aed723a73d64dd
X-Msg-Generator: CA
Content-Type: multipart/mixed;
        boundary="----cdUjzaOTU1RPrvxdiax6HhSlBq1jqBVFQM-mWLfQP3CdA8rT=_b5313_"
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
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

------cdUjzaOTU1RPrvxdiax6HhSlBq1jqBVFQM-mWLfQP3CdA8rT=_b5313_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 03, 2021 at 10:04:36AM +0100, Krzysztof Kozlowski wrote:
> On 03/11/2021 10:24, Youngmin Nam wrote:
> > On Wed, Nov 03, 2021 at 09:18:07AM +0100, Krzysztof Kozlowski wrote:
> >> On 03/11/2021 01:09, Youngmin Nam wrote:
> >>> On Tue, Nov 02, 2021 at 10:28:10AM +0000, Mark Rutland wrote:
> >>>> On Tue, Nov 02, 2021 at 09:11:21AM +0900, Youngmin Nam wrote:
> >>>>> Exynos MCT version 2 is composed of 1 FRC and 12 comparators.
> >>>>> There are no global timer and local timer anymore.
> >>>>> The 1 of 64bit FRC serves as "up-counter"(not "comparators").
> >>>>> The 12 comaprators(not "counter") can be used as per-cpu event timer
> >>>>> so that it can support upto 12 cores.
> >>>>> And a RTC source can be used as backup clock source.
> >>>>
> >>>> [...]
> >>>>
> >>>>> +static int exynos_mct_starting_cpu(unsigned int cpu)
> >>>>> +{
> >>>>> +	struct mct_clock_event_device *mevt = per_cpu_ptr(&percpu_mct_tick, cpu);
> >>>>> +	struct clock_event_device *evt = &mevt->evt;
> >>>>> +
> >>>>> +	snprintf(mevt->name, sizeof(mevt->name), "mct_comp%d", cpu);
> >>>>> +
> >>>>> +	evt->name = mevt->name;
> >>>>> +	evt->cpumask = cpumask_of(cpu);
> >>>>> +	evt->set_next_event = exynos_comp_set_next_event;
> >>>>> +	evt->set_state_periodic = mct_set_state_periodic;
> >>>>> +	evt->set_state_shutdown = mct_set_state_shutdown;
> >>>>> +	evt->set_state_oneshot = mct_set_state_shutdown;
> >>>>> +	evt->set_state_oneshot_stopped = mct_set_state_shutdown;
> >>>>> +	evt->tick_resume = mct_set_state_shutdown;
> >>>>> +	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
> >>>>> +	evt->rating = 500;	/* use value higher than ARM arch timer */
> >>>>
> >>>> Previously Will asked you to try CLOCK_EVT_FEAT_PERCPU here, and to set
> >>>> the C3STOP flag on the arch timer via the DT when necessary, rather than
> >>>> trying to override the arch timer like this:
> >>>>
> >>>>   https://protect2.fireeye.com/v1/url?k=72526080-2dc9598b-7253ebcf-002590f5b904-ca603717c6462908&q=1&e=be56aa83-dbac-4639-913d-d388620fe3fc&u=https%3A%2F%2Flore.kernel.org%2Fr%2F20211027073458.GA22231%40willie-the-truck
> >>>>
> >>>> There are a bunch of things that depend on the architected timer working
> >>>> as a clocksource (e.g. vdso, kvm), and it *should* work as a lock
> >>>> clockevent_device if configured correctly, and it's much more consistent
> >>>> with *everyone else* to use the arhcitected timer by default.
> >>>>
> >>>> Please try as Will suggested above, so that this works from day one.
> >>>>
> >>>> Thanks,
> >>>> Mark.
> >>>>
> >>>
> >>> Hi Mark.
> >>> It looks like you missed my previous mail.
> >>> https://protect2.fireeye.com/v1/url?k=ab15817a-cbf71c27-ab140a35-000babd9f1ba-123b7f313b1b1ccc&q=1&e=34c8716e-6d2e-4d8e-82fe-04777ebc5eb3&u=https%3A%2F%2Flore.kernel.org%2Fall%2F20211029035422.GA30523%40perf%2F%23t
> >>>
> >>> Yes, I believe Will's suggestion definitely will work.
> >>> But that is for performance not functionality.
> >>> As a driver for new H/W IP I would like to confirm functionality first.
> >>>
> >>> We need more time to test this feature with our exynos core power down feature.
> >>> And we need to do a various regression test whether there is another corner case or not.
> >>> So, how about we apply Will's suggetion later after the current patchset is merged first?
> >>> After doing our regression test with our exynos core power down feature, we can confirm this.
> >>>
> >>
> >> Not really, because once it is merged there is no incentive to fix it or
> >> simply changing it can be forgotten. Also similarly to commit
> >> 6282edb72bed ("clocksource/drivers/exynos_mct: Increase priority over
> >> ARM arch timer"), there should be a valid and serious reason to
> >> prioritize Exynos MCT.
> >>
> > 
> > No, it's not. I also want to decrease MCTv2 timer rating so that we want to use arm arch timer as a default.
> > But this feature has to be confirmed with core power down feature enabled.
> > Without core power down feature, we can't comfirm this.
> > Ater that we need to check whether there is regression or not related power, stability, and so on.
> > I'm not saying I will not apply Will's suggestion but I just want to apply later after some hard test.
> > 
> 
> You repeat the same argument, the same words. Nothing new. Repeating the
> same won't change it, use the lower priority. This is a patch for new
> kernel, so there is a plenty of time to test it and it won't affect your
> production environment.
> 
So, how about we control timer rating value with DT ?
Of course the default rating value should be lower than arm arch timer's.
Do you agree with this?

> Best regards,
> Krzysztof
> 

------cdUjzaOTU1RPrvxdiax6HhSlBq1jqBVFQM-mWLfQP3CdA8rT=_b5313_
Content-Type: text/plain; charset="utf-8"


------cdUjzaOTU1RPrvxdiax6HhSlBq1jqBVFQM-mWLfQP3CdA8rT=_b5313_--
