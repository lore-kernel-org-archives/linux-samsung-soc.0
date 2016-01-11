From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3] drm/exynos: fix kernel panic issue at drm releasing
Date: Mon, 11 Jan 2016 19:32:21 +0100
Message-ID: <CAKMK7uHSCXWpetAKevEW+5L4=T7YGQ8MFCfYhYOqL4mG5Mo-HA@mail.gmail.com>
References: <1452242760-20298-1-git-send-email-inki.dae@samsung.com>
	<1452242760-20298-2-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f195.google.com ([209.85.214.195]:36704 "EHLO
	mail-ob0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932616AbcAKScW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2016 13:32:22 -0500
Received: by mail-ob0-f195.google.com with SMTP id is5so3518459obc.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Jan 2016 10:32:21 -0800 (PST)
In-Reply-To: <1452242760-20298-2-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Fri, Jan 8, 2016 at 9:46 AM, Inki Dae <inki.dae@samsung.com> wrote:
> This patch fixes a kernel panic issue which happened
> when drm driver is closed while modetest.
>
> This issue could be reproduced easily by launching modetest
> with page flip repeatedly.
>
> The reason is that invalid drm_file object could be accessed by
> send_vblank_event function when finishing page flip if the drm_file
> object was removed by drm_release and there was a pended page
> flip event which was already committed to hardware.
>
> So this patch makes the pended page flip event to be cancelled by
> preclose callback which is called at front of drm_release function.
>
> Changelog v2:
> - free vblank event objects belonging to the request process,
>   increment event space and decrease pending_update when cancelling
>   the event
>
> Changelog v3:
> - initialize only device specific things. Each page flip event object
>   is created by DRM core so DRM core should release the object including
>   incrementing event space.
>
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>

Note that after my drm_event cleanup series has landed (aiming for
early 4.6) you can/should revert this again. But it's too big as a
bugfix this late in 4.5. Ack/tested-by from exynos on that series
would be great.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
