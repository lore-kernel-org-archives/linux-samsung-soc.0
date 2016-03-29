From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 3/3] cpufreq: exynos: Use generic platdev driver
Date: Tue, 29 Mar 2016 08:08:56 +0530
Message-ID: <20160329023856.GW32495@vireshk-i7>
References: <cover.1458801338.git.viresh.kumar@linaro.org>
 <6cb29053bce7026dd9429326236a67c45e901c7b.1458801338.git.viresh.kumar@linaro.org>
 <56F9E9FC.7080007@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f174.google.com ([209.85.192.174]:36660 "EHLO
	mail-pf0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752767AbcC2CjA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Mar 2016 22:39:00 -0400
Received: by mail-pf0-f174.google.com with SMTP id u190so2625195pfb.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Mar 2016 19:39:00 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <56F9E9FC.7080007@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, arnd.bergmann@linaro.org, Kukjin Kim <kgene@kernel.org>, linaro-kernel@lists.linaro.org, linux-pm@vger.kernel.org, kgene.kim@samsung.com, xf@rock-chips.com, heiko@sntech.de, mmcclint@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 29-03-16, 11:35, Krzysztof Kozlowski wrote:
> On 24.03.2016 15:40, Viresh Kumar wrote:
> > The cpufreq-dt-platdev driver supports creation of cpufreq-dt platform
> > device now, reuse that and remove similar code from platform code.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  arch/arm/mach-exynos/exynos.c        | 25 -------------------------
> >  drivers/cpufreq/cpufreq-dt-platdev.c |  5 +++++
> >  2 files changed, 5 insertions(+), 25 deletions(-)
> 
> Hi,
> 
> I got only 3rd patch (and no cover letter). I don't know what is the
> background or what is your plan for this. I suppose you want to merge it
> through cupfreq tree? Anyway could you cc-me on everything (or at least
> cover letter)?

I bounced (mutt is great) all the other mails to you just now.

-- 
viresh
