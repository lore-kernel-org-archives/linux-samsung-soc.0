From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] mfd: sec-irq: fix support for devices without irq specified
Date: Fri, 08 Aug 2014 14:44:20 +0200
Message-ID: <2973458.9hVm8HXmvI@amdc1032>
References: <22704524.WE4thfvSda@amdc1032> <1407483274.21474.1.camel@AMDC1943>
 <1407484136.21474.8.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:62095 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755485AbaHHMo2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Aug 2014 08:44:28 -0400
In-reply-to: <1407484136.21474.8.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Sangbeom Kim <sbkim73@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On Friday, August 08, 2014 09:48:56 AM Krzysztof Kozlowski wrote:
> On pi=C4=85, 2014-08-08 at 09:34 +0200, Krzysztof Kozlowski wrote:
> > On czw, 2014-08-07 at 18:48 +0200, Bartlomiej Zolnierkiewicz wrote:
> > > [ added missing linux-samsung-soc ML, sorry for the noise ]
> > >=20
> > > On Thursday, August 07, 2014 06:42:28 PM Bartlomiej Zolnierkiewic=
z wrote:
> > > > Add missing check for the case of device without irq specified
> > > > in sec_irq_exit() (please note that sec_irq_init() already
> > > > correctly handles such devices).
> > > >=20
> > > > This is needed for Insignal's Exynos4412 based Origen board.
> > > >=20
> > > > Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > > > Cc: Sangbeom Kim <sbkim73@samsung.com>
> > > > Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.=
com>
> > > > Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> > > > ---
> > > > patch is against next-20140804 branch of linux-next kernel
> > > >=20
> > > >  drivers/mfd/sec-irq.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > Looks and works good (tested on board with S2MPS14).
> >=20
> > Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >=20
> > Best regards,
> > Krzysztof
> >=20
> > > >=20
> > > > diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> > > > index f9a5786..b65a7f0 100644
> > > > --- a/drivers/mfd/sec-irq.c
> > > > +++ b/drivers/mfd/sec-irq.c
> > > > @@ -478,5 +478,6 @@ int sec_irq_init(struct sec_pmic_dev *sec_p=
mic)
> > > > =20
> > > >  void sec_irq_exit(struct sec_pmic_dev *sec_pmic)
> > > >  {
> > > > -	regmap_del_irq_chip(sec_pmic->irq, sec_pmic->irq_data);
> > > > +	if (sec_pmic->irq)
> > > > +		regmap_del_irq_chip(sec_pmic->irq, sec_pmic->irq_data);
> > > >  }
>=20
> Seems I jumped too far with this one. Patch looks OK and works fine b=
ut
> is it really needed? If (!sec_pmic->irq) then sec_pmic->irq_data will=
 be
> NULL and regmap_del_irq_chip() will handle it correctly.
>=20
> Your change adds some sense of precautions (the sec_pmic->irq_data ma=
y
> be set by some other module by mistake) but still it does not look li=
ke
> "needed" for Origen.

Indeed, I somehow assumed that regmap_del_irq_chip() doesn't check for
NULL 'struct regmap_irq_chip_data *d' argument.  Since such check is
actually present in regmap_del_irq_chip() the patch is not needed and
can be dropped.  Thanks for noticing this.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
