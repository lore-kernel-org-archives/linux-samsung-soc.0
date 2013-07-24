From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 6/6] ARM: S3C24XX: Convert s3c2416 and s3c2443 to common
 clock framework
Date: Wed, 24 Jul 2013 16:01:18 +0200
Message-ID: <2889437.fCIi7koiPh@amdc1227>
References: <201307100057.06061.heiko@sntech.de> <2236509.stVfXyPhpt@amdc1227>
 <0ee601ce886d$abb6a690$0323f3b0$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36043 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750963Ab3GXOBZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 10:01:25 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MQG00A5U1KV0040@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 15:01:22 +0100 (BST)
In-reply-to: <0ee601ce886d$abb6a690$0323f3b0$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Heiko =?ISO-8859-1?Q?St=FCbner=27?= <heiko@sntech.de>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Russell King' <linux@arm.linux.org.uk>

On Wednesday 24 of July 2013 21:59:45 Kukjin Kim wrote:
> Tomasz Figa wrote:
> 
> [...]
> 
> > > > +	timer@51000000 {
> > > > +		clocks = <&clocks PCLK_PWM>;
> > > 
> > > +		clocks = <&clock PCLK_PWM>;
> > > 
> > > And I'm not sure using definition PCLK_PWM is better here...
> > 
> > Care to explain your doubts about it? I think this is fine.
> 
> I mean I don't know why someone use a hard value(number) and someone use
> the definition...

Since preprocessor support for dts files was introduced, definitions are 
preferred, wherever possible to specify constants.

Best regards,
Tomasz
