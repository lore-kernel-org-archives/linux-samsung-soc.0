From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: samsung: Split per ARMv7/v8 arch
Date: Wed, 24 May 2017 22:09:19 +0530
Message-ID: <CAGOxZ53-NrSzGUJ-Fk1fx+3jqESK1wHTwerT6PuYY_nb3DQ0Hw@mail.gmail.com>
References: <20170516200649.4730-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170516200649.4730-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-gpio@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On Wed, May 17, 2017 at 1:36 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Hi,
>
> There will not be a shared image between ARMv7 and ARMv8 so there is no need to
> combine all of this into one driver.
>
> Splitting the data allows to make it more granular (e.g. code related to
> ARMv8 Exynos is self-contained), slightly speed up the compilation and
> reduce the effective size of compiled kernel.
>
> Diff of second patch is not nice... but it is the best I created.
> Experimenting with -B and -M resulted in detection of copy/rename but end
> diff was 60% bigger in lines of patch.
>
> Tests on ARMv8 would be much appreciated.
>
>
> Best regards,
> Krzysztof
>
>
> Krzysztof Kozlowski (2):
>   pinctrl: samsung: Add include guard to local header
>   pinctrl: samsung: Split Exynos drivers per ARMv7 and ARMv8
>
Patch: 2/2 was not applying cleanly on 4.12-rc1. Sorry if I am missing
any dependent patches.
Anyway with a minor conflict fix for 4.12-rc1, I am able to test this
series on exynos7 espresso board.
Looks good to me.
Feel free to add
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

As this works on exynos7, tested SD/eMMC card detection which depends
on pinctrl configs. So
Tested-by: Alim Akhtar <alim.akhtar@samsung.com>


>  drivers/pinctrl/samsung/Kconfig                |   10 +
>  drivers/pinctrl/samsung/Makefile               |    2 +
>  drivers/pinctrl/samsung/pinctrl-exynos-arm.c   |  815 +++++++++++++++++
>  drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |  399 ++++++++
>  drivers/pinctrl/samsung/pinctrl-exynos.c       | 1163 +-----------------------
>  drivers/pinctrl/samsung/pinctrl-exynos.h       |   13 +
>  drivers/pinctrl/samsung/pinctrl-samsung.c      |    8 +-
>  7 files changed, 1250 insertions(+), 1160 deletions(-)
>  create mode 100644 drivers/pinctrl/samsung/pinctrl-exynos-arm.c
>  create mode 100644 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>
> --
> 2.9.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Regards,
Alim
