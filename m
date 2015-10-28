From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [GIT PULL 4/5] Late Samsung driver updates for v4.4
Date: Wed, 28 Oct 2015 11:00:45 +0300
Message-ID: <000801d11156$c0e0c270$42a24750$@samsung.com>
References: <562AA40E.4050407@kernel.org> <562AA603.7040600@kernel.org>
 <56307B33.90608@samsung.com> <000101d11155$1f8d6eb0$5ea84c10$@samsung.com>
 <56307FEA.6090207@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:14198 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753385AbbJ1IAu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Oct 2015 04:00:50 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWX006YM7LBTS40@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Oct 2015 08:00:47 +0000 (GMT)
In-reply-to: <56307FEA.6090207@samsung.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>, arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

 Hello!

> The Exynos5410 in current form does not have suspend capability. During
> boot you should see in dmesg:
> 	Failed to find PMU node
> coming from mach-exynos/suspend.c.

 Indeed. By the way, can this be a reason why reboot stopped working? It worked in v4.1. Isn't this a regression?
 Ok, nevertheless, here is v3 of my patchset.

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
