Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E366DC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 23:42:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C937961073
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 23:42:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbhKBXpY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Nov 2021 19:45:24 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:63954 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231209AbhKBXpX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 19:45:23 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20211102234245epoutp0424381e18bcb8e4f99e019a70aa4e987d~z30Jny2ks1682516825epoutp04Q
        for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Nov 2021 23:42:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20211102234245epoutp0424381e18bcb8e4f99e019a70aa4e987d~z30Jny2ks1682516825epoutp04Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1635896566;
        bh=wW1zoN5ZPdMHFXRPbSYQfL6eUoeGF+hiFycNrC9mD+k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZfX+fjixMn6gASkNIcI+X0RdjUprBbAsO6ZbNuj+9oveVePIUU9TcAP8xH7rylbql
         8zCINJr0+/tSdLuOJUsFHXfpdwbmtWODnaHqjVpVwT8y++lW8KG7l+zdm8Deakdmye
         BcM1UWrQJ28X+DCBQIyJ2SM1yo8pIoVuhHv3S0KI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20211102234245epcas2p3f85e2bdbb3a00b7d27850d5e01b3ea6a~z30JJ7uL31956919569epcas2p3A;
        Tue,  2 Nov 2021 23:42:45 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.98]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4HkRK730TXz4x9Q2; Tue,  2 Nov
        2021 23:42:35 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        A8.95.10014.7ECC1816; Wed,  3 Nov 2021 08:42:31 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20211102234231epcas2p3b079a93e79767b0dd45e1ee5283e7313~z3z793wnD1956919569epcas2p3g;
        Tue,  2 Nov 2021 23:42:31 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211102234231epsmtrp279ef678b0fd2b3aa4ba2f1b8bc3e3b06~z3z781s1J2143521435epsmtrp2O;
        Tue,  2 Nov 2021 23:42:31 +0000 (GMT)
