From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH 4/4] Documentation: dt-bindings: Describe SROMc
 configuration
Date: Tue, 27 Oct 2015 09:59:43 +0300
Message-ID: <00b101d11085$0f9f7be0$2ede73a0$@samsung.com>
References: <cover.1445859834.git.p.fedin@samsung.com>
 <7ac097efc649bac4e9f2b991baaa969ce4cbc3ef.1445859834.git.p.fedin@samsung.com>
 <562F0795.10900@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:23102 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751572AbbJ0G7r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Oct 2015 02:59:47 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWV00A31A3LEH40@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Oct 2015 06:59:45 +0000 (GMT)
In-reply-to: <562F0795.10900@samsung.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Pankaj Dubey' <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: 'Kukjin Kim' <kgene@kernel.org>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Russell King' <linux@arm.linux.org.uk>

 Hello!

> > +Bank configurations can be defined as an optional subnodes. They can have the
> > +following properties:
> > +- bank : bank number (0 - 3)
> > +- width : data width in bytes (1 or 2). If omitted, default of 1 is used.
> > +- srom-timing : array of 7 integers: Tacp, Tcah, Tcoh, Tacc, Tcos, Tacs
> > +
> 
> I think these will be optional properties as all Exynos SoC may not be
> having these. So better to add them under "Optional Properties" heading,
> and move this above the "-Example" heading

 Not really. Actually 'bank' is not optional, because it actually identifies to which bank properties are applied, and srom-timings
are settings by themselves. Without both of them the definition just doesn't make sense. The only really optional specifier is
'width', which has a default.
 Could you give me an example of how to write this correctly?

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
