From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v10 3/4] phy: Add new Exynos USB 2.0 PHY driver
Date: Fri, 07 Mar 2014 20:35:10 +0100
Message-ID: <531A1F6E.9010303@math.uni-bielefeld.de>
References: <1394104609-28242-1-git-send-email-k.debski@samsung.com> <1394104609-28242-4-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1394104609-28242-4-git-send-email-k.debski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: kyungmin.park@samsung.com, kishon@ti.com, t.figa@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, jg1.han@samsung.com, galak@codeaurora.org, matt.porter@linaro.org, stern@rowland.harvard.edu, sander@humilis.net
List-Id: linux-samsung-soc@vger.kernel.org

Kamil Debski wrote:
> Add a new driver for the Exynos USB 2.0 PHY. The new driver uses the generic
> PHY framework. The driver includes support for the Exynos 4x10 and 4x12
> SoC families.
>
> Signed-off-by: Kamil Debski <k.debski@samsung.com>
> ---
>  .../devicetree/bindings/phy/samsung-phy.txt        |   53 ++++
>  Documentation/phy/samsung-usb2.txt                 |  135 ++++++++
>  drivers/phy/Kconfig                                |   29 ++
>  drivers/phy/Makefile                               |    3 +
>  drivers/phy/phy-exynos4210-usb2.c                  |  261 ++++++++++++++++
>  drivers/phy/phy-exynos4x12-usb2.c                  |  328 ++++++++++++++++++++
>  drivers/phy/phy-samsung-usb2.c                     |  222 +++++++++++++
>  drivers/phy/phy-samsung-usb2.h                     |   66 ++++
>  8 files changed, 1097 insertions(+)
>  create mode 100644 Documentation/phy/samsung-usb2.txt
>  create mode 100644 drivers/phy/phy-exynos4210-usb2.c
>  create mode 100644 drivers/phy/phy-exynos4x12-usb2.c
>  create mode 100644 drivers/phy/phy-samsung-usb2.c
>  create mode 100644 drivers/phy/phy-samsung-usb2.h
>
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

USB PHY was tested on an ODROID-X2 (Exynos4412 SoC) with patches from
Kamil's previous patchset to enable the usage of the new PHY in EHCI and
OCHI.

With best wishes,
Tobias
