From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH V7 00/12] drm/exynos: few patches to enhance bridge chip support
Date: Tue, 16 Sep 2014 14:44:02 +0200
Message-ID: <CABxcv==KyakjS5cf9PcHL_pEcC5Kzn8Zz9uQ6HpKLdSjTXciFA@mail.gmail.com>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:47443 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753887AbaIPMoI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Sep 2014 08:44:08 -0400
Received: by mail-wi0-f179.google.com with SMTP id q5so4121182wiv.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Sep 2014 05:44:02 -0700 (PDT)
In-Reply-To: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Ajay kumar <ajaynumb@gmail.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

[adding Laurent Pinchart to cc who had concerns with a previous
version of this patch-set]

Hello Ajay,

On Wed, Aug 27, 2014 at 4:29 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> This series is based on master branch of Linus tree at:
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>
> I have tested this after adding few DT changes for exynos5250-snow and
> exynos5420-peach-pit boards.
>
> The V4 series of this particular patchset was also tested by:
> Rahul Sharma <rahul.sharma@samsung.com>
> Javier Martinez Canillas <javier@dowhile0.org>
>
> Changes since V2:
>         -- Address comments from Jingoo Han for ps8622 driver
>         -- Address comments from Daniel, Rob and Thierry regarding
>            bridge chaining
>         -- Address comments from Thierry regarding the names for
>            new drm_panel functions
>
> Changes since V3:
>         -- Remove hotplug based initialization of exynos_dp
>         -- Make exynos_dp work directly with drm_panel, remove
>            dependency on panel_binder
>         -- Minor cleanups in panel_binder and panel_lvds driver
>
> Changes since V4:
>         -- Use gpiod interface for panel-lvds and ps8622 drivers.
>         -- Address comments from Javier.
>         -- Fix compilation issues when PANEL_BINDER is selected as module.
>         -- Split Documentation patches from driver patches.
>         -- Rebase on top of the tree.
>
> Changes since V5:
>         -- Modify bridge drivers to support driver model.
>         -- Drop the concept of bridge chain(sincle there are no 2 real bridges)
>            Hence drop bridge-panel_binder layer.
>         -- Drop panel-lvds driver and accomodate the required changes in
>            panel-simple driver.
>         -- Use gpiod interface in ptn3460 driver.
>         -- Address all comments by Thierry Reding for V5 series.
>         -- Address comments from Sean Paul for exynos_dp_commit issue.
>
> Changes since V6:
>         -- Panel patches were seperated and they are merged already.
>         -- Fix few issues with ptn3460, before modifying the bridge core.
>         -- Modify drm_bridge as per Thierry's comments for V6 series.
>         -- Add drm_bridge changes minimally without breaking existing code.
>         -- Add new features for ptn3460, step-by-step.
>         -- Address comments from Thierry and Andreas for ptn3460 and ps8622.
>         -- Split documentation patches from driver patches.
>

I've tested your series on an Exynos5420 Peach Pit and an Exynos5250
Snow Chromebooks and display worked for me on both machines.

I also needed "[PATCH] drm/panel: simple: Add AUO B116XW03 panel
support" [0] which does not apply cleanly on linux-next so you may
want to do a re-spin for that patch.

For Snow I also had to disable CONFIG_FB_SIMPLE, otherwise I just saw
a blink on boot and only the backlight remained turned on (no display
output). I don't know if that is expected since IIUC it should be
possible to do a transition from simplefb to a DRM/KMS driver. I don't
have a serial console hooked on this machine so I couldn't debug it
further, sorry.

Also, I saw that Laurent mentioned some concerns today about the
previous version (v6) of your series [1]. I guess he missed this v7
although AFAIU there was no fundamental change on this one so his
concerns remains? I was really hoping that this could make it to 3.18
since display support is one of the last major functionalities that is
missing on these machines.

Best regards,
Javier

[0]: http://patchwork.ozlabs.org/patch/384744/
[1]: http://www.spinics.net/lists/linux-samsung-soc/msg36791.html
