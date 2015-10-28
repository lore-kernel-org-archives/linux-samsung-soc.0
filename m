From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [GIT PULL 4/5] Late Samsung driver updates for v4.4
Date: Wed, 28 Oct 2015 12:02:11 +0300
Message-ID: <001d01d1115f$556b3670$0041a350$@samsung.com>
References: <562AA40E.4050407@kernel.org> <562AA603.7040600@kernel.org>
 <56307B33.90608@samsung.com> <000101d11155$1f8d6eb0$5ea84c10$@samsung.com>
 <56307FEA.6090207@samsung.com> <000801d11156$c0e0c270$42a24750$@samsung.com>
 <563081DE.9010500@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:18265 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754826AbbJ1JCO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Oct 2015 05:02:14 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWX006MVAFOB960@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Oct 2015 09:02:12 +0000 (GMT)
In-reply-to: <563081DE.9010500@samsung.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>, arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

 Hello!

> The noticeable change between v4.1 and v4.2 was for example:
> c4241a582d22 ("ARM: EXYNOS: use PS_HOLD based poweroff for all supported
> SoCs")

 First of all, sorry for misinforming you. It was not v4.1 which worked, but 3.18 one. I never ran 4.1 on this board, it's my
memory's fault...
 Second, the commit which actually broke 5410 is 8cfc7fdd33080e30b86d21b1a8c9ad0686427ddc ("ARM: EXYNOS: move restart code into pmu
driver"). And we don't have 5410 PMU description in our DT, that's the problem.

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
