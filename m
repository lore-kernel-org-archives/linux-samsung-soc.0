From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V4 5/5] usb-phy: samsung-usb3: Remove older
 phy-samsung-usb3 driver
Date: Wed, 09 Apr 2014 13:13:29 +0200
Message-ID: <53452B59.8030901@samsung.com>
References: <1396967803-28868-1-git-send-email-gautam.vivek@samsung.com>
 <1396967803-28868-6-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:10019 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932560AbaDILNe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Apr 2014 07:13:34 -0400
In-reply-to: <1396967803-28868-6-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, kishon@ti.com
Cc: gregkh@linuxfoundation.org, balbi@ti.com, kgene.kim@samsung.com, k.debski@samsung.com, jg1.han@samsung.com, sylvester.nawrocki@gmail.com

Hi Vivek,

On 08.04.2014 16:36, Vivek Gautam wrote:
> Removing this older USB 3.0 DRD controller PHY driver, since
> a new driver based on generic phy framework is now available.
>
> Also removing the dt node for older driver from Exynos5250
> device tree and updating the dt node for DWC3 controller.
>
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> ---
>
> NOTE: This patch should be merged only when the new USB 3.0
> DRD phy controller driver is available in the tree from the
> patches:
> 	phy: Add new Exynos5 USB 3.0 PHY driver; and
> 	dt: exynos5250: Enable support for generic USB DRD phy
>
>   arch/arm/boot/dts/exynos5250.dtsi  |   17 +-
>   drivers/usb/phy/phy-samsung-usb.h  |   83 ---------
>   drivers/usb/phy/phy-samsung-usb3.c |  350 ------------------------------------
>   3 files changed, 2 insertions(+), 448 deletions(-)
>   delete mode 100644 drivers/usb/phy/phy-samsung-usb3.c
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 92c6fcd..1cb1e91 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi

IMHO driver and dts changes should be separated into two patches, first 
updating device tree to use the new driver and second removing the driver.

After fixing this issue,

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

--
Best regards,
Tomasz
