From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/7] ARM: S5P6440: CPU initialization
Date: Mon, 14 Dec 2009 20:37:24 +0900
Message-ID: <001001ca7cb1$ce63e7f0$6b2bb7d0$%kim@samsung.com>
References: <1260525250-4160-1-git-send-email-kgene.kim@samsung.com>
 <1b68c6790912122347p6fa6cf99jf4c733e666a15f8f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47072 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752863AbZLNLfg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Dec 2009 06:35:36 -0500
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KUN00J9M47ACS@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Dec 2009 20:35:35 +0900 (KST)
Received: from kgenekim ([12.23.109.129])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KUN00LXR47A57@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Dec 2009 20:35:34 +0900 (KST)
In-reply-to: <1b68c6790912122347p6fa6cf99jf4c733e666a15f8f@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'jassi brar' <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Adityapratap Sharma' <aditya.ps@samsung.com>, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Atul Dahiya' <atul.dahiya@samsung.com>

On Sun, Dec 13, 2009 at 16:48 +0900, jassi brar wrote:
> On Fri, Dec 11, 2009 at 6:54 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > This patch adds S5P6440 support.
> >
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > Signed-off-by: Adityapratap Sharma <aditya.ps@samsung.com>
> > Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> > Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
> > ---
> >  arch/arm/mach-s5p6440/cpu.c                      |  120
> ++++++++++++++++++++++
> >  arch/arm/mach-s5p6440/include/mach/debug-macro.S |   37 +++++++
> >  arch/arm/mach-s5p6440/include/mach/entry-macro.S |   42 ++++++++
> >  arch/arm/mach-s5p6440/include/mach/gpio-core.h   |   19 ++++
> >  arch/arm/mach-s5p6440/include/mach/gpio.h        |   79 ++++++++++++++
> >  arch/arm/mach-s5p6440/include/mach/hardware.h    |   18 ++++
> >  arch/arm/mach-s5p6440/include/mach/idle.h        |   23 ++++
> >  arch/arm/mach-s5p6440/include/mach/map.h         |  100
> ++++++++++++++++++
> >  arch/arm/mach-s5p6440/include/mach/memory.h      |   22 ++++
> >  arch/arm/mach-s5p6440/include/mach/system.h      |   40 +++++++
> >  arch/arm/mach-s5p6440/include/mach/uncompress.h  |   24 +++++
> >  arch/arm/plat-s3c/include/plat/cpu.h             |    2 +
> >  arch/arm/plat-s5p/cpu.c                          |   88 ++++++++++++++++
> >  arch/arm/plat-s5p/include/plat/s5p6440.h         |   33 ++++++
> >  arch/arm/plat-s5p/s5p6440-init.c                 |   23 ++++
> >  arch/arm/plat-s5p/setup-i2c0.c                   |   23 ++++
> >  16 files changed, 693 insertions(+), 0 deletions(-)
> >  create mode 100644 arch/arm/mach-s5p6440/cpu.c
> >  create mode 100644 arch/arm/mach-s5p6440/include/mach/debug-macro.S
> >  create mode 100644 arch/arm/mach-s5p6440/include/mach/entry-macro.S
> >  create mode 100644 arch/arm/mach-s5p6440/include/mach/gpio-core.h
> >  create mode 100644 arch/arm/mach-s5p6440/include/mach/gpio.h
> >  create mode 100644 arch/arm/mach-s5p6440/include/mach/hardware.h
> >  create mode 100644 arch/arm/mach-s5p6440/include/mach/idle.h
> >  create mode 100644 arch/arm/mach-s5p6440/include/mach/map.h
> >  create mode 100644 arch/arm/mach-s5p6440/include/mach/memory.h
> >  create mode 100644 arch/arm/mach-s5p6440/include/mach/system.h
> >  create mode 100644 arch/arm/mach-s5p6440/include/mach/uncompress.h
> >  create mode 100644 arch/arm/plat-s5p/cpu.c
> >  create mode 100644 arch/arm/plat-s5p/include/plat/s5p6440.h
> >  create mode 100644 arch/arm/plat-s5p/s5p6440-init.c
> >  create mode 100644 arch/arm/plat-s5p/setup-i2c0.c

(snip)

> Perhaps arch/arm/plat-s5p/Makefile shud be in this patch, rather than
> the first one.
> Otherwise, you enable compilation before having the code.
> 
> Also, we need to look at the order of defining and using functions in
> patches in wrong order.
> Though, it wud be okay if we don't consider patch atomicity.
Ok, as I already reply another posting, I couldn't consider patch atomicity. And all(almost?) my patches need so that can support s5p6440. Of course they can be modified.


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
System LSI Division, SAMSUNG ELECTRONICS CO., LTD.
