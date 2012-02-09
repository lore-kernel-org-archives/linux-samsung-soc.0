From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 6/9] serial: samsung: Add support for EXYNOS5250
Date: Thu, 09 Feb 2012 20:32:40 +0900
Message-ID: <069f01cce71e$8809f1d0$981dd570$%kim@samsung.com>
References: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com>
 <1328024354-4277-7-git-send-email-kgene.kim@samsung.com>
 <CAH9JG2XE7nj1je9SYQ=zJKo0_P5Sx_ruZrDjtpnsL0Qtvzb+_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:30160 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756180Ab2BILdA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Feb 2012 06:33:00 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ40057VIQEZXZ0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 20:32:38 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ400L0OIQD9D40@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 20:32:38 +0900 (KST)
In-reply-to: <CAH9JG2XE7nj1je9SYQ=zJKo0_P5Sx_ruZrDjtpnsL0Qtvzb+_Q@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Greg Kroah-Hartman' <gregkh@suse.de>

Kyungmin Park wrote:
> 
> On 2/1/12, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Cc: Thomas Abraham <thomas.abraham@linaro.org>
> > Cc: Greg Kroah-Hartman <gregkh@suse.de>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> >  drivers/tty/serial/samsung.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
> > index 3b07fb9..c55e5fb 100644
> > --- a/drivers/tty/serial/samsung.c
> > +++ b/drivers/tty/serial/samsung.c
> > @@ -1594,7 +1594,7 @@ static struct s3c24xx_serial_drv_data
> > s5pv210_serial_drv_data = {
> >  #endif
> >
> >  #if defined(CONFIG_CPU_EXYNOS4210) || defined(CONFIG_SOC_EXYNOS4212) ||
> \
> > -	defined(CONFIG_SOC_EXYNOS4412)
> > +	defined(CONFIG_SOC_EXYNOS4412) || defined(CONFIG_SOC_EXYNOS5250)
> I think you can make it simple just use "#ifdef CONFIG_ARCH_EXYNOS "

I think, should be 'depends on SoC' not 'ARCH'

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
