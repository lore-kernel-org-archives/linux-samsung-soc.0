From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL 4/5] Late Samsung driver updates for v4.4
Date: Wed, 28 Oct 2015 17:05:50 +0900
Message-ID: <563081DE.9010500@samsung.com>
References: <562AA40E.4050407@kernel.org> <562AA603.7040600@kernel.org>
 <56307B33.90608@samsung.com> <000101d11155$1f8d6eb0$5ea84c10$@samsung.com>
 <56307FEA.6090207@samsung.com> <000801d11156$c0e0c270$42a24750$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:63011 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965130AbbJ1IF5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Oct 2015 04:05:57 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWX0044O7TVV750@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Oct 2015 08:05:55 +0000 (GMT)
In-reply-to: <000801d11156$c0e0c270$42a24750$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Fedin <p.fedin@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>, arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 28.10.2015 17:00, Pavel Fedin wrote:
>  Hello!
> 
>> The Exynos5410 in current form does not have suspend capability. During
>> boot you should see in dmesg:
>> 	Failed to find PMU node
>> coming from mach-exynos/suspend.c.
> 
>  Indeed. By the way, can this be a reason why reboot stopped working? It worked in v4.1. Isn't this a regression?
>  Ok, nevertheless, here is v3 of my patchset.

The noticeable change between v4.1 and v4.2 was for example:
c4241a582d22 ("ARM: EXYNOS: use PS_HOLD based poweroff for all supported
SoCs")

Can you try whether reverting it fixes the issue?

I don't recall any other changes which could affect Exynos5410.

Best regards,
Krzysztof
