From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 01/11] ARM: dt: Add SPI CS on Samsung Snow board.
Date: Thu, 04 Jun 2015 11:05:47 +0900
Message-ID: <556FB27B.2090302__32046.0523166277$1433383591$gmane$org@samsung.com>
References: <cover.1433364398.git.hramrach@gmail.com>
 <d47abe28c751b54b839d9340269a2c06a6e23a6c.1433364398.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:31238 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751081AbbFDCFx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Jun 2015 22:05:53 -0400
In-reply-to: <d47abe28c751b54b839d9340269a2c06a6e23a6c.1433364398.git.hramrach@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Michal Suchanek <hramrach@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>, Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Marek Vasut <marex@denx.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Alison Chaiken <alison_chaiken@mentor.com>, Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>, Knut Wohlrab <knut.wohlrab@de.bosch.com>, =?UTF-8?B?IkJlYW4gSHVvIOmcjeaWjOaWjCAoYmVhbmh1byki?= <beanhuo@micron.c>

On 04.06.2015 06:26, Michal Suchanek wrote:
> Although there is only one choice of chipselect it is necessary to
> specify it. The driver cannot claim the gpio otherwise.
> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> ---
>  arch/arm/boot/dts/exynos5250-snow.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
