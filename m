From: Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/14] Add Analogix Core Display Port Driver
Date: Fri, 21 Aug 2015 17:20:57 +0900
Message-ID: <105A0032-83A0-4B75-AE94-258F12451670@gmail.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439995728-18046-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org" <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "djkurtz-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <djkurtz-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, "ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel
List-Id: linux-samsung-soc@vger.kernel.org

On 2015. 8. 19., at PM 11:48, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> 
> 

.....

> .../bindings/video/analogix_dp-rockchip.txt        |   83 ++
> .../devicetree/bindings/video/exynos_dp.txt        |   51 +-
> arch/arm/boot/dts/exynos5250-arndale.dts           |   10 +-
> arch/arm/boot/dts/exynos5250-smdk5250.dts          |   10 +-
> arch/arm/boot/dts/exynos5250-snow.dts              |   12 +-
> arch/arm/boot/dts/exynos5250-spring.dts            |   12 +-
> arch/arm/boot/dts/exynos5420-peach-pit.dts         |   12 +-
> arch/arm/boot/dts/exynos5420-smdk5420.dts          |   10 +-
> arch/arm/boot/dts/exynos5800-peach-pi.dts          |   12 +-
> drivers/gpu/drm/bridge/Kconfig                     |    5 +
> drivers/gpu/drm/bridge/Makefile                    |    1 +
> drivers/gpu/drm/bridge/analogix_dp_core.c          | 1382 +++++++++++++++++++
> drivers/gpu/drm/bridge/analogix_dp_core.h          |  286 ++++
> drivers/gpu/drm/bridge/analogix_dp_reg.c           | 1294 ++++++++++++++++++
> .../exynos_dp_reg.h => bridge/analogix_dp_reg.h}   |  270 ++--
> drivers/gpu/drm/exynos/Kconfig                     |    5 +-
> drivers/gpu/drm/exynos/Makefile                    |    2 +-
> drivers/gpu/drm/exynos/analogix_dp-exynos.c        |  347 +++++

Would you change this file name to "exynos_dp.c"?

Best regards,
Jingoo Han

> drivers/gpu/drm/exynos/exynos_dp_core.c            | 1416 --------------------
> drivers/gpu/drm/exynos/exynos_dp_core.h            |  282 ----
> drivers/gpu/drm/exynos/exynos_dp_reg.c             | 1263 -----------------
> drivers/gpu/drm/rockchip/Kconfig                   |    9 +
> drivers/gpu/drm/rockchip/Makefile                  |    1 +
> drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  390 ++++++
> drivers/phy/Kconfig                                |    7 +
> drivers/phy/Makefile                               |    1 +
> drivers/phy/phy-rockchip-dp.c                      |  185 +++
> include/drm/bridge/analogix_dp.h                   |   40 +
> 30 files changed, 4325 insertions(+), 3172 deletions(-)
> create mode 100644 Documentation/devicetree/bindings/drm/bridge/analogix_dp.txt
> create mode 100644 Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
> create mode 100644 Documentation/devicetree/bindings/video/analogix_dp-rockchip.txt
> create mode 100644 drivers/gpu/drm/bridge/analogix_dp_core.c
> create mode 100644 drivers/gpu/drm/bridge/analogix_dp_core.h
> create mode 100644 drivers/gpu/drm/bridge/analogix_dp_reg.c
> rename drivers/gpu/drm/{exynos/exynos_dp_reg.h => bridge/analogix_dp_reg.h} (62%)
> create mode 100644 drivers/gpu/drm/exynos/analogix_dp-exynos.c
> delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_core.c
> delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_core.h
> delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_reg.c
> create mode 100644 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> create mode 100644 drivers/phy/phy-rockchip-dp.c
> create mode 100644 include/drm/bridge/analogix_dp.h
> 
> -- 
> 1.9.1
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
