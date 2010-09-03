From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] regulators: add support max8952 regulator
Date: Sat, 04 Sep 2010 06:47:52 +0900
Message-ID: <01e301cb4bb1$ac1fa240$045ee6c0$%kim@samsung.com>
References: <1283476524-12820-1-git-send-email-kgene.kim@samsung.com>
 <20100903094200.GC8381@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:15425 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754075Ab0ICVrm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Sep 2010 17:47:42 -0400
In-reply-to: <20100903094200.GC8381@sirena.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Changhwan Youn' <chaos.youn@samsung.com>, lrg@slimlogic.co.uk

Mark Brown wrote:
> 
Hi,

Thanks for your review.

> On Fri, Sep 03, 2010 at 10:15:24AM +0900, Kukjin Kim wrote:
> 
> > +	ret2 = max8649_reg_read(info->i2c, MAX8649_CHIP_ID2);
> > +	if (ret2 < 0) {
> > +		dev_err(info->dev, "Failed to detect ID of %s:%d\n",
> > +			id->name, ret2);
> >  		goto out;
> >  	}
> 
> If the read fails you'll not set an error code when you jump to out so
> the probe will report success.  It might be clearer to have separate id
> variables which you store the read values into if they're OK, just from
> a legibility point of view.
> 
Ok..will fix it.

> > -	dev_info(info->dev, "Detected MAX8649 (ID:%x)\n", ret);
> > +	dev_info(info->dev, "Detected %s (ID:%x %x)\n", id->name, ret,
ret2);
> > +
> > +	info->type = id->driver_data;
> 
> It'd be nice to check that the type that was supplied matches the ID
> read from the chip in case the user got things wrong, just for
> defensiveness.

Ok..will modify as per your suggestion.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
