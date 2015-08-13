From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2nd 2/4] Samsung DT 3rd updates for v4.3
Date: Thu, 13 Aug 2015 11:20:38 +0200
Message-ID: <20150813092038.GC30160@localhost>
References: <55CBE0F2.4020104@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:33507 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752383AbbHMJbR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Aug 2015 05:31:17 -0400
Received: by lbbsx3 with SMTP id sx3so23762727lbb.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Aug 2015 02:31:15 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <55CBE0F2.4020104@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>

On Thu, Aug 13, 2015 at 09:12:34AM +0900, Kukjin Kim wrote:
> Hi Arnd, Olof, Kevin
> 
> This is based on tags/samsung-dt-2 and including exynos4 related clock
> changes to support cpufreq-dt driver for exynos4 SoCs. Note that I've
> created one more clk topic branch called v4.3-topic/clk-samsung-2 based
> on previous one has been merged by Mike into clock tree before but I'm
> not sure new one merged into clk tree that's why I've noted its merge in
> this signed tag.

Since this depends on the previous DT branch that I asked for a respin, please
do it all over and send a fresh pull request that we hopefully can include.

We normally ask that you don't queue up merge requests like these for that
reason: If there's need to redo an earlier branch there's a lot of work that
needs to be done on your side. Instead, please wait until previous pull request
has been merged before you send the next one. Thanks!


-Olof
