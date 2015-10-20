From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH v4 6/8] drivers: soc: add support for exynos SROM driver
Date: Tue, 20 Oct 2015 11:17:00 +0300
Message-ID: <021201d10b0f$b273bf00$175b3d00$@samsung.com>
References: <1445255206-11148-1-git-send-email-pankaj.dubey@samsung.com>
 <1445255206-11148-7-git-send-email-pankaj.dubey@samsung.com>
 <56258683.7070204@samsung.com> <5625B92C.10505@samsung.com>
 <5625C07D.4030706@samsung.com> <014301d10b01$488873f0$d9995bd0$@samsung.com>
 <5625E3B9.8040707@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41390 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752464AbbJTIRF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Oct 2015 04:17:05 -0400
In-reply-to: <5625E3B9.8040707@samsung.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Pankaj Dubey' <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, thomas.ab@samsung.com

 Hello!

> >  Pin controller is needed in order to configure multi-functional pins correctly.
> 
> Are there any obstacles for upstreaming it?

 I don't know. The last post on this topic is from March, 2015:
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-March/330862.html. Patch 0003 has been acked-by, and nothing more since
that.
 Actually, only 0002 and 0003 of this series are needed for the pin controller. 0001 has been accepted
(27284129522e7e2a5b89e80bd44ea3345f79c9e8).

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