X-AuditID: b6c32a47-489ff7000000271e-39-6181cce77aaf
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        53.1C.29871.7ECC1816; Wed,  3 Nov 2021 08:42:31 +0900 (KST)
Received: from perf (unknown [12.36.155.123]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20211102234231epsmtip150d66548013cc8f10d0b8312fe69a03a~z3z7yIEoh3199031990epsmtip1D;
        Tue,  2 Nov 2021 23:42:31 +0000 (GMT)
Date:   Wed, 3 Nov 2021 09:09:45 +0900
From:   Youngmin Nam <youngmin.nam@samsung.com>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     krzysztof.kozlowski@canonical.com, will@kernel.org,
        daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, kgene@kernel.org
Subject: Re: [PATCH v2 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Message-ID: <20211103000945.GA48132@perf>
MIME-Version: 1.0
In-Reply-To: <20211102102802.GA16545@C02TD0UTHF1T.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfUwTZxzHfe7a62EsuVXYnnTONcWMAANapO3hgJnYzE7ZRrJlbiMKFzha
        1tLWXpmCJlSmDFBmDXMiAYZDkBHU7SovQRgv5cUFx9sWHU7DYocuMjpCATsn3dqeLv73eX6/
        7zff3/OGo6IBTIznGa20xUgZpNh6XoczShV7//oRSnZsLoas97xElvRNo+ToxXk+edI1j5Lf
        LXgRknXd4JM/dddiZPXE9wjZdHMKIRtdLQjpqxwApIM9jZJHbyu2CzVt9W1AU2OrxDRsazmm
        uX2jB9O4x8cFGsf5Ys3nV1qBxsNuTsc/0ifraCqHtkhoY7YpJ8+oTZHufjdzR6ZCKZPHypNI
        lVRipPLpFKk6LT32jTyDf2Cp5BPKUOAvpVMMI41PTbaYCqy0RGdirClS2pxjMKvMcQyVzxQY
        tXFG2rpNLpMlKPzCLL3u4dIQzzwNDzqOuwU2MBJWAUJwSCRCz9l5QQVYj4uILgBd5atYoCEi
        lgCs/es9rrEK4C/lFchTh3PUyecavX6R18HjFncBXK79hx9Q8Ygt0H7UCwKMEbGw45ovyGFE
        JDzRvew34DhKjCCw951AeSNRBFfZv4MBQiIK9t0ZF3D8HPzh7O+8AIcQJByp/zqoCSciYH/H
        KBLIhUQPDhf6JjBuOjVsGr7F53gjfDB6RcCxGHrcvU80xbCxownlzHYAv2IXn4i2wpp7nwUH
        RQkdbGnvCw4K/WlDt3hcORSWOdcEXFkIy0pFnPMV+OiLbwHHm+DVxhaUYw2sbG7AuPPxAOi8
        OyCwg5drntlbzTNpHL8KG64uYTXBI3oRXvDhHEbBy93xDYDfCp6nzUy+lmYSzFv/v+xsUz4L
        gm85emcXqF5YjBsECA4GAcRRaZgQHbZRImEOVVhEW0yZlgIDzQwChf+eTqHi8GyT/zMYrZny
        xCRZolIpVyUoZCrpC8KkcD0lIrSUldbTtJm2PPUheIjYhpzpTLtWOjs7H8pnt58pxquKE/ec
        5rE3i8obl5RZB/bOpA4eifm1q+fEddfcpwvKULUtvnm/5PEoMmV/fZfL1lSlro5c9JXcN6at
        /Djp+ji39eHkhta6tT8Or1NsmzEbNg2PZR8opPS7Lq6Q3suda38m7YZlVTOvuX0JcW0Zex58
        +LO2MqK3qHPanZbBXnj8zURt9L+X3GsZex2H2vUTuoOwpKO9bnnfYQsz5s/rFVxa8d57P9Lk
        wh+JPcl3zjkm1OpjY5M7y+e86CErPVuYm/tlVlNZ//F19t+cMRELb53bMLU5JrX5Tf2+PmcL
        wT9Zt2XHfvbtSt/5D/qHnDHLysZSKY/RUfJo1MJQ/wHnc3INVAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnkeLIzCtJLcpLzFFi42LZdlhJTvf5mcZEg32n+CzmfZa1aNp/idni
        +NrXrBb9j18zW2x8+4PJYtPja6wWl3fNYbOYcX4fk8XS6xeZLBY/XsFk8a/3IKPF5k1TmS1a
        7pg68HqsmbeG0WNWQy+bx6ZVnWwed67tYfN4d+4cu8fmJfUefVtWMXp83iQXwBHFZZOSmpNZ
        llqkb5fAlXGri61gkljFs3srWBsY5wt1MXJySAiYSBw+fpi1i5GLQ0hgN6PEnfvLWCESMhK3
        V16GsoUl7rccAbOFBB4wSiztigOxWQRUJCa0/GAEsdkEdCW2nfgHZosIqEv07PrCAjKUWeAE
        k8TxEx1gzcICVRLfNv1kArF5BTQl9t89xw6x+TOjxIQ/15ghEoISJ2c+YQGxmQW0JG78ewnU
        wAFkS0ss/8cBEuYUsJA4Nm8R2BxRAWWJA9uOM01gFJyFpHsWku5ZCN0LGJlXMUqmFhTnpucW
        GxYY5qWW6xUn5haX5qXrJefnbmIEx5WW5g7G7as+6B1iZOJgPMQowcGsJMLLfLQhUYg3JbGy
        KrUoP76oNCe1+BCjNAeLkjjvha6T8UIC6YklqdmpqQWpRTBZJg5OqQam3S4NknyVthdFmU+/
        SZfj7yz/4q+uWPz79PNaI+4JwfXzSiaaHq3nluAKWmuzvS309OcUVh57jzXun2c8PbAmWnXL
        pXUMpRfar+j4nN3VqfJC7tPPfWZSyW/nvvNRuDp1wW3hQI1LbvaTt2+VZSh9JXBYpCZ/edFy
        8fc+4T1fv2+TrOmVc99ndCUz4LSxsces6t/7uFItM7Y3Lr+hknVRcPu8N981LJ98t90u6aBm
        /TN+uiW7tsxR61axGcdS9/y7XtUQdsHYcPHOnjfzunIO6EXcbJdxmNi6VO4hs6TVVsc1d2f8
        /ZbkUBzdupjjtbLEI26exeJMwpo1H4+ou+/7/XwO7//yoHsGl3LiWHKVWIozEg21mIuKEwGA
        uY7dGgMAAA==
X-CMS-MailID: 20211102234231epcas2p3b079a93e79767b0dd45e1ee5283e7313
X-Msg-Generator: CA
Content-Type: multipart/mixed;
        boundary="----ZBuuKJqGqetWuXeXLn-uUmRQxt4bB4GzF80pTq2gGxc9tq5b=_ae3f7_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211101234500epcas2p2d0e5bc54615b635f6694bc1be4c89fb5
References: <20211102001122.27516-1-youngmin.nam@samsung.com>
        <CGME20211101234500epcas2p2d0e5bc54615b635f6694bc1be4c89fb5@epcas2p2.samsung.com>
        <20211102001122.27516-2-youngmin.nam@samsung.com>
        <20211102102802.GA16545@C02TD0UTHF1T.local>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

------ZBuuKJqGqetWuXeXLn-uUmRQxt4bB4GzF80pTq2gGxc9tq5b=_ae3f7_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 02, 2021 at 10:28:10AM +0000, Mark Rutland wrote:
> On Tue, Nov 02, 2021 at 09:11:21AM +0900, Youngmin Nam wrote:
> > Exynos MCT version 2 is composed of 1 FRC and 12 comparators.
> > There are no global timer and local timer anymore.
> > The 1 of 64bit FRC serves as "up-counter"(not "comparators").
> > The 12 comaprators(not "counter") can be used as per-cpu event timer
> > so that it can support upto 12 cores.
> > And a RTC source can be used as backup clock source.
> 
> [...]
> 
> > +static int exynos_mct_starting_cpu(unsigned int cpu)
> > +{
> > +	struct mct_clock_event_device *mevt = per_cpu_ptr(&percpu_mct_tick, cpu);
> > +	struct clock_event_device *evt = &mevt->evt;
> > +
> > +	snprintf(mevt->name, sizeof(mevt->name), "mct_comp%d", cpu);
> > +
> > +	evt->name = mevt->name;
> > +	evt->cpumask = cpumask_of(cpu);
> > +	evt->set_next_event = exynos_comp_set_next_event;
> > +	evt->set_state_periodic = mct_set_state_periodic;
> > +	evt->set_state_shutdown = mct_set_state_shutdown;
> > +	evt->set_state_oneshot = mct_set_state_shutdown;
> > +	evt->set_state_oneshot_stopped = mct_set_state_shutdown;
> > +	evt->tick_resume = mct_set_state_shutdown;
> > +	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
> > +	evt->rating = 500;	/* use value higher than ARM arch timer */
> 
> Previously Will asked you to try CLOCK_EVT_FEAT_PERCPU here, and to set
> the C3STOP flag on the arch timer via the DT when necessary, rather than
> trying to override the arch timer like this:
> 
>   https://protect2.fireeye.com/v1/url?k=72526080-2dc9598b-7253ebcf-002590f5b904-ca603717c6462908&q=1&e=be56aa83-dbac-4639-913d-d388620fe3fc&u=https%3A%2F%2Flore.kernel.org%2Fr%2F20211027073458.GA22231%40willie-the-truck
> 
> There are a bunch of things that depend on the architected timer working
> as a clocksource (e.g. vdso, kvm), and it *should* work as a lock
> clockevent_device if configured correctly, and it's much more consistent
> with *everyone else* to use the arhcitected timer by default.
> 
> Please try as Will suggested above, so that this works from day one.
> 
> Thanks,
> Mark.
> 

Hi Mark.
It looks like you missed my previous mail.
https://lore.kernel.org/all/20211029035422.GA30523@perf/#t

Yes, I believe Will's suggestion definitely will work.
But that is for performance not functionality.
As a driver for new H/W IP I would like to confirm functionality first.

We need more time to test this feature with our exynos core power down feature.
And we need to do a various regression test whether there is another corner case or not.
So, how about we apply Will's suggetion later after the current patchset is merged first?
After doing our regression test with our exynos core power down feature, we can confirm this.

Thanks.

------ZBuuKJqGqetWuXeXLn-uUmRQxt4bB4GzF80pTq2gGxc9tq5b=_ae3f7_
Content-Type: text/plain; charset="utf-8"


------ZBuuKJqGqetWuXeXLn-uUmRQxt4bB4GzF80pTq2gGxc9tq5b=_ae3f7_--
