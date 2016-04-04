From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos-5422-odroid: Remove always_on for eMMC
 and SD regulators
Date: Mon, 04 Apr 2016 09:37:05 +0900
Message-ID: <5701B731.2030806@samsung.com>
References: <56FE898F.4050404@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:23698 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752454AbcDDAhM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Apr 2016 20:37:12 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O53003VS31XD540@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Apr 2016 01:37:09 +0100 (BST)
In-reply-to: <56FE898F.4050404@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 01.04.2016 23:45, Markus Reichl wrote:
> Allow these suplies to be switched off if not used.

s/suplies/supplies/

> 
> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> ---
> Tested with eMMC only on XU4.
> SD still needs testing.

I wanted to test your patches but the first does not apply
(next-20160401, my for-next) so I gave up.

I think this patch should be squashed with previous one. I don't see
benefits of splitting this (but maybe I am missing something?).

Best regards,
Krzysztof
