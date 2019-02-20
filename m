From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] ARM: dts: exynos: Second pull for v5.1
Date: Wed, 20 Feb 2019 16:11:16 +0100
Message-ID: <CAK8P3a06-C5TpkSnnvgFTbiXX6FdcOU4RMFVr62YAxm+LEtrbA@mail.gmail.com>
References: <20190219185214.5544-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219185214.5544-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, Kukjin Kim <kgene@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Feb 19, 2019 at 7:52 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The following changes since commit ec33745bccc8f336957c751f4153421cc9ef5a54:
>
>   ARM: dts: exynos: Fix pinctrl definition for eMMC RTSN line on Odroid X2/U3 (2019-01-25 20:18:10 +0100)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.1-2
>
> for you to fetch changes up to 625c731d1b2af487fc6be10b9a505699c045813a:
>
>   ARM: dts: exynos: Add support for secondary DAI to Odroid XU4 (2019-02-18 20:52:25 +0100)
>
> ----------------------------------------------------------------
> Samsung DTS ARM changes for v5.1, part 2
>
> 1. Enable ADC on Odroid HC1 board.
> 2. Fix clkout register failure on Exynos3250.
> 3. Allow using earlycon on Arndale board.
> 4. Disable ARM PMU on Odroid XU3 Lite because it is locked by Trusted
>    Firmware.
> 5. Add support for secondary DAI to Odroid XU3 and XU4 boards.


Pulled into arm/dt, thanks!

      Arnd
