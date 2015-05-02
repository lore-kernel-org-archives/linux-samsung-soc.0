From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH V4 2/2] ARM: dts: exynos5422-odroidxu3: add 'rtc_src'
 clock to rtc node
Date: Sat, 02 May 2015 14:14:20 +0900
Message-ID: <55445D2C.7030204@samsung.com>
References: <551A8991.7080706@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:33554 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750785AbbEBFO0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 May 2015 01:14:26 -0400
Received: by pdbnk13 with SMTP id nk13so111168595pdb.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 May 2015 22:14:25 -0700 (PDT)
In-Reply-To: <551A8991.7080706@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>, linux-samsung-soc@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, cw00.choi@samsung.com

W dniu 31.03.2015 o 20:48, Markus Reichl pisze:
> The Exynos5422 SoC has a s3c6410 RTC where the source clock
> is now a mandatory property.
> 
> This patch fixes probe failure of s3c-rtc on Odroid-XU3 boards.
> It is based on v4.0-rc2.
> 
> ---
> Changes since v3:
> 1. Readded slipped #include statement.
> Sorry for the mess.
> Changes since v2:
> 1. Dropped unused phandle.
> Changes since v1:
> 1. Dropped Documentation.
> 2. Split into 2 parts.
> 
> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>

Please re-send the patch with:
1. Accumulated reviews.
2. Signed-off-by and other tags BEFORE delimiter '---'

Best regards,
Krzysztof
