From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: SAMSUNG: fix to support for missing cpu specific
 map_io
Date: Wed, 31 Jul 2013 14:44:48 +0900
Message-ID: <1bb601ce8db1$11fa30a0$35ee91e0$@org>
References: <190501ce8cdd$2abd6780$80383680$%kim@samsung.com>
 <CAK9yfHwMANp2TfQWHQVXGZ2C-t-KrwGHJOpFT+hedDFYTDng6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:35234 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750775Ab3GaFov (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 31 Jul 2013 01:44:51 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQS003ADD9T5OE0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Jul 2013 14:44:49 +0900 (KST)
In-reply-to: <CAK9yfHwMANp2TfQWHQVXGZ2C-t-KrwGHJOpFT+hedDFYTDng6Q@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Sachin Kamat wrote:
> 
> On 30 July 2013 09:57, Kukjin Kim <kgene.kim@samsung.com> wrote:
> >
> > Since commit 7ed76e08 (ARM: EXYNOS: Fix low level debug support)
> > map_io() is not needed for exynos5440 so need to fix to lookup
> > cpu which using map_io(). Without this, kernel boot log complains
> > 'CPU EXYNOS5440 support not enabled' on exynos5440 and panic().
> >
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> >  arch/arm/plat-samsung/init.c |    5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/plat-samsung/init.c b/arch/arm/plat-samsung/init.c
> > index 3e5c461..50a3ea0 100644
> > --- a/arch/arm/plat-samsung/init.c
> > +++ b/arch/arm/plat-samsung/init.c
> > @@ -55,12 +55,13 @@ void __init s3c_init_cpu(unsigned long idcode,
> >
> >         printk("CPU %s (id 0x%08lx)\n", cpu->name, idcode);
> >
> > -       if (cpu->map_io == NULL || cpu->init == NULL) {
> > +       if (cpu->init == NULL) {
> >                 printk(KERN_ERR "CPU %s support not enabled\n",
cpu->name);
> >                 panic("Unsupported Samsung CPU");
> 
> While at it you could probably remove the printk and have that message
> printed by panic instead?
> 
If required, it should be handled separately, and it is not critical.

- Kukjin
