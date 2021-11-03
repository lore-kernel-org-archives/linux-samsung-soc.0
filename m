Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FBDC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Nov 2021 08:57:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1B68611C7
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Nov 2021 08:57:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhKCJAX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 3 Nov 2021 05:00:23 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:13226 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbhKCJAX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 3 Nov 2021 05:00:23 -0400
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20211103085743epoutp02e766ec85327fe044ce7a25f0ea963753~z-YsnzgVw2654726547epoutp02e
        for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Nov 2021 08:57:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20211103085743epoutp02e766ec85327fe044ce7a25f0ea963753~z-YsnzgVw2654726547epoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1635929863;
        bh=JxmrlYFxp5I2K7CDnqbrQ3lhPQqZXHzq5G7XwS0/PRo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hNKiLTWrOjjrw2B7ngNXT2bSkFZJBV3B0l0keLDCk+D3xsUDZj30Ay0JRGBKmoWtG
         pXTNqaonCl5xl4uqnUgWIfG0t6K06/EawUfGmSJRORk8W0EziRyKwPaAuptG2oQVf+
         fZ1htPOsakv3ly7rk9iF8cnq2sRxNnYAmaOgkNyc=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20211103085743epcas2p1758ab17ad505da4a3f8abc9ec75f1f23~z-YsKfnGE0097600976epcas2p1Z;
        Wed,  3 Nov 2021 08:57:43 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.92]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4HkgdT2f5tz4x9QW; Wed,  3 Nov
        2021 08:57:33 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        75.41.10018.BFE42816; Wed,  3 Nov 2021 17:57:31 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20211103085730epcas2p492e5ce9dfd46c509890a18856f1de5a7~z-YghRp0I1303213032epcas2p4J;
        Wed,  3 Nov 2021 08:57:30 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211103085730epsmtrp268d7cc7c98c311f10c733ff8e2bcd7e1~z-YggIaid1407014070epsmtrp2S;
        Wed,  3 Nov 2021 08:57:30 +0000 (GMT)
