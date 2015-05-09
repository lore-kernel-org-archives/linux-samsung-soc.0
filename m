From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: drm/exynos: Add atomic modesetting support
Date: Sat, 09 May 2015 14:30:18 +0200
Message-ID: <554DFDDA.2040101@gmx.net>
References: <1430430651-22416-1-git-send-email-gustavo@padovan.org>	<554D2FC7.1070208@gmx.net> <CAAQKjZPCQZV7DxTuf12NyPbT2H5PJhNQs4CwtM8g563Zuw8-6w@mail.gmail.com> <554DF9DE.7000200@gmx.net> <554DFB87.7020306@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:60894 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751288AbbEIMaZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 9 May 2015 08:30:25 -0400
In-Reply-To: <554DFB87.7020306@gmx.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Gustavo Padovan <gustavo@padovan.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>

And here's the drm.debug=0xff output leading to the oops:
> [  109.575582] [drm:drm_stub_open] 
> [  109.575609] [drm:drm_open_helper] pid = 2430, minor = 0
> [  109.575630] [drm:ipp_subdrv_open] done priv[0xed9b7e10]
> [  109.575647] [drm:drm_setup] 
> [  109.575699] [drm:drm_ioctl] pid=2430, dev=0xe200, auth=1, DRM_IOCTL_VERSION
> [  109.575719] [drm:drm_ioctl] pid=2430, dev=0xe200, auth=1, DRM_IOCTL_VERSION
> [  109.575764] [drm:drm_release] open_count = 1
> [  109.575786] [drm:drm_release] pid = 2430, device = 0xe200, open_count = 1
> [  109.575810] [drm:drm_lastclose] 
> [  109.575856] [drm:drm_atomic_state_alloc] Allocate atomic state edbdb100
> [  109.575876] [drm:drm_atomic_get_crtc_state] Added [CRTC:21] ed10d600 state to edbdb100
> [  109.575893] [drm:drm_atomic_get_plane_state] Added [PLANE:17] edbdb900 state to edbdb100
> [  109.575906] [drm:drm_atomic_set_crtc_for_plane] Link plane state edbdb900 to [NOCRTC]
> [  109.575918] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for plane state edbdb900
> [  109.575933] [drm:drm_atomic_add_affected_connectors] Adding all current connectors for [CRTC:21] to edbdb100
> [  109.575947] [drm:drm_atomic_check_only] checking edbdb100
> [  109.575965] [drm:drm_atomic_commit] commiting edbdb100
> [  109.575996] Unable to handle kernel NULL pointer dereference at virtual address 000000a4

I've tried to do this in userspace by running modetest through gdb, but
I can't seem to break when the segfault occurs (modetest is already dead
when gdb attempts to break).

I hope this makes it easier to isolate the issue.

With best wishes,
Tobias
