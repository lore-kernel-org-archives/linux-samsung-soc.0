From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH RFC 0/2] drm/exynos: refactoring drm device init/deinit
Date: Sat, 12 Apr 2014 23:18:42 +0900
Message-ID: <CAAQKjZMz56YjHtjBrEwOkxbyvdp1t9o9rCU9cFiR7GZOXVsKCw@mail.gmail.com>
References: <1397225488-6634-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1397225488-6634-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andrzej,

Thanks for your contributions.

2014-04-11 23:11 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
> Hi Inki,
>
> This patchset refactors drm device initialization. Details are described
> in respective patches. It is an alternative to DT supernode concept.
>
> The first patch uses linker sections to get rid of ifdef macros, it is not

That's a good idea. :) We could avoid ugly #ifdef ~ #endif with this way.

> essential for 2nd patch but it makes code more readable. Similar approach
> is used by irqchip, clks and clk_sources.

But 2nd patch doesn't seem reasnoable to me. Your approach is same as
existing one conceptually. I think we need to handle drm driver in a
different way from irqchip, clks and clk_sources.

DRM driver means one integrated graphics card but in most embedded
systems, graphics and display relevant devices have separated hardware
resources. So we would need abstractional integrated hardware,
display-subsystem, super device. That is why I are trying to use super
device approach, and conceptually it would be right solution. It
wouldn't be not good to combine those separated hardware somehow using
specific codes.

I have updated and tested super device approach with existing dt
support so there wouldn't be any dt broken issue. I will post next
version of this patch series soon, maybe tomorrow or the day after
tomorrow.

Thanks,
Inki Dae

>
> The patchset is based on exynos-drm-next branch.
>
> Regards
> Andrzej
>
>
> Andrzej Hajda (2):
>   drm/exynos: refactor drm drivers registration code
>   drm/exynos: initialize drm master only when all exynos drm devices are
>     ready
>
>  drivers/gpu/drm/exynos/Makefile             |   2 +
>  drivers/gpu/drm/exynos/exynos_dp_core.c     |  37 ++--
>  drivers/gpu/drm/exynos/exynos_drm.lds.S     |   9 +
>  drivers/gpu/drm/exynos/exynos_drm_drv.c     | 279 +++++++++++++---------------
>  drivers/gpu/drm/exynos/exynos_drm_drv.h     |  20 +-
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c     |  42 +++--
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c    |  35 ++--
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c    |  38 ++--
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c     |  17 +-
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c     |  30 +--
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c     |  18 +-
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c |  27 ++-
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c    |  18 +-
>  drivers/gpu/drm/exynos/exynos_hdmi.c        |  53 ++++--
>  drivers/gpu/drm/exynos/exynos_mixer.c       |  14 +-
>  15 files changed, 360 insertions(+), 279 deletions(-)
>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm.lds.S
>
> --
> 1.8.3.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
