From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH v2 1/4] ARM: dts: Add SROMc to Exynos 5410
Date: Wed, 28 Oct 2015 10:06:57 +0300
Message-ID: <009001d1114f$3c7a1f60$b56e5e20$@samsung.com>
References: <cover.1445935215.git.p.fedin@samsung.com>
 <91ae80f172192fa4dbc8bf8ee5a9068661592de6.1445935215.git.p.fedin@samsung.com>
 <56302F1F.5090206@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59637 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964794AbbJ1HHB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Oct 2015 03:07:01 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWX006NV53MD530@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Oct 2015 07:06:58 +0000 (GMT)
In-reply-to: <56302F1F.5090206@samsung.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: 'Kukjin Kim' <kgene@kernel.org>, 'Pankaj Dubey' <pankaj.dubey@samsung.com>

 Hello!

> > +		sromc: sromc@12250000 {
> > +			compatible = "samsung,exynos-srom";
> > +			reg = <0x12250000 0x10>;
> 
> Isn't 0x10 too small (SROM_BC3 won't be mapped)?

 Muhaha, indeed, thanks for noticing this.
 By the way, i've just checked exynos4.dtsi and exynos5.dtsi, they specify the same size. Did reviewers overlook this small thing?
Shouldn't it be fixed then?

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
