From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH] cpufreq: exynos: allow disabling cpufreq drivers
Date: Fri, 19 Apr 2013 22:37:36 +0200
Message-ID: <5171AB10.5070702@gmail.com>
References: <201304191554.29679.arnd@arndb.de> <51717623.2060709@samsung.com> <201304192059.38606.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:56329 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753777Ab3DSUhl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Apr 2013 16:37:41 -0400
In-Reply-To: <201304192059.38606.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, cpufreq@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>

On 04/19/2013 08:59 PM, Arnd Bergmann wrote:
> Maybe you just didn't have CPUFREQ enabled? I also didn't notice this
> bug at first because it is turned off in the defconfigs.

I certainly had it enabled. Since I remember I needed to turn it off
temporarily after someone has introduced an incorrect change to the clock
tree definition and cpufreq was unexpectedly switching parents of one of
the root clocks at run time, which was causing malfunction of the camera
image processing chain.

Anyway this wasn't a clean mainline kernel, as there have been recently lot
of stuff pending upstream needed to have complete system with dt support.
I assume after 3.10 release the situation is going to be much better.

> It could also be working by chance on EXYNOS4, since the register
> definitions were not actually removed from the regs-clk.h header
> for those.

That's most likely what happened.


Thanks,
Sylwester