X-AuditID: b6c32a46-a0fff70000002722-82-61824efb7b80
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        33.F9.29871.AFE42816; Wed,  3 Nov 2021 17:57:30 +0900 (KST)
Received: from perf (unknown [12.36.155.123]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20211103085730epsmtip200124925e3209d1df5f8e422f17b6d50~z-YgQzap60627206272epsmtip2Y;
        Wed,  3 Nov 2021 08:57:30 +0000 (GMT)
Date:   Wed, 3 Nov 2021 18:24:45 +0900
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
Message-ID: <20211103092444.GA7013@perf>
MIME-Version: 1.0
In-Reply-To: <83f6574b-bbab-f0c3-7198-f773c3dcfc63@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf1AUZRjHe3fv9hans+0Ae+cExSVLqYO76w6WunMoGdvRpmGGmohRYbvb
        AeJ+dbuk4YwSMUg0l9DQZKAIIUQHiB14IQIRPwJiIpEJLZkxxSgQFARJ7+KmOxYb//s83+f5
        vs/z/sJRWS8mx7MsPGu3MCYSWydy926PU3hfz2eUPsfjVOViOJX//SWUGmi6JaaOTd5CqW/n
        7iOUa3JcTI21n8Co4790IVTt5VGEqpmsRyif4wdAtbg+R6mCCW2ClG6sbAR0eZ4Do13OjzF6
        YrwDo2+PjEjoltNH6E9bnYBedG1KwlOzdZksY2TtEazFYDVmWTL05J7ktJ1p2lilSqGKp+LI
        CAtjZvVk4mtJil1ZJv/AZMT7jCnHLyUxHEfG7NDZrTk8G5Fp5Xg9ydqMJlucLZpjzFyOJSPa
        wvIvqpRKtdZfmJ6d2d57VGSrJA8O9U1J8kBTWDEIwiGhgb6KWkkxWIfLiDYAZ38rRoXgLoBj
        i2NACJYB9CyXoQ8t/R9+IhISnQCe6SnFAgkZcQPA61dAgEXE07Dae0ccYIxQQPegb1UPIV6C
        /edOrbZAifMInBk5vmoOJnLhsusBEmApsQ06Z4+JBX4SDn15UxTgIOJl+POsVxLgUCISdrsH
        kMBCkOjA4fSvpWvjJcIfPysVCRwMZwZaJQLL4eLtTkzgI7DGXYsK5hIAT7nm14pegOVTR1dH
        RYlMuHznqt+A+/VI2Pe7SJDXw6LeFYkgS2FRoUxwPgM9ZWeBwGHwQk392jg0dNRVYcJpDSJw
        aPKSuARsLn9kb+WPdBP4eVh14a6fcT9vhF/7cAG3w+b2mCogdoINrI0zZ7Cc2qb+/7oNVrML
        rL7mqF1toGxuProHIDjoARBHyRCpQ5fPyKRG5oNc1m5Ns+eYWK4HaP03VYrKQw1W/3ew8Gkq
        TbxSExurilNrlXHkU9L40GxGRmQwPJvNsjbW/tCH4EHyPCTltKH5zytbuiO7TIapqM7QP956
        u//V/St8ysaGmQ0JE96mw20NJ0Xd55GejifSZ7Vd7btn07+5F2wubJ/nQuqTm5dXwlpTwo0L
        qbVnPC11ZfwJzcVnlcZmwz5RAfvYcN0bJz0Jjg599dZBd5J9UtznLP9C/p4uZ7/Ld/Gss/FB
        2+WfyMJx1VCj8h3Yylekxhx4ZSYx6JDC0oVt8bgXnoP6ls43R5f20nML0mvJ0dWNSz4ivGBH
        g/5fzfR00j9ufnzbXyvBu/eUHFiq3pf81cHhwq17b1QeurqTqyDUkhj1pvx3z13fnDtmvl+E
        3Cz42ztcoru2fmW0qqkqMeOj6MOK7+6RIi6TUUWhdo75D7J9y4NWBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42LZdlhJXveXX1OiwbR+dYt5n2UtmvZfYrY4
        vvY1q0X/49fMFhvf/mCy2PT4GqvF5V1z2CxmnN/HZLH0+kUmi8WPVzBZ/Os9yGixedNUZouW
        O6YOvB5r5q1h9JjV0MvmsWlVJ5vHnWt72DzenTvH7rF5Sb1H35ZVjB6fN8kFcERx2aSk5mSW
        pRbp2yVwZRy51MRacEe+Ynv7H5YGxjapLkZODgkBE4mjjd0sXYxcHEICuxkldv7/ygKRkJG4
        vfIyK4QtLHG/5QgrRNEDRomtm7ewgyRYBFQkFv5+D1bEJqArse3EP0YQW0TAWuLo1vnMIA3M
        AruZJFa23QArEhaokvi26ScTiM0roCGx6k0/1NRTTBJn7rdAJQQlTs58AnYGs4CWxI1/L4Hi
        HEC2tMTyfxwgYU4BR4mzb36DHSEqoCxxYNtxpgmMgrOQdM9C0j0LoXsBI/MqRsnUguLc9Nxi
        wwLDvNRyveLE3OLSvHS95PzcTYzg2NLS3MG4fdUHvUOMTByMhxglOJiVRHh7bZoShXhTEiur
        Uovy44tKc1KLDzFKc7AoifNe6DoZLySQnliSmp2aWpBaBJNl4uCUamCqXBPawfVT2+FtiBtX
        ZcThhfXuyYXNphGJtnGTfJa/3Nkz2+CJ0Zl5LrNWii9WF9Gqi3NruHhZfuF+x/6M+t1TXm1h
        kys96GZYdOjl2o/1e3hFE56yih3VZG3Kdftl8fP92meLHFI28Judy3jZVqWmaLXOdMLuQul9
        fU5yx/VXB5bLLXK++mhxibPzxgvnwl+kPJKQTXGtLWlxFvTek+bYNlXHZ9vVEEGxTzlbbR6H
        1QvozFiVzX2SfdfSfxarJqVILZBsWfhVeMksI7XJZ9JtDY5YTMrJ2NSw8bnm58YDxVP/bEyY
        KpJsnfNkDc+neDs9mVWHm5jOb1684meFY4pLpsolF51vCXPYttdqRyixFGckGmoxFxUnAgBG
        +mwbHAMAAA==
X-CMS-MailID: 20211103085730epcas2p492e5ce9dfd46c509890a18856f1de5a7
X-Msg-Generator: CA
Content-Type: multipart/mixed;
        boundary="----mmfly-N9_Az8CuUfOpQ-IXGlHSM_dkjAIAXexKnxhYFVpy7c=_b4dc3_"
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
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

------mmfly-N9_Az8CuUfOpQ-IXGlHSM_dkjAIAXexKnxhYFVpy7c=_b4dc3_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 03, 2021 at 09:18:07AM +0100, Krzysztof Kozlowski wrote:
> On 03/11/2021 01:09, Youngmin Nam wrote:
> > On Tue, Nov 02, 2021 at 10:28:10AM +0000, Mark Rutland wrote:
> >> On Tue, Nov 02, 2021 at 09:11:21AM +0900, Youngmin Nam wrote:
> >>> Exynos MCT version 2 is composed of 1 FRC and 12 comparators.
> >>> There are no global timer and local timer anymore.
> >>> The 1 of 64bit FRC serves as "up-counter"(not "comparators").
> >>> The 12 comaprators(not "counter") can be used as per-cpu event timer
> >>> so that it can support upto 12 cores.
> >>> And a RTC source can be used as backup clock source.
> >>
> >> [...]
> >>
> >>> +static int exynos_mct_starting_cpu(unsigned int cpu)
> >>> +{
> >>> +	struct mct_clock_event_device *mevt = per_cpu_ptr(&percpu_mct_tick, cpu);
> >>> +	struct clock_event_device *evt = &mevt->evt;
> >>> +
> >>> +	snprintf(mevt->name, sizeof(mevt->name), "mct_comp%d", cpu);
> >>> +
> >>> +	evt->name = mevt->name;
> >>> +	evt->cpumask = cpumask_of(cpu);
> >>> +	evt->set_next_event = exynos_comp_set_next_event;
> >>> +	evt->set_state_periodic = mct_set_state_periodic;
> >>> +	evt->set_state_shutdown = mct_set_state_shutdown;
> >>> +	evt->set_state_oneshot = mct_set_state_shutdown;
> >>> +	evt->set_state_oneshot_stopped = mct_set_state_shutdown;
> >>> +	evt->tick_resume = mct_set_state_shutdown;
> >>> +	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
> >>> +	evt->rating = 500;	/* use value higher than ARM arch timer */
> >>
> >> Previously Will asked you to try CLOCK_EVT_FEAT_PERCPU here, and to set
> >> the C3STOP flag on the arch timer via the DT when necessary, rather than
> >> trying to override the arch timer like this:
> >>
> >>   https://protect2.fireeye.com/v1/url?k=72526080-2dc9598b-7253ebcf-002590f5b904-ca603717c6462908&q=1&e=be56aa83-dbac-4639-913d-d388620fe3fc&u=https%3A%2F%2Flore.kernel.org%2Fr%2F20211027073458.GA22231%40willie-the-truck
> >>
> >> There are a bunch of things that depend on the architected timer working
> >> as a clocksource (e.g. vdso, kvm), and it *should* work as a lock
> >> clockevent_device if configured correctly, and it's much more consistent
> >> with *everyone else* to use the arhcitected timer by default.
> >>
> >> Please try as Will suggested above, so that this works from day one.
> >>
> >> Thanks,
> >> Mark.
> >>
> > 
> > Hi Mark.
> > It looks like you missed my previous mail.
> > https://protect2.fireeye.com/v1/url?k=ab15817a-cbf71c27-ab140a35-000babd9f1ba-123b7f313b1b1ccc&q=1&e=34c8716e-6d2e-4d8e-82fe-04777ebc5eb3&u=https%3A%2F%2Flore.kernel.org%2Fall%2F20211029035422.GA30523%40perf%2F%23t
> > 
> > Yes, I believe Will's suggestion definitely will work.
> > But that is for performance not functionality.
> > As a driver for new H/W IP I would like to confirm functionality first.
> > 
> > We need more time to test this feature with our exynos core power down feature.
> > And we need to do a various regression test whether there is another corner case or not.
> > So, how about we apply Will's suggetion later after the current patchset is merged first?
> > After doing our regression test with our exynos core power down feature, we can confirm this.
> > 
> 
> Not really, because once it is merged there is no incentive to fix it or
> simply changing it can be forgotten. Also similarly to commit
> 6282edb72bed ("clocksource/drivers/exynos_mct: Increase priority over
> ARM arch timer"), there should be a valid and serious reason to
> prioritize Exynos MCT.
> 

No, it's not. I also want to decrease MCTv2 timer rating so that we want to use arm arch timer as a default.
But this feature has to be confirmed with core power down feature enabled.
Without core power down feature, we can't comfirm this.
Ater that we need to check whether there is regression or not related power, stability, and so on.
I'm not saying I will not apply Will's suggestion but I just want to apply later after some hard test.

> 
> Best regards,
> Krzysztof
> 





------mmfly-N9_Az8CuUfOpQ-IXGlHSM_dkjAIAXexKnxhYFVpy7c=_b4dc3_
Content-Type: text/plain; charset="utf-8"


------mmfly-N9_Az8CuUfOpQ-IXGlHSM_dkjAIAXexKnxhYFVpy7c=_b4dc3_--
