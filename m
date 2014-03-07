From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v10 4/4] phy: Add Exynos 5250 support to the Exynos USB
 2.0 PHY driver
Date: Fri, 07 Mar 2014 20:36:12 +0100
Message-ID: <531A1FAC.4030507@math.uni-bielefeld.de>
References: <1394104609-28242-1-git-send-email-k.debski@samsung.com> <1394104609-28242-5-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:42147 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751647AbaCGTgP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Mar 2014 14:36:15 -0500
In-Reply-To: <1394104609-28242-5-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: kyungmin.park@samsung.com, kishon@ti.com, t.figa@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, jg1.han@samsung.com, galak@codeaurora.org, matt.porter@linaro.org, stern@rowland.harvard.edu, sander@humilis.net

Kamil Debski wrote:
> Add support for Exynos 5250. This driver is to replace the old
> USB 2.0 PHY driver.
>
> Signed-off-by: Kamil Debski <k.debski@samsung.com>
> ---
>  .../devicetree/bindings/phy/samsung-phy.txt        |    1 +
>  drivers/phy/Kconfig                                |   11 +
>  drivers/phy/Makefile                               |    1 +
>  drivers/phy/phy-exynos5250-usb2.c                  |  404 ++++++++++++++++++++
>  drivers/phy/phy-samsung-usb2.c                     |    6 +
>  drivers/phy/phy-samsung-usb2.h                     |    1 +
>  6 files changed, 424 insertions(+)
>  create mode 100644 drivers/phy/phy-exynos5250-usb2.c
>
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

USB PHY was tested on an ODROID-X2 (Exynos4412 SoC) with patches from
Kamil's previous patchset to enable the usage of the new PHY in EHCI and
OCHI.

With best wishes,
Tobias
