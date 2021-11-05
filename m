Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA567C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  5 Nov 2021 00:19:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9388261242
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  5 Nov 2021 00:19:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbhKEAWG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 4 Nov 2021 20:22:06 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:21532 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232566AbhKEAWF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 4 Nov 2021 20:22:05 -0400
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20211105001925epoutp043e2b53f33c76c85549cf51ba3f4fae15~0fmu2iWUs1746617466epoutp04A
        for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Nov 2021 00:19:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20211105001925epoutp043e2b53f33c76c85549cf51ba3f4fae15~0fmu2iWUs1746617466epoutp04A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1636071565;
        bh=9+9TvxZL3BgF2EAXL6HNltat3I9nj7xUgaCN1Ak1Xi4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mScDorKBeyzWEOo01PvIseb/yUt3cvClmV+q31Qlkh60Q8/Mm5JZlV79mk6X8DQOJ
         fcHTmyUWYEsFXwEABll0F7frZ/4RPOgxflnmORDz4PM2+1q7n9yMQdQc2MCtt+d/cS
         n19W1AtJlS0Of4XXVypjUGdTjPyg963H+InhRihw=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211105001925epcas2p4c90ae2f0ca9c738507766a6d53901bb7~0fmuNwR831564415644epcas2p4j;
        Fri,  5 Nov 2021 00:19:25 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.89]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4Hlh2V3fg6z4x9QW; Fri,  5 Nov
        2021 00:19:14 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        9C.06.10014.18874816; Fri,  5 Nov 2021 09:19:13 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20211105001912epcas2p30469b097f7c348f0a59251d03cd0075e~0fmin0Pj_0378903789epcas2p3M;
        Fri,  5 Nov 2021 00:19:12 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211105001912epsmtrp23a6ba0830321c73896bbf2ae9a944327~0fminAYGg0505805058epsmtrp2H;
        Fri,  5 Nov 2021 00:19:12 +0000 (GMT)
