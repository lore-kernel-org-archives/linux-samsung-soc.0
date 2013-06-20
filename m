From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 08/10] Samsung SoC EXYNOS5420 for v3.11
Date: Thu, 20 Jun 2013 22:58:26 +0200
Message-ID: <201306202258.26968.arnd@arndb.de>
References: <51C0BC74.1060502@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:61976 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755914Ab3FTU66 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 16:58:58 -0400
In-Reply-To: <51C0BC74.1060502@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Chander Kashyap <chander.kashyap@linaro.org>

On Tuesday 18 June 2013, Kukjin Kim wrote:
> ----------------------------------------------------------------
> based on tags/common-clk-audio
> - add support for exynos5420 SoC
> 
> ----------------------------------------------------------------

This is causing me a little pain because of the deep dependency
chain. I'll probably have to create a next/soc2 branch, but
will first try to merge the Renesas pull requests, which may have
similar problems.

If it's possible to rebase this one not to have any dependencies
other than the branches merged into next/cleanup and next/soc,
I can pull it more easily, as long as I can figure out how
to merge it with the common-clk-audio branch.

	Arnd
