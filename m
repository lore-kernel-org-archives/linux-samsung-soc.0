From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Fix compilation error with s3c2410_defconfig
Date: Wed, 08 Aug 2012 20:36:08 +0900
Message-ID: <0b1301cd755a$011e1eb0$035a5c10$%kim@samsung.com>
References: <1344333546-16995-1-git-send-email-tushar.behera@linaro.org>
 <098f01cd7488$0d66d630$28348290$%kim@samsung.com>
 <5020F568.5020204@linaro.org>
 <0a2d01cd7500$53e26c50$fba744f0$%kim@samsung.com>
 <20120808061102.GA22417@avionic-0098.mockup.avionic-design.de>
 <0abe01cd752f$4f96ad80$eec40880$%kim@samsung.com>
 <20120808065046.GA30832@avionic-0098.mockup.avionic-design.de>
 <0af001cd7550$1af66040$50e320c0$%kim@samsung.com>
 <20120808110713.GC20296@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58091 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754615Ab2HHLgK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Aug 2012 07:36:10 -0400
In-reply-to: <20120808110713.GC20296@avionic-0098.mockup.avionic-design.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thierry Reding' <thierry.reding@avionic-design.de>
Cc: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, s.hauer@pengutronix.de, patches@linaro.org, 'Jingoo Han' <jg1.han@samsung.com>

Thierry Reding wrote:
> 
> On Wed, Aug 08, 2012 at 07:25:17PM +0900, Kukjin Kim wrote:
> > Thierry Reding wrote:
> > >
> > > On Wed, Aug 08, 2012 at 03:30:32PM +0900, Kukjin Kim wrote:
> >

[...]

> He (she?) sent two patches:
> 
He :-)

> 	https://lkml.org/lkml/2012/8/2/108
> 	https://lkml.org/lkml/2012/8/2/109
> 
> And followed-up with the following three:
> 
> 	https://lkml.org/lkml/2012/8/3/47
> 	https://lkml.org/lkml/2012/8/3/44
> 	https://lkml.org/lkml/2012/8/3/45
> 
Thanks for above list-up and if any comments, let you know.

[...]


> Yes, that looks good to me. Do you want me to take that through the PWM
> tree or would you rather take it through yours?
> 
Thanks. Since the error happens in arch/arm/ part and this patch touches
some arch/arm/ files, would be better if this could be sent to upstream via
samsung tree. Of course, if your ack, would be nice to me ;-)

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
