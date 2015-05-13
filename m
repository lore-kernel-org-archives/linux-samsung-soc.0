From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv5 4/5] ARM: dts: exynos5420 update the cooling cells for
 core cpu0
Date: Wed, 13 May 2015 17:05:27 +0900
Message-ID: <CAJKOXPcxrdkwZmHKfw+YWJ4=XDBTTutK_5-d6SmZ8QQGKyvfCA@mail.gmail.com>
References: <1431499020-3912-1-git-send-email-linux.amoon@gmail.com>
	<1431499020-3912-5-git-send-email-linux.amoon@gmail.com>
	<CAJKOXPdKtMO3f8YzHXtuZ042jkFRL4wa978=TggSQk8FahubRg@mail.gmail.com>
	<CANAwSgTa=7rjcocYocxn+yv6AdH1PVtNu2NTZV6BWgBK3RXCDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f46.google.com ([209.85.216.46]:37406 "EHLO
	mail-vn0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932791AbbEMIF2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 04:05:28 -0400
In-Reply-To: <CANAwSgTa=7rjcocYocxn+yv6AdH1PVtNu2NTZV6BWgBK3RXCDw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Markus Reichl <m.reichl@fivetechno.de>, Eduardo Valentin <edubezval@gmail.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

2015-05-13 16:58 GMT+09:00 Anand Moon <linux.amoon@gmail.com>:
> Hi Krzysztof,
>
> You are correct.
>
> #cooling-cells property are required by the thermal-zone.
>
> http://lxr.free-electrons.com/source/drivers/thermal/of-thermal.c#L607
>
> So I picked this values from earlier series of CPU frequency by Thomas.
>
> Hope this explains the changes. I will update the commit log.

I still don't get it. I do not ask about cooling-cells but levels.

>>> +
>>> +                       cooling-min-level = <10>;
>>> +                       cooling-max-level = <7>;
>>> +                       #cooling-cells = <2>; /* min followed by max */

Which cooling levels are referenced here? Where are they defined?

Please, don't top-post.

Krzysztof
