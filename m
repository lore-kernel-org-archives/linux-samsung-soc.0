From: Inki Dae <inki.dae@samsung.com>
Subject: Re: drm/exynos: Add atomic modesetting support
Date: Thu, 07 May 2015 11:45:18 +0900
Message-ID: <554AD1BE.8040103@samsung.com>
References: <1430430651-22416-1-git-send-email-gustavo@padovan.org>
 <20150506214504.GA25751@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:46719 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751403AbbEGCpV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 May 2015 22:45:21 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NNY00I7MKZJJ930@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 May 2015 11:45:19 +0900 (KST)
In-reply-to: <20150506214504.GA25751@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com

Hi,

On 2015=EB=85=84 05=EC=9B=94 07=EC=9D=BC 06:45, Gustavo Padovan wrote:
> Hi Inki and Joonyoung.
>=20
> Any thoughts on this?

You need to resolve one issue that booting is still halted when one mor=
e
crtc drivers are enabled, which is a dead lock issue incurred by
register_framebuffer call. For this, I pointed out already at v3.

The last patch may resolve invalid memory access which state->crtc had
NULL while modetest is being performed but it didn't resolve above
booting halt issue.

So as of now, I have merged this patch series for more reviews to
exynos-drm-next-todo yesterday. I will move them to exynos-drm-next if
the issue is resolved.

Thanks,
Inki Dae

>=20
> 2015-04-30 Gustavo Padovan <gustavo@padovan.org>:
>=20
>> Hi,
>>
>> Here goes the full support for atomic modesetting on exynos. I've
>> split the patches in the various phases of atomic support.
>>
>> v2: fixes comments by Joonyoung
>>         - remove unused var in patch 09
>>         - use ->disable instead of outdated ->dpms in hdmi code
>>         - remove WARN_ON from crtc enable/disable
>>
>> v3: fixes comment by Joonyoung
>>         - move the removal of drm_helper_disable_unused_functions() =
to
>>         separated patch
>>
>> v4: add patches that remove unnecessary calls to disable_plane()
>>
>> 	Gustavo
>>
>> ---
>> Gustavo Padovan (12):
>>       drm/exynos: atomic phase 1: use drm_plane_helper_update()
>>       drm/exynos: atomic phase 1: use drm_plane_helper_disable()
>>       drm/exynos: atomic phase 1: add .mode_set_nofb() callback
>>       drm/exynos: atomic phase 2: wire up state reset(), duplicate()=
 and destroy()
>>       drm/exynos: atomic phase 2: keep track of framebuffer pointer
>>       drm/exynos: atomic phase 3: atomic updates of planes
>>       drm/exynos: atomic phase 3: use atomic .set_config helper
>>       drm/exynos: atomic phase 3: convert page flips
>>       drm/exynos: remove exported functions from exynos_drm_plane
>>       drm/exynos: don't disable unused functions at init
>>       drm/exynos: atomic dpms support
>>       drm/exynos: remove unnecessary calls to disable_plane()
>>
>>  drivers/gpu/drm/bridge/ps8622.c             |   6 +-
>>  drivers/gpu/drm/bridge/ptn3460.c            |   6 +-
>>  drivers/gpu/drm/exynos/exynos_dp_core.c     |   6 +-
>>  drivers/gpu/drm/exynos/exynos_drm_crtc.c    | 215 +++++++++--------=
--------------
>>  drivers/gpu/drm/exynos/exynos_drm_dpi.c     |   6 +-
>>  drivers/gpu/drm/exynos/exynos_drm_drv.c     |   2 +
>>  drivers/gpu/drm/exynos/exynos_drm_drv.h     |   4 +-
>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c     |   6 +-
>>  drivers/gpu/drm/exynos/exynos_drm_encoder.c |  35 +----
>>  drivers/gpu/drm/exynos/exynos_drm_fb.c      |  12 +-
>>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c   |   3 -
>>  drivers/gpu/drm/exynos/exynos_drm_plane.c   | 115 +++++++++--------
>>  drivers/gpu/drm/exynos/exynos_drm_plane.h   |  11 --
>>  drivers/gpu/drm/exynos/exynos_drm_vidi.c    |   6 +-
>>  drivers/gpu/drm/exynos/exynos_hdmi.c        |  10 +-
>>  15 files changed, 178 insertions(+), 265 deletions(-)
>>
>=20
> 	Gustavo
>=20
