From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/7] ARM: S5P6440: CPU initialization
Date: Mon, 14 Dec 2009 20:11:16 +0900
Message-ID: <000d01ca7cae$27dc1950$77944bf0$%kim@samsung.com>
References: <1260525250-4160-1-git-send-email-kgene.kim@samsung.com>
 <20091211120011.19236e87@life-in-the-fast-lane>
 <20091211111628.GA25806@sirena.org.uk>
 <000a01ca7ca7$fc29f030$f47dd090$%kim@samsung.com>
 <20091214113859.570c0d5f@life-in-the-fast-lane>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52836 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756797AbZLNLJ3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Dec 2009 06:09:29 -0500
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KUN00F1G2ZQ21@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Dec 2009 20:09:27 +0900 (KST)
Received: from kgenekim ([12.23.109.129])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KUN00FFF2ZQ6L@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Dec 2009 20:09:26 +0900 (KST)
In-reply-to: <20091214113859.570c0d5f@life-in-the-fast-lane>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marc Zyngier' <maz@misterjones.org>
Cc: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Adityapratap Sharma' <aditya.ps@samsung.com>, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Atul Dahiya' <atul.dahiya@samsung.com>

On Mon, 14 Dec 2009 19:39 +0900 Marc Zyngier wrote:
> On Mon, 14 Dec 2009 19:27:06 +0900
> Kukjin Kim <kgene.kim@samsung.com> wrote:
> 
> > On Fri, Dec 11, 2009 at 20:16 +0900, Mark Brown wrote:
> > > On Fri, Dec 11, 2009 at 12:00:11PM +0100, Marc Zyngier wrote:
> > > > Kukjin Kim <kgene.kim@samsung.com> wrote:
> >
> > Hi Mark Brown and Marc Zyngier,
> >
> > > > > +/* define the number of gpios we need to the one after the GPR()
range
> > */
> > > > > +#define ARCH_NR_GPIOS
> 	(S5P6440_GPR(S5P6440_GPIO_R_NR)
> > > + 1)
> > >
> > > > Doing so prevents the use of GPIO expanders. Either provide a config
> > > > option to provide additional GPIO space, or just get rid of the
#define.
> > To satisfy your request, I know what to do. However, I don't know well
the
> > reason. Please explain the reason why need the use of GPIO expanders. As
you
> > know, the number of hardware GPIO pin is fixed and limited. And the limit
> > value is ARCH_NR_GPIOS.
> 
> Exactly because the number of GPIOs is limited (and in the case of 6440,
> it is actually *very* limited), you may want to connect a GPIO expander
> over I2C or SPI.
> 
> By setting ARCH_NR_GPIOS to the number of GPIOs the SoC provides,
> you're actually preventing any use of such hardware by giving a hard
> limit to the gpiolib. The ARCH_NR_GPIO limit is actually, and despite
> its name, a platform dependent value.
> 
> I'm actually using a platform that has this exact requirement (6440 +
> pca9539).

Hi Marc Zyngier,

Thanks for your detailed explain.
Let me check and change it.

> > > It also prevents the use of external devices with interrupt controllers
> > > (eg, most PMICs these days).  See the S3C24xx and S3C64xx code for
> > > examples of how to avoid this limit.
> > As you mentioned, I can find the code in the S3C24XX, but I can't in the
> > S3C64XX. The S3C64XX codes are as follows:
> >
> > /* from arch/arm/mach-s3c6400/include/mach/gpio.h */
> > 93 /* define the number of gpios we need to the one after the GPQ() range
*/
> > 94 #define ARCH_NR_GPIOS	(S3C64XX_GPQ(S3C64XX_GPIO_Q_NR) + 1)
> 
> Then it needs to be fixed as well.
Ok.

> > Anyway, if the definition like my patch becomes problem, please let me
know
> > the reason.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
System LSI Division, SAMSUNG ELECTRONICS CO., LTD.
