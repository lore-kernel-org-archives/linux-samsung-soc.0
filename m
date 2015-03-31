From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH -v2 0/8] drm/exynos: clean up patches (preparing for atomic)
Date: Tue, 31 Mar 2015 17:27:05 +0900
Message-ID: <551A5A59.4000009@samsung.com>
References: <1427379061-30621-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:59276 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751121AbbCaI1D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Mar 2015 04:27:03 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NM2004EII51ND50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 31 Mar 2015 17:27:01 +0900 (KST)
In-reply-to: <1427379061-30621-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

On 03/26/2015 11:10 PM, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> Hi,
> 
> Here goes some clean ups to the exynos drivers. The main clean ups is
> the presetting and zpos making the property immutable and the removal
> of *_win_data structures.
> 
> v2 contains a extra patch to fix alpha setting for planes in fimd, so
> now fimd works fine even after the removal of struct fimd_win_data.
> 

Looks good to me except trivial comment.

Thanks.

> 	Gustavo
> 	
> ---
> Gustavo Padovan (7):
>   drm/exynos: fimd: fix alpha setting for XR24 pixel format
>   drm/exynos: remove unused exynos_crtc->win_enable() callback
>   drm/exynos: remove struct *_win_data abstraction on planes
>   drm/exynos: preset zpos value for overlay planes
>   drm/exynos: make zpos property immutable
>   drm/exynos: remove exynos_plane_destroy()
>   drm/exynos: remove leftover functions declarations
> 
> Mandeep Singh Baines (1):
>   drm/exynos: track vblank events on a per crtc basis
> 
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 176 ++++++++--------------
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c   | 101 ++++++-------
>  drivers/gpu/drm/exynos/exynos_drm_crtc.h   |   7 +-
>  drivers/gpu/drm/exynos/exynos_drm_drv.c    |  27 ----
>  drivers/gpu/drm/exynos/exynos_drm_drv.h    |  20 +--
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 226 ++++++++++++-----------------
>  drivers/gpu/drm/exynos/exynos_drm_plane.c  |  66 ++-------
>  drivers/gpu/drm/exynos/exynos_drm_plane.h  |   7 +-
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c   | 134 ++++-------------
>  drivers/gpu/drm/exynos/exynos_mixer.c      | 217 ++++++++++-----------------
>  include/video/samsung_fimd.h               |   5 +
>  11 files changed, 337 insertions(+), 649 deletions(-)
> 
