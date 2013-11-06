From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v3 1/3] phy: Add new Exynos USB PHY driver
Date: Wed, 06 Nov 2013 10:02:42 +0900
Message-ID: <000c01ceda8b$e54dbef0$afe93cd0$%han@samsung.com>
References: <1383668001-19141-1-git-send-email-k.debski@samsung.com>
 <1383668001-19141-2-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:39710 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755636Ab3KFBCo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Nov 2013 20:02:44 -0500
In-reply-to: <1383668001-19141-2-git-send-email-k.debski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kamil Debski' <k.debski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm@vger.kernel.org, kyungmin.park@samsung.com, kishon@ti.com, t.figa@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, galak@codeaurora.org, 'Jingoo Han' <jg1.han@samsung.com>

On Wednesday, November 06, 2013 1:13 AM, Kamil Debski wrote:
> 
> Add a new driver for the Exynos USB PHY. The new driver uses the generic
> PHY framework. The driver includes support for the Exynos 4x10 and 4x12
> SoC families.
> 
> Signed-off-by: Kamil Debski <k.debski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  .../devicetree/bindings/phy/samsung-usbphy.txt     |   52 ++++
>  drivers/phy/Kconfig                                |   23 +-
>  drivers/phy/Makefile                               |    4 +
>  drivers/phy/phy-exynos-usb2.c                      |  234 ++++++++++++++
>  drivers/phy/phy-exynos-usb2.h                      |   87 ++++++
>  drivers/phy/phy-exynos4210-usb2.c                  |  272 ++++++++++++++++
>  drivers/phy/phy-exynos4212-usb2.c                  |  324 ++++++++++++++++++++
>  7 files changed, 995 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/samsung-usbphy.txt
>  create mode 100644 drivers/phy/phy-exynos-usb2.c
>  create mode 100644 drivers/phy/phy-exynos-usb2.h
>  create mode 100644 drivers/phy/phy-exynos4210-usb2.c
>  create mode 100644 drivers/phy/phy-exynos4212-usb2.c

[....]

> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index d0caae9..c87bc65 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -7,3 +7,7 @@ obj-$(CONFIG_PHY_EXYNOS_DP_VIDEO)	+= phy-exynos-dp-video.o
>  obj-$(CONFIG_PHY_EXYNOS_MIPI_VIDEO)	+= phy-exynos-mipi-video.o
>  obj-$(CONFIG_OMAP_USB2)			+= phy-omap-usb2.o
>  obj-$(CONFIG_TWL4030_USB)		+= phy-twl4030-usb.o
> +obj-$(CONFIG_PHY_EXYNOS5250_USB)	+= phy-exynos5250-usb.o

Hi Kamil,

Would you add 'phy-exynos5250-usb.c' file? :-)

Now, I am testing Exynos5250 USB HOST with your patchset.
However, it makes error because there is no PHY driver for
Exynos5250.

  WARNING: CPU: 0 PID: 18 at drivers/phy/phy-core.c:366 phy_get+0x1e8/0x224()
  Device: exynos-ehci
  missing string
  .....

Best regards,
Jingoo Han
