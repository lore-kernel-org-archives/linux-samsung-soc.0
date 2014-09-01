From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] drivers: mfd: exynos-pmu: Add support for Exynos7
Date: Mon, 1 Sep 2014 09:22:43 +0100
Message-ID: <20140901082243.GC6226@lee--X1>
References: <1409544769-2695-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1409544769-2695-1-git-send-email-a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Eunseok Choi <es10.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 01 Sep 2014, Abhilash Kesavan wrote:

> Add intial PMU settings for exynos7. This is required for
> future suspend-to-ram and cpuidle support.
>=20
> Signed-off-by: Eunseok Choi <es10.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> This patch has been tested on an Exynos7 espresso board and is based
> on Kgene's tree (for-next branch).
>=20
> Following are the dependencies:
> 1) Support 64bit Cortex A57 based Exynos7 SoC
> http://www.spinics.net/lists/arm-kernel/msg357380.html
> 2) mfd: syscon: Decouple syscon interface from syscon devices
> http://www.spinics.net/lists/linux-samsung-soc/msg35906.html
> 3) ARM: EXYNOS: Add platform driver support for Exynos PMU
> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/27567=
5.html
> 4) ARM: EXYNOS: Move PMU specific definitions from common.h
> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/27065=
5.html
> 5) ARM: EXYNOS: Move pmu specific header files under "linux/mfd/samsu=
ng"
> https://lkml.org/lkml/2014/4/28/217
> 6) drivers: mfd: Add support for Exynos PMU driver
> https://lkml.org/lkml/2014/4/28/332
>=20
> NOTE: The above dependencies are not final yet, especially the
> movement of exynos pmu driver to the mfd directory. I will re-work
> this patch when the final location for exynos PMU driver is decided.

Let me know when this patch is ready to go in and I'll review.

>  .../devicetree/bindings/arm/samsung/pmu.txt        |    1 +
>  arch/arm64/boot/dts/exynos7.dtsi                   |    5 +
>  drivers/mfd/exynos-pmu.c                           |  285 ++++++++++=
++++++++++
>  include/linux/mfd/samsung/exynos-regs-pmu.h        |  212 ++++++++++=
+++++
>  4 files changed, 503 insertions(+)

This all needs to be broken up into seperate patches.

Also, see: Documentation/devicetree/bindings/submitting-patches.txt.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
