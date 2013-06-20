From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 08/10] Samsung SoC EXYNOS5420 for v3.11
Date: Fri, 21 Jun 2013 07:58:34 +0900
Message-ID: <25bc01ce6e09$b149fc20$13ddf460$%kim@samsung.com>
References: <51C0BC74.1060502@samsung.com> <201306202258.26968.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:37713 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161263Ab3FTW6g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 18:58:36 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOP00ILLRTLSC00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Jun 2013 07:58:35 +0900 (KST)
In-reply-to: <201306202258.26968.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Chander Kashyap' <chander.kashyap@linaro.org>

Arnd Bergmann wrote:
> 
> On Tuesday 18 June 2013, Kukjin Kim wrote:
> > ----------------------------------------------------------------
> > based on tags/common-clk-audio
> > - add support for exynos5420 SoC
> >
> > ----------------------------------------------------------------
> 
> This is causing me a little pain because of the deep dependency
> chain.

Yeah could be, but I thought it's better to avoid useless merge conflicts...

> I'll probably have to create a next/soc2 branch, but
> will first try to merge the Renesas pull requests, which may have
> similar problems.
> 
> If it's possible to rebase this one not to have any dependencies
> other than the branches merged into next/cleanup and next/soc,
> I can pull it more easily, as long as I can figure out how
> to merge it with the common-clk-audio branch.
> 
I see, BTW as you can see, the common-clk-audio touches all of samsung dt
files to use '#include' instead of '/include/' so I couldn't remove the
dependencies :( sorry about that.

If anything is required, please kindly let me know.

Thanks,
- Kukjin
