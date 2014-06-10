From: =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>
Subject: Re: linux-next on Chromebook2: DRM failing to allocate
Date: Tue, 10 Jun 2014 11:04:19 -0700
Message-ID: <CADMs+9a-vMpFOUmF5DO6X_OJfLgPP48DtRA9tcquzzt-Uso89A@mail.gmail.com>
References: <CAGa+x87EQcHBMc9NUOL_EKx=rKhOjfQ=_aMY5qvyPhqCN5--4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f180.google.com ([209.85.213.180]:55008 "EHLO
	mail-ig0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751875AbaFJSEk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 14:04:40 -0400
Received: by mail-ig0-f180.google.com with SMTP id h18so1953625igc.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2014 11:04:39 -0700 (PDT)
In-Reply-To: <CAGa+x87EQcHBMc9NUOL_EKx=rKhOjfQ=_aMY5qvyPhqCN5--4w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@linaro.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>, Daniel Kurtz <djkurtz@chromium.org>, Inki Dae <inki.dae@samsung.com>, naveenkrishna.ch@gmail.com, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Tomasz Figa <t.figa@samsung.com>

On Tue, Jun 10, 2014 at 10:56 AM, Kevin Hilman <khilman@linaro.org> wro=
te:
> I'm trying to get the latest linux-next working on my Chromebook2
> (it's booting to a serial console) and am now trying to get the
> display working (at least for a frambuffer console.)
>
> Since the display nodes seem to be present in the exynos5800-peach-pi
> DTS, I tried enabling DRM and it's failing to allocate memory (log
> below[1]
>
> Is there some additional memory setup/allocations I should be doing?
> maybe with CMA?

Probably not CMA, but maybe you don't have the iommu enabled?

St=C3=A9phane

>
> Thanks for any advice,
>
> Kevin
>
>
> [1] DRM output with drm.debug=3D0xf on command line
>
> [    1.095622] [drm] Initialized drm 1.1.0 20060810
> [    1.099792] [drm:drm_platform_init]
> [    1.102311] [drm:drm_get_platform_dev]
> [    1.106211] [drm:drm_minor_register]
> [    1.110000] [drm:drm_minor_register] new minor assigned 64
> [    1.115265] [drm:drm_minor_register]
> [    1.118900] [drm:drm_minor_register]
> [    1.122693] [drm:drm_minor_register] new minor assigned 0
> [    1.127970] [drm:exynos_drm_encoder_create] possible_crtcs =3D 0x1
> [    1.133915] [drm:exynos_drm_encoder_create] encoder has been creat=
ed
> [    1.140407] [drm:drm_sysfs_connector_add] adding "eDP-1" to sysfs
> [    1.146335] [drm:drm_sysfs_hotplug_event] generating hotplug event
> [    1.152488] [drm] Supports vblank timestamp caching Rev 2 (21.10.2=
013).
> [    1.159065] [drm] No driver support for vblank timestamp query.
> [    1.164965] [drm:drm_helper_hpd_irq_event] [CONNECTOR:15:eDP-1]
> status updated from unknown to connected
> [    1.174418] [drm:drm_sysfs_hotplug_event] generating hotplug event
> [    1.180590] [drm:exynos_drm_encoder_dpms] encoder dpms: 3
> [    1.185959] [drm:exynos_drm_crtc_dpms] crtc[6] mode[3]
> [    1.191074] [drm:exynos_drm_crtc_dpms] desired dpms mode is same a=
s
> previous one.
> [    1.198538] [drm:drm_helper_probe_single_connector_modes_merge_bit=
s]
> [CONNECTOR:15:eDP-1]
> [    1.206698] [drm:drm_helper_probe_single_connector_modes_merge_bit=
s]
> [CONNECTOR:15:eDP-1] probed modes :
> [    1.216149] [drm:drm_mode_debug_printmodeline] Modeline
> 16:"1920x1080" 60 150660 1920 1980 2060 2232 1080 1090 1100 1125 0x48
> 0x0
> [    1.227779] [drm:drm_setup_crtcs]
> [    1.231135] [drm:drm_enable_connectors] connector 15 enabled? yes
> [    1.237227] [drm:drm_target_preferred] looking for cmdline mode on
> connector 15
> [    1.244512] [drm:drm_target_preferred] looking for preferred mode
> on connector 15
> [    1.251972] [drm:drm_target_preferred] found mode 1920x1080
> [    1.257525] [drm:drm_setup_crtcs] picking CRTCs for 4096x4096 conf=
ig
> [    1.263859] [drm:drm_setup_crtcs] desired mode 1920x1080 set on cr=
tc 6
> [    1.270367] [drm:exynos_drm_fbdev_create] surface width(1920),
> height(1080) and bpp(32
> [    1.278260] [drm:exynos_drm_init_buf] desired size =3D 0x7e9000
> [    1.283995] [drm:exynos_drm_gem_init] created file object =3D 0xed=
7f9200
> [    1.290502] ------------[ cut here ]------------
> [    1.295094] WARNING: CPU: 1 PID: 1 at ../mm/page_alloc.c:2509
> __alloc_pages_nodemask+0x220/0x76c()
> [    1.304022] Modules linked in:
> [    1.307044] CPU: 1 PID: 1 Comm: swapper/0 Not tainted
> 3.15.0-rc8-next-20140605-00004-gde16f7d3b2b5-dirty #31
> [    1.316882] [<800152ac>] (unwind_backtrace) from [<80011d94>]
> (show_stack+0x20/0x24)
> [    1.324595] [<80011d94>] (show_stack) from [<805128d8>]
> (dump_stack+0x74/0x90)
> [    1.331790] [<805128d8>] (dump_stack) from [<80024208>]
> (warn_slowpath_common+0x78/0x9c)
> [    1.339854] [<80024208>] (warn_slowpath_common) from [<80024258>]
> (warn_slowpath_null+0x2c/0x34)
> [    1.348622] [<80024258>] (warn_slowpath_null) from [<800c9334>]
> (__alloc_pages_nodemask+0x220/0x76c)
> [    1.357730] [<800c9334>] (__alloc_pages_nodemask) from [<80019fb8>=
]
> (__dma_alloc_buffer.isra.13+0x3c/0x184)
> [    1.367443] [<80019fb8>] (__dma_alloc_buffer.isra.13) from
> [<8001a124>] (__alloc_remap_buffer.isra.15+0x24/0xc0)
> [    1.377592] [<8001a124>] (__alloc_remap_buffer.isra.15) from
> [<8001a410>] (__dma_alloc+0x250/0x2e0)
> [    1.386613] [<8001a410>] (__dma_alloc) from [<8001a5d8>]
> (arm_dma_alloc+0x94/0xa0)
> [    1.394166] [<8001a5d8>] (arm_dma_alloc) from [<802cf650>]
> (exynos_drm_alloc_buf+0x118/0x294)
> [    1.402663] [<802cf650>] (exynos_drm_alloc_buf) from [<802cfd10>]
> (exynos_drm_gem_create+0x84/0xec)
> [    1.411684] [<802cfd10>] (exynos_drm_gem_create) from [<802cea14>]
> (exynos_drm_fbdev_create+0xdc/0x2ec)
> [    1.421056] [<802cea14>] (exynos_drm_fbdev_create) from
> [<802b306c>] (drm_fb_helper_initial_config+0x324/0x440)
> [    1.431117] [<802b306c>] (drm_fb_helper_initial_config) from
> [<802ced58>] (exynos_drm_fbdev_init+0xd0/0x10c)
> [    1.440918] [<802ced58>] (exynos_drm_fbdev_init) from [<802cef10>]
> (exynos_drm_output_poll_changed+0x34/0x38)
> [    1.450808] [<802cef10>] (exynos_drm_output_poll_changed) from
> [<802b0a08>] (drm_kms_helper_hotplug_event+0x34/0x38)
> [    1.461305] [<802b0a08>] (drm_kms_helper_hotplug_event) from
> [<802b1148>] (drm_helper_hpd_irq_event+0x108/0x120)
> [    1.471455] [<802b1148>] (drm_helper_hpd_irq_event) from
> [<802cd998>] (exynos_drm_load+0xf0/0x130)
> [    1.480390] [<802cd998>] (exynos_drm_load) from [<802bb654>]
> (drm_dev_register+0x90/0x110)
> [    1.488631] [<802bb654>] (drm_dev_register) from [<802bcff0>]
> (drm_platform_init+0x80/0xf0)
> [    1.496958] [<802bcff0>] (drm_platform_init) from [<802cda3c>]
> (exynos_drm_platform_probe+0x64/0x74)
> [    1.506069] [<802cda3c>] (exynos_drm_platform_probe) from
> [<802de5c8>] (platform_drv_probe+0x28/0x58)
> [    1.515263] [<802de5c8>] (platform_drv_probe) from [<802dcf20>]
> (driver_probe_device+0xc4/0x214)
> [    1.524024] [<802dcf20>] (driver_probe_device) from [<802dd144>]
> (__device_attach+0x38/0x54)
> [    1.532444] [<802dd144>] (__device_attach) from [<802db430>]
> (bus_for_each_drv+0x5c/0xa4)
> [    1.540594] [<802db430>] (bus_for_each_drv) from [<802dce04>]
> (device_attach+0x74/0x98)
> [    1.548575] [<802dce04>] (device_attach) from [<802dc430>]
> (bus_probe_device+0x38/0xa8)
> [    1.556556] [<802dc430>] (bus_probe_device) from [<802da628>]
> (device_add+0x374/0x518)
> [    1.564450] [<802da628>] (device_add) from [<802de7fc>]
> (platform_device_add+0x140/0x1d0)
> [    1.572604] [<802de7fc>] (platform_device_add) from [<802dee54>]
> (platform_device_register_full+0xa8/0xe0)
> [    1.582236] [<802dee54>] (platform_device_register_full) from
> [<80754a04>] (exynos_drm_init+0x74/0xc8)
> [    1.591517] [<80754a04>] (exynos_drm_init) from [<80008a48>]
> (do_one_initcall+0x108/0x1d0)
> [    1.599758] [<80008a48>] (do_one_initcall) from [<8072dd64>]
> (kernel_init_freeable+0x108/0x1d4)
> [    1.608433] [<8072dd64>] (kernel_init_freeable) from [<8050e66c>]
> (kernel_init+0x1c/0xf4)
> [    1.616588] [<8050e66c>] (kernel_init) from [<8000e698>]
> (ret_from_fork+0x14/0x20)
> [    1.624143] ---[ end trace 7efd36d9338b10a9 ]---
> [    1.628729] [drm:lowlevel_buffer_allocate] *ERROR* failed to alloc=
ate buffer.
> [    1.635855] [drm] Initialized exynos 1.0.0 20110530 on minor 0
