From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCHv5 1/5] ARM: dts: exynos5422-odroidxu3 Add pwm-fan node
 tothe Odroid-XU3 board
Date: Wed, 13 May 2015 17:17:42 +0900
Message-ID: <555308A6.308@kernel.org>
References: <1431499020-3912-1-git-send-email-linux.amoon@gmail.com> <1431499020-3912-2-git-send-email-linux.amoon@gmail.com> <CAJKOXPefJwqvfZPDovQ6EjEOBfuJkidgeYDF_=KC9O+=2=_KoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:40886 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932611AbbEMIRz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 04:17:55 -0400
In-Reply-To: <CAJKOXPefJwqvfZPDovQ6EjEOBfuJkidgeYDF_=KC9O+=2=_KoQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Anand Moon <linux.amoon@gmail.com>, Eduardo Valentin <edubezval@gmail.com>, Lukasz Majewski <l.majewski@samsung.com>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Markus Reichl <m.reichl@fivetechno.de>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>

On 05/13/15 16:11, Krzysztof Kozlowski wrote:
> 2015-05-13 15:36 GMT+09:00 Anand Moon <linux.amoon@gmail.com>:
>> Add pwm-fan node to the Odroid-XU3 board.
>>
>> Tested-by: Markus Reichl <m.reichl@fivetechno.de>
>> Acked-by: Lukasz Majewski <l.majewski@samsung.com>
>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> 
> Please fix the title of commit (missing colon, duplicated name of board) to:
> "ARM: dts: exynos5422-odroidxu3: Add pwm-fan node"
> 
Well, I'd preferred to use the following format:
"ARM: dts: add pwm-fan node for exynos5422-odroidxu3"

But I can change it when I apply it ;-)

> Rest looks good:
> Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
Thanks,
Kukjin
