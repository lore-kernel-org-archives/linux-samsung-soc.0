From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH 0/1] Adds display-timing node parsing to exynos drm fimd
Date: Wed, 30 Jan 2013 11:01:36 +0530
Message-ID: <CAL1wa8fbfN+0Bw5yW=WEqU7mBtLfEuShJb2YquYRf9HUNKmFzA@mail.gmail.com>
References: <1359447146-23359-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f41.google.com ([209.85.212.41]:35570 "EHLO
	mail-vb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750732Ab3A3Fb5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jan 2013 00:31:57 -0500
Received: by mail-vb0-f41.google.com with SMTP id l22so793030vbn.14
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Jan 2013 21:31:57 -0800 (PST)
In-Reply-To: <1359447146-23359-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, kgene.kim@samsung.com, vikas.sajjan@linaro.org, linux-samsung-soc@vger.kernel.org, s.trumtrar@pengutronix.de

Hello Sean,
This patch set will be abandoned and your comments will be addressed
in reply to
http://lists.freedesktop.org/archives/dri-devel/2013-January/034080.html

Thanks,
Leela Krishna Amudala.

On Tue, Jan 29, 2013 at 1:42 PM, Leela Krishna Amudala
<l.krishna@samsung.com> wrote:
> This patch adds display-timing node parsing to drm fimd, this depends on
> the display helper patchset at
> http://lists.freedesktop.org/archives/dri-devel/2013-January/033998.html
>
> Patch is based on branch "exynos-drm-next" at
> http://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/
>
> It is tested on Exynos5250 and Exynos4412 board by applying dependent patches available at
> http://lists.freedesktop.org/archives/dri-devel/2013-January/033998.html
>
> Leela Krishna Amudala (1):
>   video: drm: exynos: Adds display-timing node parsing using video
>     helper function
>
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 31 +++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
>
> --
> 1.8.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
