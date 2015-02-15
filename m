From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCHv3 0/8] devfreq: Add generic exynos memory-bus
 frequency driver
Date: Sun, 15 Feb 2015 01:25:59 +0100
Message-ID: <54DFE797.1020008@math.uni-bielefeld.de>
References: <1420681257-3078-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:53790 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754324AbbBOA0E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 14 Feb 2015 19:26:04 -0500
In-Reply-To: <1420681257-3078-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, myungjoo.ham@samsung.com, kgene@kernel.org
Cc: kyungmin.park@samsung.com, rafael.j.wysocki@intel.com, mark.rutland@arm.com, a.kesavan@samsung.com, tomasz.figa@gmail.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com, robh+dt@kernel.org, inki.dae@samsung.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hello,

I've tested the series on my Odroid-X2 (by adapting the TRATS2 changes),
and so far I haven't seen any issues. With the system being idle one can
see that the 'simple_ondemand' devfreq governor clocks down both memory
busses to the lowest state.

With best wishes,
Tobias
