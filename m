From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [GIT PULL 4/5] Samsung 2nd DT updates for v4.3
Date: Thu, 13 Aug 2015 19:02:57 +0900
Message-ID: <004101d0d5af$3c688420$b5398c60$@kernel.org>
References: <55C069D5.1050409@kernel.org> <20150813091814.GA30160@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34060 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751514AbbHMKDG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Aug 2015 06:03:06 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NT0028QSML0CO50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Aug 2015 19:03:00 +0900 (KST)
In-reply-to: <20150813091814.GA30160@localhost>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Kukjin Kim' <kgene@kernel.org>
Cc: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>

Olof Johansson wrote:
> 
> On Tue, Aug 04, 2015 at 04:29:25PM +0900, Kukjin Kim wrote:
> > Hi Arnd, Olof, Kevin
> >
> > This 2nd DT update branch is based tags/samsung-dt-1 +
> > v4.3-topic/clk-samsung branch because of dependency to support generic
> > cpufreq driver. Please pull.
> >
> > Thanks,
> > Kukjin
> >
> >
> > The following changes since commit e4a39d904c3c3e4855287b7325306289ff044b06:
> >
> >   Merge branch 'v4.3-topic/clk-samsung' into v4.3-next/dt-samsung-2
> > (2015-07-24 12:54:00 +0900)
> >
> > are available in the git repository at:
> >
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > tags/samsung-dt-2
> 
> "clk: exynos5250: add cpu clock configuration data and instantiate cpu
> clock" is applied twice, once to your own branch, and once merged in
> from Mike's branch. That doesn't look right.
> 
Oops, it's my fault. Sorry for that.

> Can you please respin? Thanks.
> 
Sure, I'll tonight in my time.

Thanks,
Kukjin
