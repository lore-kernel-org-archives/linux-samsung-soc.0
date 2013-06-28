From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 1/3] phy: Add driver for Exynos DP PHY
Date: Fri, 28 Jun 2013 15:01:27 +0530
Message-ID: <51CD57EF.5010808@ti.com>
References: <001501ce73bf$87c49c00$974dd400$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <001501ce73bf$87c49c00$974dd400$@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Felipe Balbi' <balbi@ti.com>, 'Tomasz Figa' <t.figa@samsung.com>, devicetree-discuss@lists.ozlabs.org, 'Inki Dae' <inki.dae@samsung.com>, 'Donghwa Lee' <dh09.lee@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Jean-Christophe PLAGNIOL-VILLARD' <plagnioj@jcrosoft.com>, linux-fbdev@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Friday 28 June 2013 10:52 AM, Jingoo Han wrote:
> Add a PHY provider driver for the Samsung Exynos SoC DP PHY.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>   .../phy/samsung,exynos5250-dp-video-phy.txt        |    7 ++
>   drivers/phy/Kconfig                                |    8 ++
>   drivers/phy/Makefile                               |    3 +-
>   drivers/phy/phy-exynos-dp-video.c                  |  130 ++++++++++++++++++++
>   4 files changed, 147 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos5250-dp-video-phy.txt
>   create mode 100644 drivers/phy/phy-exynos-dp-video.c
>
> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos5250-dp-video-phy.txt
> b/Documentation/devicetree/bindings/phy/samsung,exynos5250-dp-video-phy.txt
> new file mode 100644
> index 0000000..8b6fa79
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos5250-dp-video-phy.txt

How about creating a single Documentation file for all samsung video phys? 
Sylwester?

Thanks
Kishon
