From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: linux-next on Chromebook2: DRM failing to allocate
Date: Wed, 11 Jun 2014 02:21:00 +0530
Message-ID: <CAEC9eQMpukbdekaUeCzs8kqS9543hnnQj95bxHadmOQW1jvmaQ@mail.gmail.com>
References: <CAGa+x87EQcHBMc9NUOL_EKx=rKhOjfQ=_aMY5qvyPhqCN5--4w@mail.gmail.com>
	<CADMs+9a-vMpFOUmF5DO6X_OJfLgPP48DtRA9tcquzzt-Uso89A@mail.gmail.com>
	<CAGa+x85gXyefMhkpE8nGZkEEPc1X8pAHUvGMQbOPkTKZ6DLNqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f175.google.com ([209.85.128.175]:41345 "EHLO
	mail-ve0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752578AbaFJUvB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 16:51:01 -0400
Received: by mail-ve0-f175.google.com with SMTP id us18so6827596veb.34
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2014 13:51:00 -0700 (PDT)
In-Reply-To: <CAGa+x85gXyefMhkpE8nGZkEEPc1X8pAHUvGMQbOPkTKZ6DLNqQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@linaro.org>
Cc: =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>, Daniel Kurtz <djkurtz@chromium.org>, Inki Dae <inki.dae@samsung.com>, Naveen Krishna <naveenkrishna.ch@gmail.com>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Olof Johansson <olof@lixom.net>

Hi,

On 6/11/14, Kevin Hilman <khilman@linaro.org> wrote:
> On Tue, Jun 10, 2014 at 11:04 AM, St=C3=A9phane Marchesin
> <marcheu@chromium.org> wrote:
>> On Tue, Jun 10, 2014 at 10:56 AM, Kevin Hilman <khilman@linaro.org>
>> wrote:
>>> I'm trying to get the latest linux-next working on my Chromebook2
>>> (it's booting to a serial console) and am now trying to get the
>>> display working (at least for a frambuffer console.)
>>>
>>> Since the display nodes seem to be present in the exynos5800-peach-=
pi
>>> DTS, I tried enabling DRM and it's failing to allocate memory (log
>>> below[1]
>>>
>>> Is there some additional memory setup/allocations I should be doing=
?
>>> maybe with CMA?
>>
>> Probably not CMA, but maybe you don't have the iommu enabled?
>
> Turns out it was missing CMA support.  Specifically:
>    CONFIG_CMA=3Dy
>    CONFIG_DMA_CMA=3Dy
> are needed (my full .config is here: http://hastebin.com/uqopirazir.v=
bs)
>
> With that, it allocates, appears to detect the panel and even claims
> "Console: switching to colour frame buffer device", but I don't see
> tux or any output on the display (DRM debug output below).
>
> Note that I'm chain-loading nv_uboot from an SD card, and u-boot is
> driving the display (black text on white background.)  As soon as it
> starts the kernel though, u-boot seems to shut down the display
> (though the backlight seems to still be on.)
>
> Maybe the DT for peach-pi is missing the regulator used to power the
> panel, or maybe a GPIO used to power up the panel?
>
> Any ideas?
Not only the DT patches, but few patches are missing to support the
panel present on peach-pi.
You should also take the following patches to be able to get the
display up on peach-pi:
http://www.spinics.net/lists/linux-samsung-soc/msg32122.html

And, Arun/me will be sending all the DT changes necessary for fimd, dp
and peach-pi panel, ASAP!

Ajay

> Kevin
>
> [1] DRM output with drm.debug=3D0xff  (full kernel boot log here:
> http://hastebin.com/xigofelepe.vhdl
>
> [    1.192850] [drm] Initialized drm 1.1.0 20060810
> [    1.197676] [drm:drm_platform_init]
> [    1.200224] [drm:drm_get_platform_dev]
> [    1.204092] [drm:drm_minor_register]
> [    1.207851] [drm:drm_minor_register] new minor assigned 64
> [    1.213154] [drm:drm_minor_register]
> [    1.216791] [drm:drm_minor_register]
> [    1.220608] [drm:drm_minor_register] new minor assigned 0
> [    1.225869] [drm:exynos_drm_encoder_create] possible_crtcs =3D 0x1
> [    1.231820] [drm:exynos_drm_encoder_create] encoder has been creat=
ed
> [    1.238295] [drm:drm_sysfs_connector_add] adding "eDP-1" to sysfs
> [    1.244222] [drm:drm_sysfs_hotplug_event] generating hotplug event
> [    1.250371] [drm] Supports vblank timestamp caching Rev 2 (21.10.2=
013).
> [    1.256953] [drm] No driver support for vblank timestamp query.
> [    1.262855] [drm:drm_helper_hpd_irq_event] [CONNECTOR:15:eDP-1]
> status updated from unknown to connected
> [    1.272309] [drm:drm_sysfs_hotplug_event] generating hotplug event
> [    1.278480] [drm:exynos_drm_encoder_dpms] encoder dpms: 3
> [    1.283849] [drm:exynos_drm_crtc_dpms] crtc[6] mode[3]
> [    1.288964] [drm:exynos_drm_crtc_dpms] desired dpms mode is same a=
s
> previous one.
> [    1.296428] [drm:drm_helper_probe_single_connector_modes_merge_bit=
s]
> [CONNECTOR:15:eDP-1]
> [    1.304588] [drm:drm_helper_probe_single_connector_modes_merge_bit=
s]
> [CONNECTOR:15:eDP-1] probed modes :
> [    1.314043] [drm:drm_mode_debug_printmodeline] Modeline
> 16:"1920x1080" 60 150660 1920 1980 2060 2232 1080 1090 1100 1125 0x48
> 0x0
> [    1.325660] [drm:drm_setup_crtcs]
> [    1.329044] [drm:drm_enable_connectors] connector 15 enabled? yes
> [    1.335116] [drm:drm_target_preferred] looking for cmdline mode on
> connector 15
> [    1.342402] [drm:drm_target_preferred] looking for preferred mode
> on connector 15
> [    1.349862] [drm:drm_target_preferred] found mode 1920x1080
> [    1.355414] [drm:drm_setup_crtcs] picking CRTCs for 4096x4096 conf=
ig
> [    1.361749] [drm:drm_setup_crtcs] desired mode 1920x1080 set on cr=
tc 6
> [    1.368257] [drm:exynos_drm_fbdev_create] surface width(1920),
> height(1080) and bpp(32
> [    1.376150] [drm:exynos_drm_init_buf] desired size =3D 0x7e9000
> [    1.381886] [drm:exynos_drm_gem_init] created file object =3D 0xec=
7e2000
> [    1.391732] [drm:lowlevel_buffer_allocate] dma_addr(0x8e900000),
> size(0x7e9000)
> [    1.397581] [drm:drm_framebuffer_reference] FB ID: 18
> [    1.402614] [drm:exynos_drm_fb_buffer] dma_addr =3D 0x8e900000
> [    1.408526] [drm:drm_crtc_helper_set_config]
> [    1.408531] [drm:drm_crtc_helper_set_config] [CRTC:6] [FB:18]
> #connectors=3D1 (x y) (0 0)
> [    1.408536] [drm:drm_crtc_helper_set_config] crtc has no fb, full =
mode
> set
> [    1.408539] [drm:drm_crtc_helper_set_config] modes are different,
> full mode set
> [    1.408544] [drm:drm_mode_debug_printmodeline] Modeline 0:"" 0 0 0
> 0 0 0 0 0 0 0 0x0 0x0
> [    1.408549] [drm:drm_mode_debug_printmodeline] Modeline
> 17:"1920x1080" 60 150660 1920 1980 2060 2232 1080 1090 1100 1125 0x48
> 0x0
> [    1.408553] [drm:drm_crtc_helper_set_config] encoder changed, full
> mode switch
> [    1.408556] [drm:drm_crtc_helper_set_config] crtc changed, full mo=
de
> switch
> [    1.408560] [drm:drm_crtc_helper_set_config] [CONNECTOR:15:eDP-1] =
to
> [CRTC:6]
> [    1.408563] [drm:drm_crtc_helper_set_config] attempting to set mod=
e
> from userspace
> [    1.408568] [drm:drm_mode_debug_printmodeline] Modeline
> 17:"1920x1080" 60 150660 1920 1980 2060 2232 1080 1090 1100 1125 0x48
> 0x0
> [    1.408574] [drm:drm_crtc_helper_set_mode] [CRTC:6]
> [    1.408579] [drm:exynos_drm_fb_buffer] dma_addr =3D 0x8e900000
> [    1.408582] [drm:exynos_plane_mode_set] buffer: 0, dma_addr =3D 0x=
8e900000
> [    1.408590] [drm:exynos_plane_mode_set] overlay : offset_x/y(0,0),
> width/height(1920,1080)
> [    1.408591] [drm:fimd_win_mode_set] offset =3D 0x0, pitch =3D 1e00
> [    1.408595] [drm:fimd_win_mode_set] offset_x =3D 0, offset_y =3D 0
> [    1.408598] [drm:fimd_win_mode_set] ovl_width =3D 1920, ovl_height=
 =3D 1080
> [    1.408601] [drm:fimd_win_mode_set] paddr =3D 0x8e900000
> [    1.408604] [drm:fimd_win_mode_set] fb_width =3D 1920, crtc_width =
=3D 1920
> [    1.408607] [drm:drm_framebuffer_reference] FB ID: 18
> [    1.408611] [drm:drm_crtc_helper_set_mode] [ENCODER:14:TMDS-14] se=
t
> [MODE:17:1920x1080]
> [    1.408614] [drm:exynos_drm_crtc_dpms] crtc[6] mode[0]
> [    1.408618] [drm:fimd_dpms] ../drivers/gpu/drm/exynos/exynos_drm_f=
imd.c,
> 0
> [    1.408649] [drm:fimd_win_commit] start addr =3D 0x8e900000, end a=
ddr
> =3D 0x8f0e9000, size =3D 0x7e9000
> [    1.408652] [drm:fimd_win_commit] ovl_width =3D 1920, ovl_height =3D=
 1080
> [    1.408656] [drm:fimd_win_commit] osd pos: tx =3D 0, ty =3D 0, bx =
=3D
> 1919, by =3D 1079
> [    1.408660] [drm:fimd_win_commit] osd size =3D 0x1fa400
> [    1.408663] [drm:fimd_win_set_pixfmt] bpp =3D 32
> [    1.408948] [drm:drm_calc_timestamping_constants] crtc 6: hwmode:
> htotal 2232, vtotal 1125, vdisplay 1080
> [    1.408953] [drm:drm_calc_timestamping_constants] crtc 6: clock
> 150660 kHz framedur 16666666 linedur 14814, pixeldur 6
> [    1.408958] [drm:drm_crtc_helper_set_config] Setting connector DPM=
S
> state to on
> [    1.408961] [drm:drm_crtc_helper_set_config] [CONNECTOR:15:eDP-1] =
set
> DPMS on
> [    1.408966] [drm:drm_framebuffer_reference] FB ID: 18
> [    1.409097] [drm:drm_crtc_helper_set_config]
> [    1.409102] [drm:drm_crtc_helper_set_config] [CRTC:6] [FB:18]
> #connectors=3D1 (x y) (0 0)
> [    1.409107] [drm:drm_crtc_helper_set_config] [CONNECTOR:15:eDP-1] =
to
> [CRTC:6]
> [    1.409110] [drm:drm_framebuffer_reference] FB ID: 18
> [    1.409113] [drm:drm_framebuffer_unreference] FB ID: 18
> [    1.422580] Console: switching to colour frame buffer device 274x7=
7
> [    1.422587] [drm:drm_crtc_helper_set_config]
> [    1.422591] [drm:drm_crtc_helper_set_config] [CRTC:6] [FB:18]
> #connectors=3D1 (x y) (0 0)
> [    1.422596] [drm:drm_crtc_helper_set_config] [CONNECTOR:15:eDP-1] =
to
> [CRTC:6]
> [    1.422600] [drm:drm_framebuffer_reference] FB ID: 18
> [    1.422603] [drm:drm_framebuffer_unreference] FB ID: 18
> [    1.745135] exynos-drm exynos-drm: fb0:  frame buffer device
> [    1.752593] exynos-drm exynos-drm: registered panic notifier
> [    1.773526] [drm] Initialized exynos 1.0.0 20110530 on minor 0
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