X-AuditID: b6c32a47-489ff7000000271e-bc-61847881a9c4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        07.8B.29871.08874816; Fri,  5 Nov 2021 09:19:12 +0900 (KST)
Received: from perf (unknown [12.36.155.123]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20211105001912epsmtip1adbd31f4da7281add572d22e1a2f5197~0fmiblgSo0689906899epsmtip1f;
        Fri,  5 Nov 2021 00:19:12 +0000 (GMT)
Date:   Fri, 5 Nov 2021 09:46:27 +0900
From:   Youngmin Nam <youngmin.nam@samsung.com>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        will@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, kgene@kernel.org, kwoo.kang@samsung.com
Subject: Re: [PATCH v2 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Message-ID: <20211105004627.GA24234@perf>
MIME-Version: 1.0
In-Reply-To: <20211104094453.GA58798@C02TD0UTHF1T.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBJsWRmVeSWpSXmKPExsWy7bCmmW5jRUuiwaLfrBbzPstaNO2/xGxx
        fO1rVov+x6+ZLTa+/cFk0XjnBZPFpsfXWC0u75rDZjHj/D4mi6XXLzJZLH68gsniX+9BRovN
        m6YyW7TcMXXg81gzbw2jx6yGXjaPTas62TzuXNvD5vHu3Dl2j81L6j36tqxi9Pi8SS6AIyrb
        JiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfoaiWFssSc
        UqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgXmBXnFibnFpXrpeXmqJlaGBgZEpUGFCdkb3
        1yksBf2iFd1HrjM3MJ4X6GLk5JAQMJHYtrGZpYuRi0NIYAejRMevxUwQzidGid0790E53xgl
        dr55ywbTsuHNTWaIxF5Gid6j/6CqHjFKrF53gxmkikVAReLp024WEJtNQFdi24l/jCC2iIC6
        RM+uL2ALmQW+Mkm875vPBJIQFqiS+LbpJ5jNK6ApsWnvWVYIW1Di5MwnQA0cHJwCFhLXryiD
        hEUFlCUObDsOtlhC4AiHRPf7q6wQ57lIfNt9F8oWlnh1fAs7hC0l8fndXqgX6iUWb1vKDNE8
        gVFi/qYPUEXGErOetYNdyiyQITHn4VOwxRJA247cYoEI80l0HP7LDhHmlehoE4LoVJP4NWUD
        I4QtI7F78QpmCNtDYtZ8kHNAAdTEIrFrz0b2CYzys5C8NgvJNghbR2LB7k9ss4BWMAtISyz/
        xwFhakqs36W/gJF1FaNYakFxbnpqsVGBMTy6k/NzNzGCk7SW+w7GGW8/6B1iZOJgPMQowcGs
        JML7fENTohBvSmJlVWpRfnxRaU5q8SFGU2BETWSWEk3OB+aJvJJ4QxNLAxMzM0NzI1MDcyVx
        XkvR7EQhgfTEktTs1NSC1CKYPiYOTqkGprkCDG+U7+efVHvwJUp029k9PXq557gEbDRPes36
        nHN0i+KZSA6FBJOz09St1dZJJBuui5nyLWyV6jQ3vslPr6xkd5mWx3n3u27dcdY/j4XOf7Zd
        cLD1xL4Xy6+39L/Q2WYQ8fPLzRUPWt+yJp0+7+R1NGWKYoavdFjCi13F7rFlTIUJYT5C865N
        69sya6Okb5TU740c4e4LAz6tampldl680vPewZLwR1pPbC/MWLnF27ay+gb74i/TPmvO+yhU
        8m7L2Y8p1ttO7j3k/2EKz4K9OwpvTI+aJdFbPXeRXLjqdff6l8eskg5WWSe2ivTfseko7tcq
        1zTYOdPpUFSwx2dDO/vWoKxd1XkOW2b8XaPEUpyRaKjFXFScCAArWOoEWwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42LZdlhJTrehoiXRYNM6dYt5n2UtmvZfYrY4
        vvY1q0X/49fMFhvf/mCyaLzzgsli0+NrrBaXd81hs5hxfh+TxdLrF5ksFj9ewWTxr/cgo8Xm
        TVOZLVrumDrweayZt4bRY1ZDL5vHplWdbB53ru1h83h37hy7x+Yl9R59W1YxenzeJBfAEcVl
        k5Kak1mWWqRvl8CVcfnMOfaC80IVsx+3MjUwruDrYuTkkBAwkdjw5iZzFyMXh5DAbkaJW1Om
        skEkZCRur7zMCmELS9xvOcIKUfSAUWLenlXMIAkWARWJp0+7WUBsNgFdiW0n/jGC2CIC6hI9
        u76wgDQwC3xlkni6ew8TSEJYoEri26afYDavgKbEpr1noaZuYZZY8eUZC0RCUOLkzCdgNrOA
        lsSNfy+BGjiAbGmJ5f84QExOAQuJ61eUQSpEBZQlDmw7zjSBUXAWkuZZSJpnITQvYGRexSiZ
        WlCcm55bbFhgmJdarlecmFtcmpeul5yfu4kRHGNamjsYt6/6oHeIkYmD8RCjBAezkgjv8w1N
        iUK8KYmVValF+fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1OTS1ILYLJMnFwSjUwdTpyPI+t
        ffd929+Zsp/2BikY9PSY3uHe/UzqWhmL3ZMz0xJT487xeNaKla67td6sSptBqnutsNV1rhDz
        0MtHlno1Pnmf2smh6Hph99PXiTKL7LaptdqcYo3TPPa74XCmXLSR+dW759zO5FYvU70U8/a2
        7oXKzZ9PeDB8sgvpvLDxtHtLgtGkV4wTvQ5F7FSrlhY8rJzM0coW/L/7zETxb92fo67xL79x
        zX/Hb06JhJXfVv8sS7O6Ei75RydJNGTB5PeKv3z2cGSJS4nJpYS49KTp/ZRYpl/6edvR2+fN
        7p088/fZ4inuvrLGcxSvXPu+8OM8iQXRioVP7+/bqeVutLCsLXXavITvS8tqHnW+VmIpzkg0
        1GIuKk4EACDDOqAgAwAA
X-CMS-MailID: 20211105001912epcas2p30469b097f7c348f0a59251d03cd0075e
X-Msg-Generator: CA
Content-Type: multipart/mixed;
        boundary="----TI73IYgzdP03rYJ9SiN0qM3o3mlayfAqXHuFFMbUzbY.6Ea-=_c65ff_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211105001912epcas2p30469b097f7c348f0a59251d03cd0075e
References: <20211102001122.27516-2-youngmin.nam@samsung.com>
        <20211102102802.GA16545@C02TD0UTHF1T.local> <20211103000945.GA48132@perf>
        <83f6574b-bbab-f0c3-7198-f773c3dcfc63@canonical.com>
        <20211103092444.GA7013@perf>
        <f7871718-f244-8a9e-9302-c27bdb2d3cc1@canonical.com>
        <20211103095727.GA19093@perf> <20211103100407.GA35817@C02TD0UTHF1T.local>
        <20211104002102.GA29618@perf> <20211104094453.GA58798@C02TD0UTHF1T.local>
        <CGME20211105001912epcas2p30469b097f7c348f0a59251d03cd0075e@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

------TI73IYgzdP03rYJ9SiN0qM3o3mlayfAqXHuFFMbUzbY.6Ea-=_c65ff_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Nov 04, 2021 at 09:44:53AM +0000, Mark Rutland wrote:
> Hi,
> 
> On Thu, Nov 04, 2021 at 09:21:02AM +0900, Youngmin Nam wrote:
> > On Wed, Nov 03, 2021 at 10:04:18AM +0000, Mark Rutland wrote:
> > > On Wed, Nov 03, 2021 at 06:57:28PM +0900, Youngmin Nam wrote:
> > > > On Wed, Nov 03, 2021 at 10:04:36AM +0100, Krzysztof Kozlowski wrote:
> > > > > On 03/11/2021 10:24, Youngmin Nam wrote:
> > > > > > On Wed, Nov 03, 2021 at 09:18:07AM +0100, Krzysztof Kozlowski wrote:
> > > > > >> On 03/11/2021 01:09, Youngmin Nam wrote:
> > > > > >>> On Tue, Nov 02, 2021 at 10:28:10AM +0000, Mark Rutland wrote:
> 
> > > > > >>>> Previously Will asked you to try CLOCK_EVT_FEAT_PERCPU here, and to set
> > > > > >>>> the C3STOP flag on the arch timer via the DT when necessary, rather than
> > > > > >>>> trying to override the arch timer like this:
> 
> > > > > >>> Yes, I believe Will's suggestion definitely will work.
> 
> > > > So, how about we control timer rating value with DT ?
> > > > Of course the default rating value should be lower than arm arch timer's.
> > > > Do you agree with this?
> > > 
> > > No; placing a rating value in the DT is a hack. That should *not* live
> > > in the DT because it's linux-internal detail and not a description of
> > > the HW.
> > 
> > So, how do we use MCTv2 only for clock event device if there are some
> > limitations caused by SoC design implemention ?
> 
> What limitations? Are you thinking of a known issue, or just in case
> there is a bug in future HW?
> 
> If there is a problem, we'll need to describe that in the DT somehow,
> and we need to know speciifcally what that limitation is.
> 
> Above you said that Will's suggestion will definitely work, which
> implies no such limitations.
> 

Using arch timer for event device is highly related with Core power down feature so that it is also related with
power saving scheme in SoC.
Core power down and power saving depend on SoC design implemention.
We can't confirm that using only arch timer can cover all scenario at production level.
So we should be able to use MCTv2 as well.

Why do you enforce using *only* arch timer ?
Why aren't we allowed to use own timer of our SoC ?

What I meant that replied to Will was
I think this will work generally, but we can't confirm this will cover all cases.

> Thanks,
> Mark.
> 

------TI73IYgzdP03rYJ9SiN0qM3o3mlayfAqXHuFFMbUzbY.6Ea-=_c65ff_
Content-Type: text/plain; charset="utf-8"


------TI73IYgzdP03rYJ9SiN0qM3o3mlayfAqXHuFFMbUzbY.6Ea-=_c65ff_--
