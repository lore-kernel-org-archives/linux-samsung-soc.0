From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 0/9] multi_v7_defconfig: Enable options for Exynos Chromebooks
Date: Fri, 15 May 2015 09:18:10 +0900
Message-ID: <CAJKOXPeDV=0agQdJ2G7x3ok4wnX66nZ_SF=cGQOW8N96=GnDJA@mail.gmail.com>
References: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

2015-05-15 0:40 GMT+09:00 Javier Martinez Canillas
<javier.martinez@collabora.co.uk>:
> Hello arm-soc maintainers,
>
> This series is an attempt to reduce the delta between exynos_defconfig
> and multi_v7_defconfig. Primarily to enable the needed Kconfig symbols
> to make all Exynos Chromebooks peripherals to be working when building
> an image using the ARMv7 multi-platform default config.
>
> Since the policy is now to now enable as much as possible, I did build
> as a module all the Kconfig symbols that were tristate and only enable
> as built-in those that can't be a module because are boolean options.
>
> A nice side effect of this series is that I found that many drivers
> were not working properly when built as a module because the modalias
> information was not filled properly or at all. I've posted patches to
> fix the issues I found when testing this series.
>
> The patches have been tested on an Exynos5250 Snow, Exynos5420 Peach
> Pit and Exynos5800 Peach Pi Chromebooks but most config options will
> be useful for others Exynos5 or other Samsung SoCs.

I think enabling these config options would help using the multi_v7 on
Exynos boards. I have doubts only for patch 7 (DRM), so for rest of
them:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
