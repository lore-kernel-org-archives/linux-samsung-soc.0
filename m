Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836D6C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  4 Nov 2021 09:45:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 680CB61186
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  4 Nov 2021 09:45:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbhKDJrl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 4 Nov 2021 05:47:41 -0400
Received: from foss.arm.com ([217.140.110.172]:45546 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231215AbhKDJrk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 4 Nov 2021 05:47:40 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDD441063;
        Thu,  4 Nov 2021 02:45:02 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 452CC3F719;
        Thu,  4 Nov 2021 02:45:00 -0700 (PDT)
Date:   Thu, 4 Nov 2021 09:44:53 +0000
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
Message-ID: <20211104094453.GA58798@C02TD0UTHF1T.local>
References: <CGME20211101234500epcas2p2d0e5bc54615b635f6694bc1be4c89fb5@epcas2p2.samsung.com>
 <20211102001122.27516-2-youngmin.nam@samsung.com>
 <20211102102802.GA16545@C02TD0UTHF1T.local>
 <20211103000945.GA48132@perf>
 <83f6574b-bbab-f0c3-7198-f773c3dcfc63@canonical.com>
 <20211103092444.GA7013@perf>
 <f7871718-f244-8a9e-9302-c27bdb2d3cc1@canonical.com>
 <20211103095727.GA19093@perf>
 <20211103100407.GA35817@C02TD0UTHF1T.local>
 <20211104002102.GA29618@perf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211104002102.GA29618@perf>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On Thu, Nov 04, 2021 at 09:21:02AM +0900, Youngmin Nam wrote:
> On Wed, Nov 03, 2021 at 10:04:18AM +0000, Mark Rutland wrote:
> > On Wed, Nov 03, 2021 at 06:57:28PM +0900, Youngmin Nam wrote:
> > > On Wed, Nov 03, 2021 at 10:04:36AM +0100, Krzysztof Kozlowski wrote:
> > > > On 03/11/2021 10:24, Youngmin Nam wrote:
> > > > > On Wed, Nov 03, 2021 at 09:18:07AM +0100, Krzysztof Kozlowski wrote:
> > > > >> On 03/11/2021 01:09, Youngmin Nam wrote:
> > > > >>> On Tue, Nov 02, 2021 at 10:28:10AM +0000, Mark Rutland wrote:

> > > > >>>> Previously Will asked you to try CLOCK_EVT_FEAT_PERCPU here, and to set
> > > > >>>> the C3STOP flag on the arch timer via the DT when necessary, rather than
> > > > >>>> trying to override the arch timer like this:

> > > > >>> Yes, I believe Will's suggestion definitely will work.

> > > So, how about we control timer rating value with DT ?
> > > Of course the default rating value should be lower than arm arch timer's.
> > > Do you agree with this?
> > 
> > No; placing a rating value in the DT is a hack. That should *not* live
> > in the DT because it's linux-internal detail and not a description of
> > the HW.
> 
> So, how do we use MCTv2 only for clock event device if there are some
> limitations caused by SoC design implemention ?

What limitations? Are you thinking of a known issue, or just in case
there is a bug in future HW?

If there is a problem, we'll need to describe that in the DT somehow,
and we need to know speciifcally what that limitation is.

Above you said that Will's suggestion will definitely work, which
implies no such limitations.

Thanks,
Mark.
