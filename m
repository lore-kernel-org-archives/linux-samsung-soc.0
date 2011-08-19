From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Remove useless codes on NURI board
Date: Fri, 19 Aug 2011 22:58:03 +0900
Message-ID: <004201cc5e78$03c83280$0b589780$%kim@samsung.com>
References: <1313758894-31814-1-git-send-email-kgene.kim@samsung.com>
 <CAH9JG2Ufwg7+6rAsf4v_RJ-fccp=5-8ziNFZEDX5ToUP5MpJ4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:56079 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751685Ab1HSN6G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 09:58:06 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQ600CK6HGSHI10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 22:58:04 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQ6004CHHGSYP@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 22:58:04 +0900 (KST)
In-reply-to: <CAH9JG2Ufwg7+6rAsf4v_RJ-fccp=5-8ziNFZEDX5ToUP5MpJ4A@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, =?utf-8?B?J+2VqOuqheyjvCc=?= <myungjoo.ham@samsung.com>, =?utf-8?B?J+2VqOuqheyjvCc=?= <myungjoo.ham@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Kyungmin Park wrote:
> 
> Maybe charger manager codes are not merged. it's used for charger managers.
> 
OK, if this is required on charger manager, will drop this.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> To Mr. Ham,
> which patches are missing?
> 
> Thank you,
> Kyungmin Park
> 
> On Fri, Aug 19, 2011 at 10:01 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > The 'nuri_cm_devices' is defined but not used.
> >
> > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> >  arch/arm/mach-exynos4/mach-nuri.c |    7 -------
> >  1 files changed, 0 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos4/mach-nuri.c b/arch/arm/mach-exynos4/mach-
> nuri.c
> > index 43be71b..65df994 100644
> > --- a/arch/arm/mach-exynos4/mach-nuri.c
> > +++ b/arch/arm/mach-exynos4/mach-nuri.c
> > @@ -1037,13 +1037,6 @@ static struct platform_device nuri_max8903_device =
> {
> >        },
> >  };
> >
> > -static struct device *nuri_cm_devices[] = {
> > -       &s3c_device_i2c5.dev,
> > -       &s3c_device_adc.dev,
> > -       NULL, /* Reserved for UART */
> > -       NULL,
> > -};
> > -
> >  static void __init nuri_power_init(void)
> >  {
> >        int gpio;
> > --
> > 1.7.1
