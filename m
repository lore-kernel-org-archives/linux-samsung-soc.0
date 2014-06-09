From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 0/5] Add Maxim 77802 PMIC support
Date: Mon, 09 Jun 2014 12:16:51 +0200
Message-ID: <1402309011.17650.9.camel@AMDC1943>
References: <1402306670-17041-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48482 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752679AbaFIKQ4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jun 2014 06:16:56 -0400
In-reply-to: <1402306670-17041-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Lee Jones <lee.jones@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Doug Anderson <dianders@chromium.org>, linux-samsung-soc@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Mark Brown <broonie@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Daniel Stone <daniels@collabora.com>

On pon, 2014-06-09 at 11:37 +0200, Javier Martinez Canillas wrote:
> MAX77802 is a PMIC that contains 10 high efficiency Buck regulators,
> 32 Low-dropout (LDO) regulators, two 32kHz buffered clock outputs,
> a Real-Time-Clock (RTC) and a I2C interface to program the individual
> regulators, clocks and the RTC.
> 
> This series are based on drivers added by Simon Glass to the Chrome OS
> kernel and adds support for the Maxim 77802 Power Management IC, their
> regulators, clocks, RTC and I2C interface. It is composed of patches:
> 
> [PATCH 1/5] mfd: Add driver for Maxim 77802 Power Management IC
> [PATCH 2/5] regulator: Add driver for Maxim 77802 PMIC regulators
> [PATCH 3/5] clk: Add driver for Maxim 77802 PMIC clocks
> [PATCH 4/5] rtc: Add driver for Maxim 77802 PMIC Real-Time-Clock
> [PATCH 5/5] ARM: dts: Add max77802 device node for exynos5420-peach-pit
> 
> Patches 1-4 add support for the different devices and Patch 5 enables
> the MAX77802 PMIC on the Exynos5420 based Peach pit board.


Hi,

The main mfd, mfd irq, clk and rtc drivers look very similar to max77686
drivers. I haven't checked other Maxim drivers but I think there will be
a lot of similarities with them also. It is almost common for Maxim
chipsets to share components between each other.

I think there is no need in duplicating all that stuff once again in new
driver for another Maxim-almost-the-same-as-others-XYZ chipset. Just
merge it with max77686 (or other better candidate).

The only difference is in regulator driver. I am not sure whether this
is a result of differences in chip or differences in driver design.

Best regards,
Krzysztof



> Lee,
> 
> Patches 2-4 depend on Patch 1 so I think that it makes sense if you take
> 1-4 through your mfd tree once the relevant maintainers ack the drivers
> added to the other subsystems (regulator, clk and rtc).
> 
> Patch 5 can go through Kukjin tree since is just DTS changes.
> 
> Thanks a lot and best regards,
> Javier
