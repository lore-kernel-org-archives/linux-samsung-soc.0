From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4412-odroid: add 'rtc_src' clock to rtc node
Date: Fri, 3 Apr 2015 10:25:59 +0200
Message-ID: <CAJKOXPe3s=LH3GBeBtrD3ZVCWXc_KU9Qd8Eu0u04qe0m7uFY2Q@mail.gmail.com>
References: <1426814952-13458-1-git-send-email-tjakobi@math.uni-bielefeld.de>
	<550B7A2C.4070403@samsung.com>
	<550BE0C1.4020500@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f46.google.com ([209.85.213.46]:33096 "EHLO
	mail-yh0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753727AbbDCI0A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Apr 2015 04:26:00 -0400
In-Reply-To: <550BE0C1.4020500@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, m.reichl@fivetechno.de
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org

2015-03-20 9:56 GMT+01:00 Javier Martinez Canillas
<javier.martinez@collabora.co.uk>:
>
> Hello,
>
> On 03/20/2015 02:38 AM, Chanwoo Choi wrote:
> > On 03/20/2015 10:29 AM, Tobias Jakobi wrote:
> >> From: Markus Reichl <m.reichl@fivetechno.de>
> >>
> >> The Exynos4412 SoC has a s3c6410 RTC where the source clock
> >> is now a mandatory property.
> >>
> >> This patch fixes probe failure of s3c-rtc on Odroid-X2/U2/U3 boards.
> >>
> >> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> >> Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> >> ---
> >>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 3 +++
> >>  1 file changed, 3 insertions(+)

Tested on Odroid-U3 board:
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

+CC Kukjin, linux-kernel, devicetree list.
Why this was not sent to Samsung-soc maintainer? Please, use
scripts/get_maintaiiner.pl script for getting the recipients list.

Best regards,
Krzysztof
