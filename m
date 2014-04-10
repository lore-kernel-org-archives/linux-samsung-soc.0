From: Chanho Park <chanho61.park@samsung.com>
Subject: RE: [PATCH 07/27] irqchip: Declare cortex-a7's irqchip to initialize
 gic from dt
Date: Thu, 10 Apr 2014 19:37:12 +0900
Message-ID: <002e01cf54a8$d59897e0$80c9c7a0$@samsung.com>
References: <1397122124-15690-1-git-send-email-cw00.choi@samsung.com>
 <1397122124-15690-8-git-send-email-cw00.choi@samsung.com>
 <878urd33g4.fsf@approximate.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:19798 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934795AbaDJKhN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 06:37:13 -0400
In-reply-to: <878urd33g4.fsf@approximate.cambridge.arm.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marc Zyngier' <marc.zyngier@arm.com>, 'Chanwoo Choi' <cw00.choi@samsung.com>
Cc: mark.rutland@arm.com, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, hyunhee.kim@samsung.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, yj44.cho@samsung.com, inki.dae@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, 'Thomas Gleixner' <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org

Hi,

> -----Original Message-----
> From: linux-arm-kernel [mailto:linux-arm-kernel-
> bounces@lists.infradead.org] On Behalf Of Marc Zyngier
> Sent: Thursday, April 10, 2014 7:05 PM
> To: Chanwoo Choi
> Cc: mark.rutland@arm.com; linux-samsung-soc@vger.kernel.org;
> t.figa@samsung.com; hyunhee.kim@samsung.com; sw0312.kim@samsung.com;
> linux-kernel@vger.kernel.org; yj44.cho@samsung.com; inki.dae@samsung.com;
> kyungmin.park@samsung.com; kgene.kim@samsung.com; Thomas Gleixner;
> linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH 07/27] irqchip: Declare cortex-a7's irqchip to
> initialize gic from dt
> 
> On Thu, Apr 10 2014 at 10:28:24 am BST, Chanwoo Choi
> <cw00.choi@samsung.com> wrote:
> > This patch declare coretex-a7's irqchip to initialze gic from dt
> > with "arm,cortex-a7-gic" data.
> >
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  drivers/irqchip/irq-gic.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
> > index 4300b66..8e906e4 100644
> > --- a/drivers/irqchip/irq-gic.c
> > +++ b/drivers/irqchip/irq-gic.c
> > @@ -1069,6 +1069,7 @@ gic_of_init(struct device_node *node, struct
> device_node *parent)
> >  }
> >  IRQCHIP_DECLARE(cortex_a15_gic, "arm,cortex-a15-gic", gic_of_init);
> >  IRQCHIP_DECLARE(cortex_a9_gic, "arm,cortex-a9-gic", gic_of_init);
> > +IRQCHIP_DECLARE(cortex_a7_gic, "arm,cortex-a7-gic", gic_of_init);
> >  IRQCHIP_DECLARE(msm_8660_qgic, "qcom,msm-8660-qgic", gic_of_init);
> >  IRQCHIP_DECLARE(msm_qgic2, "qcom,msm-qgic2", gic_of_init);
> 
> Frankly, this patch adds no value. Are we going to add
> "arm,cortex-a12-gic", "arm,cortex-a17-gic", "arm,cortex-a53-gic",
> "arm,cortex-a57-gic"? And that's just to mention the ARM Ltd cores...
> 
> Instead, how about defining a generic "arm,gic" property, and mandate
> that new DT files are using that? We can always use a more precise
> compatible for quirks.

I prefer it would be arm,gicv2 instead arm-gic.
In case of GICv3 of arm64, it can be arm,gicv3.

Best Regards,
Chanho Park
