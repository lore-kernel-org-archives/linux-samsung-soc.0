From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 07/14] regulator: s2mps11: Copy supported regulators
 from initconst
Date: Fri, 14 Feb 2014 08:46:59 +0100
Message-ID: <1392364019.29133.11.camel@AMDC1943>
References: <1392282847-25444-1-git-send-email-k.kozlowski@samsung.com>
 <1392282847-25444-8-git-send-email-k.kozlowski@samsung.com>
 <20140213190730.GB28112@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:27911 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751145AbaBNHrD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Feb 2014 02:47:03 -0500
In-reply-to: <20140213190730.GB28112@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>

On Thu, 2014-02-13 at 19:07 +0000, Mark Brown wrote:
> On Thu, Feb 13, 2014 at 10:14:00AM +0100, Krzysztof Kozlowski wrote:
> 
> > -	for (i = 0; i < S2MPS11_REGULATOR_CNT; i++)
> > +	s2mps11->rdev = devm_kzalloc(&pdev->dev,
> > +			sizeof(*s2mps11->rdev)*rdev_num, GFP_KERNEL);
> > +	if (!s2mps11->rdev)
> > +		return -ENOMEM;
> 
> If we're using managed allocations do we actually need to keep the rdev
> table at all?  We only normally use it to free.

You're right, the "s2mps11->rdev" is not needed at all.

> 
> > +	rdata = devm_kzalloc(&pdev->dev, sizeof(*rdata)*rdev_num, GFP_KERNEL);
> > +	if (!rdata)
> > +		return -ENOMEM;
> > +
> 
> > +	/* rdata was needed only for of_regulator_match() during probe */
> > +	if (rdata)
> > +		devm_kfree(&pdev->dev, rdata);
> > +
> 
> If this is always going to be freed within the probe path (in the same
> function indeed) why is it a managed allocaton at all?

Actually no good reason, simplifies a little the return statements on
error conditions. I'll use kzalloc() and kfree().

Best regards,
Krzysztof
