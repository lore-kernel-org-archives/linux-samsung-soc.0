From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [GIT PULL 5/5] Samsung driver updates for v4.3
Date: Thu, 13 Aug 2015 19:12:24 +0900
Message-ID: <007601d0d5b0$8c6eb3d0$a54c1b70$@kernel.org>
References: <55C06A0A.6040407@kernel.org> <20150813091848.GB30160@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40574 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751821AbbHMKMk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Aug 2015 06:12:40 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NT002HOWN0O6P40@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Aug 2015 19:12:24 +0900 (KST)
In-reply-to: <20150813091848.GB30160@localhost>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Kukjin Kim' <kgene@kernel.org>
Cc: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>

Olof Johansson wrote:
> 
> On Tue, Aug 04, 2015 at 04:30:18PM +0900, Kukjin Kim wrote:
> > Hi,
> >
> > This branch is including to support generic cpufreq driver in
> > mach-exynos dir. for exynos3250 and exynos5250 even the tag name is
> > driver. Because it is depending on clk and cpufreq changes which acked
> > by regarding maintainers, Mike and Viresh.
> >
> > Please pull and if any problems, please kindly let me know.
> 
> This now needs to be respun too, apparantly, since it includes dt2.
> 
Sure, I'll.

Thanks
Kukjin
