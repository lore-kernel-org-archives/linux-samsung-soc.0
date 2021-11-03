Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC05C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Nov 2021 10:04:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2B066112D
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Nov 2021 10:04:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbhKCKHL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 3 Nov 2021 06:07:11 -0400
Received: from foss.arm.com ([217.140.110.172]:56150 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231278AbhKCKHH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 3 Nov 2021 06:07:07 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C331D6E;
        Wed,  3 Nov 2021 03:04:30 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.75.102])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B8073F719;
        Wed,  3 Nov 2021 03:04:27 -0700 (PDT)
Date:   Wed, 3 Nov 2021 10:04:18 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     Youngmin Nam <youngmin.nam@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        will@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, kgene@kernel.org
Subject: Re: [PATCH v2 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Message-ID: <20211103100407.GA35817@C02TD0UTHF1T.local>
References: <20211102001122.27516-1-youngmin.nam@samsung.com>
 <CGME20211101234500epcas2p2d0e5bc54615b635f6694bc1be4c89fb5@epcas2p2.samsung.com>
 <20211102001122.27516-2-youngmin.nam@samsung.com>
 <20211102102802.GA16545@C02TD0UTHF1T.local>
 <20211103000945.GA48132@perf>
 <83f6574b-bbab-f0c3-7198-f773c3dcfc63@canonical.com>
 <20211103092444.GA7013@perf>
 <f7871718-f244-8a9e-9302-c27bdb2d3cc1@canonical.com>
 <20211103095727.GA19093@perf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211103095727.GA19093@perf>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Nov 03, 2021 at 06:57:28PM +0900, Youngmin Nam wrote:
> On Wed, Nov 03, 2021 at 10:04:36AM +0100, Krzysztof Kozlowski wrote:
> > On 03/11/2021 10:24, Youngmin Nam wrote:
> > > On Wed, Nov 03, 2021 at 09:18:07AM +0100, Krzysztof Kozlowski wrote:
> > >> On 03/11/2021 01:09, Youngmin Nam wrote:
> > >>> On Tue, Nov 02, 2021 at 10:28:10AM +0000, Mark Rutland wrote:
> > >>>> On Tue, Nov 02, 2021 at 09:11:21AM +0900, Youngmin Nam wrote:

> > >>>>> +	evt->rating = 500;	/* use value higher than ARM arch timer */
> > >>>>
> > >>>> Previously Will asked you to try CLOCK_EVT_FEAT_PERCPU here, and to set
> > >>>> the C3STOP flag on the arch timer via the DT when necessary, rather than
> > >>>> trying to override the arch timer like this:
> > >>>>
> > >>>>   https://protect2.fireeye.com/v1/url?k=72526080-2dc9598b-7253ebcf-002590f5b904-ca603717c6462908&q=1&e=be56aa83-dbac-4639-913d-d388620fe3fc&u=https%3A%2F%2Flore.kernel.org%2Fr%2F20211027073458.GA22231%40willie-the-truck

> > >>> Hi Mark.
> > >>> It looks like you missed my previous mail.
> > >>> https://protect2.fireeye.com/v1/url?k=ab15817a-cbf71c27-ab140a35-000babd9f1ba-123b7f313b1b1ccc&q=1&e=34c8716e-6d2e-4d8e-82fe-04777ebc5eb3&u=https%3A%2F%2Flore.kernel.org%2Fall%2F20211029035422.GA30523%40perf%2F%23t
> > >>>
> > >>> Yes, I believe Will's suggestion definitely will work.

Then please do so.

> > >>> But that is for performance not functionality.

No; it's about *consistency*, and avoiding unnecssary special cases. The
whole point is that marking the generic timer as C3STOP *accurately*
describes how the timer behaves on your platform, and marking the MCTv2
as a percpu timer which *can* act as a back-up also aligns with that.

That approach leaves the policy in the kernel, and we can play about
with that later without functional breakage.

> > >>> As a driver for new H/W IP I would like to confirm functionality first.
> > >>> We need more time to test this feature with our exynos core power down feature.
> > >>> And we need to do a various regression test whether there is another corner case or not.
> > >>> So, how about we apply Will's suggetion later after the current patchset is merged first?
> > >>> After doing our regression test with our exynos core power down feature, we can confirm this.
> > >>
> > >> Not really, because once it is merged there is no incentive to fix it or
> > >> simply changing it can be forgotten. Also similarly to commit
> > >> 6282edb72bed ("clocksource/drivers/exynos_mct: Increase priority over
> > >> ARM arch timer"), there should be a valid and serious reason to
> > >> prioritize Exynos MCT.

It's also worth nothing that the case described for 6282edb72bed is
really a system design erratum, since the counter is supposed to be in
an always-on power domain and should be counting well before a regular
OS kernel boots. The arm64 kernel requires the architected counter to be
running before it is entered, or there will be subtle breakage.

> > > No, it's not. I also want to decrease MCTv2 timer rating so that we want to use arm arch timer as a default.
> > > But this feature has to be confirmed with core power down feature enabled.
> > > Without core power down feature, we can't comfirm this.
> > > Ater that we need to check whether there is regression or not related power, stability, and so on.
> > > I'm not saying I will not apply Will's suggestion but I just want to apply later after some hard test.
> > 
> > You repeat the same argument, the same words. Nothing new. Repeating the
> > same won't change it, use the lower priority. This is a patch for new
> > kernel, so there is a plenty of time to test it and it won't affect your
> > production environment.
> > 
> So, how about we control timer rating value with DT ?
> Of course the default rating value should be lower than arm arch timer's.
> Do you agree with this?

No; placing a rating value in the DT is a hack. That should *not* live
in the DT because it's linux-internal detail and not a description of
the HW.

Thanks,
Mark.
