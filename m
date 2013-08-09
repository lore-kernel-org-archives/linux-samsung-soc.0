From: Chanho Park <chanho61.park@samsusng.com>
Subject: RE: [PATCHv2 1/5] drm/exynos: add device tree support for rotator
Date: Fri, 09 Aug 2013 19:29:50 +0900
Message-ID: <011101ce94eb$612ae6b0$2380b410$@samsusng.com>
References: <1376034053-31910-1-git-send-email-chanho61.park@samsung.com>
 <1376034053-31910-2-git-send-email-chanho61.park@samsung.com>
 <CAK9yfHwrE8pnc=jF+7=wuqyemmZFMi5WX+giXYizbP_yy34Wfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:64530 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966467Ab3HIK3w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Aug 2013 06:29:52 -0400
In-reply-to: <CAK9yfHwrE8pnc=jF+7=wuqyemmZFMi5WX+giXYizbP_yy34Wfw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Chanho Park' <chanho61.park@samsung.com>
Cc: inki.dae@samsung.com, kgene.kim@samsung.com, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, mark.rutland@arm.com, l.stach@pengutronix.de, s.nawrocki@samsung.com, tomasz.figa@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org

Hi Sachin,

> -----Original Message-----
> From: Sachin Kamat [mailto:sachin.kamat@linaro.org]
> Sent: Friday, August 09, 2013 6:49 PM
> To: Chanho Park
> Cc: inki.dae@samsung.com; kgene.kim@samsung.com; dri-
> devel@lists.freedesktop.org; kyungmin.park@samsung.com;
> mark.rutland@arm.com; l.stach@pengutronix.de; s.nawrocki@samsung.com;
> tomasz.figa@gmail.com; linux-samsung-soc@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; devicetree@vger.kernel.org
> Subject: Re: [PATCHv2 1/5] drm/exynos: add device tree support for
> rotator
> 
> Hi Chanho,
> 
> On 9 August 2013 13:10, Chanho Park <chanho61.park@samsung.com> wrote:
> > The exynos4 platform is only dt-based since 3.10, we should convert
> > driver data and ids to dt-based parsing methods. The rotator driver
> > has a limit table to get size limit of input picture. Each SoCs has
> > slightly different limit value compared with any others.
> > For example, exynos4210's max_size of RGB888 is 16k x 16k. But, others
> > have 8k x 8k. Another example the exynos5250 should have multiple of 2
> > pixel size for its X/Y axis. Thus, we should keep different tables for
> each of them.
> >
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_rotator.c |  109
> > ++++++++++++++++++++-------
> >  1 file changed, 81 insertions(+), 28 deletions(-)
> [snip]
> > +
> > +static const struct of_device_id exynos_rotator_match[] = {
> > +       {
> > +               .compatible = "samsung,exynos4210-rotator",
> > +               .data = &rot_limit_tbl_4210,
> > +       },
> > +       {
> > +               .compatible = "samsung,exynos4212-rotator",
> > +               .data = &rot_limit_tbl_4x12,
> > +       },
> > +       {
> > +               .compatible = "samsung,exynos5250-rotator",
> > +               .data = &rot_limit_tbl_5250,
> > +       },
> > +       {},
> > +};
> > +
> >  static int rotator_probe(struct platform_device *pdev)  {
> >         struct device *dev = &pdev->dev; @@ -645,8 +712,19 @@ static
> > int rotator_probe(struct platform_device *pdev)
> >                 return -ENOMEM;
> >         }
> >
> > -       rot->limit_tbl = (struct rot_limit_table *)
> > -
platform_get_device_id(pdev)->driver_data;
> > +       if (dev->of_node) {
> > +               const struct of_device_id *match;
> > +               match =
> > + of_match_node(of_match_ptr(exynos_rotator_match),
> 
> of_match_ptr is not needed since exynos_rotator_match is always compiled
> in.

OK. I'll remove it.
Thanks.

> 
> [snip]
> > -static struct platform_device_id rotator_driver_ids[] = {
> > -       {
> > -               .name           = "exynos-rot",
> > -               .driver_data    = (unsigned long)&rot_limit_tbl,
> > -       },
> > -       {},
> > -};
> > -
> >  static int rotator_clk_crtl(struct rot_context *rot, bool enable)  {
> >         if (enable) {
> > @@ -804,10 +857,10 @@ static const struct dev_pm_ops rotator_pm_ops =
> > {  struct platform_driver rotator_driver = {
> >         .probe          = rotator_probe,
> >         .remove         = rotator_remove,
> > -       .id_table       = rotator_driver_ids,
> >         .driver         = {
> >                 .name   = "exynos-rot",
> >                 .owner  = THIS_MODULE,
> >                 .pm     = &rotator_pm_ops,
> > +               .of_match_table = of_match_ptr(exynos_rotator_match),
> 
> ditto
> 
> --
> With warm regards,
> Sachin
