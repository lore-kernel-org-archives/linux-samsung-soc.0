From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [GIT PULL 2nd 3/4] Samsung driver 2nd updates for v4.3
Date: Thu, 13 Aug 2015 19:13:59 +0900
Message-ID: <007a01d0d5b0$c53d6580$4fb83080$@kernel.org>
References: <55CBE10B.2030103@kernel.org> <20150813092144.GD30160@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:59691 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752209AbbHMKOI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Aug 2015 06:14:08 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NT0023RDN3B0RA0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Aug 2015 19:13:59 +0900 (KST)
In-reply-to: <20150813092144.GD30160@localhost>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Kukjin Kim' <kgene@kernel.org>
Cc: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Viresh Kumar' <viresh.kumar@linaro.org>, 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, 'Michael Turquette' <mturquette@baylibre.com>, 'Mike Turquette' <mturquette@linaro.org>

Olof Johansson wrote:
> 
> On Thu, Aug 13, 2015 at 09:12:59AM +0900, Kukjin Kim wrote:
> > Hi,
> >
> > I've created the signed tag based on previous tags/samsung-driver so you
> > can see several merge in there. To support cpufreq-dt driver requires
> > clk/cpufreq/exynos changes together and clk/cpufreq maintainers are
> > aware of this changes. And we can remove exynos cpufreq driver at last.
> >
> > Note this drivers update is including previous dependencies and if
> > you're OK, please pull.
> 
> Again, this needs to be revisited.
> 
YES.

> Please try to keep the dependency only driver->dt if you can,
> and we can merge drivers before DT this release cycle. If you do
> driver->dt->driver->dt like here then things get messy.
> 
It looks better. OK.

Thanks,
Kukjin
