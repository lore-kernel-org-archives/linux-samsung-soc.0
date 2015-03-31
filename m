From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH V4 2/2] ARM: dts: exynos5422-odroidxu3: add 'rtc_src'
 clock to rtc node
Date: Tue, 31 Mar 2015 14:00:14 +0200
Message-ID: <551A8C4E.2030400@collabora.co.uk>
References: <551A8991.7080706@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:44340 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753969AbbCaMAT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Mar 2015 08:00:19 -0400
In-Reply-To: <551A8991.7080706@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>, linux-samsung-soc@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, cw00.choi@samsung.com

Hello Markus,

On 03/31/2015 01:48 PM, Markus Reichl wrote:
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
>

When you re-spin your patches with small changes, you should keep all
the {Reviewed,Tested,Acked}-by tags collected on previous versions so
the maintainer picking the patches knows who already reviewed the code.

Best regards,
Javier
