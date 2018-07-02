From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/3] arm/arm64: configs: Remove the MFD_ prefix for
 MFD_CROS_EC_I2C/SPI symbols.
Date: Mon, 2 Jul 2018 13:05:40 +0200
Message-ID: <CAJKOXPd51yU8-zObXszc4zJpHsGtMNFTsbQsQdKBFg=k22xZLA@mail.gmail.com>
References: <20180702102201.13461-1-enric.balletbo@collabora.com> <20180702102201.13461-3-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180702102201.13461-3-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Lee Jones <lee.jones@linaro.org>, Benson Leung <bleung@chromium.org>, Olof Johansson <olof@lixom.net>, Gwendal Grignou <gwendal@chromium.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, kernel@collabora.com, Guenter Roeck <groeck@google.com>, linux-arm-kernel@lists.infradead.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Gregory CLEMENT <gregory.clement@bootlin.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Geert
List-Id: linux-samsung-soc@vger.kernel.org

On 2 July 2018 at 12:22, Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
> The cros-ec I2C and SPI transport drivers have been moved from MFD
> subsystem to platform/chrome, at the same time, the config symbol has
> been renamed and lost the MFD_ prefix, so update all configs to the new
> config symbol name.
>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>
>  arch/arm/configs/exynos_defconfig   | 4 ++--
>  arch/arm/configs/multi_v7_defconfig | 4 ++--
>  arch/arm/configs/pxa_defconfig      | 4 ++--
>  arch/arm64/configs/defconfig        | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)

Since you put in one patch multiple defconfigs belonging to multiple
maintainers, I assume you are pushing this through arm-soc or Russell.
In such case, for Exynos boards:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
