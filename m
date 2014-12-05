From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH V4 0/3] PM / Domains: Add initial PM clock support to genpd
Date: Fri, 05 Dec 2014 03:14:54 +0100
Message-ID: <4377493.dchgvn3k6f@vostro.rjw.lan>
References: <1417434623-31301-1-git-send-email-ulf.hansson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:63433 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754717AbaLEBx3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Dec 2014 20:53:29 -0500
In-Reply-To: <1417434623-31301-1-git-send-email-ulf.hansson@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, Kevin Hilman <khilman@linaro.org>, Simon Horman <horms@verge.net.au>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Arnd Bergmann <arnd@arndb.de>

On Monday, December 01, 2014 12:50:20 PM Ulf Hansson wrote:
> Changes in v4:
> 	-Applied acks/tested by tags.
> 	-Change name of define, affects all patches.
> 
> Changes in v3:
> 	-Fixed comments from Rafael for patch 1.
> 	-Change name of define, affects all patches.
> 
> Changes in v2:
> 	-Small fixes in patch 1.
> 
> 
> It's quite common for PM domains to use PM clocks. Typically from SOC specific
> code, the per device PM clock list is created and pm_clk_suspend|resume() are
> invoked to handle clock gating/ungating.
> 
> A step towards consolidation is to integrate PM clock support into genpd, which
> is what this patchset does.
> 
> In this initial step, the calls to the pm_clk_suspend|resume() are handled
> within genpd, but the per device PM clock list still needs to be created from
> SOC specific code. It seems reasonable to have gendp to handle that as well, but
> that left to future patchsets to address.
> 
> It's not every users of genpd that are keen on using PM clocks thus we need
> to provide this a configuration option for genpd.
> 
> In patch 2 and patch 3, we convert some of the SH-MOBILE SOCs to start using the
> new PM clock support in genpd.
> 
> 
> Ulf Hansson (3):
>   PM / Domains: Initial PM clock support for genpd
>   ARM: shmobile: Convert to genpd flags for PM clocks for r8a7779
>   ARM: shmobile: Convert to genpd flags for PM clocks for R-mobile

All queued up for 3.19-rc1, thanks!

-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
