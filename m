From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2nd 3/4] Samsung driver 2nd updates for v4.3
Date: Thu, 13 Aug 2015 11:21:44 +0200
Message-ID: <20150813092144.GD30160@localhost>
References: <55CBE10B.2030103@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:36084 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752391AbbHMJbS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Aug 2015 05:31:18 -0400
Received: by lagz9 with SMTP id z9so22893981lag.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Aug 2015 02:31:17 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <55CBE10B.2030103@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Mike Turquette <mturquette@linaro.org>

On Thu, Aug 13, 2015 at 09:12:59AM +0900, Kukjin Kim wrote:
> Hi,
> 
> I've created the signed tag based on previous tags/samsung-driver so you
> can see several merge in there. To support cpufreq-dt driver requires
> clk/cpufreq/exynos changes together and clk/cpufreq maintainers are
> aware of this changes. And we can remove exynos cpufreq driver at last.
> 
> Note this drivers update is including previous dependencies and if
> you're OK, please pull.

Again, this needs to be revisited.

Please try to keep the dependency only driver->dt if you can,
and we can merge drivers before DT this release cycle. If you do
driver->dt->driver->dt like here then things get messy.


-Olof
