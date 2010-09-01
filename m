From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] MAX8952 PMIC Driver Initial Release
Date: Wed, 01 Sep 2010 19:05:39 +0900
Message-ID: <000901cb49bd$3df19440$b9d4bcc0$%kim@samsung.com>
References: <1282283036-12641-1-git-send-email-myungjoo.ham@samsung.com>
	<20100820095351.GD13668@rakim.wolfsonmicro.main>
	<1282301229.3084.152.camel@odin>
	<011b01cb496a$cfa773d0$6ef65b70$%kim@samsung.com>
	<20100901091519.GA17032@opensource.wolfsonmicro.com>
	<000801cb49ba$3e1e50f0$ba5af2d0$%kim@samsung.com>
	<20100901094826.GA28490@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20100901094826.GA28490@sirena.org.uk>
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
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, myungjoo.ham@gmail.com, 'MyungJoo Ham' <myungjoo.ham@samsung.com>, 'Changhwan Youn' <chaos.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, 'Liam Girdwood' <lrg@slimlogic.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Mark Brown wrote:
> 
> On Wed, Sep 01, 2010 at 06:44:11PM +0900, Kukjin Kim wrote:
> 
> > MM...but I'm not sure if I can submit other patch for max8952...
> > Actually, Mr. Ham's max8952 code has been applied by Liam.
> 
> We can always remove that if it makes more sense to combine the code.
> 
> > -	return (MAX8649_DCDC_VMIN + index * MAX8649_DCDC_STEP);
> > +	struct max8649_regulator_info *info = rdev_get_drvdata(rdev);
> > +	int ret = MAX8649_DCDC_VMIN + index * MAX8649_DCDC_STEP;
> > +
> > +	if (!strcmp(info->i2c->name, "max8952"))
> 
> Rather than doing a strcmp on the name you should use the id field here:
> 
Ok..will fix it.

> >  static const struct i2c_device_id max8649_id[] = {
> >  	{ "max8649", 0 },
> > +	{ "max8952", 0 },
> >  	{ }
> >  };
> 
> to pass in a value which you compare against.  While it's probably not a
> performance issue on this chip this is much clearer and more idiomatic.

Thanks for your review and suggestion.
Will submit as per your comments.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
