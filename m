From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH v7 2/2] iommu/exynos: Add iommu driver for Exynos Platforms
Date: Tue, 06 Dec 2011 15:27:53 +0100
Message-ID: <009c01ccb423$3d9e95c0$b8dbc140$%szyprowski@samsung.com>
References: <1321609650-1329-1-git-send-email-pullip.cho@samsung.com>
 <1321609650-1329-3-git-send-email-pullip.cho@samsung.com>
 <007e01ccb40c$ed62bca0$c82835e0$%szyprowski@samsung.com>
 <CAHQjnOM9N8zJmiNnHfrN00jbF8Wk5WwtsBsuPsC2Xv0g_O1tdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:40438 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751007Ab1LFO17 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Dec 2011 09:27:59 -0500
In-reply-to: <CAHQjnOM9N8zJmiNnHfrN00jbF8Wk5WwtsBsuPsC2Xv0g_O1tdA@mail.gmail.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'KyongHo Cho' <pullip.cho@samsung.com>
Cc: 'Ohad Ben-Cohen' <ohad@wizery.com>, linux-samsung-soc@vger.kernel.org, 'Russell King' <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, 'Younglak Kim' <younglak1004.kim@samsung.com>, iommu@lists.linux-foundation.org, 'Kukjin Kim' <kgene.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 'Sanghyun Lee' <sanghyun75.lee@samsung.com>, linux-arm-kernel@lists.infradead.org

Hello,

On Tuesday, December 06, 2011 1:21 PM KyongHo Cho wrote:

> On Tue, Dec 6, 2011 at 8:48 PM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> > Hello,
> >
> > I'm trying to integrate your SYSMMU driver with my DMA-mapping & IO=
MMU
> > API integration patches. I've noticed some issues, please see my co=
mments below.
> >
> Thank you!
>=20
> > On Friday, November 18, 2011 10:48 AM KyongHo Cho wrote:
> >
> >> +
> >> +static int exynos_sysmmu_probe(struct platform_device *pdev)
> >> +{
> >> + =A0 =A0 struct resource *res, *ioarea;
> >> + =A0 =A0 int ret;
> >> + =A0 =A0 int irq;
> >> + =A0 =A0 struct device *dev;
> >> + =A0 =A0 void *sfr;
> >> + =A0 =A0 struct sysmmu_drvdata *data;
> >> + =A0 =A0 char *emsg;
> >> +
> >> + =A0 =A0 dev =3D &pdev->dev;
> >> +
> >> + =A0 =A0 if (dev_get_platdata(dev) =3D=3D NULL) {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 pr_debug("%s: No System MMU is assigned =
for %s.%d.\n", __func__,
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdev->na=
me, pdev->id);
> >> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> >> + =A0 =A0 }
> >> +
> >> + =A0 =A0 data =3D kzalloc(sizeof(*data), GFP_KERNEL);
> >> + =A0 =A0 if (!data) {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 emsg =3D "Not enough memory";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 goto err_alloc;
> >> + =A0 =A0 }
> >> +
> >> + =A0 =A0 data->owner =3D dev_get_platdata(dev);
> >> +
> >> + =A0 =A0 ret =3D dev_set_drvdata(dev, data);
> >> + =A0 =A0 if (ret) {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 emsg =3D "Unable to set driver data.";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 goto err_init;
> >> + =A0 =A0 }
> >> +
> >> + =A0 =A0 res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >> + =A0 =A0 if (!res) {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 emsg =3D "Failed probing system MMU: fai=
led to get resource.";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 goto err_init;
> >> + =A0 =A0 }
> >> +
> >> + =A0 =A0 ioarea =3D request_mem_region(res->start, resource_size(=
res),
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_name(dev));
> >> + =A0 =A0 if (ioarea =3D=3D NULL) {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 emsg =3D "failed to request memory regio=
n.";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 goto err_init;
> >> + =A0 =A0 }
> >> +
> >> + =A0 =A0 sfr =3D ioremap(res->start, resource_size(res));
> >> + =A0 =A0 if (!sfr) {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 emsg =3D "failed to call ioremap().";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOENT;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 goto err_ioremap;
> >> + =A0 =A0 }
> >> +
> >> + =A0 =A0 irq =3D platform_get_irq(pdev, 0);
> >> + =A0 =A0 if (irq <=3D 0) {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 emsg =3D "failed to get irq resource.";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D irq;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 goto err_irq;
> >> + =A0 =A0 }
> >> +
> >> + =A0 =A0 ret =3D request_irq(irq, exynos_sysmmu_irq, 0, dev_name(=
dev), data);
> >> + =A0 =A0 if (ret) {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 emsg =3D "failed to request irq.";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 goto err_irq;
> >> + =A0 =A0 }
> >> +
> >> + =A0 =A0 data->clk =3D clk_get(dev, "sysmmu");
> >> + =A0 =A0 if (IS_ERR(data->clk)) {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 emsg =3D "failed to get clock descriptor=
";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D PTR_ERR(data->clk);
> >> + =A0 =A0 =A0 =A0 =A0 =A0 goto err_clk;
> >> + =A0 =A0 }
> >> +
> >> + =A0 =A0 data->dev =3D dev;
> >> + =A0 =A0 data->sfrbase =3D sfr;
> >> + =A0 =A0 __set_fault_handler(data, &default_fault_handler);
> >> + =A0 =A0 rwlock_init(&data->lock);
> >
> > Here is a serious problem: __set_fault_handler takes data->lock whi=
ch is initialized after
> calling
> > this function.
> >
>=20
> Yeah, you're right. Thank you. I didn't notice it.
> I will fix it.
>=20
> >> +
> >> +static unsigned long *alloc_lv2entry(unsigned long *sent, unsigne=
d long iova,
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 short *pgcounter)
> >> +{
> >> + =A0 =A0 if (lv1ent_fault(sent)) {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 unsigned long *pent;
> >> +
> >> + =A0 =A0 =A0 =A0 =A0 =A0 pent =3D kzalloc(1024, GFP_KERNEL);
> >
> > I would use GFP_ATOMIC here. iommu_map() function might be called i=
n atomic context, and
> > GFP_KERNEL here causes kernel ops/warning.
>=20
> I wanted to avoid to allocate memory from emergency pool.
> Do you think that it needs to allocate memory with GFP_ATOMIC flag?

Otherwise it will very hard to get it integrated with DMA mapping frame=
work. GFP_ATOMIC
memory is allocated straight from system free lists, which are refilled=
 on the next=20
non-atomic allocation if the watermark level is low enough.=20

It will be best if iommu_map() can be extended with allocation flags ar=
gument, so the
caller can decide if iommu driver can use GFP_ATOMIC or GFP_KERNEL depe=
nding on the context.=20

Best regards
--=20
Marek Szyprowski
Samsung Poland R&D Center
