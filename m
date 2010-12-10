From: Kamil Debski <k.debski@samsung.com>
Subject: RE: [RFC/PATCH v4 2/4] MFC: Add MFC 5.1 driver to plat-s5p
Date: Fri, 10 Dec 2010 11:10:51 +0100
Message-ID: <001401cb9852$893456c0$9b9d0440$%debski@samsung.com>
References: <1291901723-20361-1-git-send-email-k.debski@samsung.com>
 <1291901723-20361-3-git-send-email-k.debski@samsung.com>
 <027501cb9814$3a9089f0$afb19dd0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <027501cb9814$3a9089f0$afb19dd0$%kim@samsung.com>
Content-language: en-gb
Sender: linux-media-owner@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, pawel@osciak.com, kyungmin.park@samsung.com, jaeryul.oh@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

> From: Kukjin Kim [mailto:kgene.kim@samsung.com]
> Kamil Debski wrote:
> >
> Would be better if you could keep the subject style...
> 

Ok, I'll make the comment more consistent.

(snip)

> > diff --git a/arch/arm/mach-s5pv210/include/mach/map.h
> b/arch/arm/mach-
> > s5pv210/include/mach/map.h
> > index 0982443..8f887c4 100644
> > --- a/arch/arm/mach-s5pv210/include/mach/map.h
> > +++ b/arch/arm/mach-s5pv210/include/mach/map.h
> > @@ -107,6 +107,9 @@
> >  #define S5PV210_PA_DMC0		(0xF0000000)
> >  #define S5PV210_PA_DMC1		(0xF1400000)
> >
> > +/* MFC */
> 
> No need useless comment.

Just above the place, where I have added MFC, there are defines
for AC97, PCM, I2S etc. and all of them have such comment before
( /* AC97 */ for AC97 codec). As such I wanted to keep the style.
I agree that it is not necessary, but removing it could make the
file less consistent. Are you sure you want me to remove it?

> 
> > +#define S5PV210_PA_MFC		(0xF1700000)
> > +
> >  /* compatibiltiy defines. */
> >  #define S3C_PA_UART		S5PV210_PA_UART
> >  #define S3C_PA_HSMMC0		S5PV210_PA_HSMMC(0)
> > @@ -123,6 +126,7 @@
> >  #define S5P_PA_FIMC0		S5PV210_PA_FIMC0
> >  #define S5P_PA_FIMC1		S5PV210_PA_FIMC1
> >  #define S5P_PA_FIMC2		S5PV210_PA_FIMC2
> > +#define S5P_PA_MFC		S5PV210_PA_MFC
> >
> >  #define SAMSUNG_PA_ADC		S5PV210_PA_ADC
> >  #define SAMSUNG_PA_CFCON	S5PV210_PA_CFCON
> > diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
> > index 9755df9..c7a048e 100644
> > --- a/arch/arm/plat-s5p/Kconfig
> > +++ b/arch/arm/plat-s5p/Kconfig
> > @@ -5,6 +5,11 @@
> >  #
> >  # Licensed under GPLv2
> >
> > +config S5P_DEV_MFC
> > +	bool
> > +	help
> > +	  Compile in platform device definitions for MFC
> > +
> >  config PLAT_S5P
> >  	bool
> >  	depends on (ARCH_S5P64X0 || ARCH_S5P6442 || ARCH_S5PC100 ||
> > ARCH_S5PV210 || ARCH_S5PV310)
> > diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
> > index df65cb7..ed0f33d 100644
> > --- a/arch/arm/plat-s5p/Makefile
> > +++ b/arch/arm/plat-s5p/Makefile
> > @@ -23,6 +23,7 @@ obj-$(CONFIG_PM)		+= pm.o
> >  obj-$(CONFIG_PM)		+= irq-pm.o
> >
> >  # devices
> > +obj-$(CONFIG_S5P_DEV_MFC)	+= dev-mfc5.o
> 
> Do we really need to distinguish mfc version in file name?
> So why did you use just CONFIG_S5P_DEV_MFC as config name?
> 
> I mean don't use mixed name in there.

Right, I think removing the version number is ok. Another way would be
adding
"v5" everywhere. But I don't think it is necessary. 
 
> +obj-$(CONFIG_S5P_DEV_MFC5)	+= dev-mfc5.o
> 
> Or
> 
> +obj-$(CONFIG_S5P_DEV_MFC)	+= dev-mfc.o
> 
> I prefer the latter...because no need to separate the hardware version
> in
> platform data now.

Ok.

> >
> >  obj-$(CONFIG_S5P_DEV_FIMC0)	+= dev-fimc0.o
> >  obj-$(CONFIG_S5P_DEV_FIMC1)	+= dev-fimc1.o
> > diff --git a/arch/arm/plat-s5p/dev-mfc5.c b/arch/arm/plat-s5p/dev-
> mfc5.c
> > new file mode 100644
> > index 0000000..c06ea97
> > --- /dev/null
> > +++ b/arch/arm/plat-s5p/dev-mfc5.c
> > @@ -0,0 +1,37 @@
> > +/* Base S3C64XX mfc resource and device definitions */
> > +
> > +
> 
> Where is the GPL license?
> This is very important...

The file lacks a proper comment altogether. Thanks for pointing
this out, indeed it is important. 
 
> > +#include <linux/kernel.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/ioport.h>
> > +
> > +#include <mach/map.h>
> > +#include <plat/map-base.h>
> 
> Do we _really_ need <plat/map-base.h> inclusion?
> NO.

Right.

> 
> > +#include <plat/devs.h>
> > +#include <plat/irqs.h>
> > +
> > +/* MFC controller */
> 
> No need above comment.

Ok.
 
> > +static struct resource s5p_mfc_resource[] = {
> > +	[0] = {
> > +		.start  = S5P_PA_MFC,
> > +		.end    = S5P_PA_MFC + SZ_64K - 1,
> > +		.flags  = IORESOURCE_MEM,
> > +	},
> > +	[1] = {
> > +		.start  = IRQ_MFC,
> > +		.end    = IRQ_MFC,
> > +		.flags  = IORESOURCE_IRQ,
> > +	}
> > +};
> > +
> > +struct platform_device s5p_device_mfc5 = {
> > +	.name          = "s5p-mfc5",
> > +	.id            = -1,
> > +	.num_resources = ARRAY_SIZE(s5p_mfc_resource),
> > +	.resource      = s5p_mfc_resource,
> > +};
> > +
> > +EXPORT_SYMBOL(s5p_device_mfc5);
> > +
> > +
> 
> No need useless 2 empty lines here.

Ok.

(snip)

Thank you for your comments.

Best regards,
-- 
Kamil Debski
Linux Platform Group
Samsung Poland R&D Center
