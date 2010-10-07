From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH 2/7] ARM: S5PC110: Fix wrong interrupt I2C2 number
Date: Thu, 07 Oct 2010 11:02:39 +0200
Message-ID: <018501cb65fe$677dfe40$3679fac0$%szyprowski@samsung.com>
References: <20100930044827.GA16901@july>
 <004401cb65bf$ec00b7a0$c40226e0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52503 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752721Ab0JGJCq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Oct 2010 05:02:46 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9W0036YX4K9T50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Oct 2010 18:02:44 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9W00H2VX4G7J@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Oct 2010 18:02:44 +0900 (KST)
In-reply-to: <004401cb65bf$ec00b7a0$c40226e0$%kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Kyungmin Park' <kmpark@infradead.org>, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

Hello,

On Thursday, October 07, 2010 3:35 AM Kukjin Kim wrote:

> Kyungmin Park wrote:
> >
> > From: Kyungmin Park <kyungmin.park@samsung.com>
> >
> > It's I2C2 interrupt number instead of CAN0.
> >
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  arch/arm/mach-s5pv210/include/mach/irqs.h |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/mach-s5pv210/include/mach/irqs.h b/arch/arm/mach-
> > s5pv210/include/mach/irqs.h
> > index cdb8ae4..5ab1833 100644
> > --- a/arch/arm/mach-s5pv210/include/mach/irqs.h
> > +++ b/arch/arm/mach-s5pv210/include/mach/irqs.h
> > @@ -55,8 +55,8 @@
> >  #define IRQ_SPI1		S5P_IRQ_VIC1(16)
> >  #define IRQ_SPI2		S5P_IRQ_VIC1(17)
> >  #define IRQ_IRDA		S5P_IRQ_VIC1(18)
> > -#define IRQ_CAN0		S5P_IRQ_VIC1(19)
> > -#define IRQ_CAN1		S5P_IRQ_VIC1(20)
> > +#define IRQ_IIC2		S5P_IRQ_VIC1(19)
> > +#define IRQ_I2C_HDMI_PHY	S5P_IRQ_VIC1(20)
> >  #define IRQ_HSIRX		S5P_IRQ_VIC1(21)
> >  #define IRQ_HSITX		S5P_IRQ_VIC1(22)
> >  #define IRQ_UHOST		S5P_IRQ_VIC1(23)
> > --
> 
> Please refer to my other comments.
> 
> Hmm...I think, no need to change to IRQ_I2C_HDMI_PHY...in here.
> If required, we can do it later...and how about IRQ_IIC_HDMI_PHY like other
> IRQ_IIC?

IMHO the best option would be to call it just IRQ_IIC3. This way it would be
possible just to use the dev-i2c3 from the next patch in this series (once a
dummy setup-i2c3 will be provided for s5pv210). Otherwise we would need to
create a special dev-i2c-hdmiphy.c just for this case what would be an overhead
imho.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
