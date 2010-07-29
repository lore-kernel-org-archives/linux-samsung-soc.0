From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/5] ARM: S5P6440: Add RTC support for S5P6440
Date: Thu, 29 Jul 2010 10:37:18 +0900
Message-ID: <007601cb2ebe$978d87d0$c6a89770$%kim@samsung.com>
References: <1279702814-14929-1-git-send-email-kgene.kim@samsung.com>
	<1279702814-14929-4-git-send-email-kgene.kim@samsung.com>
	<4C507367.1000206@simtec.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <4C507367.1000206@simtec.co.uk>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Ben Dooks' <ben@simtec.co.uk>
Cc: p_gortmaker@yahoo.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, rtc-linux@googlegroups.com, a.zummo@towertech.it, 'Atul Dahiya' <atul.dahiya@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Ben Dooks wrote:
> 
> On 21/07/10 10:00, Kukjin Kim wrote:
> > From: Atul Dahiya <atul.dahiya@samsung.com>
> >
> > This patch adds support RTC driver for Samsung S5P6440.
> >
> > Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> >  arch/arm/mach-s5p6440/Kconfig            |    2 ++
> >  arch/arm/mach-s5p6440/include/mach/map.h |    2 +-
> >  arch/arm/mach-s5p6440/mach-smdk6440.c    |    1 +
> >  3 files changed, 4 insertions(+), 1 deletions(-)
> >
> > diff --git a/arch/arm/mach-s5p6440/Kconfig
b/arch/arm/mach-s5p6440/Kconfig
> > index f066fae..b2d4716 100644
> > --- a/arch/arm/mach-s5p6440/Kconfig
> > +++ b/arch/arm/mach-s5p6440/Kconfig
> > @@ -18,7 +18,9 @@ config MACH_SMDK6440
> >  	select CPU_S5P6440
> >  	select SAMSUNG_DEV_TS
> >  	select SAMSUNG_DEV_ADC
> > +	select S3C_DEV_RTC
> >  	select S3C_DEV_WDT
> > +	select HAVE_S3C_RTC
> >  	select HAVE_S3C2410_WATCHDOG
> >  	help
> >  	  Machine support for the Samsung SMDK6440
> 
> I'm considering we shoudl just set HAVE_S3C_RTC for
> each SOC, as allowing it to compile isn't going to
> end up causing a problem. Adding it to each machine
> will end up with large Kconfig entries for each.
> 
Yes..I agree with you...So submitted '[PATCH] ARM: SAMSUNG: Make RTC driver
dependency SoC specific instead of machine specific' together.
And to separate moving dependency from machine to SoC patch can help to
avoid conflict during merging because as you know adding it to each SoC
needs to change arch/arm/Kconfig.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
