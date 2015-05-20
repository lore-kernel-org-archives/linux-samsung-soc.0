From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] video: exynos: fix modular build
Date: Wed, 20 May 2015 10:14:21 +0900
Message-ID: <555BDFED.7060607@samsung.com>
References: <2708563.ADEZz3igC5@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:54062 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751858AbbETBOY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 May 2015 21:14:24 -0400
In-reply-to: <2708563.ADEZz3igC5@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-fbdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>, Donghwa Lee <dh09.lee@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On 19.05.2015 21:17, Arnd Bergmann wrote:
> The s6e8ax0 driver has a dependency on BACKLIGHT_CLASS_DEVICE,
> which can be configured as a loadable module, so we have to
> make the driver a tristate symbol as well, to avoid this error:
> 
> drivers/built-in.o: In function `s6e8ax0_probe':
> :(.text+0x23a48): undefined reference to `devm_backlight_device_register'
> 
> This also means we get another error from a missing export, which
> this fixes as well:
> 
> ERROR: "exynos_mipi_dsi_register_lcd_driver" [drivers/video/fbdev/exynos/s6e8ax0.ko] undefined!
> 
> Finally, the EXYNOS_VIDEO option is turned into tristate as well
> for good measure, as all framebuffer drivers should be configurable
> as modules.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Looks good:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
