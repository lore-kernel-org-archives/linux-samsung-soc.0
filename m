From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH -v3 00/11] drm/exynos: Add atomic modesetting support
Date: Tue, 7 Apr 2015 00:44:04 +0900
Message-ID: <CAAQKjZNMkNVs9YOq5G+u+-oQJrJrmxi=6bqMM2ScQP7RRrNpig@mail.gmail.com>
References: <1428084583-14616-1-git-send-email-gustavo@padovan.org>
	<55226412.8040807@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f42.google.com ([209.85.215.42]:35674 "EHLO
	mail-la0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752791AbbDFPoG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Apr 2015 11:44:06 -0400
Received: by labbd9 with SMTP id bd9so10962829lab.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Apr 2015 08:44:05 -0700 (PDT)
In-Reply-To: <55226412.8040807@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org

2015-04-06 19:46 GMT+09:00 Inki Dae <inki.dae@samsung.com>:
> On 2015=B3=E2 04=BF=F9 04=C0=CF 03:09, Gustavo Padovan wrote:
>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>>
>> Hi,
>>
>> Here goes the full support for atomic modesetting on exynos. I've
>> split the patches in the various phases of atomic support.
>>
>> These patches sits on top of the clean up patches I've sent yesterda=
y
>> to this mailing list[1].
>>
>> v2: fixes comments by Joonyoung
>>         - remove unused var in patch 09
>>         - use ->disable instead of outdated ->dpms in hdmi code
>>         - remove WARN_ON from crtc enable/disable
>>
>> v3: fixes comment by Joonyoung
>>       - move the removal of drm_helper_disable_unused_functions() to
>>       separated patch
>
> With this patch series, Kernel booting is halted at end of kernel
> booting. I tested this patch series on Trats2 board based on Exynos44=
12 SoC.
>
> Below is a part of full booting logs, which was halted,
> [    1.992015] exynos-drm-ipp exynos-drm-ipp: drm ipp registered
> successfully.
> [    1.993009] exynos-drm exynos-drm: bound exynos-drm-vidi (ops
> vidi_component_ops)
> [    1.993036] exynos-drm exynos-drm: bound 11c00000.fimd (ops
> fimd_component_ops)
> [    1.993385] exynos-drm exynos-drm: bound 11c80000.dsi (ops
> exynos_dsi_component_ops)
> [    1.993390] [drm] Supports vblank timestamp caching Rev 2 (21.10.2=
013).
> [    1.993393] [drm] No driver support for vblank timestamp query.
> [    1.993442] [drm] Initialized exynos 1.0.0 20110530 on minor 0
> [    2.043358] WARNING: CPU: 2 PID: 1209 at drivers/clk/clk.c:898
> clk_unprepare+0x24/0x2c()
> [    2.051412] Modules linked in:
> [    2.054422] CPU: 2 PID: 1209 Comm: kworker/2:1 Tainted: G        W
>     4.0.0-rc6-00526-gc49d7de-dirty #1278
> [    2.064337] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> [    2.070428] Workqueue: pm pm_runtime_work>
>
> After that, I tested it again without FIMD and the booting is ok. So =
I
> guess that this atomic feature has a bug to FIMD driver.
>

More information,

The reason the booting is halted is that a deadlock occurs at fbcon
module when register_framebuffer() is called.

Below are our test results,
- with only cleanup series, FIMD and HDMI work well.
- with cleanup and atomic series, HDMI works well but FIMD doesn't
work - a deadlock occurs.

Could anyone test it with the atomic series on trats2 board? You can
test it on top of exynos-drm-next-todo branch which contains all
relevant patches,
https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/log=
/?h=3Dexynos-drm-next-todo

Anyway, we will continue to take a look at the this issue why the
deadlock occurs.

Thanks,
Inki Dae

> Thanks,
> Inki Dae
>
>>
>>       Gustavo
>> ---
>>
>> Gustavo Padovan (11):
>>   drm/exynos: atomic phase 1: use drm_plane_helper_update()
>>   drm/exynos: atomic phase 1: use drm_plane_helper_disable()
>>   drm/exynos: atomic phase 1: add .mode_set_nofb() callback
>>   drm/exynos: atomic phase 2: wire up state reset(), duplicate() and
>>     destroy()
>>   drm/exynos: atomic phase 2: keep track of framebuffer pointer
>>   drm/exynos: atomic phase 3: atomic updates of planes
>>   drm/exynos: atomic phase 3: use atomic .set_config helper
>>   drm/exynos: atomic phase 3: convert page flips
>>   drm/exynos: remove exported functions from exynos_drm_plane
>>   drm/exynos: don't disable unused functions at init
>>   drm/exynos: atomic dpms support
>>
>>  drivers/gpu/drm/bridge/ptn3460.c              |   4 +
>>  drivers/gpu/drm/exynos/exynos_dp_core.c       |   6 +-
>>  drivers/gpu/drm/exynos/exynos_drm_connector.c |   6 +-
>>  drivers/gpu/drm/exynos/exynos_drm_crtc.c      | 226 ++++++++-------=
-----------
>>  drivers/gpu/drm/exynos/exynos_drm_dpi.c       |   6 +-
>>  drivers/gpu/drm/exynos/exynos_drm_drv.c       |   2 +
>>  drivers/gpu/drm/exynos/exynos_drm_drv.h       |   4 +-
>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       |   6 +-
>>  drivers/gpu/drm/exynos/exynos_drm_encoder.c   |  27 +--
>>  drivers/gpu/drm/exynos/exynos_drm_fb.c        |  12 +-
>>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |   3 -
>>  drivers/gpu/drm/exynos/exynos_drm_plane.c     | 113 +++++++------
>>  drivers/gpu/drm/exynos/exynos_drm_plane.h     |  11 --
>>  drivers/gpu/drm/exynos/exynos_drm_vidi.c      |   6 +-
>>  drivers/gpu/drm/exynos/exynos_hdmi.c          |  10 +-
>>  15 files changed, 187 insertions(+), 255 deletions(-)
>>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
