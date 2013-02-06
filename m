From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 4/5] Samsung cleanup-s3c24xx-2 for v3.9
Date: Tue, 5 Feb 2013 17:01:39 -0800
Message-ID: <20130206010139.GB28722@quad.lixom.net>
References: <120e01ce0331$3aba1ec0$b02e5c40$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f49.google.com ([209.85.210.49]:51708 "EHLO
	mail-da0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753729Ab3BFBBj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 20:01:39 -0500
Received: by mail-da0-f49.google.com with SMTP id t11so337290daj.36
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Feb 2013 17:01:39 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <120e01ce0331$3aba1ec0$b02e5c40$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Mon, Feb 04, 2013 at 03:42:00PM -0800, Kukjin Kim wrote:
> Hi Arnd and Olof,
> 
> This is 4th cleanup for Samsung S3C24XX stuff, and removes plat-s3c24xx
> directory :-)
> Note, this is based on previous pull-request, 'next/irq-s3c24xx' branch.
> 
> If any problems, please kindly let me know.
> 
> Thanks.
> 
> - Kukjin
> 
> 
> The following changes since commit f44ddba3635e35317057e976888d4a12dcb0f842:
> 
>   ARM: S3C24XX: transform s3c2443 subirqs into new structure (2013-02-03
> 15:52:50 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> next/cleanup-s3c24xx-2
> 
> for you to fetch changes up to 37c3adca81b282bdf310d5ed54acbc28ac0b20a3:
> 
>   ARM: S3C24XX: header mach/regs-mem.h local (2013-02-04 10:31:43 -0800)
> 
> ----------------------------------------------------------------
> Kukjin Kim (4):
>       ARM: S3C24XX: Remove plat-s3c24xx directory in arch/arm/

So the previous branch moved some of the irq stuff from mach to plat, and here
you move it from plat to mach. Please avoid extra churn like this in the future
if you can.


-Olof
