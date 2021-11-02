Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA159C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 10:28:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94C9F60EE9
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 10:28:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhKBKbA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Nov 2021 06:31:00 -0400
Received: from foss.arm.com ([217.140.110.172]:60492 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230368AbhKBKa7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 06:30:59 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29F341FB;
        Tue,  2 Nov 2021 03:28:25 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.75.232])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A206B3F719;
        Tue,  2 Nov 2021 03:28:22 -0700 (PDT)
Date:   Tue, 2 Nov 2021 10:28:10 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     Youngmin Nam <youngmin.nam@samsung.com>
Cc:     krzysztof.kozlowski@canonical.com, will@kernel.org,
        daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, kgene@kernel.org
Subject: Re: [PATCH v2 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Message-ID: <20211102102802.GA16545@C02TD0UTHF1T.local>
References: <20211102001122.27516-1-youngmin.nam@samsung.com>
 <CGME20211101234500epcas2p2d0e5bc54615b635f6694bc1be4c89fb5@epcas2p2.samsung.com>
 <20211102001122.27516-2-youngmin.nam@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102001122.27516-2-youngmin.nam@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Nov 02, 2021 at 09:11:21AM +0900, Youngmin Nam wrote:
> Exynos MCT version 2 is composed of 1 FRC and 12 comparators.
> There are no global timer and local timer anymore.
> The 1 of 64bit FRC serves as "up-counter"(not "comparators").
> The 12 comaprators(not "counter") can be used as per-cpu event timer
> so that it can support upto 12 cores.
> And a RTC source can be used as backup clock source.

[...]

> +static int exynos_mct_starting_cpu(unsigned int cpu)
> +{
> +	struct mct_clock_event_device *mevt = per_cpu_ptr(&percpu_mct_tick, cpu);
> +	struct clock_event_device *evt = &mevt->evt;
> +
> +	snprintf(mevt->name, sizeof(mevt->name), "mct_comp%d", cpu);
> +
> +	evt->name = mevt->name;
> +	evt->cpumask = cpumask_of(cpu);
> +	evt->set_next_event = exynos_comp_set_next_event;
> +	evt->set_state_periodic = mct_set_state_periodic;
> +	evt->set_state_shutdown = mct_set_state_shutdown;
> +	evt->set_state_oneshot = mct_set_state_shutdown;
> +	evt->set_state_oneshot_stopped = mct_set_state_shutdown;
> +	evt->tick_resume = mct_set_state_shutdown;
> +	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
> +	evt->rating = 500;	/* use value higher than ARM arch timer */

Previously Will asked you to try CLOCK_EVT_FEAT_PERCPU here, and to set
the C3STOP flag on the arch timer via the DT when necessary, rather than
trying to override the arch timer like this:

  https://lore.kernel.org/r/20211027073458.GA22231@willie-the-truck

There are a bunch of things that depend on the architected timer working
as a clocksource (e.g. vdso, kvm), and it *should* work as a lock
clockevent_device if configured correctly, and it's much more consistent
with *everyone else* to use the arhcitected timer by default.

Please try as Will suggested above, so that this works from day one.

Thanks,
Mark.
