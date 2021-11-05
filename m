Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DC1C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  5 Nov 2021 09:31:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 000A36126A
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  5 Nov 2021 09:31:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232546AbhKEJeD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 5 Nov 2021 05:34:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:45792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230175AbhKEJeD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 5 Nov 2021 05:34:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FC8A61265;
        Fri,  5 Nov 2021 09:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636104683;
        bh=uW7lxpxGzhHmx68h0V1upJH+zpkSIzcoQ2W5NasrhVY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pEkDeqBd0kJQu9Md/KauwOXtNMu6x4Ar8TKL94/xK/2HhMW/ovS8493Cj2dQ+/5c2
         d6T3u34HmEak4NUDyMmmxnIRqfkJp4M0ID9LItKsqUEUAoAxeh/vhZt/HFzH5hqgiG
         nCktFpL8EzIpzB91oRBFPo+46ZZwtPxCKxZ4XNyVK+bojYJw1DCStRzuqdVPGEiFyT
         tcr36DSa3ZhktWVqwnzHp1gWMVFrW2dLnRIlmzBf+PTNDgTQb6gUdiSYI8nfaFHoY7
         UDnkBUf+yX4YOa0oH/87PlbiV5MZtAGZja3BshzsbdW3VtkkU0T4maUpmnvCNTQSAp
         vgHaPN68b1fPg==
Date:   Fri, 5 Nov 2021 09:31:17 +0000
From:   Will Deacon <will@kernel.org>
To:     Youngmin Nam <youngmin.nam@samsung.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, kgene@kernel.org, kwoo.kang@samsung.com
Subject: Re: [PATCH v2 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Message-ID: <20211105093117.GA32036@willie-the-truck>
References: <20211103000945.GA48132@perf>
 <83f6574b-bbab-f0c3-7198-f773c3dcfc63@canonical.com>
 <20211103092444.GA7013@perf>
 <f7871718-f244-8a9e-9302-c27bdb2d3cc1@canonical.com>
 <20211103095727.GA19093@perf>
 <20211103100407.GA35817@C02TD0UTHF1T.local>
 <20211104002102.GA29618@perf>
 <20211104094453.GA58798@C02TD0UTHF1T.local>
 <CGME20211105001912epcas2p30469b097f7c348f0a59251d03cd0075e@epcas2p3.samsung.com>
 <20211105004627.GA24234@perf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211105004627.GA24234@perf>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Nov 05, 2021 at 09:46:27AM +0900, Youngmin Nam wrote:
> On Thu, Nov 04, 2021 at 09:44:53AM +0000, Mark Rutland wrote:
> > Hi,
> > 
> > On Thu, Nov 04, 2021 at 09:21:02AM +0900, Youngmin Nam wrote:
> > > On Wed, Nov 03, 2021 at 10:04:18AM +0000, Mark Rutland wrote:
> > > > On Wed, Nov 03, 2021 at 06:57:28PM +0900, Youngmin Nam wrote:
> > > > > On Wed, Nov 03, 2021 at 10:04:36AM +0100, Krzysztof Kozlowski wrote:
> > > > > > On 03/11/2021 10:24, Youngmin Nam wrote:
> > > > > > > On Wed, Nov 03, 2021 at 09:18:07AM +0100, Krzysztof Kozlowski wrote:
> > > > > > >> On 03/11/2021 01:09, Youngmin Nam wrote:
> > > > > > >>> On Tue, Nov 02, 2021 at 10:28:10AM +0000, Mark Rutland wrote:
> > 
> > > > > > >>>> Previously Will asked you to try CLOCK_EVT_FEAT_PERCPU here, and to set
> > > > > > >>>> the C3STOP flag on the arch timer via the DT when necessary, rather than
> > > > > > >>>> trying to override the arch timer like this:
> > 
> > > > > > >>> Yes, I believe Will's suggestion definitely will work.
> > 
> > > > > So, how about we control timer rating value with DT ?
> > > > > Of course the default rating value should be lower than arm arch timer's.
> > > > > Do you agree with this?
> > > > 
> > > > No; placing a rating value in the DT is a hack. That should *not* live
> > > > in the DT because it's linux-internal detail and not a description of
> > > > the HW.
> > > 
> > > So, how do we use MCTv2 only for clock event device if there are some
> > > limitations caused by SoC design implemention ?
> > 
> > What limitations? Are you thinking of a known issue, or just in case
> > there is a bug in future HW?
> > 
> > If there is a problem, we'll need to describe that in the DT somehow,
> > and we need to know speciifcally what that limitation is.
> > 
> > Above you said that Will's suggestion will definitely work, which
> > implies no such limitations.
> > 
> 
> Using arch timer for event device is highly related with Core power down feature so that it is also related with
> power saving scheme in SoC.
> Core power down and power saving depend on SoC design implemention.
> We can't confirm that using only arch timer can cover all scenario at production level.

Why not and what are we supposed to do about that? It's probably worth
pointing out that the majority of arm64-based SoCs have been using the arch
timer for *years* without problems. So I reckon you can make it work too.

> So we should be able to use MCTv2 as well.
> 
> Why do you enforce using *only* arch timer ?
> Why aren't we allowed to use own timer of our SoC ?

You can do whatever you like downstream, but the upstream position is that
the arch timer is preferred: it's an architected solution from Arm which
supports things like virtualisation and userspace access. It's also a damn
sight quicker to access than the MCT.

On the downside, it's not usually possible to use it as a wakeup source,
so that's a great place for the MCT to shine. I've literally written the
code for you to do this.

Anyway, this MCTv2 driver is a dead duck whatever we do. Extend the existing
driver please.

Will
