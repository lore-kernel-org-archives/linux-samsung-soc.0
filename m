From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/3] platform/chrome: Move cros-ec transport drivers to
 drivers/platform.
Date: Tue, 3 Jul 2018 07:32:30 +0100
Message-ID: <20180703063230.GC4242@dell>
References: <20180702102201.13461-1-enric.balletbo@collabora.com>
 <20180702102201.13461-2-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180702102201.13461-2-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Benson Leung <bleung@chromium.org>, Olof Johansson <olof@lixom.net>, Gwendal Grignou <gwendal@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, kernel@collabora.com, Guenter Roeck <groeck@google.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 02 Jul 2018, Enric Balletbo i Serra wrote:

> There are some cros-ec transport drivers (I2C, SPI) living in MFD, while
> others (LPC) living in drivers/platform. The transport drivers are more
> platform specific. So, move the I2C and SPI transport drivers to the
> platform/chrome directory. The patch also removes the MFD_ prefix of
> their Kconfig symbols.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
>  drivers/mfd/Kconfig                           | 20 -------------------
>  drivers/mfd/Makefile                          |  2 --
>  drivers/platform/chrome/Kconfig               | 20 +++++++++++++++++++
>  drivers/platform/chrome/Makefile              |  2 ++
>  .../{mfd => platform/chrome}/cros_ec_i2c.c    |  0
>  .../{mfd => platform/chrome}/cros_ec_spi.c    |  0
>  6 files changed, 22 insertions(+), 22 deletions(-)
>  rename drivers/{mfd => platform/chrome}/cros_ec_i2c.c (100%)
>  rename drivers/{mfd => platform/chrome}/cros_ec_spi.c (100%)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
