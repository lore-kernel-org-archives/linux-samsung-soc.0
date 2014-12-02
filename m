From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 0/4] removal of extra abstraction layers
Date: Tue, 2 Dec 2014 10:38:47 -0200
Message-ID: <20141202123847.GA9426@joana>
References: <1416853266-10584-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f169.google.com ([209.85.216.169]:58108 "EHLO
	mail-qc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932724AbaLBMiw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Dec 2014 07:38:52 -0500
Received: by mail-qc0-f169.google.com with SMTP id w7so9283438qcr.28
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Dec 2014 04:38:51 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1416853266-10584-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Inki,

Can you please review this? I also have sent other two patch sets that sits on
top of this one. Thanks.

	Gustavo

2014-11-24 Gustavo Padovan <gustavo@padovan.org>:

> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> Hi Inki,                                                                        
>                                                                                 
> In this series I've removed some level of indirection from the exynos_drm_code. 
> There two moves in these patches, first we remove all exynos_drm_crtc_plane_*() 
> wrappers and call the manager specific functions directly. The other change is  
> the removal of struct exynos_drm_overlay(). In my understanding the overlay     
> struct was just storing plane data in a 1:1 relationship so it made sense to    
> merge its fields in struct exynos_drm_plane and remove another abstraction from 
> the driver.                                                                     
>                                                                                 
> Next steps:                                                                     
>                                                                                 
> During our initial investigation on the Exynos DRM driver we've spoted a few    
> abstractions that could be removed to get a more clean and less abstract code.  
>         - struct exynos_drm_manager: this is just a helper of                   
>         struct exynos_drm_crtc,  I suggest we could merge them both.            
>         - struct *_win_data: Most of the share common fields and could be merged
>         int struct exynos_drm_plane.                                            
>         - some more function wrapper can be removed as well.                    
>                                                                                 
> After these changes intead of looking to manager and win_data we will look into 
> crtc and planes. The new names give us more clue about what a piece of code is  
> doing since they are already defined and used by the whole DRM ecossytem.       
>                                                                                 
> What your thoughts on this? I've seen that you pushed some patches to remove    
> static usage of managers so I would like to check with you which direction are  
> you planning to go with this. I've done some code[0] around this but now it     
> needs a rebase against you exynos-drm-next.                                     
>                                                                                 
> [0] https://git.kernel.org/cgit/linux/kernel/git/padovan/drm-exynos.git/log/?h=cleanup
> 
> Gustavo Padovan (4):
>   drm/exynos: move to_exynos_crtc() macro to main header
>   drm/exynos: expose struct exynos_drm_crtc
>   drm/exynos: remove exynos_drm_crtc_plane_* wrappers
>   drm/exynos: remove struct exynos_drm_overlay
> 
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c  | 66 ---------------------
>  drivers/gpu/drm/exynos/exynos_drm_crtc.h  |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_drv.h   | 43 +++++++++++++-
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c  | 44 +++++++-------
>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 96 +++++++++++++++----------------
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c  | 38 ++++++------
>  drivers/gpu/drm/exynos/exynos_mixer.c     | 50 ++++++++--------
>  7 files changed, 156 insertions(+), 183 deletions(-)
> 
> -- 
> 1.9.3
> 
