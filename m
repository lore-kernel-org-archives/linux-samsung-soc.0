From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] drm/exynos: Fix locking in the suspend/resume paths
Date: Tue, 19 Sep 2017 08:34:10 +0200
Message-ID: <CAJKOXPedKiw2BDyfdkE0EKQY2kTnSH3G_izdEy-02ThprVn5gQ@mail.gmail.com>
References: <CGME20170914120128eucas1p1ef0aa82654554401950b1889a9809de7@eucas1p1.samsung.com>
 <1505390461-14211-1-git-send-email-m.szyprowski@samsung.com> <1505390461-14211-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1505390461-14211-2-git-send-email-m.szyprowski@samsung.com>
Sender: stable-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Sep 14, 2017 at 2:01 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Commit 48a92916729b ("drm/exynos: use drm_for_each_connector_iter()")
> replaced unsafe drm_for_each_connector() with drm_for_each_connector_iter()
> and removed surrounding drm_modeset_lock calls. However, that lock was
> there not only to protect unsafe drm_for_each_connector(), but it was also
> required to be held by the dpms code which was called from the loop body.
> This patch restores those drm_modeset_lock calls to fix broken suspend
> and resume of Exynos DRM subsystem in v4.13 kernel.
>
> Fixes: 48a92916729b ("drm/exynos: use drm_for_each_connector_iter()")
> CC: stable@vger.kernel.org # v4.13
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
