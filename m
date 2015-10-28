From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL 4/5] Late Samsung driver updates for v4.4
Date: Wed, 28 Oct 2015 16:57:30 +0900
Message-ID: <56307FEA.6090207@samsung.com>
References: <562AA40E.4050407@kernel.org> <562AA603.7040600@kernel.org>
 <56307B33.90608@samsung.com> <000101d11155$1f8d6eb0$5ea84c10$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:12993 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932286AbbJ1H5g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Oct 2015 03:57:36 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWX000VW7FY5S40@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Oct 2015 07:57:34 +0000 (GMT)
In-reply-to: <000101d11155$1f8d6eb0$5ea84c10$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Fedin <p.fedin@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>, arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 28.10.2015 16:49, Pavel Fedin wrote:
>  Hello!
> 
>> The question is - do you prefer us to send a following up patch or to
>> fix it by amending the commit?
>>
>> Here is a fix which can be squashed into these two commits:
> 
>  By the way, since we are discussing fixing these commits...
>  After hardcoded SROMc handling has been removed, Exynos5410-based machines stopped handling it entirely, because the description
> has never been added to exynos5410.dtsi (which does not include exynos5.dtsi). Shouldn't the description be added there too?

No, it is not needed.
The Exynos5410 in current form does not have suspend capability. During
boot you should see in dmesg:
	Failed to find PMU node
coming from mach-exynos/suspend.c.

In suspend.c there is no compatible for Exynos5410.

Best regards,
Krzysztof
