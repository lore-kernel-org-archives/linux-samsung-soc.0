From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/4] mach-s5pv210: Add platform definitions for mipi-csis
Date: Fri, 03 Dec 2010 17:32:42 +0900
Message-ID: <014a01cb92c4$a9af62c0$fd0e2840$%kim@samsung.com>
References: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
	<1291307862-8125-2-git-send-email-s.nawrocki@samsung.com>
	<012301cb92a1$a7020af0$f50620d0$%kim@samsung.com>
	<AANLkTi=bARGdX2Y4Ea-YP8qQRcjAXme8NW9Mp-0dTxgZ@mail.gmail.com>
	<014901cb92c2$d9c9e8b0$8d5dba10$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <014901cb92c2$d9c9e8b0$8d5dba10$%kim@samsung.com>
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
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Kukjin Kim wrote:
> =

> Kyungmin Park wrote:
> >

One more..

> > > And I'm confused about the name of MIPI-CSI...
> > > Hmm...used MIPICSI or MIPI_CSI, sometimes MIPICSIS or MIPI_CSIS.
> > >
> > > Maybe the meaning is Camera Serial Interface Slave...
> > > So...how about to use just one such as "IRQ_MIPI_CSIS" and
> > > "S5PV210_PA_MIPI_CSIS".
> >
> > I think it's better use the common word, CSI. I can't find CSIS word
> > at googling.
> >
> But used it in datasheet. How about FIMC, I think, it depends on usage of
> datasheet.
> =

However, if required, it can be changed...
I meant to use written name in datasheet is better to us.

> > >
> > > ---
> > > @@ -65,7 +65,7 @@
> > > =A0#define IRQ_HSMMC0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC1(26)
> > > =A0#define IRQ_HSMMC1 =A0 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC1(27)
> > > =A0#define IRQ_HSMMC2 =A0 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC1(28)
> > > -#define IRQ_MIPICSI =A0 =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC1(29)
> > > +#define IRQ_MIPI_CSIS =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC1(29)
> > > =A0#define IRQ_MIPIDSI =A0 =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC1(30)
> > > =A0#define IRQ_ONENAND_AUDI =A0 =A0 =A0 S5P_IRQ_VIC1(31)
> > >
> > > @@ -132,5 +132,6 @@
> > > =A0#define IRQ_LCD_FIFO =A0 =A0 =A0 =A0 =A0 IRQ_LCD0
> > > =A0#define IRQ_LCD_VSYNC =A0 =A0 =A0 =A0 =A0IRQ_LCD1
> > > =A0#define IRQ_LCD_SYSTEM =A0 =A0 =A0 =A0 IRQ_LCD2
> > > +#define IRQ_MIPI_CSIS0 =A0 =A0 =A0 =A0 IRQ_MIPI_CSIS
> >
> > In this case, I can't find any good reason since it's first used.
> > as s3c series used the different names compare to s5p series. it's
> > okay make these wrapper.
> > but it's new one and not used previous time.
> >
> I already commented about that.
> Shortly, IRQ_MIPI_CSIS0 is used as common name for S5PV210 and S5PV310 in
> plat-s5p.
> And IRQ_MIPI_CSI is used as specific name on S5PV210. So needed it.
> =

To use IRQ_MIPI_CSIS means just one on S5PV210.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
