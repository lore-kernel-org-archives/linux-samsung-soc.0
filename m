From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] drm/exynos: Fix suspend/resume support
Date: Tue, 19 Sep 2017 08:33:22 +0200
Message-ID: <CAJKOXPe9yHqnwFCBkD+6wZr77JUtvL2pXKsv__vAx_-bVCzFhA@mail.gmail.com>
References: <CGME20170914120128eucas1p1760828f9d419c724ec5d69d0d6f9796a@eucas1p1.samsung.com>
 <1505390461-14211-1-git-send-email-m.szyprowski@samsung.com> <1505390461-14211-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751539AbdISGdY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Sep 2017 02:33:24 -0400
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com [209.85.223.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A1DB21D29
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Sep 2017 06:33:23 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id e189so7660387ioa.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Sep 2017 23:33:23 -0700 (PDT)
In-Reply-To: <1505390461-14211-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.com>, Daniel Vetter <daniel.vetter@ffwll.ch>

On Thu, Sep 14, 2017 at 2:01 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Commit 7d902c05b480 ("drm: Nuke drm_atomic_helper_connector_dpms")
> removed drm_atomic_helper_connector_dpms() helper saying that it was a dead
> code. It was however indirectly used by Exynos DRM driver for implementing
> suspend/resume support. To fix this regression (after that patch Exynos DRM
> suspend/resume functions became no-ops and hardware fails to suspend),
> this patch rewrites them with drm_atomic_helper_suspend/resume() helpers.
>
> Fixes: 7d902c05b480 ("drm: Nuke drm_atomic_helper_connector_dpms")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c   | 40 ++++++++++---------------------
>  drivers/gpu/drm/exynos/exynos_drm_drv.h   |  1 +
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 20 ++++++++++++++++
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.h | 10 ++++++++
>  4 files changed, 43 insertions(+), 28 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
