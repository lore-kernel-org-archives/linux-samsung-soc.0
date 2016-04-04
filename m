From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: [PATCH] ARM: dts: exynos-5422-odroid: Remove always_on for eMMC
 and SD regulators
Date: Mon, 4 Apr 2016 10:38:36 +0200
Message-ID: <5702280C.1080905@fivetechno.de>
References: <56FE898F.4050404@fivetechno.de> <5701B731.2030806@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:57923 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753219AbcDDIij (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Apr 2016 04:38:39 -0400
In-Reply-To: <5701B731.2030806@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: c Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi Krzysztof,  

Am 04.04.2016 um 02:37 schrieb Krzysztof Kozlowski:
> On 01.04.2016 23:45, Markus Reichl wrote:
>> Allow these suplies to be switched off if not used.
> 
> s/suplies/supplies/

Will correct it.

> 
>>
>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
>> ---
>> Tested with eMMC only on XU4.
>> SD still needs testing.
> 
> I wanted to test your patches but the first does not apply
> (next-20160401, my for-next) so I gave up.

Will check and base on next-20160401.

> 
> I think this patch should be squashed with previous one. I don't see
> benefits of splitting this (but maybe I am missing something?).

Will sqash them into one.

> 
> Best regards,
> Krzysztof
> 
Servus,
--
Markus Reichl
