From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 0/3] ARM: dts: Peach boards WiFi and audio support
Date: Fri, 27 Feb 2015 00:55:35 +0900
Message-ID: <003e01d051dc$a8cf0960$fa6d1c20$@kernel.org>
References: <1424965776-4381-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1424965776-4381-1-git-send-email-javier.martinez@collabora.co.uk>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, 'Kukjin Kim' <kgene@kernel.org>
Cc: 'Doug Anderson' <dianders@chromium.org>, 'Olof Johansson' <olof@lixom.net>, 'Tushar Behera' <tushar.b@samsung.com>, 'Kevin Hilman' <khilman@linaro.org>, 'Andreas Faerber' <afaerber@suse.de>, 'Tyler Baker' <tyler.baker@linaro.org>, 'Steve Capper' <steve.capper@linaro.org>, 'Amit Kucheria' <amit.kucheria@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Javier Martinez Canillas wrote:
> 
> Hello Kukjin,
> 
Hi,

> This series adds support for the remaining peripherals that were not
> supported in the Exynos5420 Peach Pit and Exynos5800 Peach Pi boards.
> 
> Javier Martinez Canillas (2):
>   ARM: dts: Mux XMMCnDATA[0] pad correctly for Exynos5420 boards.
>   ARM: dts: Add WiFi module support for Peach boards
> 
> Tushar Behera (1):
>   ARM: dts: Add mclk entry for Peach Pit/Pi boards
> 
>  arch/arm/boot/dts/exynos5420-arndale-octa.dts |  4 +-
>  arch/arm/boot/dts/exynos5420-peach-pit.dts    | 62 ++++++++++++++++++++++++++-
>  arch/arm/boot/dts/exynos5420-smdk5420.dts     |  4 +-
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts    |  4 +-
>  arch/arm/boot/dts/exynos5800-peach-pi.dts     | 62 ++++++++++++++++++++++++++-
>  5 files changed, 126 insertions(+), 10 deletions(-)
> 
> Patch #1 is just a bugfix since the DTS was relying in the bootloader
> to mux the XMMCnDATA[0] pad in function mode SD_n_DATA[0] for the uSD
> and eMMC. The same bug was present in all Exynos5420/5422/5800 boards
> probably due a difference in how the 5250 and 5420 pinctrl is defined.
> 
> Patch #2 adds support for the SDIO WiFi module present in Peach boards
> and patch #3 adds a phandle for the audio codec master clock source.
> 
> After this series all the peripherals in the Peach boards are working
> at least at a basic level, more work is needed to make the ASoC audio
> driver more robust or the WiFi chip to support highspeed mode but that
> can be made as a follow-up.
> 
Sounds great and looks good to me after quick looking at this series.

Will apply this whole series.

Thanks,
Kukjin
