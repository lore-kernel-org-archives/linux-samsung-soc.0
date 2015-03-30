From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH V3 2/2] ARM: dts: exynos5422-odroidxu3: add 'rtc_src'
 clock to rtc node
Date: Mon, 30 Mar 2015 17:39:59 +0200
Message-ID: <CAJKOXPf+1hJgHbYrLS+UoGAJVys_q1oHs2779Qd6g9Oo7g-AUA@mail.gmail.com>
References: <55196DE2.4030109@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f54.google.com ([209.85.213.54]:35280 "EHLO
	mail-yh0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751659AbbC3PkA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Mar 2015 11:40:00 -0400
Received: by yhfw71 with SMTP id w71so7282001yhf.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Mar 2015 08:39:59 -0700 (PDT)
In-Reply-To: <55196DE2.4030109@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>

2015-03-30 17:38 GMT+02:00 Markus Reichl <m.reichl@fivetechno.de>:
> The Exynos5422 SoC has a s3c6410 RTC where the source clock
> is now a mandatory property.
>
> This patch fixes probe failure of s3c-rtc on Odroid-XU3 boards.
> It is based in v4.0-rc2.
>
> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> ---
> Changes since v2:
> 1. Dropped unused phandle.
> Changes since v1:
> 1. Dropped Documentation.
> 2. Split into 2 parts.
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
