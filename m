From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 6/9] serial: samsung: Add support for EXYNOS5250
Date: Thu, 9 Feb 2012 23:41:08 +0000
Message-ID: <201202092341.08981.arnd@arndb.de>
References: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com> <1328024354-4277-7-git-send-email-kgene.kim@samsung.com> <CAH9JG2XE7nj1je9SYQ=zJKo0_P5Sx_ruZrDjtpnsL0Qtvzb+_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:51727 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754586Ab2BIXlY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Feb 2012 18:41:24 -0500
In-Reply-To: <CAH9JG2XE7nj1je9SYQ=zJKo0_P5Sx_ruZrDjtpnsL0Qtvzb+_Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk, olof@lixom.net, Thomas Abraham <thomas.abraham@linaro.org>, Greg Kroah-Hartman <gregkh@suse.de>

On Wednesday 01 February 2012, Kyungmin Park wrote:
> >
> > diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
> > index 3b07fb9..c55e5fb 100644
> > --- a/drivers/tty/serial/samsung.c
> > +++ b/drivers/tty/serial/samsung.c
> > @@ -1594,7 +1594,7 @@ static struct s3c24xx_serial_drv_data
> > s5pv210_serial_drv_data = {
> >  #endif
> >
> >  #if defined(CONFIG_CPU_EXYNOS4210) || defined(CONFIG_SOC_EXYNOS4212) || \
> > -     defined(CONFIG_SOC_EXYNOS4412)
> > +     defined(CONFIG_SOC_EXYNOS4412) || defined(CONFIG_SOC_EXYNOS5250)
> I think you can make it simple just use "#ifdef CONFIG_ARCH_EXYNOS "

Or you could just remove all the #ifdef. Most drivers just register
for all devices that they support, even if you know which one to expect.

	Arnd
