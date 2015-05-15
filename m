From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: drm/exynos: Add atomic modesetting support
Date: Fri, 15 May 2015 13:44:42 +0200
Message-ID: <10cea26ae89c8bf2f26c2d258dcabd3a@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:57736 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933731AbbEOLop (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 May 2015 07:44:45 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: gustavo@padovan.org, inki.dae@samsung.com, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, liquid.acid@gmx.net

Hello,

I did another run with drm.debug=0xff and also tried to figure out where 
the div-by-zero comes from.

The only division I see is in fimd_calc_clkdiv() (which is called by 
fimd_commit()). So it looks like 'ideal_clk' is zero when calling 
DIV_ROUND_UP().

'htotal' and 'vtotal' can't be zero, since this is checked early in 
fimd_commit(). So 'vrefresh' has to be zero. Maybe this helps?


With best wishes,
Tobias

kernel log:
[  178.351424] [drm:drm_stub_open]
[  178.351443] [drm:drm_open_helper] pid = 2645, minor = 0
[  178.351457] [drm:ipp_subdrv_open] done priv[0xed9b6410]
[  178.351469] [drm:drm_setup]
[  178.351501] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_VERSION
[  178.351515] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_VERSION
[  178.351544] [drm:drm_release] open_count = 1
[  178.351559] [drm:drm_release] pid = 2645, device = 0xe200, open_count 
= 1
[  178.351575] [drm:drm_lastclose]
[  178.351667] [drm:drm_atomic_state_alloc] Allocate atomic state 
ec0567c0
[  178.351685] [drm:drm_atomic_get_crtc_state] Added [CRTC:21] ed0e2e00 
state to ec0567c0
[  178.351697] [drm:drm_atomic_get_plane_state] Added [PLANE:17] 
ec056c80 state to ec0567c0
[  178.351706] [drm:drm_atomic_set_crtc_for_plane] Link plane state 
ec056c80 to [NOCRTC]
[  178.351714] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for plane 
state ec056c80
[  178.351724] [drm:drm_atomic_add_affected_connectors] Adding all 
current connectors for [CRTC:21] to ec0567c0
[  178.351734] [drm:drm_atomic_check_only] checking ec0567c0
[  178.351749] [drm:drm_atomic_commit] commiting ec0567c0
[  178.351764] [drm:drm_atomic_state_clear] Clearing atomic state 
ec0567c0
[  178.351778] [drm:drm_atomic_state_free] Freeing atomic state ec0567c0
[  178.351794] [drm:drm_atomic_state_alloc] Allocate atomic state 
ec0567c0
[  178.351806] [drm:drm_atomic_get_crtc_state] Added [CRTC:29] ed0e2a00 
state to ec0567c0
[  178.351817] [drm:drm_atomic_get_plane_state] Added [PLANE:24] 
ec056d00 state to ec0567c0
[  178.351826] [drm:drm_atomic_set_crtc_for_plane] Link plane state 
ec056d00 to [CRTC:29]
[  178.351835] [drm:drm_framebuffer_reference] ee266c00: FB ID: 40 (1)
[  178.351842] [drm:drm_atomic_set_fb_for_plane] Set [FB:40] for plane 
state ec056d00
[  178.351854] [drm:drm_atomic_get_connector_state] Added [CONNECTOR:31] 
ec0560c0 state to ec0567c0
[  178.351871] [drm:drm_atomic_add_affected_connectors] Adding all 
current connectors for [CRTC:29] to ec0567c0
[  178.351886] [drm:drm_atomic_set_crtc_for_connector] Link connector 
state ec0560c0 to [CRTC:29]
[  178.351899] [drm:drm_atomic_check_only] checking ec0567c0
[  178.351915] [drm:drm_atomic_helper_check_modeset] [CRTC:29] mode 
changed
[  178.351928] [drm:drm_atomic_helper_check_modeset] [CRTC:29] enable 
changed
[  178.351942] [drm:update_connector_routing] Updating routing for 
[CONNECTOR:31:VGA-1]
[  178.351959] [drm:update_connector_routing] [CONNECTOR:31:VGA-1] using 
[ENCODER:30:TMDS-30] on [CRTC:29]
[  178.351973] [drm:drm_atomic_helper_check_modeset] [CRTC:29] active 
changed
[  178.351990] [drm:drm_atomic_helper_check_modeset] [CRTC:29] needs all 
connectors, enable: y, active: y
[  178.352006] [drm:drm_atomic_add_affected_connectors] Adding all 
current connectors for [CRTC:29] to ec0567c0
[  178.352020] [drm:drm_atomic_connectors_for_crtc] State ec0567c0 has 1 
connectors for [CRTC:29]
[  178.352032] [drm:exynos_drm_fb_buffer] dma_addr = 0x20100000
[  178.352040] [drm:exynos_plane_atomic_check] buffer: 0, dma_addr = 
0x20100000
[  178.352048] [drm:drm_atomic_commit] commiting ec0567c0
[  178.352058] [drm:crtc_set_mode] modeset on [CRTC:29]
[  178.352065] [drm:crtc_set_mode] modeset on [ENCODER:30:TMDS-30]
[  178.352093] [drm:exynos_plane_mode_set] plane : offset_x/y(0,0), 
width/height(1366,768)
[  178.352102] [drm:drm_atomic_helper_commit_modeset_enables] enabling 
[CRTC:29]
[  178.352111] [drm:fimd_dpms] drivers/gpu/drm/exynos/exynos_drm_fimd.c, 
0
[  178.352168] Division by zero in kernel.
[  178.352181] CPU: 1 PID: 2645 Comm: lt-modetest Not tainted 
4.1.0-rc3-debug+ #2
[  178.352187] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[  178.352194] Backtrace:
[  178.352219] [<c00132b0>] (dump_backtrace) from [<c00134c8>] 
(show_stack+0x18/0x1c)
[  178.352225]  r6:c06f9a08 r5:ffffffff r4:00000000 r3:dc8ba300
[  178.352253] [<c00134b0>] (show_stack) from [<c04f2138>] 
(dump_stack+0x88/0xc8)
[  178.352265] [<c04f20b0>] (dump_stack) from [<c0013434>] 
(__div0+0x1c/0x20)
[  178.352270]  r6:00000003 r5:00000000 r4:ed9cd010 r3:00000000
[  178.352293] [<c0013418>] (__div0) from [<c020dc14>] (Ldiv0+0x8/0x10)
[  178.352309] [<c02b5e08>] (fimd_commit) from [<c02b6200>] 
(fimd_poweron.part.9+0xd4/0x19c)
[  178.352314]  r9:ee14cc00 r8:c06ffcbc r7:c0748f94 r6:ed9cda70 
r5:ed9cd010 r4:00000005
[  178.352338] [<c02b612c>] (fimd_poweron.part.9) from [<c02b6354>] 
(fimd_dpms+0x8c/0xb4)
[  178.352344]  r6:ee14cc00 r5:00000000 r4:c0748f94 r3:00000001
[  178.352363] [<c02b62c8>] (fimd_dpms) from [<c02b1bf4>] 
(exynos_drm_crtc_enable+0x34/0x7c)
[  178.352369]  r6:ec0567c0 r5:ed9cd020 r4:ee14cc00 r3:c02b62c8
[  178.352393] [<c02b1bc0>] (exynos_drm_crtc_enable) from [<c028c0e8>] 
(drm_atomic_helper_commit_modeset_enables+0x98/0x1c8)
[  178.352399]  r5:ee14cc00 r4:00000001
[  178.352416] [<c028c050>] (drm_atomic_helper_commit_modeset_enables) 
from [<c028e6ac>] (drm_atomic_helper_commit+0x124/0x170)
[  178.352421]  r8:00000000 r7:ed978000 r6:00000000 r5:ec0567c0 
r4:0000000b r3:00000000
[  178.352445] [<c028e588>] (drm_atomic_helper_commit) from [<c02b2794>] 
(exynos_atomic_commit+0x14/0x18)
[  178.352450]  r8:ee14cc00 r7:00000000 r6:ee2385a8 r5:ed978000 
r4:ec0567c0 r3:c02b2780
[  178.352473] [<c02b2780>] (exynos_atomic_commit) from [<c02af928>] 
(drm_atomic_commit+0x4c/0x6c)
[  178.352483] [<c02af8dc>] (drm_atomic_commit) from [<c028d250>] 
(drm_atomic_helper_set_config+0x31c/0x428)
[  178.352489]  r5:ec0567c0 r4:00000003
[  178.352508] [<c028cf34>] (drm_atomic_helper_set_config) from 
[<c029f14c>] (drm_mode_set_config_internal+0x60/0xdc)
[  178.352514]  r10:00000000 r9:ed978000 r8:ee238300 r7:ee14cc00 
r6:00000002 r5:00000050
[  178.352533]  r4:ee266c00
[  178.352547] [<c029f0ec>] (drm_mode_set_config_internal) from 
[<c0290c2c>] (drm_fb_helper_restore_fbdev_mode_unlocked+0xec/0x140)
[  178.352553]  r7:ee2385a8 r6:00000002 r5:00000050 r4:00000000
[  178.352573] [<c0290b40>] (drm_fb_helper_restore_fbdev_mode_unlocked) 
from [<c02b2658>] (exynos_drm_fbdev_restore_mode+0x28/0x2c)
[  178.352579]  r10:ed97814c r9:ed051c00 r8:ed978034 r7:ed978000 
r6:ed978058 r5:c0748f94
[  178.352598]  r4:ed978000
[  178.352609] [<c02b2630>] (exynos_drm_fbdev_restore_mode) from 
[<c02b1068>] (exynos_drm_lastclose+0x10/0x14)
[  178.352619] [<c02b1058>] (exynos_drm_lastclose) from [<c0294564>] 
(drm_lastclose+0x3c/0x10c)
[  178.352627] [<c0294528>] (drm_lastclose) from [<c0294974>] 
(drm_release+0x340/0x4e0)
[  178.352633]  r6:ed978058 r5:ec2a16a8 r4:ec2a1600 r3:00000000
[  178.352658] [<c0294634>] (drm_release) from [<c0103ca8>] 
(__fput+0xa0/0x1e4)
[  178.352663]  r10:00000000 r9:00000008 r8:ed84f600 r7:edc0c428 
r6:edb67b10 r5:ed84f600
[  178.352681]  r4:ec2a1700
[  178.352693] [<c0103c08>] (__fput) from [<c0103e58>] 
(____fput+0x10/0x14)
[  178.352698]  r10:00000000 r9:ec11e000 r8:c000fc04 r7:ed918a80 
r6:c0718ef8 r5:00000000
[  178.352717]  r4:ed918e84
[  178.352732] [<c0103e48>] (____fput) from [<c00473b0>] 
(task_work_run+0xb8/0xfc)
[  178.352746] [<c00472f8>] (task_work_run) from [<c0012ec8>] 
(do_work_pending+0x88/0xa8)
[  178.352752]  r7:00000006 r6:ec11ffb0 r5:c000fc04 r4:ec11e000
[  178.352772] [<c0012e40>] (do_work_pending) from [<c000faa4>] 
(work_pending+0xc/0x20)
[  178.352778]  r6:00000000 r5:00000001 r4:00000003 r3:00000000
[  178.352802] [drm:fimd_win_commit] start addr = 0x20100000, end addr = 
0x20500800, size = 0x400800
[  178.352810] [drm:fimd_win_commit] ovl_width = 1366, ovl_height = 768
[  178.352819] [drm:fimd_win_commit] osd pos: tx = 0, ty = 0, bx = 1365, 
by = 767
[  178.352827] [drm:fimd_win_commit] osd size = 0x100200
[  178.352834] [drm:fimd_win_set_pixfmt] bpp = 32
[  178.352846] Division by zero in kernel.
[  178.352857] CPU: 1 PID: 2645 Comm: lt-modetest Not tainted 
4.1.0-rc3-debug+ #2
[  178.352863] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[  178.352868] Backtrace:
[  178.352882] [<c00132b0>] (dump_backtrace) from [<c00134c8>] 
(show_stack+0x18/0x1c)
[  178.352888]  r6:c06f9a08 r5:ffffffff r4:00000000 r3:dc8ba300
[  178.352911] [<c00134b0>] (show_stack) from [<c04f2138>] 
(dump_stack+0x88/0xc8)
[  178.352922] [<c04f20b0>] (dump_stack) from [<c0013434>] 
(__div0+0x1c/0x20)
[  178.352928]  r6:00000003 r5:00000000 r4:ed9cd010 r3:00000000
[  178.352949] [<c0013418>] (__div0) from [<c020dc14>] (Ldiv0+0x8/0x10)
[  178.352961] [<c02b5e08>] (fimd_commit) from [<c02b1c38>] 
(exynos_drm_crtc_enable+0x78/0x7c)
[  178.352967]  r9:ee14cc00 r8:c06ffcbc r7:c0748f94 r6:ec0567c0 
r5:ed9cd020 r4:ee14cc00
[  178.352992] [<c02b1bc0>] (exynos_drm_crtc_enable) from [<c028c0e8>] 
(drm_atomic_helper_commit_modeset_enables+0x98/0x1c8)
[  178.352998]  r5:ee14cc00 r4:00000001
[  178.353038] [<c028c050>] (drm_atomic_helper_commit_modeset_enables) 
from [<c028e6ac>] (drm_atomic_helper_commit+0x124/0x170)
[  178.353053]  r8:00000000 r7:ed978000 r6:00000000 r5:ec0567c0 
r4:0000000b r3:00000000
[  178.353114] [<c028e588>] (drm_atomic_helper_commit) from [<c02b2794>] 
(exynos_atomic_commit+0x14/0x18)
[  178.353127]  r8:ee14cc00 r7:00000000 r6:ee2385a8 r5:ed978000 
r4:ec0567c0 r3:c02b2780
[  178.353190] [<c02b2780>] (exynos_atomic_commit) from [<c02af928>] 
(drm_atomic_commit+0x4c/0x6c)
[  178.353212] [<c02af8dc>] (drm_atomic_commit) from [<c028d250>] 
(drm_atomic_helper_set_config+0x31c/0x428)
[  178.353224]  r5:ec0567c0 r4:00000003
[  178.353261] [<c028cf34>] (drm_atomic_helper_set_config) from 
[<c029f14c>] (drm_mode_set_config_internal+0x60/0xdc)
[  178.353273]  r10:00000000 r9:ed978000 r8:ee238300 r7:ee14cc00 
r6:00000002 r5:00000050
[  178.353328]  r4:ee266c00
[  178.353351] [<c029f0ec>] (drm_mode_set_config_internal) from 
[<c0290c2c>] (drm_fb_helper_restore_fbdev_mode_unlocked+0xec/0x140)
[  178.353356]  r7:ee2385a8 r6:00000002 r5:00000050 r4:00000000
[  178.353377] [<c0290b40>] (drm_fb_helper_restore_fbdev_mode_unlocked) 
from [<c02b2658>] (exynos_drm_fbdev_restore_mode+0x28/0x2c)
[  178.353383]  r10:ed97814c r9:ed051c00 r8:ed978034 r7:ed978000 
r6:ed978058 r5:c0748f94
[  178.353401]  r4:ed978000
[  178.353412] [<c02b2630>] (exynos_drm_fbdev_restore_mode) from 
[<c02b1068>] (exynos_drm_lastclose+0x10/0x14)
[  178.353422] [<c02b1058>] (exynos_drm_lastclose) from [<c0294564>] 
(drm_lastclose+0x3c/0x10c)
[  178.353431] [<c0294528>] (drm_lastclose) from [<c0294974>] 
(drm_release+0x340/0x4e0)
[  178.353436]  r6:ed978058 r5:ec2a16a8 r4:ec2a1600 r3:00000000
[  178.353456] [<c0294634>] (drm_release) from [<c0103ca8>] 
(__fput+0xa0/0x1e4)
[  178.353462]  r10:00000000 r9:00000008 r8:ed84f600 r7:edc0c428 
r6:edb67b10 r5:ed84f600
[  178.353480]  r4:ec2a1700
[  178.353492] [<c0103c08>] (__fput) from [<c0103e58>] 
(____fput+0x10/0x14)
[  178.353498]  r10:00000000 r9:ec11e000 r8:c000fc04 r7:ed918a80 
r6:c0718ef8 r5:00000000
[  178.353516]  r4:ed918e84
[  178.353530] [<c0103e48>] (____fput) from [<c00473b0>] 
(task_work_run+0xb8/0xfc)
[  178.353542] [<c00472f8>] (task_work_run) from [<c0012ec8>] 
(do_work_pending+0x88/0xa8)
[  178.353547]  r7:00000006 r6:ec11ffb0 r5:c000fc04 r4:ec11e000
[  178.353567] [<c0012e40>] (do_work_pending) from [<c000faa4>] 
(work_pending+0xc/0x20)
[  178.353573]  r6:00000000 r5:00000001 r4:00000003 r3:00000000
[  178.353591] [drm:drm_atomic_helper_commit_modeset_enables] enabling 
[ENCODER:30:TMDS-30]
[  178.353603] [drm:drm_vblank_enable] enabling vblank on crtc 1, ret: 0
[  178.353613] [drm:drm_update_vblank_count] updating vblank count on 
crtc 1, missed 0
[  178.401638] [drm:drm_atomic_state_clear] Clearing atomic state 
ec0567c0
[  178.401654] [drm:drm_atomic_state_free] Freeing atomic state ec0567c0
[  178.401668] [drm:drm_framebuffer_reference] ee266c00: FB ID: 40 (2)
[  178.401683] [drm:drm_atomic_state_alloc] Allocate atomic state 
ec0567c0
[  178.401698] [drm:drm_atomic_get_crtc_state] Added [CRTC:35] ed0e2800 
state to ec0567c0
[  178.401710] [drm:drm_atomic_get_plane_state] Added [PLANE:32] 
ec056f80 state to ec0567c0
[  178.401718] [drm:drm_atomic_set_crtc_for_plane] Link plane state 
ec056f80 to [NOCRTC]
[  178.401725] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for plane 
state ec056f80
[  178.401735] [drm:drm_atomic_add_affected_connectors] Adding all 
current connectors for [CRTC:35] to ec0567c0
[  178.401744] [drm:drm_atomic_check_only] checking ec0567c0
[  178.401756] [drm:drm_atomic_commit] commiting ec0567c0
[  178.401768] [drm:drm_atomic_state_clear] Clearing atomic state 
ec0567c0
[  178.401779] [drm:drm_atomic_state_free] Freeing atomic state ec0567c0
[  178.401790] [drm:drm_framebuffer_reference] ee266c00: FB ID: 40 (3)
[  178.401798] [drm:drm_framebuffer_unreference] ee266c00: FB ID: 40 (4)
[  178.401811] [drm:drm_lastclose] driver lastclose completed
[  178.401820] [drm:drm_lastclose] lastclose completed
[  178.401889] [drm:drm_stub_open]
[  178.401902] [drm:drm_open_helper] pid = 2645, minor = 0
[  178.401916] [drm:ipp_subdrv_open] done priv[0xed9b6410]
[  178.401927] [drm:drm_setup]
[  178.401947] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_VERSION
[  178.401960] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_VERSION
[  178.401996] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_GET_UNIQUE
[  178.402007] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_GET_UNIQUE
[  178.402038] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_SET_CLIENT_CAP
[  178.402056] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETRESOURCES
[  178.402068] [drm:drm_mode_getresources] CRTC[3] CONNECTORS[3] 
ENCODERS[3]
[  178.402078] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETRESOURCES
[  178.402089] [drm:drm_mode_getresources] CRTC[3] CONNECTORS[3] 
ENCODERS[3]
[  178.402109] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETCRTC
[  178.402129] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETCRTC
[  178.402147] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETCRTC
[  178.402168] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETENCODER
[  178.402181] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETENCODER
[  178.402193] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETENCODER
[  178.402209] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETCONNECTOR
[  178.402218] [drm:drm_mode_getconnector] [CONNECTOR:23:?]
[  178.402229] [drm:drm_helper_probe_single_connector_modes_merge_bits] 
[CONNECTOR:23:Virtual-1]
[  178.402238] [drm:drm_helper_probe_single_connector_modes_merge_bits] 
[CONNECTOR:23:Virtual-1] disconnected
[  178.402252] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETCONNECTOR
[  178.402261] [drm:drm_mode_getconnector] [CONNECTOR:23:?]
[  178.402277] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETCONNECTOR
[  178.402285] [drm:drm_mode_getconnector] [CONNECTOR:31:?]
[  178.402295] [drm:drm_helper_probe_single_connector_modes_merge_bits] 
[CONNECTOR:31:VGA-1]
[  178.402316] [drm:drm_helper_probe_single_connector_modes_merge_bits] 
[CONNECTOR:31:VGA-1] probed modes :
[  178.402330] [drm:drm_mode_debug_printmodeline] Modeline 38:"1366x768" 
0 500 1366 1414 1446 1526 768 771 776 790 0x48 0x5
[  178.402344] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETCONNECTOR
[  178.402352] [drm:drm_mode_getconnector] [CONNECTOR:31:?]
[  178.402369] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETCONNECTOR
[  178.402377] [drm:drm_mode_getconnector] [CONNECTOR:37:?]
[  178.402387] [drm:drm_helper_probe_single_connector_modes_merge_bits] 
[CONNECTOR:37:HDMI-A-1]
[  178.402402] [drm:drm_helper_probe_single_connector_modes_merge_bits] 
[CONNECTOR:37:HDMI-A-1] disconnected
[  178.402415] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETCONNECTOR
[  178.402423] [drm:drm_mode_getconnector] [CONNECTOR:37:?]
[  178.402445] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.402471] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.402495] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.402518] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.402542] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.402565] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.402589] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.402612] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.402641] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.402667] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.402698] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.402723] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.402748] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.402772] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.402796] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.402820] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.402846] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.402870] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.402896] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.402920] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.402944] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.402967] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.402997] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANERESOURCES
[  178.403009] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANERESOURCES
[  178.403027] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403039] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403052] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403064] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403077] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403088] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403101] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403113] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403125] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403137] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403165] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403178] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403191] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403202] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403215] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403226] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403238] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403249] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403262] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403273] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403285] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403296] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPLANE
[  178.403309] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.403333] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.403359] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.403383] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.403410] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.403434] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.403460] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.403484] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.403511] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.403534] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.403559] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.403583] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.403608] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.403632] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.403658] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.403681] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.403705] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.403729] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.403754] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.403778] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.403804] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.403827] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.403852] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.403876] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.403902] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.403926] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.403951] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.403975] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.404001] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404025] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404051] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404074] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404099] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.404123] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.404149] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404173] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404199] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404223] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404247] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.404271] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.404297] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404321] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404348] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404371] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404396] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.404420] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.404445] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404469] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404495] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.404518] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.404543] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404567] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404601] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404625] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404650] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.404674] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_OBJ_GETPROPERTIES
[  178.404700] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404724] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404750] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.404773] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPERTY
[  178.406785] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPBLOB
[  178.406824] [drm:drm_ioctl] ret = -2
[  178.407568] [drm:drm_ioctl] pid=2645, dev=0xe200, auth=1, 
DRM_IOCTL_MODE_GETPROPBLOB
[  178.407593] [drm:drm_ioctl] ret = -2
[  178.431659] [drm:drm_release] open_count = 1
[  178.431681] [drm:drm_release] pid = 2645, device = 0xe200, open_count 
= 1
[  178.431699] [drm:drm_lastclose]
[  178.431731] [drm:drm_atomic_state_alloc] Allocate atomic state 
ec0561c0
[  178.431746] [drm:drm_atomic_get_crtc_state] Added [CRTC:21] ed0e3800 
state to ec0561c0
[  178.431758] [drm:drm_atomic_get_plane_state] Added [PLANE:17] 
ec056d80 state to ec0561c0
[  178.431766] [drm:drm_atomic_set_crtc_for_plane] Link plane state 
ec056d80 to [NOCRTC]
[  178.431774] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for plane 
state ec056d80
[  178.431784] [drm:drm_atomic_add_affected_connectors] Adding all 
current connectors for [CRTC:21] to ec0561c0
[  178.431794] [drm:drm_atomic_check_only] checking ec0561c0
[  178.431806] [drm:drm_atomic_commit] commiting ec0561c0
[  178.431819] [drm:drm_atomic_state_clear] Clearing atomic state 
ec0561c0
[  178.431828] [drm:drm_atomic_state_free] Freeing atomic state ec0561c0
[  178.431840] [drm:drm_framebuffer_reference] ee266c00: FB ID: 40 (3)
[  178.431849] [drm:drm_framebuffer_unreference] ee266c00: FB ID: 40 (4)
[  178.431861] [drm:drm_atomic_state_alloc] Allocate atomic state 
ec0561c0
[  178.431872] [drm:drm_atomic_get_crtc_state] Added [CRTC:29] ed0e2e00 
state to ec0561c0
[  178.431882] [drm:drm_framebuffer_reference] ee266c00: FB ID: 40 (3)
[  178.431890] [drm:drm_atomic_get_plane_state] Added [PLANE:24] 
ec056c80 state to ec0561c0
[  178.431899] [drm:drm_atomic_set_crtc_for_plane] Link plane state 
ec056c80 to [CRTC:29]
[  178.431907] [drm:drm_framebuffer_unreference] ee266c00: FB ID: 40 (4)
[  178.431915] [drm:drm_framebuffer_reference] ee266c00: FB ID: 40 (3)
[  178.431922] [drm:drm_atomic_set_fb_for_plane] Set [FB:40] for plane 
state ec056c80
[  178.431934] [drm:drm_atomic_get_connector_state] Added [CONNECTOR:31] 
ec056040 state to ec0561c0
[  178.431943] [drm:drm_atomic_add_affected_connectors] Adding all 
current connectors for [CRTC:29] to ec0561c0
[  178.431952] [drm:drm_atomic_set_crtc_for_connector] Link connector 
state ec056040 to [NOCRTC]
[  178.431960] [drm:drm_atomic_set_crtc_for_connector] Link connector 
state ec056040 to [CRTC:29]
[  178.431967] [drm:drm_atomic_check_only] checking ec0561c0
[  178.431977] [drm:update_connector_routing] Updating routing for 
[CONNECTOR:31:VGA-1]
[  178.431987] [drm:update_connector_routing] [CONNECTOR:31:VGA-1] keeps 
[ENCODER:30:TMDS-30], now on [CRTC:29]
[  178.431996] [drm:exynos_drm_fb_buffer] dma_addr = 0x20100000
[  178.432004] [drm:exynos_plane_atomic_check] buffer: 0, dma_addr = 
0x20100000
[  178.432012] [drm:drm_atomic_commit] commiting ec0561c0
[  178.432023] [drm:exynos_plane_mode_set] plane : offset_x/y(0,0), 
width/height(1366,768)
[  178.432034] [drm:fimd_win_commit] start addr = 0x20100000, end addr = 
0x20500800, size = 0x400800
[  178.432042] [drm:fimd_win_commit] ovl_width = 1366, ovl_height = 768
[  178.432051] [drm:fimd_win_commit] osd pos: tx = 0, ty = 0, bx = 1365, 
by = 767
[  178.432058] [drm:fimd_win_commit] osd size = 0x100200
[  178.432066] [drm:fimd_win_set_pixfmt] bpp = 32
[  178.432075] [drm:drm_atomic_state_clear] Clearing atomic state 
ec0561c0
[  178.432085] [drm:drm_framebuffer_unreference] ee266c00: FB ID: 40 (4)
[  178.432093] [drm:drm_atomic_state_free] Freeing atomic state ec0561c0
[  178.432104] [drm:drm_framebuffer_reference] ee266c00: FB ID: 40 (3)
[  178.432112] [drm:drm_framebuffer_unreference] ee266c00: FB ID: 40 (4)
[  178.432124] [drm:drm_atomic_state_alloc] Allocate atomic state 
ec0561c0
[  178.432135] [drm:drm_atomic_get_crtc_state] Added [CRTC:35] ed0e2a00 
state to ec0561c0
[  178.432146] [drm:drm_atomic_get_plane_state] Added [PLANE:32] 
ec056d00 state to ec0561c0
[  178.432154] [drm:drm_atomic_set_crtc_for_plane] Link plane state 
ec056d00 to [NOCRTC]
[  178.432161] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for plane 
state ec056d00
[  178.432171] [drm:drm_atomic_add_affected_connectors] Adding all 
current connectors for [CRTC:35] to ec0561c0
[  178.432178] [drm:drm_atomic_check_only] checking ec0561c0
[  178.432187] [drm:drm_atomic_commit] commiting ec0561c0
[  178.432198] [drm:drm_atomic_state_clear] Clearing atomic state 
ec0561c0
[  178.432206] [drm:drm_atomic_state_free] Freeing atomic state ec0561c0
[  178.432217] [drm:drm_framebuffer_reference] ee266c00: FB ID: 40 (3)
[  178.432225] [drm:drm_framebuffer_unreference] ee266c00: FB ID: 40 (4)
[  178.432235] [drm:drm_lastclose] driver lastclose completed
[  178.432244] [drm:drm_lastclose] lastclose completed
