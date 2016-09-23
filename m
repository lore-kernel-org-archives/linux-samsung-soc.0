From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 1/2] drm/exynos/vidi: use timer for vblanks instead of
 sleeping worker
Date: Fri, 23 Sep 2016 15:27:41 +0300
Message-ID: <20160923122741.GA30511@joana>
References: <1474618524-8916-1-git-send-email-a.hajda@samsung.com>
 <CGME20160923081541eucas1p277bce738f62966250216ae1da9accc81@eucas1p2.samsung.com>
 <1474618524-8916-2-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:36780 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758823AbcIWM1o (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 23 Sep 2016 08:27:44 -0400
Received: by mail-lf0-f68.google.com with SMTP id s29so5631384lfg.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Sep 2016 05:27:43 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1474618524-8916-2-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Marek Szyprowski <m.szyprowski@samsung.com>

2016-09-23 Andrzej Hajda <a.hajda@samsung.com>:

> VIDI driver uses fake vblank handler to generate vblank events.
> It was implemented using worker which slept for vblank time, additionally
> it did not work if there were no page flips. The patch replaces it with
> timer, uses drm_crtc_vblank_(on|off) helpers to manage it and fixes
> behavior for non-page-flip cases.
> This change allows further improvements of vblank in exynos-drm framework.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c | 66 ++++++++++----------------------
>  1 file changed, 20 insertions(+), 46 deletions(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Gustavo
