From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] drm/exynos: Check for NULL dereference of crtc
Date: Fri, 6 Mar 2015 14:04:31 +0000
Message-ID: <20150306140431.GE4286@opensource.wolfsonmicro.com>
References: <1424193281-30401-1-git-send-email-ckeepax@opensource.wolfsonmicro.com> <54F9A806.6020605@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:59455 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751542AbbCFOEe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Mar 2015 09:04:34 -0500
Content-Disposition: inline
In-Reply-To: <54F9A806.6020605@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene@kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Mar 06, 2015 at 10:13:42PM +0900, Inki Dae wrote:
> On 2015=EB=85=84 02=EC=9B=94 18=EC=9D=BC 02:14, Charles Keepax wrote:
> > The commit "drm/exynos: remove exynos_plane_dpms" (d9ea6256) remove=
d the
> > use of the enabled flag, which means that the code may attempt to c=
all
> > win_enable on a NULL crtc. This results in the following oops on
>=20
> Hmm... it's strange. plane->funcs->destroy() is called prior to
> crtc->funcs->destroy() so it should be exynos_crtc is not NULL. Howev=
er,
> it seems there is any corner case we didn't catch up.
>=20
> Applied.

Thanks, it seems the offending path in an error path, looks like
Arndale is missing some required DT setting which causes
exynos_drm_load to fail:

[    1.638109] of_graph_get_next_endpoint(): no port node found in /dp-=
controller@145B0000
[    1.646424] exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_com=
ponent_ops)
[    1.652704] /dp-controller@145B0000: could not find display-timings =
node
[    1.659323] /dp-controller@145B0000: no timings specified
[    1.664709] [drm:exynos_dp_bind] *ERROR* failed: of_get_videomode() =
: -22
[    1.671485] exynos-drm exynos-drm: failed to bind 145b0000.dp-contro=
ller (ops exynos_dp_ops): -22

Which ends up calling exynos_plane_destroy as part of the clean up:

[    1.698655] [<c0015db4>] (unwind_backtrace) from [<c00121cc>] (show_=
stack+0x20/0x24)
[    1.706385] [<c00121cc>] (show_stack) from [<c0528230>] (dump_stack+=
0x78/0xc4)
[    1.713588] [<c0528230>] (dump_stack) from [<c02f72ec>] (exynos_disa=
ble_plane+0x2c/0x60)
[    1.721660] [<c02f72ec>] (exynos_disable_plane) from [<c02f733c>] (e=
xynos_plane_destroy+0x1c/0x30)
[    1.730605] [<c02f733c>] (exynos_plane_destroy) from [<c02e37c4>] (d=
rm_mode_config_cleanup+0x168/0x20c)
[    1.739982] [<c02e37c4>] (drm_mode_config_cleanup) from [<c02f3d18>]=
 (exynos_drm_load+0xac/0x12c)
[    1.748832] [<c02f3d18>] (exynos_drm_load) from [<c02dc074>] (drm_de=
v_register+0xb0/0x110)
[    1.757075] [<c02dc074>] (drm_dev_register) from [<c02ddc88>] (drm_p=
latform_init+0x50/0xe0)
[    1.765405] [<c02ddc88>] (drm_platform_init) from [<c02f3a08>] (exyn=
os_drm_bind+0x20/0x28)
[    1.773655] [<c02f3a08>] (exynos_drm_bind) from [<c02fe664>] (try_to=
_bring_up_master.part.1+0xd8/0x114)
[    1.783027] [<c02fe664>] (try_to_bring_up_master.part.1) from [<c02f=
e754>] (component_master_add_with_match+0xb4/0x134)
[    1.793792] [<c02fe754>] (component_master_add_with_match) from [<c0=
2f3e94>] (exynos_drm_platform_probe+0xfc/0x124)
[    1.804207] [<c02f3e94>] (exynos_drm_platform_probe) from [<c0304a44=
>] (platform_drv_probe+0x58/0xb4)
[    1.813411] [<c0304a44>] (platform_drv_probe) from [<c0302fa8>] (dri=
ver_probe_device+0x11c/0x23c)
[    1.822261] [<c0302fa8>] (driver_probe_device) from [<c0303164>] (__=
driver_attach+0x9c/0xa0)
[    1.830679] [<c0303164>] (__driver_attach) from [<c03014a0>] (bus_fo=
r_each_dev+0x64/0x98)
[    1.838838] [<c03014a0>] (bus_for_each_dev) from [<c0302a4c>] (drive=
r_attach+0x2c/0x30)
[    1.846824] [<c0302a4c>] (driver_attach) from [<c030269c>] (bus_add_=
driver+0xe8/0x1e4)
[    1.854722] [<c030269c>] (bus_add_driver) from [<c0303ad8>] (driver_=
register+0x88/0x104)
[    1.862794] [<c0303ad8>] (driver_register) from [<c03048ac>] (__plat=
form_driver_register+0x58/0x6c)
[    1.871827] [<c03048ac>] (__platform_driver_register) from [<c02f3f8=
4>] (exynos_drm_init+0xc8/0x124)
[    1.880936] [<c02f3f84>] (exynos_drm_init) from [<c00089f4>] (do_one=
_initcall+0x90/0x1e0)
[    1.889096] [<c00089f4>] (do_one_initcall) from [<c08b2e24>] (kernel=
_init_freeable+0x114/0x1e0)
[    1.897779] [<c08b2e24>] (kernel_init_freeable) from [<c05235ac>] (k=
ernel_init+0x18/0xfc)
[    1.905934] [<c05235ac>] (kernel_init) from [<c000efa0>] (ret_from_f=
ork+0x14/0x34)

Hope that helps some, afraid I am not really familiar enough with
the graphics stack to chase that down much more though.

Thanks,
Charles
