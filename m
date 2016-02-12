From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 4/4] drm/exynos: use arch independent types in uapi header
Date: Fri, 12 Feb 2016 18:33:58 +0000
Message-ID: <CACvgo52E_8af3rRdYRONKASjR7nUL3haeURhj7zh71n82S9BrQ@mail.gmail.com>
References: <1455279239-13609-1-git-send-email-a.hajda@samsung.com>
	<1455279239-13609-5-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:32968 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751982AbcBLSd7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 13:33:59 -0500
Received: by mail-wm0-f66.google.com with SMTP id c200so4174715wme.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Feb 2016 10:33:59 -0800 (PST)
In-Reply-To: <1455279239-13609-5-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

On 12 February 2016 at 12:13, Andrzej Hajda <a.hajda@samsung.com> wrote:
> User API structs should not use types which size/alignment/padding depends
> on architecture. The patch fixes it for all structures except
> drm_exynos_g2d_userptr, as g2d related stuff seems to be more complicated
> and will be reviewed/adjusted later.
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

Andrzej for President ;-)

But seriously, thank you very much. There is an open question about
the license miss-match of the file (libdrm version is X11/MIT while
this one is GPL) , although we'll need Inki's input on that one.

Love the whole series, but my exynos foo isn't that great. So this patch is
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

Thanks
Emil
