From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 2/2] Samsung defconfig update for v3.18
Date: Thu, 27 Nov 2014 14:31:05 +0100
Message-ID: <201411271431.05461.arnd@arndb.de>
References: <546F3CE3.5010502@kernel.org> <201411271428.41847.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:53453 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750784AbaK0NbL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Nov 2014 08:31:11 -0500
In-Reply-To: <201411271428.41847.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Thursday 27 November 2014, Arnd Bergmann wrote:
> On Friday 21 November 2014, Kukjin Kim wrote:
> > The following changes since commit 0df1f2487d2f0d04703f142813d53615d62a1da4:
> > 
> >   Linux 3.18-rc3 (2014-11-02 15:01:51 -0800)
> > 
> > are available in the git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > tags/samsung-defconfig-v3.18
> > 
> > for you to fetch changes up to 0788148935c3a0fae3cca6af72943b9628bf8a54:
> > 
> >   ARM: exynos_defconfig: Enable max77802 rtc and clock drivers
> > (2014-11-21 21:46:21 +0900)
> > 
> > ----------------------------------------------------------------
> > Samsung defconfig update for v3.18
> > 
> > - enable max77802 rtc and clock drivers for exynos_defconfig
> >   : enable the kernel config options to have the drivers for
> >     max77802 including rtc and 2-ch 32kHz clock outputs
> 
> Pulled into next/fixes, thanks!

Sorry, I meant fixes, not next/fixes. It's queued for 3.18.

	Arnd
