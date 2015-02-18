From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: [PATCHv3 0/8] devfreq: Add generic exynos memory-bus
 frequency driver
Date: Wed, 18 Feb 2015 21:59:44 +0100
Message-ID: <54E4FD40.8020206@gmx.net>
References: <1420681257-3078-1-git-send-email-cw00.choi@samsung.com> <54DFE797.1020008@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <54DFE797.1020008@math.uni-bielefeld.de>
Sender: linux-pm-owner@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Chanwoo Choi <cw00.choi@samsung.com>, myungjoo.ham@samsung.com, kgene@kernel.org
Cc: kyungmin.park@samsung.com, rafael.j.wysocki@intel.com, mark.rutland@arm.com, a.kesavan@samsung.com, tomasz.figa@gmail.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com, robh+dt@kernel.org, inki.dae@samsung.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello again,

Tobias Jakobi wrote
> I've tested the series on my Odroid-X2 (by adapting the TRATS2 changes),
> and so far I haven't seen any issues. With the system being idle one can
> see that the 'simple_ondemand' devfreq governor clocks down both memory
> busses to the lowest state.

looks I was too hasty the last time. Actually this series breaks HDMI
output for me (or at least with 'simple_ondemand' governor, haven't
tried with performance yet).

I tried to run some simple application, but it hangs in uninterruptible
sleep immediately, probably before the first page flip. Going to check
this more thoroughly.

Maybe some parts of the hdmi subsystem don't like the lower clocks?

With best wishes,
Tobias

