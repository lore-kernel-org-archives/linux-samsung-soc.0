From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 2/7] drm/exynos/mixer: replace direct cross-driver call
 with drm mode validation
Date: Tue, 24 Nov 2015 18:40:19 -0300
Message-ID: <CABxcv=kKWbS5bWNE--wP8nuFEkTR=2vghQpAo-AtnYvm34tnow@mail.gmail.com>
References: <1445861025-23266-1-git-send-email-a.hajda@samsung.com>
	<1445861025-23266-3-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f181.google.com ([209.85.160.181]:36444 "EHLO
	mail-yk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754706AbbKXVkT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Nov 2015 16:40:19 -0500
Received: by ykdr82 with SMTP id r82so35057172ykd.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Nov 2015 13:40:19 -0800 (PST)
In-Reply-To: <1445861025-23266-3-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

Hello Andrzej,

On Mon, Oct 26, 2015 at 9:03 AM, Andrzej Hajda <a.hajda@samsung.com> wrote:
> HDMI driver called directly function from MIXER driver to invalidate modes
> not supported by MIXER. The patch replaces the hack with proper .atomic_check
> callback.
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---

It seems this patch is not a drop-in replacement since it causes a
"Division by zero in kernel" error with v4.4-rc2 on an Exynos5800
Peach Pi, causing the display console to not be initialized. X works
correctly though.

An interesting data point is that it only happens when the HDMI
monitor is not plugged on the first mode set, everything works
correctly when booting with a HDMI monitor plugged.

Following is the relevant messages from the kernel log buffer:

[   14.295702] Division by zero in kernel.
[   14.298191] CPU: 0 PID: 2008 Comm: Xorg Not tainted 4.4.0-rc2 #111
[   14.304243] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[   14.310334] [<c0015f08>] (unwind_backtrace) from [<c0012c94>]
(show_stack+0x10/0x14)
[   14.318072] [<c0012c94>] (show_stack) from [<c01f8f80>]
(dump_stack+0x84/0xc4)
[   14.325264] [<c01f8f80>] (dump_stack) from [<c01f7a90>] (Ldiv0+0x8/0x10)
[   14.331943] [<c01f7a90>] (Ldiv0) from [<c02b34f8>] (fimd_commit+0x1f0/0x2b4)
[   14.338968] [<c02b34f8>] (fimd_commit) from [<c02b0788>]
(exynos_drm_crtc_enable+0x1c/0x28)
[   14.347303] [<c02b0788>] (exynos_drm_crtc_enable) from [<c028b328>]
(drm_atomic_helper_commit_modeset_enables+0x98/0x198)
[   14.358227] [<c028b328>] (drm_atomic_helper_commit_modeset_enables)
from [<c02afc40>] (exynos_atomic_commit_complete+0x2c/0x1c4)
[   14.369761] [<c02afc40>] (exynos_atomic_commit_complete) from
[<c02b0604>] (exynos_atomic_commit+0x180/0x1cc)
[   14.379681] [<c02b0604>] (exynos_atomic_commit) from [<c028c770>]
(drm_atomic_helper_set_config+0x6c/0x90)
[   14.389301] [<c028c770>] (drm_atomic_helper_set_config) from
[<c029cabc>] (drm_mode_set_config_internal+0x58/0xd4)
[   14.399629] [<c029cabc>] (drm_mode_set_config_internal) from
[<c02a18d0>] (drm_mode_setcrtc+0x148/0x4bc)
[   14.409078] [<c02a18d0>] (drm_mode_setcrtc) from [<c029489c>]
(drm_ioctl+0x12c/0x49c)
[   14.416892] [<c029489c>] (drm_ioctl) from [<c00ec19c>]
(do_vfs_ioctl+0x498/0x6c8)
[   14.424346] [<c00ec19c>] (do_vfs_ioctl) from [<c00ec400>]
(SyS_ioctl+0x34/0x5c)
[   14.431638] [<c00ec400>] (SyS_ioctl) from [<c000f600>]
(ret_fast_syscall+0x0/0x3c)

Best regards,
Javier
