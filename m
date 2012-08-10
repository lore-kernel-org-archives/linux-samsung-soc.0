From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ASoC: Samsung: Fix build error
Date: Fri, 10 Aug 2012 14:42:04 +0900
Message-ID: <0dca01cd76ba$df198a40$9d4c9ec0$%kim@samsung.com>
References: <1344405883-27603-1-git-send-email-sachin.kamat@linaro.org>
 <20120808110926.GK16861@opensource.wolfsonmicro.com>
 <CAK9yfHzE4sRKj7uUKAEWtonV2uVBcg5_JhL1Ny4d1ohS5g+5yw@mail.gmail.com>
 <0b1401cd755a$552fb9f0$ff8f2dd0$%kim@samsung.com>
 <CAK9yfHw7pYBJ=5E4EX9OzApz0YM=_2PNSCqspTT=rRTR1UrneQ@mail.gmail.com>
 <0b2a01cd7561$333e97b0$99bbc710$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:31498 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752151Ab2HJFmG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Aug 2012 01:42:06 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M8I004P8YHSBGA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Aug 2012 14:42:04 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M8I006XFYI418D0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Aug 2012 14:42:04 +0900 (KST)
In-reply-to: <0b2a01cd7561$333e97b0$99bbc710$%kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, patches@linaro.org, sbkim73@samsung.com, 'Boojin Kim' <boojin.kim@samsung.com>

Kukjin Kim wrote:
> 
> Kukjin Kim wrote:
> >
> > Sachin Kamat wrote:
> > >
> > > On 8 August 2012 17:08, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > > > Sachin Kamat wrote:
> > > >>
> > > >> Hi Mark,
> > > >>
> > > >> On 8 August 2012 16:39, Mark Brown
> > > <broonie@opensource.wolfsonmicro.com>
> > > >> wrote:
> > > >> > On Wed, Aug 08, 2012 at 11:34:43AM +0530, Sachin Kamat wrote:
> > > >> >> Fixes the following build error:
> > > >> >> In file included from
> arch/arm/mach-exynos/include/mach/dma.h:24:0,
> > > >> >>               from
> arch/arm/plat-samsung/include/plat/dma-ops.h:17,
> > > >> >>               from arch/arm/plat-samsung/include/plat/dma.h:128,
> > > >> >>               from sound/soc/samsung/pcm.c:23:
> > > >> >> arch/arm/plat-samsung/include/plat/dma-pl330.h:106:8:
> > > >> >>                       error: redefinition of 'struct
> > > > s3c2410_dma_client'
> > > >> >> arch/arm/plat-samsung/include/plat/dma.h:40:8: note: originally
> > > defined
> > > >> here
> > > >> >> make[3]: *** [sound/soc/samsung/pcm.o] Error 1
> > > >> >
> > > >> > Shouldn't this be being fixed in the headers?  It looks like they
> > > >> > reference and disagree with each other on Exynos (my primary
> > > development
> > > >> > platform is S3C6410 based so I'd notice if it was a generic
> Samsung
> > > >> > issue.
> > > >> >
> > > >> > Pasting the error message isn't really that useful unless the fix
> > is
> > > >> > obvious, it's better to explain in words what's wrong.
> > > >>
> > > >> I had sent the initial patch trying to fix this in the headers and
> it
> > > >> worked for exynos4 config. However Kukjin pointed out that the
> patch
> > > >> created similar errors with 2410 and 6400 configs. Fixing it
> further
> > > >> in the headers did not look quite straight forward as there are
> many
> > > >> headers trying to include one another. Hence I felt it is better
> > > >> handled in the current way. I understand i should have added this
> > > >> information in the commit message. Below is the link for your
> > > >> reference that provides the complete discussion.
> > > >>
> > > >> http://comments.gmane.org/gmane.linux.kernel.samsung-soc/11274
> > > >>
> > > >> Please let me know your opinion about this.
> > > >>
> > > >>
> > > > I also agree with Mark's opinion and current Sachin's approach
> cannot
> > > avoid
> > > > whole similar build error.
> > >
> > > With the current change I did not see any build error with the configs
> > > (2410, 6400, 64x0 and exyno4) i checked with (after enabling audio).
> > > Please let me know if you observed any such build error after adding
> > > this patch.
> > >
> > >
> >
> > Happens following error with s5pv210_defcofnig (after enabling s5p-sss).
> >
> > In file included from arch/arm/mach-s5pv210/include/mach/dma.h:24,
> >                  from arch/arm/plat-samsung/include/plat/dma-ops.h:17,
> >                  from arch/arm/plat-samsung/include/plat/dma.h:128,
> >                  from drivers/crypto/s5p-sss.c:33:
> > arch/arm/plat-samsung/include/plat/dma-pl330.h:106: error: redefinition
> of
> > 'struct s3c2410_dma_client'
> > make[2]: *** [drivers/crypto/s5p-sss.o] Error 1
> > make[1]: *** [drivers/crypto] Error 2
> > make[1]: *** Waiting for unfinished jobs....
> > make: *** [drivers] Error 2
> > make: *** Waiting for unfinished jobs....
> >
> > Actually, <mach/dma.h> is including <plat/dma-pl330.h> for s5p64x0,
> > s5pc100, s5pv210 and exynos or <plat/dma.h> for s3c24xx and s3c64xx. And
> > the cause of build error you reported is duplicated declaration of
> > s3c2410_dma_client. So it can happen when <plat/dma-pl330.h> and
> > <plat/dma.h> are included together at the same time...
> >
> Of course, following can fix above build error similarly...
> 
> ---
> diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
> index bc986f8..6a3e98e 100644
> --- a/drivers/crypto/s5p-sss.c
> +++ b/drivers/crypto/s5p-sss.c
> @@ -30,7 +30,7 @@
>  #include <crypto/ctr.h>
> 
>  #include <plat/cpu.h>
> -#include <plat/dma.h>
> +#include <mach/dma.h>
> 
>  #define _SBF(s, v)			((v) << (s))
>  #define _BIT(b)			_SBF(b, 1)
> ---
> 
> Hmm...I need to sort this out...
> 
Mark, I think, Sachin's "[PATCH] ASoC: Samsung: Fix build error" can be a
solution to fix build error because current structure of Samsung DMA is not
simple to fix the problem and support s3c24xx-dma, pl080 and pl330 together.
So only <mach/dma.h> should be included in driver not <plat/dma.h> for
Samsung DMA now. However I know, Boojin Kim (Cc'ed) will clean up the
headers for DMA.

So if you agree, please pick this up into your tree with my ack.

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Note, if this is ok to you, I will post above fix (drivers/crypto/s5p-sss.c)
to crypto mailing list too.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
