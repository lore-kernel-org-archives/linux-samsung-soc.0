From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: exynos-5422-odroid: Add eMMC and SD regulator
 supplies
Date: Tue, 05 Apr 2016 12:56:03 +0900
Message-ID: <57033753.5020906@samsung.com>
References: <57023A01.4070403@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:14041 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752360AbcDED4L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Apr 2016 23:56:11 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O5500H0E6XJAF80@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Apr 2016 04:56:07 +0100 (BST)
In-reply-to: <57023A01.4070403@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 04.04.2016 18:55, Markus Reichl wrote:
> Add vmmc and vqmmc supplies from MF circuit sheets for eMMC and SD on
> odroid XU3 and XU4 to avoid warnings in dmesg output and remove their
> always_on properties.
> 
> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> ---
> Changes in V2:
>     Sqashed two patches in one.
> 
> Tested with eMMC only on XU4.
> SD still needs testing.

I tested the SD card, everything looks fine. Applied with adjusted
commit message (the warnings I asked for should be mentioned). Thanks.

Best regards,
Krzysztof
