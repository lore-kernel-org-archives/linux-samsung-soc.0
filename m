From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] mfd: sec-irq: fix support for devices without irq specified
Date: Fri, 08 Aug 2014 09:48:56 +0200
Message-ID: <1407484136.21474.8.camel@AMDC1943>
References: <22704524.WE4thfvSda@amdc1032> <1471646.xbSCysvkpT@amdc1032>
 <1407483274.21474.1.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:42250 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753781AbaHHHsz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Aug 2014 03:48:55 -0400
In-reply-to: <1407483274.21474.1.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Sangbeom Kim <sbkim73@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On pi=C4=85, 2014-08-08 at 09:34 +0200, Krzysztof Kozlowski wrote:
> On czw, 2014-08-07 at 18:48 +0200, Bartlomiej Zolnierkiewicz wrote:
> > [ added missing linux-samsung-soc ML, sorry for the noise ]
> >=20
> > On Thursday, August 07, 2014 06:42:28 PM Bartlomiej Zolnierkiewicz =
wrote:
> > > Add missing check for the case of device without irq specified
> > > in sec_irq_exit() (please note that sec_irq_init() already
> > > correctly handles such devices).
> > >=20
> > > This is needed for Insignal's Exynos4412 based Origen board.
> > >=20
> > > Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > > Cc: Sangbeom Kim <sbkim73@samsung.com>
> > > Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.co=
m>
> > > Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> > > ---
> > > patch is against next-20140804 branch of linux-next kernel
> > >=20
> > >  drivers/mfd/sec-irq.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> Looks and works good (tested on board with S2MPS14).
>=20
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>=20
> Best regards,
> Krzysztof
>=20
> > >=20
> > > diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> > > index f9a5786..b65a7f0 100644
> > > --- a/drivers/mfd/sec-irq.c
> > > +++ b/drivers/mfd/sec-irq.c
> > > @@ -478,5 +478,6 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmi=
c)
> > > =20
> > >  void sec_irq_exit(struct sec_pmic_dev *sec_pmic)
> > >  {
> > > -	regmap_del_irq_chip(sec_pmic->irq, sec_pmic->irq_data);
> > > +	if (sec_pmic->irq)
> > > +		regmap_del_irq_chip(sec_pmic->irq, sec_pmic->irq_data);
> > >  }

Seems I jumped too far with this one. Patch looks OK and works fine but
is it really needed? If (!sec_pmic->irq) then sec_pmic->irq_data will b=
e
NULL and regmap_del_irq_chip() will handle it correctly.

Your change adds some sense of precautions (the sec_pmic->irq_data may
be set by some other module by mistake) but still it does not look like
"needed" for Origen.

Best regards,
Krzysztof
