Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFD8C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Oct 2021 07:35:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAE6C610A4
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Oct 2021 07:35:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237095AbhJ0Hha (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Oct 2021 03:37:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:36840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230494AbhJ0Hh3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Oct 2021 03:37:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A02E86109E;
        Wed, 27 Oct 2021 07:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635320104;
        bh=vb5/UUmGuytMVQ4VOJsav4ATysXUmZVjZbbtwRDmqdA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sBAhtDYuLPTb0VW4inS89PEVfNVDqk/owmfiYVgUit6DOFXiC+DvpGdAsLIEkqQ83
         U/i9gOF0yqD6OCaiKIda+RoNji+igQtEf94iaWZW0eZ9R6E8AMKN1fo6ZBpjY3Qh0c
         AqhEaPsKd34we+35+ifseVtRirdfKeebQfH1ukQ8XQjtJbMgRp/K5ypZFBgrxCLnAR
         tDj+LJb9seQMpbOTMgO0EORT7UbBoJrqJKYg0RagbiCdvuDeNNa765QxP90Yunl7hX
         WWmGvGcH5X/YTrGhe4btqUVbFnq25IVvEncoE+QKuzAcaznFKaZOM4XxhC8FXewf+8
         AOHRiZNQkpc7w==
Date:   Wed, 27 Oct 2021 08:34:58 +0100
From:   Will Deacon <will@kernel.org>
To:     Youngmin Nam <youngmin.nam@samsung.com>
Cc:     krzysztof.kozlowski@canonical.com, mark.rutland@arm.com,
        daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, kgene@kernel.org
Subject: Re: [PATCH v1 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Message-ID: <20211027073458.GA22231@willie-the-truck>
References: <20211021082650.GA30741@perf>
 <1b93aaf3-ed64-b105-dec4-07b6f27b385b@canonical.com>
 <20211022042116.GA30645@perf>
 <da83de3a-e7a2-f9b2-80f2-25c39717c3e4@canonical.com>
 <20211026014732.GA45525@perf>
 <91e926c4-9a3a-196d-1451-d3e7d38fc132@canonical.com>
 <20211026104518.GA40630@perf>
 <cb5bd5a3-1c23-0dc5-9f77-112befd7269c@canonical.com>
 <CGME20211027011125epcas2p2916524051416ede854b750c91a19073b@epcas2p2.samsung.com>
 <20211027013709.GA17353@perf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211027013709.GA17353@perf>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 27, 2021 at 10:38:37AM +0900, Youngmin Nam wrote:
> On Tue, Oct 26, 2021 at 01:00:51PM +0200, Krzysztof Kozlowski wrote:
> > On 26/10/2021 12:45, Youngmin Nam wrote:
> > > On Tue, Oct 26, 2021 at 09:10:28AM +0200, Krzysztof Kozlowski wrote:
> > >> On 26/10/2021 03:47, Youngmin Nam wrote:
> > >>>> If everyone added a new driver to avoid integrating with existing code,
> > >>>> we would have huge kernel with thousands of duplicated solutions. The
> > >>>> kernel also would be unmaintained.
> > >>>>
> > >>>> Such arguments were brought before several times - "I don't want to
> > >>>> integrating with existing code", "My use case is different", "I would
> > >>>> need to test the other cases", "It's complicated for me".
> > >>>>
> > >>>> Instead of pushing a new vendor driver you should integrate it with
> > >>>> existing code.
> > >>>>
> > >>> Let me ask you one question.
> > >>> If we maintain as one driver, how can people who don't have the new MCT test the new driver?
> > >>
> > >> I assume you talk about a case when someone else later changes something
> > >> in the driver. Such person doesn't necessarily have to test it. The same
> > >> as in all other cases (Exynos MCT is not special here): just ask for
> > >> testing on platform one doesn't have.
> > >>
> > >> Even if you submit this as separate driver, there is the exact same
> > >> problem. People will change the MCTv2 driver without access to hardware.
> > >>
> > > Yes, I can test the new MCT driver if someone ask for testing after modifying the new driver.
> > > But in this case, we don't need to test the previous MCT driver. We have only to test the new MCT driver.
> > 
> > Like with everything in Linux kernel. We merge instead of duplicate.
> > It's not an argument.
> > 
> > >> None of these differ for Exynos MCT from other drivers, e.g. mentioned
> > >> Samsung PMIC drivers, recently modified (by Will and Sam) the SoC clock
> > >> drivers or the ChipID drivers (changed by Chanho).
> > > From HW point of view, the previous MCT is almost 10-year-old IP without any major change and
> > > it will not be used on next new Exynos SoC.
> > > MCTv2 is the totally newly designed IP and it will replace the Exynos system timer.
> > > Device driver would be dependent with H/W. We are going to apply a lot of changes for this new MCT.
> > > For maintenance, I think we should separate the new MCT driver for maintenance.
> > > 
> > 
> > There are several similarities which actually suggest that you
> > exaggerate the differences.
> > 
> > The number of interrupts is the same (4+8 in older one, 12 in new one...).
> 
> I didn't "exaggerate" at all.
> The numer of interrups is the same. But their usage is completely different.
> The type of each timer is different.
> And previous MCT can only support upto 8 cores.
> 
> * MCTv1 (Let me call previous MCT as MCTv1)
>  - 4 global timer + 8 local timer
>  - Global timer and local timer are totally different.
>  - 4 global timer have only one 64bit FRC that serves as the "up-counter" with 4 "comparators"
>  - 8 local timer have 8 of 32bit FRC that serves as the "down-counter" without any "comparators".(just expire timer)
>  - local timer can be used as per-cpu event timer, so it can only support upto 8 cores.
> 
> * MCTv2
>  - There are no global timer and local timer anymore.
>  - 1 of 64bit FRC that serves as "up-counter" (just counter without "comparators")
>  - 12 comaprators (These are not "counter") can be used as per-cpu event timer so that it can support upto 12 cores.
>  - RTC source can be used as backup source.
> 
> > You assign the MCT priority also as higher than Architected Timer
> > (+Cc Will and Mark - is it ok for you?)
> >     evt->rating = 500;      /* use value higher than ARM arch timer *
> > 
> Yes, this is absolutely correct on event timer.
> We cannot use arm arch timer which is operating based on PPI as per-cpu event timer because of poewr mode.

You should be able to now that I've added support for per-cpu wakeup timers.

As long as the Arm arch timer is marked as C3STOP (e.g. by sticking the
"local-timer-stop" property in the DT notes), then the MCT will be used
as the wakeup source if you set the CLOCK_EVT_FEAT_PERCPU feature flag.

Give it a try.

Will
