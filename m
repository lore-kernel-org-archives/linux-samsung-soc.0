From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung cleanup-spi for v3.3
Date: Wed, 28 Dec 2011 00:14:33 +0000
Message-ID: <201112280014.34021.arnd@arndb.de>
References: <088001ccc1d7$7c0da460$7428ed20$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:53812 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752407Ab1L1AOj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Dec 2011 19:14:39 -0500
In-Reply-To: <088001ccc1d7$7c0da460$7428ed20$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Saturday 24 December 2011, Kukjin Kim wrote:
> Please pull the samsung-cleanup-spi for v3.3.
> It depends on samsung-devel-spi3 branch...
> 
> If any problems, please let me know.

I've applied next-samsung-cleanup-mmc2, next-samsung-devel-spi3 and
next-samsung-cleanup-spi4, all into next/cleanup2 now.

This was the best solution I could come up with, because strictly following
the normal rules would have meant creating an insane number of merge
commits and sending out each of your branches separately to Linus, after
all the other stuff.

I normally try to send out all cleanups before everything else, except
when a cleanup has a dependency on another branch, in which case I have
to create an extra cleanup branch. What you sent me would have
meant doing something like:

1. cleanup
	all cleanup branches except samsung

2. dt
	all dt branches

3. devel
	all devel branches, including devel-ohci but not devel-spi
	or devel-mmc-spi

4.-10.
	everything else except samsung

11. cleanup2
	only samsung/cleanup-mmc

12. devel2
	only samsung/devel-spi

13. cleanup3
	only samsung/cleanup-spi

14. devel3
	only samsung/devel-mmc-spi

I've now squashed samsung/devel-spi into the cleanup2 branch, which also lets me
put cleanup-spi in there, and put it right after next/dt. This works because
devel-spi can still be considered a cleanup (although you did not consider it that).

Right now, the order we have in arm-soc is "fixes-non-critical", "cleanup", "dt",
"cleanup2", "soc", "boards", "devel", "drivers", "pm", "timer", "move". There
is some flexibility towards the end, but if you use a different order, that creates
circular dependencies which we absolutely don't want.

	Arnd
