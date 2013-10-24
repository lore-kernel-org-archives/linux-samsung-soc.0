From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 3/7] video: exynos_mipi_dsim: Use the generic PHY driver
Date: Thu, 24 Oct 2013 07:30:28 -0700
Message-ID: <CAOesGMhwotSY-1WQmt+wtsrsH2m30VE=j-MwyhpYU3mt_PSPPw@mail.gmail.com>
References: <1381940896-9355-1-git-send-email-kishon@ti.com>
	<1381940896-9355-4-git-send-email-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1381940896-9355-4-git-send-email-kishon@ti.com>
Sender: linux-media-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kishon,

On Wed, Oct 16, 2013 at 9:28 AM, Kishon Vijay Abraham I <kishon@ti.com> wrote:
> diff --git a/drivers/video/exynos/exynos_mipi_dsi.c b/drivers/video/exynos/exynos_mipi_dsi.c
> index 32e5406..00b3a52 100644
> --- a/drivers/video/exynos/exynos_mipi_dsi.c
> +++ b/drivers/video/exynos/exynos_mipi_dsi.c
> @@ -156,8 +157,7 @@ static int exynos_mipi_dsi_blank_mode(struct mipi_dsim_device *dsim, int power)
>                 exynos_mipi_regulator_enable(dsim);
>
>                 /* enable MIPI-DSI PHY. */
> -               if (dsim->pd->phy_enable)
> -                       dsim->pd->phy_enable(pdev, true);
> +               phy_power_on(dsim->phy);
>
>                 clk_enable(dsim->clock);
>

This introduces the below with exynos_defconfig:

../../drivers/video/exynos/exynos_mipi_dsi.c: In function
'exynos_mipi_dsi_blank_mode':
../../drivers/video/exynos/exynos_mipi_dsi.c:144:26: warning: unused
variable 'pdev' [-Wunused-variable]
  struct platform_device *pdev = to_platform_device(dsim->dev);


-Olof
