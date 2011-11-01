From: padma venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH 1/7] SPI: S3C64XX: Use bus clocks created using clkdev
Date: Tue, 1 Nov 2011 13:11:52 +0530
Message-ID: <CAAgF-Bf74OJu_OhkJ5vnMoak45ie3VfMxFRjJBO+Swx5o8edXA@mail.gmail.com>
References: <1316778827-24694-1-git-send-email-padma.v@samsung.com>
	<1316778827-24694-2-git-send-email-padma.v@samsung.com>
	<20110923231233.GE24631@ponder.secretlab.ca>
	<003301cc7ca3$3314dae0$993e90a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:46431 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751539Ab1KAHlx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Nov 2011 03:41:53 -0400
Received: by wyh15 with SMTP id 15so142243wyh.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Nov 2011 00:41:52 -0700 (PDT)
In-Reply-To: <003301cc7ca3$3314dae0$993e90a0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Padmavathi Venna <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, jassisinghbrar@gmail.com, ben-linux@fluff.org, s.nawrocki@samsung.com

Hi All,

On Tue, Sep 27, 2011 at 4:52 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
>
> Grant Likely wrote:
> >
> > On Fri, Sep 23, 2011 at 05:23:41PM +0530, Padmavathi Venna wrote:
> > > This patch modifies the driver to stop depending on the
> > > clock names being passed from platform and switch over
> > > to lookup clocks generic names using clkdev
> > >
> > > Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> >
> > Looks okay to me.
> >
> > Acked-by: Grant Likely <grant.likely@secretlab.ca>
> >
> > This series I imagine should go in via the arm-soc tree.
> >
> OK, if others ok to me, I will pick up this series so that it will be=
 sent
> to upstream via arm-soc.

Ping.
Any update on this.

Thanks
Padma
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
> >
> > > ---
> > > =A0drivers/spi/spi-s3c64xx.c | =A0 14 +++++---------
> > > =A01 files changed, 5 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.=
c
> > > index 019a716..dcf7e10 100644
> > > --- a/drivers/spi/spi-s3c64xx.c
> > > +++ b/drivers/spi/spi-s3c64xx.c
> > > @@ -971,6 +971,7 @@ static int __init s3c64xx_spi_probe(struct
> > platform_device *pdev)
> > > =A0 =A0 struct s3c64xx_spi_info *sci;
> > > =A0 =A0 struct spi_master *master;
> > > =A0 =A0 int ret;
> > > + =A0 char clk_name[16];
> > >
> > > =A0 =A0 if (pdev->id < 0) {
> > > =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev,
> > > @@ -984,11 +985,6 @@ static int __init s3c64xx_spi_probe(struct
> > platform_device *pdev)
> > > =A0 =A0 }
> > >
> > > =A0 =A0 sci =3D pdev->dev.platform_data;
> > > - =A0 if (!sci->src_clk_name) {
> > > - =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev,
> > > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Board init must call s3c64=
xx_spi_set_info()\n");
> > > - =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> > > - =A0 }
> > >
> > > =A0 =A0 /* Check for availability of necessary resource */
> > >
> > > @@ -1073,17 +1069,17 @@ static int __init s3c64xx_spi_probe(struc=
t
> > platform_device *pdev)
> > > =A0 =A0 =A0 =A0 =A0 =A0 goto err4;
> > > =A0 =A0 }
> > >
> > > - =A0 sdd->src_clk =3D clk_get(&pdev->dev, sci->src_clk_name);
> > > + =A0 sprintf(clk_name, "spi_busclk%d", sci->src_clk_nr);
> > > + =A0 sdd->src_clk =3D clk_get(&pdev->dev, clk_name);
> > > =A0 =A0 if (IS_ERR(sdd->src_clk)) {
> > > =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev,
> > > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Unable to acquire clock '%=
s'\n",
> sci->src_clk_name);
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Unable to acquire clock '%=
s'\n", clk_name);
> > > =A0 =A0 =A0 =A0 =A0 =A0 ret =3D PTR_ERR(sdd->src_clk);
> > > =A0 =A0 =A0 =A0 =A0 =A0 goto err5;
> > > =A0 =A0 }
> > >
> > > =A0 =A0 if (clk_enable(sdd->src_clk)) {
> > > - =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Couldn't enable clock =
'%s'\n",
> > > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sci->src_clk_name);
> > > + =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Couldn't enable clock =
'%s'\n",
> clk_name);
> > > =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EBUSY;
> > > =A0 =A0 =A0 =A0 =A0 =A0 goto err6;
> > > =A0 =A0 }
> > > --
> > > 1.7.4.4
> > >
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
