From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH] ARM: exynos: Bring back reboot on Exynos5410
Date: Thu, 29 Oct 2015 11:43:22 +0300
Message-ID: <002801d11225$dedab4a0$9c901de0$@samsung.com>
References: <1446024965-8508-1-git-send-email-p.fedin@samsung.com>
 <56317960.9070608@samsung.com>
 <CAGcde9H4WVt34rn6_9H+sVu2Bp2xq4awMiwV1zgv1D6posPWSg@mail.gmail.com>
 <006c01d11218$d6e2d500$84a87f00$@samsung.com> <5631D8E5.6090506@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:8831 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751261AbbJ2In0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Oct 2015 04:43:26 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWZ003NU48B9C40@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Oct 2015 08:43:23 +0000 (GMT)
In-reply-to: <5631D8E5.6090506@samsung.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Pankaj Dubey' <pankaj.dubey@samsung.com>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 'Kukjin Kim' <kgene@kernel.org>

 Hello!

> These patches are not adding any new code, except DT entry. Infact
> restart handler will be removed from PMU driver and we will be using
> generic syscon based implementation for reboot, which is already present
> in Linux kernel.

 Ah, got it. So syscon is a very generic thing, allowing to describe whatever reset register for whatever board, since we are specifying both address and value to write there. Is my understanding correct? If so, then, OK, you can do this too.

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
