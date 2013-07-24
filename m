From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v2 6/6] ARM: S3C24XX: Convert s3c2416 and s3c2443 to common
 clock framework
Date: Wed, 24 Jul 2013 21:59:45 +0900
Message-ID: <0ee601ce886d$abb6a690$0323f3b0$@org>
References: <201307100057.06061.heiko@sntech.de>
 <201307100100.28992.heiko@sntech.de>
 <02cf01ce81f3$6777e5f0$3667b1d0$%kim@samsung.com> <2236509.stVfXyPhpt@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:16549 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751057Ab3GXM7r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 08:59:47 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQF003N9YRMF9S0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 21:59:46 +0900 (KST)
In-reply-to: <2236509.stVfXyPhpt@amdc1227>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>
Cc: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Russell King' <linux@arm.linux.org.uk>, 'Kukjin Kim' <kgene@kernel.org>

Tomasz Figa wrote:

[...]

> > > +	timer@51000000 {
> > > +		clocks = <&clocks PCLK_PWM>;
> >
> > +		clocks = <&clock PCLK_PWM>;
> >
> > And I'm not sure using definition PCLK_PWM is better here...
> 
> Care to explain your doubts about it? I think this is fine.
> 
I mean I don't know why someone use a hard value(number) and someone use the
definition...

- Kukjin
