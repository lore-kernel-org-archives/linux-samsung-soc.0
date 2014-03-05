From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v9 3/4] phy: Add new Exynos USB 2.0 PHY driver
Date: Wed, 05 Mar 2014 17:04:41 +0100
Message-ID: <53174B19.9020009@gmail.com>
References: <1394033288-5551-1-git-send-email-k.debski@samsung.com> <1394033288-5551-4-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f54.google.com ([74.125.83.54]:49102 "EHLO
	mail-ee0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755194AbaCEQE5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Mar 2014 11:04:57 -0500
In-Reply-To: <1394033288-5551-4-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: kyungmin.park@samsung.com, kishon@ti.com, t.figa@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, jg1.han@samsung.com, galak@codeaurora.org, matt.porter@linaro.org, tjakobi@math.uni-bielefeld.de, stern@rowland.harvard.edu, sander@humilis.net

On 05.03.2014 16:28, Kamil Debski wrote:
> Add a new driver for the Exynos USB 2.0 PHY. The new driver uses the generic
> PHY framework. The driver includes support for the Exynos 4x10 and 4x12
> SoC families.
>
> Signed-off-by: Kamil Debski <k.debski@samsung.com>
> ---
>   .../devicetree/bindings/phy/samsung-phy.txt        |   53 ++++
>   Documentation/phy/samsung-usb2.txt                 |  134 ++++++++
>   drivers/phy/Kconfig                                |   29 ++
>   drivers/phy/Makefile                               |    3 +
>   drivers/phy/phy-exynos4210-usb2.c                  |  261 ++++++++++++++++
>   drivers/phy/phy-exynos4x12-usb2.c                  |  328 ++++++++++++++++++++
>   drivers/phy/phy-samsung-usb2.c                     |  222 +++++++++++++
>   drivers/phy/phy-samsung-usb2.h                     |   66 ++++
>   8 files changed, 1096 insertions(+)
>   create mode 100644 Documentation/phy/samsung-usb2.txt
>   create mode 100644 drivers/phy/phy-exynos4210-usb2.c
>   create mode 100644 drivers/phy/phy-exynos4x12-usb2.c
>   create mode 100644 drivers/phy/phy-samsung-usb2.c
>   create mode 100644 drivers/phy/phy-samsung-usb2.h

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
