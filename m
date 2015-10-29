From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH] ARM: exynos: Bring back reboot on Exynos5410
Date: Thu, 29 Oct 2015 10:10:05 +0300
Message-ID: <006c01d11218$d6e2d500$84a87f00$@samsung.com>
References: <1446024965-8508-1-git-send-email-p.fedin@samsung.com>
 <56317960.9070608@samsung.com>
 <CAGcde9H4WVt34rn6_9H+sVu2Bp2xq4awMiwV1zgv1D6posPWSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:60868 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752510AbbJ2HKJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Oct 2015 03:10:09 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWY002GSZWU9Z20@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Oct 2015 07:10:06 +0000 (GMT)
In-reply-to: <CAGcde9H4WVt34rn6_9H+sVu2Bp2xq4awMiwV1zgv1D6posPWSg@mail.gmail.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Pankaj Dubey' <pankaj.dubey@samsung.com>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 'Kukjin Kim' <kgene@kernel.org>

 Hello!

> Patch looks ok, but after Alim's patch series [1] to handle poweroff
> and reboot via generic syscon based driver gets merged, this will
> become redundant entry into PMU driver in the absence of any PMU  data
> for Exynos5410. Alim has taken care of adding power-off and reboot
> device node in exynos5410.dtsi [2].
> 
> [1]: http://www.spinics.net/lists/devicetree/msg98858.html
> [2]: http://www.spinics.net/lists/devicetree/msg98862.html

 I looked at those patches, IMHO they are too large for doing too small thing. What they do is basically describing two registers one-by-one and adding a separate per-register driver. Isn't it too much just for pushing a reset pin?
 May be we should just invent some generic "compatible" string, like "samsung,exynos-pmu" (or "Samsung,exynos-pmu-generic", if you want to be more specific), which would do the same as my patch currently does? This would be only several lines of code, achieving the same result.

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
