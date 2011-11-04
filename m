From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung devel-4 for v3.2
Date: Sat, 5 Nov 2011 00:20:54 +0100
Message-ID: <201111050020.55071.arnd@arndb.de>
References: <027f01cc9ab6$2086eae0$6194c0a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:60404 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751155Ab1KDXVD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Nov 2011 19:21:03 -0400
In-Reply-To: <027f01cc9ab6$2086eae0$6194c0a0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Russell King' <rmk+kernel@arm.linux.org.uk>, ben-linux@fluff.org

On Friday 04 November 2011, Kukjin Kim wrote:
> As we talked in Prague, I'm sending 'pull request for v3.2' Samsung-devel4
> which includes supporting EXYNOS4 DT, SPI clkdev and reorganization
> arch/arm/mach-exynos and small things.
> 
> Please pull from: 
>   git://github.com/kgene/linux-samsung.git next-samsung-devel-4
> 
> As a note, the branch includes arm-soc/next/cleanup3 and arm-soc/next/devel2
> based on mainline commit 994c0e99 ("Merge branch 'next/soc' of
> git://git.linaro.org/people/arnd/arm-soc") because it is needed for this and
> they include all of Samsung stuff for v3.2.
> 
> And I will be back to kernel.org after this merge window.
> 
> If any problems, please let me know.

I've looked through it, and I think I'll hold off for this merge window,
especially given that I had enough trouble with the the other commits
and that the submission is really late. Please realize that I have to
push back on stuff that comes during the merge window.

Please send the contents split up into separate branches (dt, spi, clkdev,
rename, devel) for 3.3. I think it's ok if you want to send just the
rename patch for 3.2 the way we had discussed earlier, because this kind
of patch really makes sense at the end of the merge window.

	Arnd
