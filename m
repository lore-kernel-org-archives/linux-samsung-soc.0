From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: drm/exynos: getting the video processor to work
Date: Wed, 22 Apr 2015 10:55:31 +0900
Message-ID: <5536FF93.6000107@samsung.com>
References: <55356FEE.7030109@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:9842 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756783AbbDVBza (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Apr 2015 21:55:30 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NN600I3NQOFWI00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Apr 2015 10:55:27 +0900 (KST)
In-reply-to: <55356FEE.7030109@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>

Hi Tobias,

On 04/21/2015 06:30 AM, Tobias Jakobi wrote:
> Hello,
> 
> I've spend some time on figuring out how to use the VP on my Exynos4412.
> I noticed that currently it seems to be pretty broken (I've put a full
> crashlog with drm.debug=0xff at the end).
> 
> As far as I can see, the problem stems from conflicting buffer counts in
> the driver.
> 
> Let's start with vp_video_buffer(), there buf_num gets set to '2' when
> DRM_FORMAT_NV12 is encountered as pixelformat. Which results in the VP
> reading luma data from the plane's dma_addr[0] and chroma from dma_addr[1].
> 
> But dma_addr[1] is never correctly set. It should be set by
> exynos_check_plane(), but the loop only does one iteration since
> exynos_drm_fb_get_buf_cnt() returns 1.
> 
> Which is due to special case handling in
> exynos_drm_format_num_buffers(). At least for the buffers that libdrm's
> modetest creates this case handling triggers and reduces buffer count to
> '1'.
> 

This is just pixel format issue and mixer driver is not completed about
that. The exynos mixer can support two NV12 formats.

First, NV12 format having just one buffer(Y plane and CbCr plane use a
same buffer but differ their start index.)
Second, NV12 format having split two buffers(one is for Y plane, other
is for CbCr plane)

Current mixer driver considers only second NV12 format, we can know it
from following comment in mixer driver.

/* TODO: single buffer format NV12, NV21 */

Thanks.

> As you can see below, that makes the mixer go boom pretty fast.
> 
> Any idea how to proceed here? It looks to me like vp_video_buffer()
> should just respect the buffer count that is previously computed.
> 
> 
> With best wishes,
> Tobias
> 
> 
> liquid@chidori ~/sourcecode/video/drm/tests/modetest $ ./modetest -M
> exynos -s 23@21:1920x1080@XR24 -P 21:640x480+128+128@RG16 -P
> 21:640x480+1024+128@NV12
> [  125.727749] [drm:drm_stub_open]
> [  125.727816] [drm:drm_open_helper] pid = 2390, minor = 0
> [  125.730563] [drm:ipp_subdrv_open] done priv[0xed862410]
> [  125.735817] [drm:drm_setup]
> [  125.738727] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_VERSION
> [  125.745627] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_VERSION
> [  125.752592] [drm:drm_release] open_count = 1
> [  125.756816] [drm:drm_release] pid = 2390, device = 0xe200, open_count = 1
> [  125.763594] [drm:drm_lastclose]
> [  125.766766] [drm:drm_crtc_helper_set_config]
> [  125.771131] [drm:drm_crtc_helper_set_config] [CRTC:21] [FB:32]
> #connectors=1 (x y) (0 0)
> [  125.779208] [drm:drm_crtc_helper_set_config] crtc has no fb, full
> mode set
> [  125.786063] [drm:drm_crtc_helper_set_config] modes are different,
> full mode set
> [  125.793480] [drm:drm_mode_debug_printmodeline] Modeline 0:"" 0 0 0 0
> 0 0 0 0 0 0 0x0 0x0
> [  125.801504] [drm:drm_mode_debug_printmodeline] Modeline 30:"1280x720"
> 60 74250 1280 1390 1430 1650 720 725 730 750 0x40 0x5
> [  125.812642] [drm:drm_crtc_helper_set_config] encoder changed, full
> mode switch
> [  125.819770] [drm:drm_crtc_helper_set_config] crtc changed, full mode
> switch
> [  125.826664] [drm:drm_crtc_helper_set_config] [CONNECTOR:23:HDMI-A-1]
> to [CRTC:21]
> [  125.834117] [drm:drm_crtc_helper_set_config] attempting to set mode
> from userspace
> [  125.841671] [drm:drm_mode_debug_printmodeline] Modeline 30:"1280x720"
> 60 74250 1280 1390 1430 1650 720 725 730 750 0x40 0x5
> [  125.852788] [drm:hdmi_mode_fixup] drivers/gpu/drm/exynos/exynos_hdmi.c
> [  125.859286] [drm:hdmi_mode_valid] xres=1280, yres=720, refresh=60,
> intl=0 clock=74250000
> [  125.867362] [drm:mixer_check_mode] xres=1280, yres=720, refresh=60,
> intl=0
> [  125.874219] [drm:drm_crtc_helper_set_mode] [CRTC:21]
> [  125.879166] [drm:exynos_drm_fb_buffer] dma_addr = 0x20100000
> [  125.884807] [drm:exynos_check_plane] buffer: 0, dma_addr = 0x20100000
> [  125.891236] [drm:exynos_plane_mode_set] plane : offset_x/y(0,0),
> width/height(1280,720)
> [  125.899047] [drm:drm_crtc_helper_set_mode] [ENCODER:22:TMDS-22] set
> [MODE:30:1280x720]
> [  125.907115] [drm:hdmi_mode_set] xres=1280, yres=720, refresh=60,
> intl=PROGRESSIVE
> [  125.914588] [drm:exynos_drm_crtc_dpms] crtc[21] mode[0]
> [  125.919835] [drm:mixer_win_commit] win: 0
> [  125.923789] [drm:mixer_setup_scale] only 2x width/height scaling of
> plane supported
> [  125.931421] [drm:hdmi_dpms] mode 0
> [  125.935265] [drm:hdmiphy_poweron]
> [  126.003371] [drm:hdmi_reg_infoframe] AVI checksum = 0x4f
> [  126.003439] [drm:hdmi_reg_infoframe] AUI checksum = 0x71
> [  126.008603] [drm:hdmi_v14_regs_dump] start: ---- CONTROL REGISTERS ----
> [  126.015012] [drm:hdmi_v14_regs_dump] start:HDMI_INTC_CON = 00000000
> [  126.021263] [drm:hdmi_v14_regs_dump] start:HDMI_INTC_FLAG = 00000000
> [  126.027545] [drm:hdmi_v14_regs_dump] start:HDMI_HPD_STATUS = 00000000
> [  126.033973] [drm:hdmi_v14_regs_dump] start:HDMI_INTC_CON_1 = 00000000
> [  126.040398] [drm:hdmi_v14_regs_dump] start:HDMI_INTC_FLAG_1 = 00000000
> [  126.046902] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_STATUS_0 = 00000001
> [  126.053494] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_STATUS_PLL = 00000001
> [  126.060268] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_CON_0 = 00000000
> [  126.066610] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_RSTOUT = 00000000
> [  126.073028] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_VPLL = 00000080
> [  126.079270] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_CMU = 0000008c
> [  126.085445] [drm:hdmi_v14_regs_dump] start:HDMI_CORE_RSTOUT = 00000001
> [  126.091982] [drm:hdmi_v14_regs_dump] start: ---- CORE REGISTERS ----
> [  126.098288] [drm:hdmi_v14_regs_dump] start:HDMI_CON_0 = 00000005
> [  126.104275] [drm:hdmi_v14_regs_dump] start:HDMI_CON_1 = 00000000
> [  126.110265] [drm:hdmi_v14_regs_dump] start:HDMI_CON_2 = 00000000
> [  126.116249] [drm:hdmi_v14_regs_dump] start:HDMI_SYS_STATUS = 00000000
> [  126.122677] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_STATUS_0 = 00000001
> [  126.129273] [drm:hdmi_v14_regs_dump] start:HDMI_STATUS_EN = 00000000
> [  126.135610] [drm:hdmi_v14_regs_dump] start:HDMI_HPD = 00000000
> [  126.141421] [drm:hdmi_v14_regs_dump] start:HDMI_MODE_SEL = 00000002
> [  126.147681] [drm:hdmi_v14_regs_dump] start:HDMI_ENC_EN = 00000000
> [  126.153751] [drm:hdmi_v14_regs_dump] start:HDMI_DC_CONTROL = 00000000
> [  126.160175] [drm:hdmi_v14_regs_dump] start:HDMI_VIDEO_PATTERN_GEN =
> 00000000
> [  126.167199] [drm:hdmi_v14_regs_dump] start: ---- CORE SYNC REGISTERS ----
> [  126.173976] [drm:hdmi_v14_regs_dump] start:HDMI_H_BLANK_0 = 00000072
> [  126.180311] [drm:hdmi_v14_regs_dump] start:HDMI_H_BLANK_1 = 00000001
> [  126.186648] [drm:hdmi_v14_regs_dump] start:HDMI_V2_BLANK_0 = 000000ee
> [  126.193066] [drm:hdmi_v14_regs_dump] start:HDMI_V2_BLANK_1 = 00000002
> [  126.199501] [drm:hdmi_v14_regs_dump] start:HDMI_V1_BLANK_0 = 0000001e
> [  126.205937] [drm:hdmi_v14_regs_dump] start:HDMI_V1_BLANK_1 = 00000000
> [  126.212329] [drm:hdmi_v14_regs_dump] start:HDMI_V_LINE_0 = 000000ee
> [  126.218576] [drm:hdmi_v14_regs_dump] start:HDMI_V_LINE_1 = 00000002
> [  126.224827] [drm:hdmi_v14_regs_dump] start:HDMI_H_LINE_0 = 00000072
> [  126.231112] [drm:hdmi_v14_regs_dump] start:HDMI_H_LINE_1 = 00000006
> [  126.237330] [drm:hdmi_v14_regs_dump] start:HDMI_HSYNC_POL = 00000000
> [  126.243662] [drm:hdmi_v14_regs_dump] start:HDMI_VSYNC_POL = 00000000
> [  126.250001] [drm:hdmi_v14_regs_dump] start:HDMI_INT_PRO_MODE = 00000000
> [  126.256629] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F0_0 = 000000ff
> [  126.263196] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F0_1 = 0000001f
> [  126.269789] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F1_0 = 000000ff
> [  126.276386] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F1_1 = 0000001f
> [  126.283015] [drm:hdmi_v14_regs_dump] start:HDMI_H_SYNC_START_0 = 0000006c
> [  126.289764] [drm:hdmi_v14_regs_dump] start:HDMI_H_SYNC_START_1 = 00000000
> [  126.296522] [drm:hdmi_v14_regs_dump] start:HDMI_H_SYNC_END_0 = 00000094
> [  126.303121] [drm:hdmi_v14_regs_dump] start:HDMI_H_SYNC_END_1 = 00000000
> [  126.309744] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_BEF_2_0 =
> 0000000a
> [  126.316924] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_BEF_2_1 =
> 00000000
> [  126.324125] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_BEF_1_0 =
> 00000005
> [  126.331498] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_BEF_1_1 =
> 00000000
> [  126.338532] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_2_0 =
> 000000ff
> [  126.345740] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_2_1 =
> 0000001f
> [  126.352938] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_1_0 =
> 000000ff
> [  126.360149] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_1_1 =
> 0000001f
> [  126.367348] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_2_0 = 000000ff
> [  126.374902] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_2_1 = 0000001f
> [  126.382454] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_1_0 = 000000ff
> [  126.390025] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_1_1 = 0000001f
> [  126.397554] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F2_0 = 000000ff
> [  126.404157] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F2_1 = 0000001f
> [  126.410751] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F3_0 = 000000ff
> [  126.417350] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F3_1 = 0000001f
> [  126.423940] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F4_0 = 000000ff
> [  126.430543] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F4_1 = 0000001f
> [  126.437135] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F5_0 = 000000ff
> [  126.443736] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F5_1 = 0000001f
> [  126.450328] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_3_0 =
> 000000ff
> [  126.457537] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_3_1 =
> 0000001f
> [  126.464734] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_4_0 =
> 000000ff
> [  126.471940] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_4_1 =
> 0000001f
> [  126.479150] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_5_0 =
> 000000ff
> [  126.486355] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_5_1 =
> 0000001f
> [  126.493588] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_6_0 =
> 000000ff
> [  126.500764] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_6_1 =
> 0000001f
> [  126.507966] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_3_0 = 000000ff
> [  126.515517] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_3_1 = 0000001f
> [  126.523070] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_4_0 = 000000ff
> [  126.530621] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_4_1 = 0000001f
> [  126.538170] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_5_0 = 000000ff
> [  126.545727] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_5_1 = 0000001f
> [  126.553270] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_6_0 = 000000ff
> [  126.560867] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_6_1 = 0000001f
> [  126.568417] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_1_0 = 000000ff
> [  126.575185] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_1_1 = 0000001f
> [  126.581955] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_2_0 = 000000ff
> [  126.588719] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_2_1 = 0000001f
> [  126.595461] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_3_0 = 000000ff
> [  126.602234] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_3_1 = 0000001f
> [  126.609035] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_4_0 = 000000ff
> [  126.615809] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_4_1 = 0000001f
> [  126.622578] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_5_0 = 000000ff
> [  126.629350] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_5_1 = 0000001f
> [  126.636117] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_6_0 = 000000ff
> [  126.642891] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_6_1 = 0000001f
> [  126.649622] [drm:hdmi_v14_regs_dump] start: ---- TG REGISTERS ----
> [  126.655789] [drm:hdmi_v14_regs_dump] start:HDMI_TG_CMD = 00000001
> [  126.661859] [drm:hdmi_v14_regs_dump] start:HDMI_TG_H_FSZ_L = 00000072
> [  126.668292] [drm:hdmi_v14_regs_dump] start:HDMI_TG_H_FSZ_H = 00000006
> [  126.674707] [drm:hdmi_v14_regs_dump] start:HDMI_TG_HACT_ST_L = 00000072
> [  126.681307] [drm:hdmi_v14_regs_dump] start:HDMI_TG_HACT_ST_H = 00000001
> [  126.687921] [drm:hdmi_v14_regs_dump] start:HDMI_TG_HACT_SZ_L = 00000000
> [  126.694501] [drm:hdmi_v14_regs_dump] start:HDMI_TG_HACT_SZ_H = 00000005
> [  126.701096] [drm:hdmi_v14_regs_dump] start:HDMI_TG_V_FSZ_L = 000000ee
> [  126.707519] [drm:hdmi_v14_regs_dump] start:HDMI_TG_V_FSZ_H = 00000002
> [  126.713943] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC_L = 00000001
> [  126.720367] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC_H = 00000000
> [  126.726787] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC2_L = 00000033
> [  126.733301] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC2_H = 00000002
> [  126.739802] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST_L = 0000001e
> [  126.746402] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST_H = 00000000
> [  126.752999] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_SZ_L = 000000d0
> [  126.759595] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_SZ_H = 00000002
> [  126.766193] [drm:hdmi_v14_regs_dump] start:HDMI_TG_FIELD_CHG_L = 00000033
> [  126.772981] [drm:hdmi_v14_regs_dump] start:HDMI_TG_FIELD_CHG_H = 00000002
> [  126.779746] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST2_L = 00000048
> [  126.786432] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST2_H = 00000002
> [  126.793135] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST3_L = 0000007b
> [  126.799802] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST3_H = 00000004
> [  126.806480] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST4_L = 000000ae
> [  126.813167] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST4_H = 00000006
> [  126.819847] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC_TOP_HDMI_L =
> 00000001
> [  126.827044] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC_TOP_HDMI_H =
> 00000000
> [  126.834248] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC_BOT_HDMI_L =
> 00000033
> [  126.841451] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC_BOT_HDMI_H =
> 00000002
> [  126.848650] [drm:hdmi_v14_regs_dump] start:HDMI_TG_FIELD_TOP_HDMI_L =
> 00000001
> [  126.855857] [drm:hdmi_v14_regs_dump] start:HDMI_TG_FIELD_TOP_HDMI_H =
> 00000000
> [  126.863062] [drm:hdmi_v14_regs_dump] start:HDMI_TG_FIELD_BOT_HDMI_L =
> 00000033
> [  126.870269] [drm:hdmi_v14_regs_dump] start:HDMI_TG_FIELD_BOT_HDMI_H =
> 00000002
> [  126.877467] [drm:hdmi_v14_regs_dump] start:HDMI_TG_3D = 00000000
> [  126.883459] [drm:hdmi_v14_regs_dump] start: ---- PACKET REGISTERS ----
> [  126.889986] [drm:hdmi_v14_regs_dump] start:HDMI_AVI_CON = 00000002
> [  126.896133] [drm:hdmi_v14_regs_dump] start:HDMI_AVI_HEADER0 = 00000082
> [  126.902642] [drm:hdmi_v14_regs_dump] start:HDMI_AVI_HEADER1 = 00000002
> [  126.909152] [drm:hdmi_v14_regs_dump] start:HDMI_AVI_HEADER2 = 0000000d
> [  126.915662] [drm:hdmi_v14_regs_dump] start:HDMI_AVI_CHECK_SUM = 0000004f
> [  126.922346] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_CON = 00000000
> [  126.928511] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_HEADER0 = 00000000
> [  126.935019] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_HEADER1 = 00000000
> [  126.941528] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_HEADER2 = 00000000
> [  126.948039] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  126.954548] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  126.961058] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  126.967569] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  126.974083] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  126.980588] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  126.987116] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  127.033434] [drm:hdmi_reg_infoframe] AVI checksum = 0x4f
> [  127.033500] [drm:hdmi_reg_infoframe] AUI checksum = 0x71
> [  127.038492] [drm:hdmi_v14_regs_dump] start: ---- CONTROL REGISTERS ----
> [  127.045004] [drm:hdmi_v14_regs_dump] start:HDMI_INTC_CON = 00000000
> [  127.051253] [drm:hdmi_v14_regs_dump] start:HDMI_INTC_FLAG = 00000000
> [  127.057589] [drm:hdmi_v14_regs_dump] start:HDMI_HPD_STATUS = 00000000
> [  127.064012] [drm:hdmi_v14_regs_dump] start:HDMI_INTC_CON_1 = 00000000
> [  127.070435] [drm:hdmi_v14_regs_dump] start:HDMI_INTC_FLAG_1 = 00000000
> [  127.076950] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_STATUS_0 = 00000001
> [  127.083539] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_STATUS_PLL = 00000001
> [  127.090465] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_CON_0 = 00000000
> [  127.096657] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_RSTOUT = 00000000
> [  127.103088] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_VPLL = 00000080
> [  127.109328] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_CMU = 0000008c
> [  127.115536] [drm:hdmi_v14_regs_dump] start:HDMI_CORE_RSTOUT = 00000001
> [  127.122003] [drm:hdmi_v14_regs_dump] start: ---- CORE REGISTERS ----
> [  127.128345] [drm:hdmi_v14_regs_dump] start:HDMI_CON_0 = 00000005
> [  127.134326] [drm:hdmi_v14_regs_dump] start:HDMI_CON_1 = 00000000
> [  127.140358] [drm:hdmi_v14_regs_dump] start:HDMI_CON_2 = 00000000
> [  127.146307] [drm:hdmi_v14_regs_dump] start:HDMI_SYS_STATUS = 00000000
> [  127.152736] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_STATUS_0 = 00000001
> [  127.159325] [drm:hdmi_v14_regs_dump] start:HDMI_STATUS_EN = 00000000
> [  127.165702] [drm:hdmi_v14_regs_dump] start:HDMI_HPD = 00000000
> [  127.171479] [drm:hdmi_v14_regs_dump] start:HDMI_MODE_SEL = 00000002
> [  127.177740] [drm:hdmi_v14_regs_dump] start:HDMI_ENC_EN = 00000000
> [  127.183803] [drm:hdmi_v14_regs_dump] start:HDMI_DC_CONTROL = 00000000
> [  127.190267] [drm:hdmi_v14_regs_dump] start:HDMI_VIDEO_PATTERN_GEN =
> 00000000
> [  127.197258] [drm:hdmi_v14_regs_dump] start: ---- CORE SYNC REGISTERS ----
> [  127.204033] [drm:hdmi_v14_regs_dump] start:HDMI_H_BLANK_0 = 00000072
> [  127.210422] [drm:hdmi_v14_regs_dump] start:HDMI_H_BLANK_1 = 00000001
> [  127.216710] [drm:hdmi_v14_regs_dump] start:HDMI_V2_BLANK_0 = 000000ee
> [  127.223127] [drm:hdmi_v14_regs_dump] start:HDMI_V2_BLANK_1 = 00000002
> [  127.229551] [drm:hdmi_v14_regs_dump] start:HDMI_V1_BLANK_0 = 0000001e
> [  127.235973] [drm:hdmi_v14_regs_dump] start:HDMI_V1_BLANK_1 = 00000000
> [  127.242398] [drm:hdmi_v14_regs_dump] start:HDMI_V_LINE_0 = 000000ee
> [  127.248645] [drm:hdmi_v14_regs_dump] start:HDMI_V_LINE_1 = 00000002
> [  127.254895] [drm:hdmi_v14_regs_dump] start:HDMI_H_LINE_0 = 00000072
> [  127.261150] [drm:hdmi_v14_regs_dump] start:HDMI_H_LINE_1 = 00000006
> [  127.267397] [drm:hdmi_v14_regs_dump] start:HDMI_HSYNC_POL = 00000000
> [  127.273729] [drm:hdmi_v14_regs_dump] start:HDMI_VSYNC_POL = 00000000
> [  127.280074] [drm:hdmi_v14_regs_dump] start:HDMI_INT_PRO_MODE = 00000000
> [  127.286664] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F0_0 = 000000ff
> [  127.293274] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F0_1 = 0000001f
> [  127.299856] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F1_0 = 000000ff
> [  127.306455] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F1_1 = 0000001f
> [  127.313052] [drm:hdmi_v14_regs_dump] start:HDMI_H_SYNC_START_0 = 0000006c
> [  127.319823] [drm:hdmi_v14_regs_dump] start:HDMI_H_SYNC_START_1 = 00000000
> [  127.326589] [drm:hdmi_v14_regs_dump] start:HDMI_H_SYNC_END_0 = 00000094
> [  127.333195] [drm:hdmi_v14_regs_dump] start:HDMI_H_SYNC_END_1 = 00000000
> [  127.339788] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_BEF_2_0 =
> 0000000a
> [  127.346981] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_BEF_2_1 =
> 00000000
> [  127.354184] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_BEF_1_0 =
> 00000005
> [  127.361389] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_BEF_1_1 =
> 00000000
> [  127.368593] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_2_0 =
> 000000ff
> [  127.375797] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_2_1 =
> 0000001f
> [  127.383006] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_1_0 =
> 000000ff
> [  127.390223] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_1_1 =
> 0000001f
> [  127.397409] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_2_0 = 000000ff
> [  127.404963] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_2_1 = 0000001f
> [  127.412514] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_1_0 = 000000ff
> [  127.420065] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_1_1 = 0000001f
> [  127.427617] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F2_0 = 000000ff
> [  127.434214] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F2_1 = 0000001f
> [  127.440811] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F3_0 = 000000ff
> [  127.447408] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F3_1 = 0000001f
> [  127.454004] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F4_0 = 000000ff
> [  127.460601] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F4_1 = 0000001f
> [  127.467198] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F5_0 = 000000ff
> [  127.473793] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F5_1 = 0000001f
> [  127.480391] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_3_0 =
> 000000ff
> [  127.487659] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_3_1 =
> 0000001f
> [  127.494814] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_4_0 =
> 000000ff
> [  127.502022] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_4_1 =
> 0000001f
> [  127.509228] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_5_0 =
> 000000ff
> [  127.516417] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_5_1 =
> 0000001f
> [  127.523623] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_6_0 =
> 000000ff
> [  127.530826] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_6_1 =
> 0000001f
> [  127.538025] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_3_0 = 000000ff
> [  127.545579] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_3_1 = 0000001f
> [  127.553131] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_4_0 = 000000ff
> [  127.560681] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_4_1 = 0000001f
> [  127.568233] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_5_0 = 000000ff
> [  127.575785] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_5_1 = 0000001f
> [  127.583336] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_6_0 = 000000ff
> [  127.590911] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_6_1 = 0000001f
> [  127.598438] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_1_0 = 000000ff
> [  127.605210] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_1_1 = 0000001f
> [  127.611981] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_2_0 = 000000ff
> [  127.618751] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_2_1 = 0000001f
> [  127.625521] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_3_0 = 000000ff
> [  127.632292] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_3_1 = 0000001f
> [  127.639062] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_4_0 = 000000ff
> [  127.645832] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_4_1 = 0000001f
> [  127.652603] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_5_0 = 000000ff
> [  127.659373] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_5_1 = 0000001f
> [  127.666143] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_6_0 = 000000ff
> [  127.672914] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_6_1 = 0000001f
> [  127.679683] [drm:hdmi_v14_regs_dump] start: ---- TG REGISTERS ----
> [  127.685847] [drm:hdmi_v14_regs_dump] start:HDMI_TG_CMD = 00000001
> [  127.691945] [drm:hdmi_v14_regs_dump] start:HDMI_TG_H_FSZ_L = 00000072
> [  127.698347] [drm:hdmi_v14_regs_dump] start:HDMI_TG_H_FSZ_H = 00000006
> [  127.704769] [drm:hdmi_v14_regs_dump] start:HDMI_TG_HACT_ST_L = 00000072
> [  127.711366] [drm:hdmi_v14_regs_dump] start:HDMI_TG_HACT_ST_H = 00000001
> [  127.717964] [drm:hdmi_v14_regs_dump] start:HDMI_TG_HACT_SZ_L = 00000000
> [  127.724559] [drm:hdmi_v14_regs_dump] start:HDMI_TG_HACT_SZ_H = 00000005
> [  127.731156] [drm:hdmi_v14_regs_dump] start:HDMI_TG_V_FSZ_L = 000000ee
> [  127.737585] [drm:hdmi_v14_regs_dump] start:HDMI_TG_V_FSZ_H = 00000002
> [  127.744006] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC_L = 00000001
> [  127.750430] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC_H = 00000000
> [  127.756854] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC2_L = 00000033
> [  127.763364] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC2_H = 00000002
> [  127.769872] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST_L = 0000001e
> [  127.776469] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST_H = 00000000
> [  127.783070] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_SZ_L = 000000d0
> [  127.789683] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_SZ_H = 00000002
> [  127.796265] [drm:hdmi_v14_regs_dump] start:HDMI_TG_FIELD_CHG_L = 00000033
> [  127.803032] [drm:hdmi_v14_regs_dump] start:HDMI_TG_FIELD_CHG_H = 00000002
> [  127.809800] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST2_L = 00000048
> [  127.816489] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST2_H = 00000002
> [  127.823188] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST3_L = 0000007b
> [  127.829868] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST3_H = 00000004
> [  127.836550] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST4_L = 000000ae
> [  127.843234] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST4_H = 00000006
> [  127.849920] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC_TOP_HDMI_L =
> 00000001
> [  127.857124] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC_TOP_HDMI_H =
> 00000000
> [  127.864325] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC_BOT_HDMI_L =
> 00000033
> [  127.871531] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC_BOT_HDMI_H =
> 00000002
> [  127.878724] [drm:hdmi_v14_regs_dump] start:HDMI_TG_FIELD_TOP_HDMI_L =
> 00000001
> [  127.885926] [drm:hdmi_v14_regs_dump] start:HDMI_TG_FIELD_TOP_HDMI_H =
> 00000000
> [  127.893143] [drm:hdmi_v14_regs_dump] start:HDMI_TG_FIELD_BOT_HDMI_L =
> 00000033
> [  127.900338] [drm:hdmi_v14_regs_dump] start:HDMI_TG_FIELD_BOT_HDMI_H =
> 00000002
> [  127.907538] [drm:hdmi_v14_regs_dump] start:HDMI_TG_3D = 00000000
> [  127.913525] [drm:hdmi_v14_regs_dump] start: ---- PACKET REGISTERS ----
> [  127.920037] [drm:hdmi_v14_regs_dump] start:HDMI_AVI_CON = 00000002
> [  127.926201] [drm:hdmi_v14_regs_dump] start:HDMI_AVI_HEADER0 = 00000082
> [  127.932710] [drm:hdmi_v14_regs_dump] start:HDMI_AVI_HEADER1 = 00000002
> [  127.939219] [drm:hdmi_v14_regs_dump] start:HDMI_AVI_HEADER2 = 0000000d
> [  127.945733] [drm:hdmi_v14_regs_dump] start:HDMI_AVI_CHECK_SUM = 0000004f
> [  127.952414] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_CON = 00000000
> [  127.958574] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_HEADER0 = 00000000
> [  127.965089] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_HEADER1 = 00000000
> [  127.971590] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_HEADER2 = 00000000
> [  127.978144] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  127.984652] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  127.991183] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  127.997645] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  128.004155] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  128.010657] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  128.017169] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  128.023714] [drm:drm_calc_timestamping_constants] crtc 21: hwmode:
> htotal 1650, vtotal 750, vdisplay 720
> [  128.033177] [drm:drm_calc_timestamping_constants] crtc 21: clock
> 74250 kHz framedur 16666666 linedur 22222, pixeldur 13
> [  128.043942] [drm:drm_crtc_helper_set_config] Setting connector DPMS
> state to on
> [  128.051230] [drm:drm_crtc_helper_set_config]
> [CONNECTOR:23:HDMI-A-1] set DPMS on
> [  128.058716] [drm:drm_framebuffer_reference] ed95c180: FB ID: 32 (1)
> [  128.064921] [drm:drm_lastclose] driver lastclose completed
> [  128.070374] [drm:drm_lastclose] lastclose completed
> [  128.075301] [drm:drm_stub_open]
> [  128.078449] [drm:drm_open_helper] pid = 2390, minor = 0
> [  128.083662] [drm:ipp_subdrv_open] done priv[0xed862410]
> [  128.088884] [drm:drm_setup]
> [  128.091739] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_VERSION
> [  128.098676] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_VERSION
> [  128.105654] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_GET_UNIQUE
> [  128.112823] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_GET_UNIQUE
> [  128.120042] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_SET_CLIENT_CAP
> [  128.127578] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETRESOURCES
> [  128.135388] [drm:drm_mode_getresources] CRTC[1] CONNECTORS[1] ENCODERS[1]
> [  128.142158] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETRESOURCES
> [  128.149969] [drm:drm_mode_getresources] CRTC[1] CONNECTORS[1] ENCODERS[1]
> [  128.156748] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETCRTC
> [  128.164130] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETENCODER
> [  128.171763] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETCONNECTOR
> [  128.179567] [drm:drm_mode_getconnector] [CONNECTOR:23:?]
> [  128.184863] [drm:drm_helper_probe_single_connector_modes_merge_bits]
> [CONNECTOR:23:HDMI-A-1]
> [  128.218460] [drm:hdmi_get_modes] hdmi monitor : width[60] x height[34]
> [  128.219856] [drm:hdmi_mode_valid] xres=1920, yres=1080, refresh=60,
> intl=0 clock=148500000
> [  128.227610] [drm:mixer_check_mode] xres=1920, yres=1080, refresh=60,
> intl=0
> [  128.234549] [drm:hdmi_mode_valid] xres=1920, yres=1080, refresh=60,
> intl=1 clock=74250000
> [  128.242705] [drm:mixer_check_mode] xres=1920, yres=1080, refresh=60,
> intl=1
> [  128.249649] [drm:hdmi_mode_valid] xres=1920, yres=1080, refresh=60,
> intl=1 clock=74176000
> [  128.257807] [drm:mixer_check_mode] xres=1920, yres=1080, refresh=60,
> intl=1
> [  128.264752] [drm:hdmi_mode_valid] xres=1920, yres=1080, refresh=50,
> intl=0 clock=148500000
> [  128.272998] [drm:mixer_check_mode] xres=1920, yres=1080, refresh=50,
> intl=0
> [  128.279942] [drm:hdmi_mode_valid] xres=1920, yres=1080, refresh=50,
> intl=1 clock=74250000
> [  128.288250] [drm:mixer_check_mode] xres=1920, yres=1080, refresh=50,
> intl=1
> [  128.295053] [drm:hdmi_mode_valid] xres=1920, yres=1080, refresh=50,
> intl=1 clock=74250000
> [  128.303220] [drm:mixer_check_mode] xres=1920, yres=1080, refresh=50,
> intl=1
> [  128.310160] [drm:hdmi_mode_valid] xres=1680, yres=1050, refresh=60,
> intl=0 clock=119000000
> [  128.318440] [drm:mixer_check_mode] xres=1680, yres=1050, refresh=60,
> intl=0
> [  128.325346] [drm:hdmi_mode_valid] xres=1280, yres=720, refresh=60,
> intl=0 clock=74250000
> [  128.333422] [drm:mixer_check_mode] xres=1280, yres=720, refresh=60,
> intl=0
> [  128.340272] [drm:hdmi_mode_valid] xres=1280, yres=720, refresh=60,
> intl=0 clock=74176000
> [  128.348383] [drm:mixer_check_mode] xres=1280, yres=720, refresh=60,
> intl=0
> [  128.355205] [drm:hdmi_mode_valid] xres=1280, yres=720, refresh=50,
> intl=0 clock=74250000
> [  128.363281] [drm:mixer_check_mode] xres=1280, yres=720, refresh=50,
> intl=0
> [  128.370131] [drm:hdmi_mode_valid] xres=720, yres=576, refresh=50,
> intl=0 clock=27000000
> [  128.378156] [drm:mixer_check_mode] xres=720, yres=576, refresh=50, intl=0
> [  128.384889] [drm:hdmi_mode_valid] xres=720, yres=480, refresh=60,
> intl=0 clock=27027000
> [  128.392880] [drm:mixer_check_mode] xres=720, yres=480, refresh=60, intl=0
> [  128.399643] [drm:hdmi_mode_valid] xres=720, yres=480, refresh=60,
> intl=0 clock=27000000
> [  128.407668] [drm:mixer_check_mode] xres=720, yres=480, refresh=60, intl=0
> [  128.414406] [drm:hdmi_mode_valid] xres=640, yres=480, refresh=60,
> intl=0 clock=25200000
> [  128.422390] [drm:mixer_check_mode] xres=640, yres=480, refresh=60, intl=0
> [  128.429208] [drm:hdmi_mode_valid] xres=1600, yres=1200, refresh=0,
> intl=0 clock=162000000
> [  128.437321] [drm:mixer_check_mode] xres=1600, yres=1200, refresh=0,
> intl=0
> [  128.444174] [drm:hdmi_mode_valid] xres=1440, yres=900, refresh=0,
> intl=0 clock=88750000
> [  128.452161] [drm:mixer_check_mode] xres=1440, yres=900, refresh=0, intl=0
> [  128.458930] [drm:hdmi_mode_valid] xres=1280, yres=960, refresh=0,
> intl=0 clock=108000000
> [  128.467007] [drm:mixer_check_mode] xres=1280, yres=960, refresh=0, intl=0
> [  128.473773] [drm:hdmi_mode_valid] xres=1280, yres=1024, refresh=0,
> intl=0 clock=108000000
> [  128.481933] [drm:mixer_check_mode] xres=1280, yres=1024, refresh=0,
> intl=0
> [  128.488816] [drm:hdmi_mode_valid] xres=1440, yres=900, refresh=0,
> intl=0 clock=136750000
> [  128.496870] [drm:mixer_check_mode] xres=1440, yres=900, refresh=0, intl=0
> [  128.503633] [drm:hdmi_mode_valid] xres=1152, yres=864, refresh=0,
> intl=0 clock=108000000
> [  128.511706] [drm:mixer_check_mode] xres=1152, yres=864, refresh=0, intl=0
> [  128.518481] [drm:hdmi_mode_valid] xres=800, yres=600, refresh=0,
> intl=0 clock=40000000
> [  128.526376] [drm:mixer_check_mode] xres=800, yres=600, refresh=0, intl=0
> [  128.533058] [drm:hdmi_mode_valid] xres=800, yres=600, refresh=0,
> intl=0 clock=36000000
> [  128.540956] [drm:mixer_check_mode] xres=800, yres=600, refresh=0, intl=0
> [  128.547641] [drm:hdmi_mode_valid] xres=640, yres=480, refresh=0,
> intl=0 clock=31500000
> [  128.555540] [drm:mixer_check_mode] xres=640, yres=480, refresh=0, intl=0
> [  128.562223] [drm:hdmi_find_phy_conf] Could not find phy config for
> 31500000
> [  128.569171] [drm:hdmi_mode_valid] xres=640, yres=480, refresh=0,
> intl=0 clock=31500000
> [  128.577077] [drm:mixer_check_mode] xres=640, yres=480, refresh=0, intl=0
> [  128.583742] [drm:hdmi_find_phy_conf] Could not find phy config for
> 31500000
> [  128.590696] [drm:hdmi_mode_valid] xres=640, yres=480, refresh=0,
> intl=0 clock=30240000
> [  128.598585] [drm:mixer_check_mode] xres=640, yres=480, refresh=0, intl=0
> [  128.605267] [drm:hdmi_find_phy_conf] Could not find phy config for
> 30240000
> [  128.612212] [drm:hdmi_mode_valid] xres=720, yres=400, refresh=0,
> intl=0 clock=28320000
> [  128.620114] [drm:mixer_check_mode] xres=720, yres=400, refresh=0, intl=0
> [  128.626794] [drm:hdmi_find_phy_conf] Could not find phy config for
> 28320000
> [  128.633739] [drm:hdmi_mode_valid] xres=1280, yres=1024, refresh=0,
> intl=0 clock=135000000
> [  128.641898] [drm:mixer_check_mode] xres=1280, yres=1024, refresh=0,
> intl=0
> [  128.648756] [drm:hdmi_mode_valid] xres=1024, yres=768, refresh=0,
> intl=0 clock=78800000
> [  128.656739] [drm:mixer_check_mode] xres=1024, yres=768, refresh=0, intl=0
> [  128.663511] [drm:hdmi_mode_valid] xres=1024, yres=768, refresh=0,
> intl=0 clock=75000000
> [  128.671496] [drm:mixer_check_mode] xres=1024, yres=768, refresh=0, intl=0
> [  128.678267] [drm:hdmi_mode_valid] xres=1024, yres=768, refresh=0,
> intl=0 clock=65000000
> [  128.686271] [drm:mixer_check_mode] xres=1024, yres=768, refresh=0, intl=0
> [  128.693021] [drm:hdmi_mode_valid] xres=832, yres=624, refresh=0,
> intl=0 clock=57284000
> [  128.700921] [drm:mixer_check_mode] xres=832, yres=624, refresh=0, intl=0
> [  128.707606] [drm:hdmi_mode_valid] xres=800, yres=600, refresh=0,
> intl=0 clock=49500000
> [  128.715504] [drm:mixer_check_mode] xres=800, yres=600, refresh=0, intl=0
> [  128.722192] [drm:hdmi_mode_valid] xres=800, yres=600, refresh=0,
> intl=0 clock=50000000
> [  128.730098] [drm:mixer_check_mode] xres=800, yres=600, refresh=0, intl=0
> [  128.736768] [drm:hdmi_mode_valid] xres=720, yres=576, refresh=0,
> intl=1 clock=13500000
> [  128.744669] [drm:mixer_check_mode] xres=720, yres=576, refresh=0, intl=1
> [  128.751353] [drm:hdmi_find_phy_conf] Could not find phy config for
> 13500000
> [  128.758297] [drm:hdmi_mode_valid] xres=720, yres=480, refresh=0,
> intl=1 clock=13500000
> [  128.766195] [drm:mixer_check_mode] xres=720, yres=480, refresh=0, intl=1
> [  128.772877] [drm:hdmi_find_phy_conf] Could not find phy config for
> 13500000
> [  128.779823] [drm:hdmi_mode_valid] xres=640, yres=480, refresh=0,
> intl=0 clock=25175000
> [  128.787738] [drm:mixer_check_mode] xres=640, yres=480, refresh=0, intl=0
> [  128.794402] [drm:hdmi_find_phy_conf] Could not find phy config for
> 25175000
> [  128.801350] [drm:hdmi_mode_valid] xres=1920, yres=1080, refresh=60,
> intl=0 clock=148352000
> [  128.809595] [drm:mixer_check_mode] xres=1920, yres=1080, refresh=60,
> intl=0
> [  128.816539] [drm:hdmi_find_phy_conf] Could not find phy config for
> 148352000
> [  128.823577] [drm:hdmi_mode_valid] xres=720, yres=480, refresh=60,
> intl=1 clock=13513000
> [  128.831556] [drm:mixer_check_mode] xres=720, yres=480, refresh=60, intl=1
> [  128.838325] [drm:hdmi_find_phy_conf] Could not find phy config for
> 13513000
> [  128.845270] [drm:hdmi_mode_valid] xres=1280, yres=720, refresh=0,
> intl=0 clock=74500000
> [  128.853256] [drm:mixer_check_mode] xres=1280, yres=720, refresh=0, intl=0
> [  128.860025] [drm:hdmi_find_phy_conf] Could not find phy config for
> 74500000
> [  128.866973] [drm:drm_mode_debug_printmodeline] Modeline
> 40:"1600x1200" 0 162000 1600 1664 1856 2160 1200 1201 1204 1250 0x40 0x5
> [  128.878532] [drm:drm_mode_prune_invalid] Not using 1600x1200 mode: BAD
> [  128.885042] [drm:drm_mode_debug_printmodeline] Modeline 41:"1440x900"
> 0 88750 1440 1488 1520 1600 900 903 909 926 0x40 0x9
> [  128.896088] [drm:drm_mode_prune_invalid] Not using 1440x900 mode: BAD
> [  128.902488] [drm:drm_mode_debug_printmodeline] Modeline 42:"1280x960"
> 0 108000 1280 1376 1488 1800 960 961 964 1000 0x40 0x5
> [  128.913684] [drm:drm_mode_prune_invalid] Not using 1280x960 mode: BAD
> [  128.920107] [drm:drm_mode_debug_printmodeline] Modeline
> 44:"1280x1024" 0 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x40 0x5
> [  128.931653] [drm:drm_mode_prune_invalid] Not using 1280x1024 mode: BAD
> [  128.938162] [drm:drm_mode_debug_printmodeline] Modeline 45:"1440x900"
> 0 136750 1440 1536 1688 1936 900 903 909 942 0x40 0x6
> [  128.949259] [drm:drm_mode_prune_invalid] Not using 1440x900 mode: BAD
> [  128.955685] [drm:drm_mode_debug_printmodeline] Modeline 46:"1152x864"
> 0 108000 1152 1216 1344 1600 864 865 868 900 0x40 0x5
> [  128.966792] [drm:drm_mode_prune_invalid] Not using 1152x864 mode: BAD
> [  128.973217] [drm:drm_mode_debug_printmodeline] Modeline 47:"800x600"
> 0 40000 800 840 968 1056 600 601 605 628 0x40 0x5
> [  128.983889] [drm:drm_mode_prune_invalid] Not using 800x600 mode: BAD
> [  128.990247] [drm:drm_mode_debug_printmodeline] Modeline 48:"800x600"
> 0 36000 800 824 896 1024 600 601 603 625 0x40 0x5
> [  129.000903] [drm:drm_mode_prune_invalid] Not using 800x600 mode: BAD
> [  129.007242] [drm:drm_mode_debug_printmodeline] Modeline 49:"640x480"
> 0 31500 640 656 720 840 480 481 484 500 0x40 0xa
> [  129.017828] [drm:drm_mode_prune_invalid] Not using 640x480 mode: BAD
> [  129.024168] [drm:drm_mode_debug_printmodeline] Modeline 50:"640x480"
> 0 31500 640 664 704 832 480 489 491 520 0x40 0xa
> [  129.034757] [drm:drm_mode_prune_invalid] Not using 640x480 mode: BAD
> [  129.041091] [drm:drm_mode_debug_printmodeline] Modeline 51:"640x480"
> 0 30240 640 704 768 864 480 483 486 525 0x40 0xa
> [  129.051679] [drm:drm_mode_prune_invalid] Not using 640x480 mode: BAD
> [  129.058020] [drm:drm_mode_debug_printmodeline] Modeline 53:"720x400"
> 0 28320 720 738 846 900 400 412 414 449 0x40 0x6
> [  129.068605] [drm:drm_mode_prune_invalid] Not using 720x400 mode: BAD
> [  129.074946] [drm:drm_mode_debug_printmodeline] Modeline
> 55:"1280x1024" 0 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40 0x5
> [  129.086505] [drm:drm_mode_prune_invalid] Not using 1280x1024 mode: BAD
> [  129.092999] [drm:drm_mode_debug_printmodeline] Modeline 56:"1024x768"
> 0 78800 1024 1040 1136 1312 768 769 772 800 0x40 0x5
> [  129.104021] [drm:drm_mode_prune_invalid] Not using 1024x768 mode: BAD
> [  129.110447] [drm:drm_mode_debug_printmodeline] Modeline 57:"1024x768"
> 0 75000 1024 1048 1184 1328 768 771 777 806 0x40 0xa
> [  129.121472] [drm:drm_mode_prune_invalid] Not using 1024x768 mode: BAD
> [  129.127897] [drm:drm_mode_debug_printmodeline] Modeline 58:"1024x768"
> 0 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
> [  129.138921] [drm:drm_mode_prune_invalid] Not using 1024x768 mode: BAD
> [  129.145345] [drm:drm_mode_debug_printmodeline] Modeline 59:"832x624"
> 0 57284 832 864 928 1152 624 625 628 667 0x40 0xa
> [  129.156018] [drm:drm_mode_prune_invalid] Not using 832x624 mode: BAD
> [  129.162356] [drm:drm_mode_debug_printmodeline] Modeline 60:"800x600"
> 0 49500 800 816 896 1056 600 601 604 625 0x40 0x5
> [  129.173029] [drm:drm_mode_prune_invalid] Not using 800x600 mode: BAD
> [  129.179370] [drm:drm_mode_debug_printmodeline] Modeline 64:"800x600"
> 0 50000 800 856 976 1040 600 637 643 666 0x40 0x5
> [  129.190060] [drm:drm_mode_prune_invalid] Not using 800x600 mode: BAD
> [  129.196384] [drm:drm_mode_debug_printmodeline] Modeline 71:"720x576i"
> 0 13500 720 732 795 864 576 580 586 625 0x40 0x101a
> [  129.207317] [drm:drm_mode_prune_invalid] Not using 720x576i mode: BAD
> [  129.213742] [drm:drm_mode_debug_printmodeline] Modeline 81:"720x480i"
> 0 13500 720 739 801 858 480 488 494 525 0x40 0x101a
> [  129.224676] [drm:drm_mode_prune_invalid] Not using 720x480i mode: BAD
> [  129.231103] [drm:drm_mode_debug_printmodeline] Modeline 83:"640x480"
> 0 25175 640 656 752 800 480 490 492 525 0x40 0xa
> [  129.241694] [drm:drm_mode_prune_invalid] Not using 640x480 mode: BAD
> [  129.248028] [drm:drm_mode_debug_printmodeline] Modeline
> 84:"1920x1080" 60 148352 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0x5
> [  129.259656] [drm:drm_mode_prune_invalid] Not using 1920x1080 mode: BAD
> [  129.266170] [drm:drm_mode_debug_printmodeline] Modeline 92:"720x480i"
> 60 13513 720 739 801 858 480 488 494 525 0x40 0x101a
> [  129.277190] [drm:drm_mode_prune_invalid] Not using 720x480i mode: BAD
> [  129.283615] [drm:drm_mode_debug_printmodeline] Modeline 95:"1280x720"
> 0 74500 1280 1344 1472 1664 720 723 728 748 0x20 0x6
> [  129.294653] [drm:drm_mode_prune_invalid] Not using 1280x720 mode: BAD
> [  129.301068] [drm:drm_helper_probe_single_connector_modes_merge_bits]
> [CONNECTOR:23:HDMI-A-1] probed modes :
> [  129.310781] [drm:drm_mode_debug_printmodeline] Modeline
> 25:"1920x1080" 60 148500 1920 2008 2052 2200 1080 1084 1089 1125 0x48 0x5
> [  129.322416] [drm:drm_mode_debug_printmodeline] Modeline
> 61:"1920x1080i" 60 74250 1920 2008 2052 2200 1080 1084 1094 1125 0x40 0x15
> [  129.334136] [drm:drm_mode_debug_printmodeline] Modeline
> 72:"1920x1080i" 60 74176 1920 2008 2052 2200 1080 1084 1094 1125 0x40 0x15
> [  129.345855] [drm:drm_mode_debug_printmodeline] Modeline
> 26:"1920x1080" 50 148500 1920 2448 2492 2640 1080 1084 1089 1125 0x40 0x5
> [  129.357486] [drm:drm_mode_debug_printmodeline] Modeline
> 27:"1920x1080i" 50 74250 1920 1936 1980 2640 1080 1084 1094 1125 0x40 0x15
> [  129.369199] [drm:drm_mode_debug_printmodeline] Modeline
> 54:"1920x1080i" 50 74250 1920 2448 2492 2640 1080 1084 1094 1125 0x40 0x15
> [  129.380921] [drm:drm_mode_debug_printmodeline] Modeline
> 31:"1680x1050" 60 119000 1680 1728 1760 1840 1050 1053 1059 1080 0x40 0x9
> [  129.392564] [drm:drm_mode_debug_printmodeline] Modeline 62:"1280x720"
> 60 74250 1280 1390 1430 1650 720 725 730 750 0x40 0x5
> [  129.403661] [drm:drm_mode_debug_printmodeline] Modeline 73:"1280x720"
> 60 74176 1280 1390 1430 1650 720 725 730 750 0x40 0x5
> [  129.414768] [drm:drm_mode_debug_printmodeline] Modeline 28:"1280x720"
> 50 74250 1280 1720 1760 1980 720 725 730 750 0x40 0x5
> [  129.425883] [drm:drm_mode_debug_printmodeline] Modeline 29:"720x576"
> 50 27000 720 732 796 864 576 581 586 625 0x40 0xa
> [  129.436552] [drm:drm_mode_debug_printmodeline] Modeline 74:"720x480"
> 60 27027 720 736 798 858 480 489 495 525 0x40 0xa
> [  129.447278] [drm:drm_mode_debug_printmodeline] Modeline 63:"720x480"
> 60 27000 720 736 798 858 480 489 495 525 0x40 0xa
> [  129.457945] [drm:drm_mode_debug_printmodeline] Modeline 43:"640x480"
> 60 25200 640 656 752 800 480 490 492 525 0x40 0xa
> [  129.468629] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETCONNECTOR
> [  129.476434] [drm:drm_mode_getconnector] [CONNECTOR:23:?]
> [  129.481718] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_OBJ_GETPROPERTIES
> [  129.489979] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_OBJ_GETPROPERTIES
> [  129.498195] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_OBJ_GETPROPERTIES
> [  129.506472] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_OBJ_GETPROPERTIES
> [  129.514728] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPROPERTY
> [  129.522444] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPROPERTY
> [  129.530176] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPROPERTY
> [  129.537894] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPROPERTY
> [  129.545629] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPLANERESOURCES
> [  129.553829] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPLANERESOURCES
> [  129.562078] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPLANE
> [  129.569532] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPLANE
> [  129.577004] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPLANE
> [  129.584463] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPLANE
> [  129.591949] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPLANE
> [  129.599393] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPLANE
> [  129.606866] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_OBJ_GETPROPERTIES
> [  129.615106] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_OBJ_GETPROPERTIES
> [  129.623360] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPROPERTY
> [  129.631080] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPROPERTY
> [  129.638809] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_OBJ_GETPROPERTIES
> [  129.647052] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_OBJ_GETPROPERTIES
> [  129.655300] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPROPERTY
> [  129.663026] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPROPERTY
> [  129.670748] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPROPERTY
> [  129.678470] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPROPERTY
> [  129.686214] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_OBJ_GETPROPERTIES
> [  129.694438] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_OBJ_GETPROPERTIES
> [  129.702689] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPROPERTY
> [  129.710426] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPROPERTY
> [  129.718135] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPROPERTY
> [  129.725900] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_GETPROPERTY
> [  129.733608] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_GET_CAP
> [  129.740550] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_CREATE_DUMB
> [  129.748269] [drm:exynos_drm_init_buf] desired size = 0x7e9000
> [  129.753995] [drm:exynos_drm_gem_init] created file object = 0xe4b4e900
> [  129.776474] [drm:lowlevel_buffer_allocate] dma_addr(0x20c00000),
> size(0x7e9000)
> [  129.778147] [drm:exynos_drm_gem_handle_create] gem handle = 0x1
> [  129.784072] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_MAP_DUMB
> [  129.791554] [drm:exynos_drm_gem_dumb_map_offset] offset = 0x10000000
> [  129.797880] [drm:drm_vm_open_locked] 0xb5eff000,0x007e9000
> [  129.803327] [drm:update_vm_cache_attr] flags = 0x5
> [  129.843824] [drm:drm_vm_close_locked] 0xb5eff000,0x007e9000
> [  129.843896] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_ADDFB2
> [  129.851057] [drm:exynos_user_fb_create] buf_cnt = 1
> [  129.855911] [drm:drm_mode_addfb2] [FB:33]
> [  129.859970] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_SETCRTC
> [  129.867300] [drm:drm_mode_setcrtc] [CRTC:21]
> [  129.871537] [drm:drm_mode_setcrtc] [CONNECTOR:23:HDMI-A-1]
> [  129.877001] [drm:drm_crtc_helper_set_config]
> [  129.881341] [drm:drm_crtc_helper_set_config] [CRTC:21] [FB:33]
> #connectors=1 (x y) (0 0)
> [  129.889434] [drm:drm_crtc_helper_set_config] modes are different,
> full mode set
> [  129.896706] [drm:drm_mode_debug_printmodeline] Modeline 33:"1280x720"
> 60 74250 1280 1390 1430 1650 720 725 730 750 0x40 0x5
> [  129.907818] [drm:drm_mode_debug_printmodeline] Modeline
> 34:"1920x1080" 60 148500 1920 2008 2052 2200 1080 1084 1089 1125 0x48 0x5
> [  129.919448] [drm:drm_crtc_helper_set_config] [CONNECTOR:23:HDMI-A-1]
> to [CRTC:21]
> [  129.926911] [drm:drm_crtc_helper_set_config] attempting to set mode
> from userspace
> [  129.934464] [drm:drm_mode_debug_printmodeline] Modeline
> 34:"1920x1080" 60 148500 1920 2008 2052 2200 1080 1084 1089 1125 0x48 0x5
> [  129.946118] [drm:hdmi_mode_fixup] drivers/gpu/drm/exynos/exynos_hdmi.c
> [  129.952618] [drm:hdmi_mode_valid] xres=1920, yres=1080, refresh=60,
> intl=0 clock=148500000
> [  129.960866] [drm:mixer_check_mode] xres=1920, yres=1080, refresh=60,
> intl=0
> [  129.967809] [drm:drm_crtc_helper_set_mode] [CRTC:21]
> [  129.972754] [drm:exynos_drm_fb_buffer] dma_addr = 0x20c00000
> [  129.978394] [drm:exynos_check_plane] buffer: 0, dma_addr = 0x20c00000
> [  129.984819] [drm:exynos_plane_mode_set] plane : offset_x/y(0,0),
> width/height(1920,1080)
> [  129.992744] [drm:drm_crtc_helper_set_mode] [ENCODER:22:TMDS-22] set
> [MODE:34:1920x1080]
> [  130.000866] [drm:hdmi_mode_set] xres=1920, yres=1080, refresh=60,
> intl=PROGRESSIVE
> [  130.008429] [drm:exynos_drm_crtc_dpms] crtc[21] mode[0]
> [  130.013623] [drm:exynos_drm_crtc_dpms] desired dpms mode is same as
> previous one.
> [  130.021091] [drm:mixer_win_commit] win: 0
> [  130.025075] [drm:mixer_regs_dump] MXR_STATUS = 00000083
> [  130.030274] [drm:mixer_regs_dump] MXR_CFG = 000007d5
> [  130.035221] [drm:mixer_regs_dump] MXR_INT_EN = 00000000
> [  130.040429] [drm:mixer_regs_dump] MXR_INT_STATUS = 00000800
> [  130.045984] [drm:mixer_regs_dump] MXR_LAYER_CFG = 00000321
> [  130.051453] [drm:mixer_regs_dump] MXR_VIDEO_CFG = 00000000
> [  130.056921] [drm:mixer_regs_dump] MXR_GRAPHIC0_CFG = 002207ff
> [  130.062650] [drm:mixer_regs_dump] MXR_GRAPHIC0_BASE = 20c00000
> [  130.068465] [drm:mixer_regs_dump] MXR_GRAPHIC0_SPAN = 00000780
> [  130.074281] [drm:mixer_regs_dump] MXR_GRAPHIC0_WH = 07800438
> [  130.079923] [drm:mixer_regs_dump] MXR_GRAPHIC0_SXY = 00000000
> [  130.085652] [drm:mixer_regs_dump] MXR_GRAPHIC0_DXY = 00000000
> [  130.091381] [drm:mixer_regs_dump] MXR_GRAPHIC1_CFG = 00110000
> [  130.097109] [drm:mixer_regs_dump] MXR_GRAPHIC1_BASE = 00000000
> [  130.102925] [drm:mixer_regs_dump] MXR_GRAPHIC1_SPAN = 00000000
> [  130.108741] [drm:mixer_regs_dump] MXR_GRAPHIC1_WH = 00000000
> [  130.114382] [drm:mixer_regs_dump] MXR_GRAPHIC1_SXY = 00000000
> [  130.120111] [drm:mixer_regs_dump] MXR_GRAPHIC1_DXY = 00000000
> [  130.125885] [drm:hdmi_dpms] mode 0
> setting mode 1920x1080-60Hz@XR24 on connectors 23, crtc 21
> [  130.169050] [drm:hdmi_reg_infoframe] AVI checksum = 0x45
> [  130.169119] [drm:hdmi_reg_infoframe] AUI checksum = 0x71
> [  130.174108] [drm:hdmi_v14_regs_dump] start: ---- CONTROL REGISTERS ----
> [  130.180621] [drm:hdmi_v14_regs_dump] start:HDMI_INTC_CON = 00000000
> [  130.187036] [drm:hdmi_v14_regs_dump] start:HDMI_INTC_FLAG = 00000000
> [  130.193221] [drm:hdmi_v14_regs_dump] start:HDMI_HPD_STATUS = 00000000
> [  130.199654] [drm:hdmi_v14_regs_dump] start:HDMI_INTC_CON_1 = 00000000
> [  130.206068] [drm:hdmi_v14_regs_dump] start:HDMI_INTC_FLAG_1 = 00000000
> [  130.212642] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_STATUS_0 = 00000001
> [  130.219179] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_STATUS_PLL = 00000001
> [  130.225960] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_CON_0 = 00000000
> [  130.232334] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_RSTOUT = 00000000
> [  130.238715] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_VPLL = 00000080
> [  130.244952] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_CMU = 0000008c
> [  130.251178] [drm:hdmi_v14_regs_dump] start:HDMI_CORE_RSTOUT = 00000001
> [  130.257628] [drm:hdmi_v14_regs_dump] start: ---- CORE REGISTERS ----
> [  130.263969] [drm:hdmi_v14_regs_dump] start:HDMI_CON_0 = 00000005
> [  130.270001] [drm:hdmi_v14_regs_dump] start:HDMI_CON_1 = 00000000
> [  130.275950] [drm:hdmi_v14_regs_dump] start:HDMI_CON_2 = 00000000
> [  130.282015] [drm:hdmi_v14_regs_dump] start:HDMI_SYS_STATUS = 00000000
> [  130.288388] [drm:hdmi_v14_regs_dump] start:HDMI_PHY_STATUS_0 = 00000001
> [  130.294947] [drm:hdmi_v14_regs_dump] start:HDMI_STATUS_EN = 00000000
> [  130.301301] [drm:hdmi_v14_regs_dump] start:HDMI_HPD = 00000000
> [  130.307109] [drm:hdmi_v14_regs_dump] start:HDMI_MODE_SEL = 00000002
> [  130.313360] [drm:hdmi_v14_regs_dump] start:HDMI_ENC_EN = 00000000
> [  130.319426] [drm:hdmi_v14_regs_dump] start:HDMI_DC_CONTROL = 00000000
> [  130.325863] [drm:hdmi_v14_regs_dump] start:HDMI_VIDEO_PATTERN_GEN =
> 00000000
> [  130.332894] [drm:hdmi_v14_regs_dump] start: ---- CORE SYNC REGISTERS ----
> [  130.339661] [drm:hdmi_v14_regs_dump] start:HDMI_H_BLANK_0 = 00000018
> [  130.345989] [drm:hdmi_v14_regs_dump] start:HDMI_H_BLANK_1 = 00000001
> [  130.352336] [drm:hdmi_v14_regs_dump] start:HDMI_V2_BLANK_0 = 00000065
> [  130.358754] [drm:hdmi_v14_regs_dump] start:HDMI_V2_BLANK_1 = 00000004
> [  130.365180] [drm:hdmi_v14_regs_dump] start:HDMI_V1_BLANK_0 = 0000002d
> [  130.371593] [drm:hdmi_v14_regs_dump] start:HDMI_V1_BLANK_1 = 00000000
> [  130.378029] [drm:hdmi_v14_regs_dump] start:HDMI_V_LINE_0 = 00000065
> [  130.384274] [drm:hdmi_v14_regs_dump] start:HDMI_V_LINE_1 = 00000004
> [  130.390530] [drm:hdmi_v14_regs_dump] start:HDMI_H_LINE_0 = 00000098
> [  130.396772] [drm:hdmi_v14_regs_dump] start:HDMI_H_LINE_1 = 00000008
> [  130.403012] [drm:hdmi_v14_regs_dump] start:HDMI_HSYNC_POL = 00000000
> [  130.409336] [drm:hdmi_v14_regs_dump] start:HDMI_VSYNC_POL = 00000000
> [  130.415673] [drm:hdmi_v14_regs_dump] start:HDMI_INT_PRO_MODE = 00000000
> [  130.422269] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F0_0 = 000000ff
> [  130.428866] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F0_1 = 0000001f
> [  130.435467] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F1_0 = 000000ff
> [  130.442060] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F1_1 = 0000001f
> [  130.448656] [drm:hdmi_v14_regs_dump] start:HDMI_H_SYNC_START_0 = 00000056
> [  130.455426] [drm:hdmi_v14_regs_dump] start:HDMI_H_SYNC_START_1 = 00000000
> [  130.462197] [drm:hdmi_v14_regs_dump] start:HDMI_H_SYNC_END_0 = 00000082
> [  130.468794] [drm:hdmi_v14_regs_dump] start:HDMI_H_SYNC_END_1 = 00000000
> [  130.475391] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_BEF_2_0 =
> 00000009
> [  130.482595] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_BEF_2_1 =
> 00000000
> [  130.489825] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_BEF_1_0 =
> 00000004
> [  130.497008] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_BEF_1_1 =
> 00000000
> [  130.504206] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_2_0 =
> 000000ff
> [  130.511414] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_2_1 =
> 0000001f
> [  130.518617] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_1_0 =
> 000000ff
> [  130.525822] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_1_1 =
> 0000001f
> [  130.533026] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_2_0 = 000000ff
> [  130.540581] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_2_1 = 0000001f
> [  130.548126] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_1_0 = 000000ff
> [  130.555681] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_1_1 = 0000001f
> [  130.563232] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F2_0 = 000000ff
> [  130.569829] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F2_1 = 0000001f
> [  130.576426] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F3_0 = 000000ff
> [  130.583022] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F3_1 = 0000001f
> [  130.589637] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F4_0 = 000000ff
> [  130.596218] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F4_1 = 0000001f
> [  130.602813] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F5_0 = 000000ff
> [  130.609409] [drm:hdmi_v14_regs_dump] start:HDMI_V_BLANK_F5_1 = 0000001f
> [  130.616007] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_3_0 =
> 000000ff
> [  130.623211] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_3_1 =
> 0000001f
> [  130.630416] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_4_0 =
> 000000ff
> [  130.637620] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_4_1 =
> 0000001f
> [  130.644828] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_5_0 =
> 000000ff
> [  130.652032] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_5_1 =
> 0000001f
> [  130.659236] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_6_0 =
> 000000ff
> [  130.666444] [drm:hdmi_v14_regs_dump] start:HDMI_V_SYNC_LINE_AFT_6_1 =
> 0000001f
> [  130.673642] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_3_0 = 000000ff
> [  130.681200] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_3_1 = 0000001f
> [  130.688763] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_4_0 = 000000ff
> [  130.696304] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_4_1 = 0000001f
> [  130.703849] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_5_0 = 000000ff
> [  130.711407] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_5_1 = 0000001f
> [  130.718953] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_6_0 = 000000ff
> [  130.726508] [drm:hdmi_v14_regs_dump]
> start:HDMI_V_SYNC_LINE_AFT_PXL_6_1 = 0000001f
> [  130.734060] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_1_0 = 000000ff
> [  130.740830] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_1_1 = 0000001f
> [  130.747618] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_2_0 = 000000ff
> [  130.754409] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_2_1 = 0000001f
> [  130.761156] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_3_0 = 000000ff
> [  130.767920] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_3_1 = 0000001f
> [  130.774689] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_4_0 = 000000ff
> [  130.781475] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_4_1 = 0000001f
> [  130.788251] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_5_0 = 000000ff
> [  130.795014] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_5_1 = 0000001f
> [  130.801770] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_6_0 = 000000ff
> [  130.808545] [drm:hdmi_v14_regs_dump] start:HDMI_VACT_SPACE_6_1 = 0000001f
> [  130.815316] [drm:hdmi_v14_regs_dump] start: ---- TG REGISTERS ----
> [  130.821483] [drm:hdmi_v14_regs_dump] start:HDMI_TG_CMD = 00000001
> [  130.827548] [drm:hdmi_v14_regs_dump] start:HDMI_TG_H_FSZ_L = 00000098
> [  130.833980] [drm:hdmi_v14_regs_dump] start:HDMI_TG_H_FSZ_H = 00000008
> [  130.840403] [drm:hdmi_v14_regs_dump] start:HDMI_TG_HACT_ST_L = 00000018
> [  130.847002] [drm:hdmi_v14_regs_dump] start:HDMI_TG_HACT_ST_H = 00000001
> [  130.853591] [drm:hdmi_v14_regs_dump] start:HDMI_TG_HACT_SZ_L = 00000080
> [  130.860194] [drm:hdmi_v14_regs_dump] start:HDMI_TG_HACT_SZ_H = 00000007
> [  130.866783] [drm:hdmi_v14_regs_dump] start:HDMI_TG_V_FSZ_L = 00000065
> [  130.873214] [drm:hdmi_v14_regs_dump] start:HDMI_TG_V_FSZ_H = 00000004
> [  130.879623] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC_L = 00000001
> [  130.886065] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC_H = 00000000
> [  130.892477] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC2_L = 00000033
> [  130.898989] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC2_H = 00000002
> [  130.905488] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST_L = 0000002d
> [  130.912118] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST_H = 00000000
> [  130.918695] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_SZ_L = 00000038
> [  130.925334] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_SZ_H = 00000004
> [  130.931886] [drm:hdmi_v14_regs_dump] start:HDMI_TG_FIELD_CHG_L = 00000033
> [  130.938654] [drm:hdmi_v14_regs_dump] start:HDMI_TG_FIELD_CHG_H = 00000002
> [  130.945420] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST2_L = 00000048
> [  130.952104] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST2_H = 00000002
> [  130.958795] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST3_L = 0000007b
> [  130.965478] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST3_H = 00000004
> [  130.972160] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST4_L = 000000ae
> [  130.978844] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VACT_ST4_H = 00000006
> [  130.985548] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC_TOP_HDMI_L =
> 00000001
> [  130.992733] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC_TOP_HDMI_H =
> 00000000
> [  130.999941] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC_BOT_HDMI_L =
> 00000033
> [  131.007150] [drm:hdmi_v14_regs_dump] start:HDMI_TG_VSYNC_BOT_HDMI_H =
> 00000002
> [  131.014347] [drm:hdmi_v14_regs_dump] start:HDMI_TG_FIELD_TOP_HDMI_L =
> 00000001
> [  131.021560] [drm:hdmi_v14_regs_dump] start:HDMI_TG_FIELD_TOP_HDMI_H =
> 00000000
> [  131.028757] [drm:hdmi_v14_regs_dump] start:HDMI_TG_FIELD_BOT_HDMI_L =
> 00000033
> [  131.035964] [drm:hdmi_v14_regs_dump] start:HDMI_TG_FIELD_BOT_HDMI_H =
> 00000002
> [  131.043167] [drm:hdmi_v14_regs_dump] start:HDMI_TG_3D = 00000000
> [  131.049155] [drm:hdmi_v14_regs_dump] start: ---- PACKET REGISTERS ----
> [  131.055654] [drm:hdmi_v14_regs_dump] start:HDMI_AVI_CON = 00000002
> [  131.061821] [drm:hdmi_v14_regs_dump] start:HDMI_AVI_HEADER0 = 00000082
> [  131.068327] [drm:hdmi_v14_regs_dump] start:HDMI_AVI_HEADER1 = 00000002
> [  131.074838] [drm:hdmi_v14_regs_dump] start:HDMI_AVI_HEADER2 = 0000000d
> [  131.081343] [drm:hdmi_v14_regs_dump] start:HDMI_AVI_CHECK_SUM = 00000045
> [  131.088049] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_CON = 00000000
> [  131.094186] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_HEADER0 = 00000000
> [  131.100699] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_HEADER1 = 00000000
> [  131.107208] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_HEADER2 = 00000000
> [  131.113718] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  131.120228] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  131.126737] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  131.133248] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  131.139758] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  131.146268] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  131.152778] [drm:hdmi_v14_regs_dump] start:HDMI_VSI_DATA(i) = 00000000
> [  131.159291] [drm:drm_calc_timestamping_constants] crtc 21: hwmode:
> htotal 2200, vtotal 1125, vdisplay 1080
> [  131.168928] [drm:drm_calc_timestamping_constants] crtc 21: clock
> 148500 kHz framedur 16666666 linedur 14814, pixeldur 6
> [  131.179690] [drm:drm_crtc_helper_set_config] Setting connector DPMS
> state to on
> [  131.186995] [drm:drm_crtc_helper_set_config]
> [CONNECTOR:23:HDMI-A-1] set DPMS on
> [  131.194443] [drm:drm_framebuffer_reference] edaa2a00: FB ID: 33 (2)
> [  131.200693] [drm:drm_framebuffer_unreference] ed95c180: FB ID: 32 (2)
> [  131.207115] [drm:drm_framebuffer_unreference] edaa2a00: FB ID: 33 (3)
> [  131.213559] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_DIRTYFB
> [  131.220921] [drm:drm_framebuffer_unreference] edaa2a00: FB ID: 33 (3)
> [  131.227387] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_CREATE_DUMB
> [  131.235068] [drm:exynos_drm_init_buf] desired size = 0x96000
> [  131.240720] [drm:exynos_drm_gem_init] created file object = 0xe4b4ed00
> [  131.248547] [drm:lowlevel_buffer_allocate] dma_addr(0x21400000),
> size(0x96000)
> [  131.254433] [drm:exynos_drm_gem_handle_create] gem handle = 0x2
> [  131.260328] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_MAP_DUMB
> [  131.267792] [drm:exynos_drm_gem_dumb_map_offset] offset = 0x107e9000
> [  131.274144] [drm:drm_vm_open_locked] 0xb6652000,0x00096000
> [  131.279595] [drm:update_vm_cache_attr] flags = 0x5
> testing 640x480@RG16 overlay plane 18
> [  131.531988] [drm:drm_vm_close_locked] 0xb6652000,0x00096000
> [  131.532088] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_ADDFB2
> [  131.539264] [drm:exynos_user_fb_create] buf_cnt = 1
> [  131.544114] [drm:drm_mode_addfb2] [FB:34]
> [  131.548121] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_SETPLANE
> [  131.555586] [drm:exynos_drm_fb_buffer] dma_addr = 0x21400000
> [  131.561205] [drm:exynos_check_plane] buffer: 0, dma_addr = 0x21400000
> [  131.567625] [drm:exynos_plane_mode_set] plane : offset_x/y(128,128),
> width/height(640,480)
> [  131.575699] [drm:mixer_win_commit] win: 1
> [  131.579866] [drm:mixer_regs_dump] MXR_STATUS = 00000081
> [  131.585039] [drm:mixer_regs_dump] MXR_CFG = 000007f5
> [  131.589987] [drm:mixer_regs_dump] MXR_INT_EN = 00000000
> [  131.595194] [drm:mixer_regs_dump] MXR_INT_STATUS = 00000900
> [  131.600749] [drm:mixer_regs_dump] MXR_LAYER_CFG = 00000321
> [  131.606218] [drm:mixer_regs_dump] MXR_VIDEO_CFG = 00000000
> [  131.611686] [drm:mixer_regs_dump] MXR_GRAPHIC0_CFG = 002207ff
> [  131.617415] [drm:mixer_regs_dump] MXR_GRAPHIC0_BASE = 20c00000
> [  131.623230] [drm:mixer_regs_dump] MXR_GRAPHIC0_SPAN = 00000780
> [  131.629046] [drm:mixer_regs_dump] MXR_GRAPHIC0_WH = 07800438
> [  131.634688] [drm:mixer_regs_dump] MXR_GRAPHIC0_SXY = 00000000
> [  131.640416] [drm:mixer_regs_dump] MXR_GRAPHIC0_DXY = 00000000
> [  131.646145] [drm:mixer_regs_dump] MXR_GRAPHIC1_CFG = 00000400
> [  131.651874] [drm:mixer_regs_dump] MXR_GRAPHIC1_BASE = 21400000
> [  131.657689] [drm:mixer_regs_dump] MXR_GRAPHIC1_SPAN = 00000280
> [  131.663505] [drm:mixer_regs_dump] MXR_GRAPHIC1_WH = 028001e0
> [  131.669147] [drm:mixer_regs_dump] MXR_GRAPHIC1_SXY = 00000000
> [  131.674876] [drm:mixer_regs_dump] MXR_GRAPHIC1_DXY = 00800080
> [  131.680820] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_CREATE_DUMB
> [  131.688429] [drm:exynos_drm_init_buf] desired size = 0x71000
> [  131.694098] [drm:exynos_drm_gem_init] created file object = 0xedb3e100
> [  131.702258] [drm:lowlevel_buffer_allocate] dma_addr(0x20080000),
> size(0x71000)
> [  131.707707] [drm:exynos_drm_gem_handle_create] gem handle = 0x3
> [  131.713608] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_MAP_DUMB
> [  131.721071] [drm:exynos_drm_gem_dumb_map_offset] offset = 0x1087f000
> [  131.727417] [drm:drm_vm_open_locked] 0xb6677000,0x00071000
> [  131.732873] [drm:update_vm_cache_attr] flags = 0x5
> testing 640x480@NV12 overlay plane 20
> [  131.757643] [drm:drm_vm_close_locked] 0xb6677000,0x00071000
> [  131.757708] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_ADDFB2
> [  131.764884] [drm:drm_fb_get_bpp_depth] unsupported pixel format NV12
> little-endian (0x3231564e)
> [  131.773555] [drm:exynos_user_fb_create] buf_cnt = 1
> [  131.778418] [drm:drm_mode_addfb2] [FB:35]
> [  131.782412] [drm:drm_ioctl] pid=2390, dev=0xe200, auth=1,
> DRM_IOCTL_MODE_SETPLANE
> [  131.789885] [drm:exynos_drm_fb_buffer] dma_addr = 0x20080000
> [  131.795517] [drm:exynos_check_plane] buffer: 0, dma_addr = 0x20080000
> [  131.801939] [drm:exynos_plane_mode_set] plane : offset_x/y(1024,128),
> width/height(640,480)
> [  131.810098] [drm:mixer_win_commit] win: 2
> [  131.814274] [drm:mixer_regs_dump] MXR_STATUS = 00000081
> [  131.819457] [drm:mixer_regs_dump] MXR_CFG = 000007fd
> [  131.824132] PAGE FAULT occurred at 0x0 by 12e20000.sysmmu(Page table
> base: 0x6e280000)
> [  131.824134]  Lv1 entry: 0x6e0f2401
> [  131.824153] ------------[ cut here ]------------
> [  131.824155] kernel BUG at drivers/iommu/exynos-iommu.c:358!
> [  131.824158] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
> [  131.824188] Modules linked in: ecb bridge stp llc bnep btrfs xor
> xor_neon zlib_inflate zlib_deflate raid6_pq btusb bluetooth usb_storage
> s5p_jpeg videobuf2_dma_contig videobuf2_memops v4l2_mem2mem videobuf2_core
> [  131.824194] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W
> 4.0.0-debug+ #3
> [  131.824196] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> [  131.824199] task: c06c95a8 ti: c06c4000 task.ti: c06c4000
> [  131.824209] PC is at exynos_sysmmu_irq+0x2a0/0x2a8
> [  131.824215] LR is at vprintk_emit+0x268/0x594
> [  131.824220] pc : [<c02781a4>]    lr : [<c00650d0>]    psr: a00701d3
> [  131.824220] sp : c06c5d88  ip : 00000000  fp : c06c5dc4
> [  131.824222] r10: ffffffda  r9 : ee206e28  r8 : ee2d1a10
> [  131.824225] r7 : 00000000  r6 : 00000000  r5 : 00000000  r4 : ee206e10
> [  131.824228] r3 : c06fca20  r2 : 00000000  r1 : c06c95a8  r0 : ee1622c0
> [  131.824232] Flags: NzCv  IRQs off  FIQs off  Mode SVC_32  ISA ARM
> Segment kernel
> [  131.824235] Control: 10c5387d  Table: 68b7004a  DAC: 00000015
> [  131.824238] Process swapper/0 (pid: 0, stack limit = 0xc06c4218)
> [  131.824241] Stack: (0xc06c5d88 to 0xc06c6000)
> [  131.824246] 5d80:                   c06c5d94 c06c5d98 c0055504
> 6e280000 c06c5dbc ee20a900
> [  131.824251] 5da0: ee04a7e0 00000028 ee007000 00000000 00000000
> c06fb1fc c06c5e0c c06c5dc8
> [  131.824256] 5dc0: c0066a34 c0277f10 c06c609c c06c668c ee78d880
> c06fafbb ee04a780 c06fb1e8
> [  131.824261] 5de0: c06c5e2c ee04a780 ee04a7e0 ee20a900 ee007000
> 00000015 c06c5ef8 ee008000
> [  131.824266] 5e00: c06c5e2c c06c5e10 c0066c90 c00669e0 00020000
> ee04a780 ee04a7e0 00001000
> [  131.824271] 5e20: c06c5e44 c06c5e30 c0069c6c c0066c58 00000028
> ee004450 c06c5e5c c06c5e48
> [  131.824276] 5e40: c0066028 c0069bac 000000a0 c06e19b4 c06c5e84
> c06c5e60 c0223678 c0066000
> [  131.824281] 5e60: c02235dc 00000015 00000000 00000015 00000000
> 00000001 c06c5e9c c06c5e88
> [  131.824286] 5e80: c0066028 c02235e8 00000089 c06bfc54 c06c5ecc
> c06c5ea0 c006633c c0066000
> [  131.824291] 5ea0: c06c5ef8 f002000c 00000025 00000015 c06c680c
> c06c5ef8 f0020000 c06fb774
> [  131.824296] 5ec0: c06c5ef4 c06c5ed0 c000867c c00662c4 c000f830
> 60070053 ffffffff c06c5f2c
> [  131.824301] 5ee0: c06c0dc0 00000001 c06c5f4c c06c5ef8 c0013240
> c0008650 00000001 00000000
> [  131.824305] 5f00: 00000000 c00206c0 c06c6518 c04eb3a4 00000000
> 00000000 c06c0dc0 00000001
> [  131.824310] 5f20: c06fb774 c06c5f4c c06c5f50 c06c5f40 c000f82c
> c000f830 60070053 ffffffff
> [  131.824315] 5f40: c06c5f8c c06c5f50 c005b6e8 c000f7fc 00000000
> 00000001 c06c5f7c c06c1880
> [  131.824320] 5f60: c004b008 c004af24 c06fafb9 c06c6520 c06c668c
> c06c1880 c04e1b90 ffffffff
> [  131.824325] 5f80: c06c5fa4 c06c5f90 c04da460 c005b3dc c06c4000
> c06c6618 c06c5ff4 c06c5fa8
> [  131.824330] 5fa0: c068dcfc c04da3e0 ffffffff ffffffff c068d6d0
> 00000000 00000000 ef7fc900
> [  131.824335] 5fc0: 00000000 c06b1628 00000000 c06fd3d4 c06c64b8
> c06b1624 c06ca7ac 4000406a
> [  131.824339] 5fe0: 413fc090 00000000 00000000 c06c5ff8 40008070
> c068d968 00000000 00000000
> [  131.824342] Backtrace:
> [  131.824351] [<c0277f04>] (exynos_sysmmu_irq) from [<c0066a34>]
> (handle_irq_event_percpu+0x60/0x278)
> [  131.824360]  r10:c06fb1fc r9:00000000 r8:00000000 r7:ee007000
> r6:00000028 r5:ee04a7e0
> [  131.824363]  r4:ee20a900
> [  131.824370] [<c00669d4>] (handle_irq_event_percpu) from [<c0066c90>]
> (handle_irq_event+0x44/0x64)
> [  131.824379]  r10:ee008000 r9:c06c5ef8 r8:00000015 r7:ee007000
> r6:ee20a900 r5:ee04a7e0
> [  131.824381]  r4:ee04a780
> [  131.824388] [<c0066c4c>] (handle_irq_event) from [<c0069c6c>]
> (handle_level_irq+0xcc/0x144)
> [  131.824395]  r6:00001000 r5:ee04a7e0 r4:ee04a780 r3:00020000
> [  131.824401] [<c0069ba0>] (handle_level_irq) from [<c0066028>]
> (generic_handle_irq+0x34/0x44)
> [  131.824407]  r5:ee004450 r4:00000028
> [  131.824416] [<c0065ff4>] (generic_handle_irq) from [<c0223678>]
> (combiner_handle_cascade_irq+0x9c/0x108)
> [  131.824420]  r4:c06e19b4 r3:000000a0
> [  131.824426] [<c02235dc>] (combiner_handle_cascade_irq) from
> [<c0066028>] (generic_handle_irq+0x34/0x44)
> [  131.824434]  r8:00000001 r7:00000000 r6:00000015 r5:00000000
> r4:00000015 r3:c02235dc
> [  131.824440] [<c0065ff4>] (generic_handle_irq) from [<c006633c>]
> (__handle_domain_irq+0x84/0xf0)
> [  131.824444]  r4:c06bfc54 r3:00000089
> [  131.824450] [<c00662b8>] (__handle_domain_irq) from [<c000867c>]
> (gic_handle_irq+0x38/0x70)
> [  131.824459]  r10:c06fb774 r9:f0020000 r8:c06c5ef8 r7:c06c680c
> r6:00000015 r5:00000025
> [  131.824463]  r4:f002000c r3:c06c5ef8
> [  131.824471] [<c0008644>] (gic_handle_irq) from [<c0013240>]
> (__irq_svc+0x40/0x74)
> [  131.824474] Exception stack(0xc06c5ef8 to 0xc06c5f40)
> [  131.824477] 5ee0:
>    00000001 00000000
> [  131.824482] 5f00: 00000000 c00206c0 c06c6518 c04eb3a4 00000000
> 00000000 c06c0dc0 00000001
> [  131.824487] 5f20: c06fb774 c06c5f4c c06c5f50 c06c5f40 c000f82c
> c000f830 60070053 ffffffff
> [  131.824495]  r9:00000001 r8:c06c0dc0 r7:c06c5f2c r6:ffffffff
> r5:60070053 r4:c000f830
> [  131.824504] [<c000f7f0>] (arch_cpu_idle) from [<c005b6e8>]
> (cpu_startup_entry+0x318/0x4ec)
> [  131.824513] [<c005b3d0>] (cpu_startup_entry) from [<c04da460>]
> (rest_init+0x8c/0x90)
> [  131.824516]  r7:ffffffff
> [  131.824526] [<c04da3d4>] (rest_init) from [<c068dcfc>]
> (start_kernel+0x3a0/0x3ac)
> [  131.824530]  r4:c06c6618 r3:c06c4000
> [  131.824538] [<c068d95c>] (start_kernel) from [<40008070>] (0x40008070)
> [  131.824543] Code: e3130002 0affffaf eb09a647 eaffffad (e7f001f2)
> [  131.824547] ---[ end trace 5586d719192694b5 ]---
> [  131.824551] Kernel panic - not syncing: Fatal exception in interrupt
> [  131.824556] CPU1: stopping
> [  131.824562] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D W
> 4.0.0-debug+ #3
> [  131.824564] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> [  131.824567] Backtrace:
> [  131.824576] [<c0012484>] (dump_backtrace) from [<c001269c>]
> (show_stack+0x18/0x1c)
> [  131.824584]  r6:c06e158c r5:ffffffff r4:00000000 r3:dc8ba200
> [  131.824592] [<c0012684>] (show_stack) from [<c04dfab8>]
> (dump_stack+0x88/0xc8)
> [  131.824598] [<c04dfa30>] (dump_stack) from [<c0014894>]
> (handle_IPI+0x1c8/0x2c4)
> [  131.824605]  r6:c06bfc54 r5:c06bfc54 r4:00000005 r3:ee0ae000
> [  131.824611] [<c00146cc>] (handle_IPI) from [<c00086b0>]
> (gic_handle_irq+0x6c/0x70)
> [  131.824620]  r9:f0024000 r8:ee0aff48 r7:c06c680c r6:fffffff5
> r5:00000005 r4:f002400c
> [  131.824625] [<c0008644>] (gic_handle_irq) from [<c0013240>]
> (__irq_svc+0x40/0x74)
> [  131.824628] Exception stack(0xee0aff48 to 0xee0aff90)
> [  131.824633] ff40:                   00000001 00000000 00000000
> c00206c0 c06c6518 c04eb3a4
> [  131.824638] ff60: 00000000 00000000 c06c0dc0 00000001 c06fb774
> ee0aff9c ee0affa0 ee0aff90
> [  131.824642] ff80: c000f82c c000f830 60010053 ffffffff
> [  131.824650]  r9:00000001 r8:c06c0dc0 r7:ee0aff7c r6:ffffffff
> r5:60010053 r4:c000f830
> [  131.824658] [<c000f7f0>] (arch_cpu_idle) from [<c005b6e8>]
> (cpu_startup_entry+0x318/0x4ec)
> [  131.824664] [<c005b3d0>] (cpu_startup_entry) from [<c00144d0>]
> (secondary_start_kernel+0xf4/0x100)
> [  131.824667]  r7:c06fd440
> [  131.824673] [<c00143dc>] (secondary_start_kernel) from [<40008744>]
> (0x40008744)
> [  131.824678]  r4:6e09006a r3:c000872c
> [  131.824681] CPU2: stopping
> [  131.824686] CPU: 2 PID: 0 Comm: swapper/2 Tainted: G      D W
> 4.0.0-debug+ #3
> [  131.824688] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> [  131.824691] Backtrace:
> [  131.824700] [<c0012484>] (dump_backtrace) from [<c001269c>]
> (show_stack+0x18/0x1c)
> [  131.824707]  r6:c06e158c r5:ffffffff r4:00000000 r3:dc8ba200
> [  131.824715] [<c0012684>] (show_stack) from [<c04dfab8>]
> (dump_stack+0x88/0xc8)
> [  131.824721] [<c04dfa30>] (dump_stack) from [<c0014894>]
> (handle_IPI+0x1c8/0x2c4)
> [  131.824728]  r6:c06bfc54 r5:c06bfc54 r4:00000005 r3:ee0b0000
> [  131.824733] [<c00146cc>] (handle_IPI) from [<c00086b0>]
> (gic_handle_irq+0x6c/0x70)
> [  131.824741]  r9:f0028000 r8:ee0b1f48 r7:c06c680c r6:fffffff5
> r5:00000005 r4:f002800c
> [  131.824747] [<c0008644>] (gic_handle_irq) from [<c0013240>]
> (__irq_svc+0x40/0x74)
> [  131.824749] Exception stack(0xee0b1f48 to 0xee0b1f90)
> [  131.824754] 1f40:                   00000001 00000000 00000000
> c00206c0 c06c6518 c04eb3a4
> [  131.824759] 1f60: 00000000 00000000 c06c0dc0 00000001 c06fb774
> ee0b1f9c ee0b1fa0 ee0b1f90
> [  131.824762] 1f80: c000f82c c000f830 60010053 ffffffff
> [  131.824771]  r9:00000001 r8:c06c0dc0 r7:ee0b1f7c r6:ffffffff
> r5:60010053 r4:c000f830
> [  131.824778] [<c000f7f0>] (arch_cpu_idle) from [<c005b6e8>]
> (cpu_startup_entry+0x318/0x4ec)
> [  131.824784] [<c005b3d0>] (cpu_startup_entry) from [<c00144d0>]
> (secondary_start_kernel+0xf4/0x100)
> [  131.824787]  r7:c06fd440
> [  131.824793] [<c00143dc>] (secondary_start_kernel) from [<40008744>]
> (0x40008744)
> [  131.824797]  r4:6e09006a r3:c000872c
> [  132.621228] [drm:mixer_regs_dump] MXR_INT_EN = 00000000
> [  132.626436] [drm:mixer_regs_dump] MXR_INT_STATUS = 00000b00
> [  132.631991] [drm:mixer_regs_dump] MXR_LAYER_CFG = 00000321
> [  132.637459] [drm:mixer_regs_dump] MXR_VIDEO_CFG = 00000000
> [  132.642928] [drm:mixer_regs_dump] MXR_GRAPHIC0_CFG = 003307ff
> [  132.648657] [drm:mixer_regs_dump] MXR_GRAPHIC0_BASE = 20c00000
> [  132.654472] [drm:mixer_regs_dump] MXR_GRAPHIC0_SPAN = 00000780
> [  132.660288] [drm:mixer_regs_dump] MXR_GRAPHIC0_WH = 07800438
> [  132.665930] [drm:mixer_regs_dump] MXR_GRAPHIC0_SXY = 00000000
> [  132.671658] [drm:mixer_regs_dump] MXR_GRAPHIC0_DXY = 00000000
> [  132.677387] [drm:mixer_regs_dump] MXR_GRAPHIC1_CFG = 00000400
> [  132.683116] [drm:mixer_regs_dump] MXR_GRAPHIC1_BASE = 21400000
> [  132.688932] [drm:mixer_regs_dump] MXR_GRAPHIC1_SPAN = 00000280
> [  132.694747] [drm:mixer_regs_dump] MXR_GRAPHIC1_WH = 028001e0
> [  132.700390] [drm:mixer_regs_dump] MXR_GRAPHIC1_SXY = 00000000
> [  132.706118] [drm:mixer_regs_dump] MXR_GRAPHIC1_DXY = 00800080
> [  132.711848] CPU3: stopping
> [  132.714540] CPU: 3 PID: 2390 Comm: lt-modetest Tainted: G      D W
>     4.0.0-debug+ #3
> [  132.722610] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> [  132.728685] Backtrace:
> [  132.731123] [<c0012484>] (dump_backtrace) from [<c001269c>]
> (show_stack+0x18/0x1c)
> [  132.738668]  r6:c06e158c r5:ffffffff r4:00000000 r3:dc8ba200
> [  132.744315] [<c0012684>] (show_stack) from [<c04dfab8>]
> (dump_stack+0x88/0xc8)
> [  132.751518] [<c04dfa30>] (dump_stack) from [<c0014894>]
> (handle_IPI+0x1c8/0x2c4)
> [  132.758892]  r6:c06bfc54 r5:c06bfc54 r4:00000005 r3:e8b8e000
> [  132.764537] [<c00146cc>] (handle_IPI) from [<c00086b0>]
> (gic_handle_irq+0x6c/0x70)
> [  132.772085]  r9:f002c000 r8:e8b8fc80 r7:c06c680c r6:fffffff5
> r5:00000005 r4:f002c00c
> [  132.779815] [<c0008644>] (gic_handle_irq) from [<c0013240>]
> (__irq_svc+0x40/0x74)
> [  132.787276] Exception stack(0xe8b8fc80 to 0xe8b8fcc8)
> [  132.792313] fc80: ed990e5c ee3e1400 00000003 f00fc000 600f0053
> ed990c20 c072df54 00000400
> [  132.800472] fca0: ed990810 ed990e5c 00000080 e8b8fcdc e8b8fcc8
> e8b8fcc8 c04e6548 c04e654c
> [  132.808629] fcc0: 600f0053 ffffffff
> [  132.812100]  r9:ed990e5c r8:ed990810 r7:e8b8fcb4 r6:ffffffff
> r5:600f0053 r4:c04e654c
> [  132.819832] [<c04e6534>] (_raw_spin_unlock_irqrestore) from
> [<c02b6344>] (mixer_win_commit+0x530/0xd94)
> [  132.829200]  r4:c072df54 r3:f00fc000
> [  132.832766] [<c02b5e14>] (mixer_win_commit) from [<c02a8898>]
> (exynos_update_plane+0xac/0xb8)
> [  132.841265]  r10:00000280 r9:ed94c400 r8:00000400 r7:00000400
> r6:ed990c20 r5:ed3a0c00
> [  132.849077]  r4:ed94c400
> [  132.851601] [<c02a87ec>] (exynos_update_plane) from [<c0293cbc>]
> (__setplane_internal+0x1a4/0x2c0)
> [  132.860535]  r7:ed3a0c00 r6:ed990c20 r5:00000002 r4:01e00000
> [  132.866181] [<c0293b18>] (__setplane_internal) from [<c0297800>]
> (drm_mode_setplane+0x180/0x244)
> [  132.874943]  r9:000001e0 r8:01e00000 r7:00000000 r6:ed990c20
> r5:ed3a0c00 r4:ed990c60
> [  132.882676] [<c0297680>] (drm_mode_setplane) from [<c028a848>]
> (drm_ioctl+0x1d0/0x58c)
> [  132.890568]  r10:e8b8fe54 r9:e4b4e000 r8:e8b8fe54 r7:ee2b0000
> r6:000000b7 r5:c072df54
> [  132.898379]  r4:c06c6448
> [  132.900903] [<c028a678>] (drm_ioctl) from [<c010b618>]
> (do_vfs_ioctl+0x430/0x614)
> [  132.908361]  r10:ee2da040 r9:bef9bd78 r8:00000003 r7:bef9bd78
> r6:00000003 r5:e4b4e100
> [  132.916173]  r4:e4b4e100
> [  132.918695] [<c010b1e8>] (do_vfs_ioctl) from [<c010b838>]
> (SyS_ioctl+0x3c/0x64)
> [  132.925982]  r10:00000000 r9:e8b8e000 r8:00000003 r7:bef9bd78
> r6:c03064b7 r5:e4b4e100
> [  132.933794]  r4:e4b4e100
> [  132.936316] [<c010b7fc>] (SyS_ioctl) from [<c000ec40>]
> (ret_fast_syscall+0x0/0x34)
> [  132.943863]  r8:c000ede4 r7:00000036 r6:c03064b7 r5:bef9bd78
> r4:00000000 r3:00000023
> [  132.951592] ---[ end Kernel panic - not syncing: Fatal exception in
> interrupt
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
