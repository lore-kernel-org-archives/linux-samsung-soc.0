From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] exynos: change the license to X11/MIT
Date: Wed, 11 May 2016 22:39:56 +0100
Message-ID: <CACvgo51MP4_2mwW=hKdVX8YXXc8jGk_rfLSJyGzKW5B69nFZ3g@mail.gmail.com>
References: <1462864733-31610-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36341 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750984AbcEKVj6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 May 2016 17:39:58 -0400
Received: by mail-wm0-f66.google.com with SMTP id w143so11954448wmw.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 May 2016 14:39:57 -0700 (PDT)
In-Reply-To: <1462864733-31610-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>

Hi Inki, all,

On 10 May 2016 at 08:18, Inki Dae <inki.dae@samsung.com> wrote:
> This patch changes GPL license to X11/MIT.
>
As mentioned by Tobias, the commit messages should elaborate on the
summary - why the change is needed, how it's achieved.

Is this change due to my recent(ish) request on the topic of licenses,
because some distributions don't include GPL code or otherwise ?

In the first case, I was talking about the license miss-match between
the kernel and libdrm version of exynos_drm.h.
Whatever the reason, one should check with all contributors who
touched the files in question.

> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> ---
>  exynos/exynos_fimg2d.c             | 21 +++++++++++++++++----
>  exynos/exynos_fimg2d.h             | 21 +++++++++++++++++----
>  exynos/fimg2d_reg.h                | 21 +++++++++++++++++----
>  tests/exynos/exynos_fimg2d_event.c | 27 +++++++++++++++++----------
>  tests/exynos/exynos_fimg2d_perf.c  | 27 +++++++++++++++++----------
>  tests/exynos/exynos_fimg2d_test.c  | 21 +++++++++++++++++----
>  6 files changed, 102 insertions(+), 36 deletions(-)
>

$ git log  -- exynos/fimg2d_reg.h exynos/exynos_fimg2d.*
tests/exynos/exynos_fimg2d_* | grep ^Author | sort -u
Author: Daniel Kurtz <djkurtz@chromium.org>
Author: Emil Velikov <emil.l.velikov@gmail.com>
Author: Inki Dae <inki.dae@samsung.com>
Author: Jan Vesely <jan.vesely@rutgers.edu>
Author: Maarten Lankhorst <maarten.lankhorst@canonical.com> // check
with the linux kernel logs for alternative email
Author: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

I doubt any of them will have objections, but still - do reach out for
confirmation. Personally I'm ok with either license, so
Acked-by: Emil Velikov <emil.l.velikov@gmail.com>

Thanks
Emil
