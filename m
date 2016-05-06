From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: drm/exynos: fimd: pagefault when restarting X
Date: Fri, 06 May 2016 08:30:06 +0200
Message-ID: <572C39EE.6010507@samsung.com>
References: <572B8291.6040803@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:23326 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751193AbcEFGaY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 May 2016 02:30:24 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O6Q0089USQLOZ70@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 May 2016 07:30:21 +0100 (BST)
In-reply-to: <572B8291.6040803@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Hi Tobias,

On 05/05/2016 07:27 PM, Tobias Jakobi wrote:
> Hello,
>
> here's another issue I experience when enabling FIMD on the ODROID-X2.
>
> I can trigger a IOMMU pagefault by starting X once, quitting, and
> restarting X again.
>

I have observed similar behavior on arm64 dev board which
uses decon5433 device.

> The pagefault occurs exactly when exynos_drm_free_buf() is called on
> this buffer, which then destroys the IOMMU mapping.
>
> Obviously the FIMD block is still happily scanning out from the buffer,
> even though the previous fimd_update_plane() has configured a new
> dma_addr.
>
> Now here's what I guess happens:
> Hardware registers are never updated in fimd_update_plane(), but update
> is only performed on the shadow registers. Shadow registers are written
> to the real ones on next vblank, but such a vblank nevers occurs before
> DRM core decides that the previously bound fb is no longer used.
>
> Now I'm not sure if I'm just seeing this since nothing is connected to
> the external connector on the board. Still something looks wrong here.
> If the real update of the hw registers really happens on the next
> vblank, then the driver should probably still hold a reference to the
> old fb, which is then dropped in the vblank irq handler?

For sure there is a problem in synchronization with irq handler and
in some circumstances driver assumes crtc (fimd/decon) stopped using
old framebuffer which is not true. In system without IOMMU it was usually
painless, but since IOMMU started working it signals this bug quite
loudly :)

I will prepare patch for this, hopefully today/tomorrow.
As the patch will touch exynos-drm core it should be tested on different
platforms / configurations, I will be glad if you can test on your board.

Regards
Andrzej


>
>
> With best wishes,
> Tobias
>
>
>
> dmesg / startx run 1:
>> [  229.728455] [drm:drm_stub_open] 
>> [  229.728554] [drm:drm_open_helper] pid = 2620, minor = 0
>> [  229.731411] [drm:ipp_subdrv_open] done priv[ee2be810]
>> [  229.737144] [drm:drm_setup] 
>> [  229.739394] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_SET_VERSION
>> [  229.746721] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  229.753799] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  229.761193] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_VERSION
>> [  229.767889] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_VERSION
>> [  229.774886] [drm:drm_release] open_count = 1
>> [  229.779653] [drm:drm_release] pid = 2620, device = 0xe200, open_count = 1
>> [  229.786060] [drm:drm_lastclose] 
>> [  229.789045] [drm:drm_lastclose] driver lastclose completed
>> [  229.794517] [drm:drm_lastclose] lastclose completed
>> [  230.011151] [drm:drm_stub_open] 
>> [  230.011214] [drm:drm_open_helper] pid = 2620, minor = 0
>> [  230.014006] [drm:ipp_subdrv_open] done priv[ee2be810]
>> [  230.019032] [drm:drm_setup] 
>> [  230.021918] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_SET_VERSION
>> [  230.029197] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  230.036384] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  230.043848] [drm:drm_release] open_count = 1
>> [  230.047866] [drm:drm_release] pid = 2620, device = 0xe200, open_count = 1
>> [  230.054634] [drm:drm_lastclose] 
>> [  230.057973] [drm:drm_lastclose] driver lastclose completed
>> [  230.063620] [drm:drm_lastclose] lastclose completed
>> [  230.068896] [drm:drm_stub_open] 
>> [  230.071522] [drm:drm_open_helper] pid = 2620, minor = 0
>> [  230.076791] [drm:ipp_subdrv_open] done priv[ee2be810]
>> [  230.081651] [drm:drm_setup] 
>> [  230.084485] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_VERSION
>> [  230.091481] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_VERSION
>> [  230.098449] [drm:drm_release] open_count = 1
>> [  230.102689] [drm:drm_release] pid = 2620, device = 0xe200, open_count = 1
>> [  230.109442] [drm:drm_lastclose] 
>> [  230.112621] [drm:drm_lastclose] driver lastclose completed
>> [  230.118089] [drm:drm_lastclose] lastclose completed
>> [  230.123121] [drm:drm_stub_open] 
>> [  230.126110] [drm:drm_open_helper] pid = 2620, minor = 0
>> [  230.131385] [drm:ipp_subdrv_open] done priv[ee2be810]
>> [  230.136412] [drm:drm_setup] 
>> [  230.139251] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_SET_VERSION
>> [  230.146588] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  230.153788] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  230.161972] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  230.168182] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  230.175765] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_VERSION
>> [  230.182347] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_VERSION
>> [  230.190573] [drm:drm_release] open_count = 1
>> [  230.193567] [drm:drm_release] pid = 2620, device = 0xe200, open_count = 1
>> [  230.200339] [drm:drm_lastclose] 
>> [  230.203506] [drm:drm_lastclose] driver lastclose completed
>> [  230.208988] [drm:drm_lastclose] lastclose completed
>> [  230.217252] [drm:drm_stub_open] 
>> [  230.217330] [drm:drm_open_helper] pid = 2620, minor = 0
>> [  230.222274] [drm:ipp_subdrv_open] done priv[ee2be810]
>> [  230.227316] [drm:drm_setup] 
>> [  230.230142] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_SET_VERSION
>> [  230.237471] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  230.244675] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  230.252232] [drm:drm_release] open_count = 1
>> [  230.256080] [drm:drm_release] pid = 2620, device = 0xe200, open_count = 1
>> [  230.262939] [drm:drm_lastclose] 
>> [  230.266049] [drm:drm_lastclose] driver lastclose completed
>> [  230.271555] [drm:drm_lastclose] lastclose completed
>> [  230.276681] [drm:drm_stub_open] 
>> [  230.279561] [drm:drm_open_helper] pid = 2620, minor = 0
>> [  230.284798] [drm:ipp_subdrv_open] done priv[ee2be810]
>> [  230.289836] [drm:drm_setup] 
>> [  230.292700] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_VERSION
>> [  230.299637] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_VERSION
>> [  230.306581] [drm:drm_release] open_count = 1
>> [  230.310816] [drm:drm_release] pid = 2620, device = 0xe200, open_count = 1
>> [  230.317613] [drm:drm_lastclose] 
>> [  230.320784] [drm:drm_lastclose] driver lastclose completed
>> [  230.326277] [drm:drm_lastclose] lastclose completed
>> [  230.331198] [drm:drm_stub_open] 
>> [  230.334352] [drm:drm_open_helper] pid = 2620, minor = 0
>> [  230.339565] [drm:ipp_subdrv_open] done priv[ee2be810]
>> [  230.344595] [drm:drm_setup] 
>> [  230.347467] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_SET_VERSION
>> [  230.354755] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  230.361958] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  230.369470] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  230.376379] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  230.383715] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_VERSION
>> [  230.390525] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_VERSION
>> [  230.397686] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_SET_VERSION
>> [  230.405561] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETRESOURCES
>> [  230.412794] [drm:drm_mode_getresources] CRTC[3] CONNECTORS[3] ENCODERS[3]
>> [  230.419354] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETRESOURCES
>> [  230.427143] [drm:drm_mode_getresources] [CRTC:24:crtc-0]
>> [  230.432496] [drm:drm_mode_getresources] [CRTC:31:crtc-1]
>> [  230.437730] [drm:drm_mode_getresources] [CRTC:37:crtc-2]
>> [  230.443028] [drm:drm_mode_getresources] [ENCODER:25:TMDS-25]
>> [  230.448664] [drm:drm_mode_getresources] [ENCODER:32:TMDS-32]
>> [  230.454309] [drm:drm_mode_getresources] [ENCODER:38:TMDS-38]
>> [  230.459947] [drm:drm_mode_getresources] [CONNECTOR:26:VGA-1]
>> [  230.465589] [drm:drm_mode_getresources] [CONNECTOR:33:HDMI-A-1]
>> [  230.471497] [drm:drm_mode_getresources] [CONNECTOR:39:Virtual-1]
>> [  230.477482] [drm:drm_mode_getresources] CRTC[3] CONNECTORS[3] ENCODERS[3]
>> [  230.484907] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  230.492071] [drm:drm_mode_getconnector] [CONNECTOR:26:?]
>> [  230.497445] DEBUG: in drm_helper_probe_single_connector_modes()
>> [  230.503264] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:26:VGA-1]
>> [  230.510482] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:26:VGA-1] probed modes :
>> [  230.518980] [drm:drm_mode_debug_printmodeline] Modeline 40:"1366x768" 71 85860 1366 1414 1446 1526 768 771 776 790 0x48 0x5
>> [  230.530149] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  230.537895] [drm:drm_mode_getconnector] [CONNECTOR:26:?]
>> [  230.543275] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
>> [  230.551034] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  230.558647] [drm:drm_mode_getconnector] [CONNECTOR:33:?]
>> [  230.563945] DEBUG: in drm_helper_probe_single_connector_modes()
>> [  230.569839] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:33:HDMI-A-1]
>> [  230.577311] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:33:HDMI-A-1] disconnected
>> [  230.585909] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  230.593714] [drm:drm_mode_getconnector] [CONNECTOR:33:?]
>> [  230.599025] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
>> [  230.607060] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  230.614468] [drm:drm_mode_getconnector] [CONNECTOR:39:?]
>> [  230.619750] DEBUG: in drm_helper_probe_single_connector_modes()
>> [  230.625655] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:39:Virtual-1]
>> [  230.633204] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:39:Virtual-1] disconnected
>> [  230.641975] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  230.649747] [drm:drm_mode_getconnector] [CONNECTOR:39:?]
>> [  230.655051] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
>> [  230.662850] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  230.670448] [drm:drm_mode_getconnector] [CONNECTOR:26:?]
>> [  230.675740] DEBUG: in drm_helper_probe_single_connector_modes()
>> [  230.681633] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:26:VGA-1]
>> [  230.688855] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:26:VGA-1] probed modes :
>> [  230.697347] [drm:drm_mode_debug_printmodeline] Modeline 40:"1366x768" 71 85860 1366 1414 1446 1526 768 771 776 790 0x48 0x5
>> [  230.708466] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  230.716264] [drm:drm_mode_getconnector] [CONNECTOR:26:?]
>> [  230.721607] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  230.729487] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  230.737168] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPBLOB
>> [  230.744850] [drm:drm_ioctl] ret = -2
>> [  230.748331] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  230.756124] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  230.764258] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  230.771573] [drm:drm_mode_getconnector] [CONNECTOR:33:?]
>> [  230.776886] DEBUG: in drm_helper_probe_single_connector_modes()
>> [  230.782763] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:33:HDMI-A-1]
>> [  230.790237] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:33:HDMI-A-1] disconnected
>> [  230.798833] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  230.806639] [drm:drm_mode_getconnector] [CONNECTOR:33:?]
>> [  230.812260] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  230.819752] [drm:drm_mode_getconnector] [CONNECTOR:39:?]
>> [  230.825044] DEBUG: in drm_helper_probe_single_connector_modes()
>> [  230.830941] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:39:Virtual-1]
>> [  230.838491] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:39:Virtual-1] disconnected
>> [  230.847186] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  230.854979] [drm:drm_mode_getconnector] [CONNECTOR:39:?]
>> [  230.878504] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, EXYNOS_GEM_CREATE
>> [  230.880120] [drm:exynos_drm_gem_init] created file object = edc7a640
>> [  230.896020] [drm:exynos_drm_alloc_buf] dma_addr(0x20100000), size(0x408000)
>> [  230.897689] [drm:exynos_drm_gem_handle_create] gem handle = 0x1
>> [  230.909691] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_MAP_DUMB
>> [  230.911566] [drm:exynos_drm_gem_dumb_map_offset] offset = 0x10000000
>> [  230.918056] [drm:exynos_drm_gem_mmap] flags = 0x5
>> [  230.936591] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, EXYNOS_G2D_GET_VER2
>> [  230.943254] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANERESOURCES
>> [  230.946334] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANERESOURCES
>> [  230.954642] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANE
>> [  230.962077] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANE
>> [  230.969955] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
>> [  230.977913] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
>> [  230.986136] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  230.993793] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.001577] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.009266] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.017008] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANE
>> [  231.024391] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANE
>> [  231.031862] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
>> [  231.040169] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
>> [  231.048424] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.056140] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.063874] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.071593] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.079327] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANE
>> [  231.086713] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANE
>> [  231.094185] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
>> [  231.102497] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
>> [  231.110754] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.118474] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.126205] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.133923] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.141605] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANE
>> [  231.149035] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANE
>> [  231.156645] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
>> [  231.164838] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
>> [  231.173118] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.180809] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.188550] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.196277] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.204012] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANE
>> [  231.211355] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANE
>> [  231.218824] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
>> [  231.227125] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
>> [  231.235383] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.243097] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.250829] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.258549] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.266285] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, EXYNOS_GEM_CREATE
>> [  231.273177] [drm:exynos_drm_gem_init] created file object = edd93a40
>> [  231.279595] [drm:exynos_drm_alloc_buf] dma_addr(0x20010000), size(0x6000)
>> [  231.286264] [drm:exynos_drm_gem_handle_create] gem handle = 0x2
>> [  231.292180] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_ADDFB2
>> [  231.299633] [drm:drm_mode_addfb2] [FB:41]
>> [  231.303710] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_ADDFB
>> [  231.310713] [drm:drm_mode_addfb2] [FB:42]
>> [  231.314767] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETCRTC
>> [  231.322097] [drm:drm_mode_setcrtc] [CRTC:24:crtc-0]
>> [  231.326923] [drm:drm_mode_setcrtc] [CONNECTOR:26:VGA-1]
>> [  231.332096] [drm:drm_atomic_state_init] Allocated atomic state ece04a00
>> [  231.338698] [drm:drm_atomic_get_crtc_state] Added [CRTC:24:crtc-0] edd43800 state to ece04a00
>> [  231.347196] [drm:drm_atomic_get_plane_state] Added [PLANE:18:plane-0] ecc69000 state to ece04a00
>> [  231.355972] [drm:drm_atomic_set_mode_for_crtc] Set [MODE:] for CRTC state edd43800
>> [  231.363510] [drm:drm_atomic_set_crtc_for_plane] Link plane state ecc69000 to [CRTC:24:crtc-0]
>> [  231.372020] [drm:drm_framebuffer_reference] edccdf00: FB ID: 42 (2)
>> [  231.378389] [drm:drm_atomic_set_fb_for_plane] Set [FB:42] for plane state ecc69000
>> [  231.385843] [drm:drm_atomic_get_connector_state] Added [CONNECTOR:26] ece04c40 state to ece04a00
>> [  231.394590] [drm:drm_atomic_add_affected_connectors] Adding all current connectors for [CRTC:24:crtc-0] to ece04a00
>> [  231.405211] [drm:drm_atomic_set_crtc_for_connector] Link connector state ece04c40 to [CRTC:24:crtc-0]
>> [  231.414209] [drm:drm_atomic_check_only] checking ece04a00
>> [  231.419598] [drm:drm_atomic_helper_check_modeset] [CRTC:24:crtc-0] mode changed
>> [  231.426877] [drm:drm_atomic_helper_check_modeset] [CRTC:24:crtc-0] enable changed
>> [  231.434398] [drm:update_connector_routing] Updating routing for [CONNECTOR:26:VGA-1]
>> [  231.442118] [drm:update_connector_routing] [CONNECTOR:26:VGA-1] using [ENCODER:25:TMDS-25] on [CRTC:24:crtc-0]
>> [  231.452054] [drm:drm_atomic_helper_check_modeset] [CRTC:24:crtc-0] active changed
>> [  231.459565] [drm:drm_atomic_helper_check_modeset] [CRTC:24:crtc-0] needs all connectors, enable: y, active: y
>> [  231.469421] [drm:drm_atomic_add_affected_connectors] Adding all current connectors for [CRTC:24:crtc-0] to ece04a00
>> [  231.479833] [drm:drm_atomic_helper_crtc_normalize_zpos] [CRTC:24:crtc-0] calculating normalized zpos values
>> [  231.489555] [drm:drm_atomic_helper_crtc_normalize_zpos] [PLANE:18:plane-0] processing zpos value 0
>> [  231.498539] [drm:drm_atomic_helper_crtc_normalize_zpos] [PLANE:18:plane-0] normalized zpos value 0
>> [  231.507445] [drm:exynos_plane_mode_set] plane : offset_x/y(0,0), width/height(1366,768)
>> [  231.515243] [drm:drm_atomic_commit] commiting ece04a00
>> [  231.520761] [drm:drm_calc_timestamping_constants] crtc 24: hwmode: htotal 1526, vtotal 790, vdisplay 768
>> [  231.530004] [drm:drm_calc_timestamping_constants] crtc 24: clock 85860 kHz framedur 14040764 linedur 17773
>> [  231.539740] [drm:crtc_set_mode] modeset on [ENCODER:25:TMDS-25]
>> [  231.545561] [drm:drm_atomic_helper_commit_modeset_enables] enabling [CRTC:24:crtc-0]
>> [  231.553522] [drm:drm_vblank_on] crtc 0, vblank enabled 0, inmodeset 0
>> [  231.559842] [drm:drm_atomic_helper_commit_modeset_enables] enabling [ENCODER:25:TMDS-25]
>> [  231.567782] [drm:fimd_update_plane] start addr = 0x20100000, end addr = 0x20508000, size = 0x408000
>> [  231.576785] [drm:fimd_update_plane] ovl_width = 1366, ovl_height = 768
>> [  231.583298] [drm:fimd_update_plane] osd pos: tx = 0, ty = 0, bx = 1365, by = 767
>> [  231.590671] [drm:fimd_update_plane] osd size = 0x100200
>> [  231.595899] [drm:drm_vblank_enable] enabling vblank on crtc 0, ret: 0
>> [  231.602277] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=1, diff=0, hw=0 hw_last=0
>> [  231.612338] [drm:drm_atomic_state_default_clear] Clearing atomic state ece04a00
>> [  231.619446] [drm:drm_atomic_state_free] Freeing atomic state ece04a00
>> [  231.626152] [drm:drm_framebuffer_reference] edccdf00: FB ID: 42 (3)
>> [  231.632183] [drm:drm_framebuffer_unreference] edccdf00: FB ID: 42 (4)
>> [  231.638680] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCRTC
>> [  231.646084] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.654024] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.661363] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.669081] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.676850] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
>> [  231.684560] [drm:drm_atomic_state_init] Allocated atomic state ece04740
>> [  231.691102] [drm:drm_property_reference_blob] ecc69900: blob ID: 44 (1)
>> [  231.697695] [drm:drm_atomic_get_crtc_state] Added [CRTC:24:crtc-0] edd42c00 state to ece04740
>> [  231.706201] [drm:drm_atomic_check_only] checking ece04740
>> [  231.711584] [drm:drm_atomic_helper_crtc_normalize_zpos] [CRTC:24:crtc-0] calculating normalized zpos values
>> [  231.721319] [drm:drm_framebuffer_reference] edccdf00: FB ID: 42 (3)
>> [  231.727554] [drm:drm_atomic_get_plane_state] Added [PLANE:18:plane-0] ecc69d80 state to ece04740
>> [  231.736321] [drm:drm_atomic_helper_crtc_normalize_zpos] [PLANE:18:plane-0] processing zpos value 0
>> [  231.745260] [drm:drm_atomic_helper_crtc_normalize_zpos] [PLANE:18:plane-0] normalized zpos value 0
>> [  231.754205] [drm:exynos_plane_mode_set] plane : offset_x/y(0,0), width/height(1366,768)
>> [  231.762018] [drm:drm_atomic_commit] commiting ece04740
>> [  231.767312] [drm:drm_calc_timestamping_constants] crtc 24: hwmode: htotal 1526, vtotal 790, vdisplay 768
>> [  231.776772] [drm:drm_calc_timestamping_constants] crtc 24: clock 85860 kHz framedur 14040764 linedur 17773
>> [  231.786410] [drm:fimd_update_plane] start addr = 0x20100000, end addr = 0x20508000, size = 0x408000
>> [  231.795432] [drm:fimd_update_plane] ovl_width = 1366, ovl_height = 768
>> [  231.801944] [drm:fimd_update_plane] osd pos: tx = 0, ty = 0, bx = 1365, by = 767
>> [  231.809321] [drm:fimd_update_plane] osd size = 0x100200
>> [  231.861495] [drm:drm_atomic_state_default_clear] Clearing atomic state ece04740
>> [  231.863161] [drm:drm_property_unreference_blob] ecc69900: blob ID: 44 (2)
>> [  231.869959] [drm:drm_framebuffer_unreference] edccdf00: FB ID: 42 (4)
>> [  231.876381] [drm:drm_atomic_state_free] Freeing atomic state ece04740
>> [  231.882852] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.890595] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.898323] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.906040] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.913774] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
>> [  231.921536] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.929227] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  231.936954] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
>> [  231.944674] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETCRTC
>> [  231.952045] [drm:drm_mode_setcrtc] [CRTC:31:crtc-1]
>> [  231.956846] [drm:drm_atomic_state_init] Allocated atomic state ece04580
>> [  231.963445] [drm:drm_atomic_get_crtc_state] Added [CRTC:31:crtc-1] edd43800 state to ece04580
>> [  231.971946] [drm:drm_atomic_get_plane_state] Added [PLANE:27:plane-5] ecc69000 state to ece04580
>> [  231.980713] [drm:drm_atomic_set_mode_for_crtc] Set [NOMODE] for CRTC state edd43800
>> [  231.988346] [drm:drm_atomic_set_crtc_for_plane] Link plane state ecc69000 to [NOCRTC]
>> [  231.996162] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for plane state ecc69000
>> [  232.003628] [drm:drm_atomic_add_affected_connectors] Adding all current connectors for [CRTC:31:crtc-1] to ece04580
>> [  232.014043] [drm:drm_atomic_check_only] checking ece04580
>> [  232.019424] [drm:drm_atomic_commit] commiting ece04580
>> [  232.024553] [drm:drm_atomic_state_default_clear] Clearing atomic state ece04580
>> [  232.031843] [drm:drm_atomic_state_free] Freeing atomic state ece04580
>> [  232.038383] [drm:drm_framebuffer_reference] edccdf00: FB ID: 42 (3)
>> [  232.044517] [drm:drm_framebuffer_unreference] edccdf00: FB ID: 42 (4)
>> [  232.051176] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETCRTC
>> [  232.058500] [drm:drm_mode_setcrtc] [CRTC:37:crtc-2]
>> [  232.063193] [drm:drm_atomic_state_init] Allocated atomic state ece043c0
>> [  232.069784] [drm:drm_atomic_get_crtc_state] Added [CRTC:37:crtc-2] edd42400 state to ece043c0
>> [  232.078295] [drm:drm_atomic_get_plane_state] Added [PLANE:34:plane-8] ecc69e80 state to ece043c0
>> [  232.087047] [drm:drm_atomic_set_mode_for_crtc] Set [NOMODE] for CRTC state edd42400
>> [  232.094744] [drm:drm_atomic_set_crtc_for_plane] Link plane state ecc69e80 to [NOCRTC]
>> [  232.102500] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for plane state ecc69e80
>> [  232.109974] [drm:drm_atomic_add_affected_connectors] Adding all current connectors for [CRTC:37:crtc-2] to ece043c0
>> [  232.120378] [drm:drm_atomic_check_only] checking ece043c0
>> [  232.125822] [drm:drm_atomic_commit] commiting ece043c0
>> [  232.130891] [drm:drm_atomic_state_default_clear] Clearing atomic state ece043c0
>> [  232.138190] [drm:drm_atomic_state_free] Freeing atomic state ece043c0
>> [  232.144687] [drm:drm_framebuffer_reference] edccdf00: FB ID: 42 (3)
>> [  232.150847] [drm:drm_framebuffer_unreference] edccdf00: FB ID: 42 (4)
>> [  232.159761] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  232.165167] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  232.172813] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  232.180483] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  232.188218] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  232.195967] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  232.203693] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  232.211417] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  232.219153] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  232.226876] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  232.357296] DEBUG: fimd_irq_handler
>> [  232.357376] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=1, diff=1, hw=0 hw_last=0
>> [  232.809449] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETCRTC
>> [  232.811789] [drm:drm_mode_setcrtc] [CRTC:24:crtc-0]
>> [  232.816159] [drm:drm_mode_setcrtc] [CONNECTOR:26:VGA-1]
>> [  232.821584] [drm:drm_atomic_state_init] Allocated atomic state ecd35c40
>> [  232.827989] [drm:drm_property_reference_blob] ecc69900: blob ID: 44 (1)
>> [  232.834595] [drm:drm_atomic_get_crtc_state] Added [CRTC:24:crtc-0] ede12600 state to ecd35c40
>> [  232.843104] [drm:drm_framebuffer_reference] edccdf00: FB ID: 42 (4)
>> [  232.849348] [drm:drm_atomic_get_plane_state] Added [PLANE:18:plane-0] ede86c00 state to ecd35c40
>> [  232.858120] [drm:drm_property_unreference_blob] ecc69900: blob ID: 44 (2)
>> [  232.864932] [drm:drm_atomic_set_mode_for_crtc] Set [MODE:] for CRTC state ede12600
>> [  232.872426] [drm:drm_atomic_set_crtc_for_plane] Link plane state ede86c00 to [CRTC:24:crtc-0]
>> [  232.880947] [drm:drm_framebuffer_unreference] edccdf00: FB ID: 42 (5)
>> [  232.887347] [drm:drm_framebuffer_reference] edccdf00: FB ID: 42 (4)
>> [  232.893615] [drm:drm_atomic_set_fb_for_plane] Set [FB:42] for plane state ede86c00
>> [  232.901186] [drm:drm_atomic_get_connector_state] Added [CONNECTOR:26] ecd351c0 state to ecd35c40
>> [  232.909948] [drm:drm_atomic_add_affected_connectors] Adding all current connectors for [CRTC:24:crtc-0] to ecd35c40
>> [  232.920760] [drm:drm_atomic_set_crtc_for_connector] Link connector state ecd351c0 to [NOCRTC]
>> [  232.928975] [drm:drm_atomic_set_crtc_for_connector] Link connector state ecd351c0 to [CRTC:24:crtc-0]
>> [  232.937971] [drm:drm_atomic_check_only] checking ecd35c40
>> [  232.943363] [drm:update_connector_routing] Updating routing for [CONNECTOR:26:VGA-1]
>> [  232.951082] [drm:update_connector_routing] [CONNECTOR:26:VGA-1] keeps [ENCODER:25:TMDS-25], now on [CRTC:24:crtc-0]
>> [  232.961505] [drm:drm_atomic_helper_crtc_normalize_zpos] [CRTC:24:crtc-0] calculating normalized zpos values
>> [  232.971219] [drm:drm_atomic_helper_crtc_normalize_zpos] [PLANE:18:plane-0] processing zpos value 0
>> [  232.980161] [drm:drm_atomic_helper_crtc_normalize_zpos] [PLANE:18:plane-0] normalized zpos value 0
>> [  232.989100] [drm:exynos_plane_mode_set] plane : offset_x/y(0,0), width/height(1366,768)
>> [  232.996912] [drm:drm_atomic_commit] commiting ecd35c40
>> [  233.002207] [drm:drm_calc_timestamping_constants] crtc 24: hwmode: htotal 1526, vtotal 790, vdisplay 768
>> [  233.011669] [drm:drm_calc_timestamping_constants] crtc 24: clock 85860 kHz framedur 14040764 linedur 17773
>> [  233.021306] [drm:fimd_update_plane] start addr = 0x20100000, end addr = 0x20508000, size = 0x408000
>> [  233.030332] [drm:fimd_update_plane] ovl_width = 1366, ovl_height = 768
>> [  233.036837] [drm:fimd_update_plane] osd pos: tx = 0, ty = 0, bx = 1365, by = 767
>> [  233.044217] [drm:fimd_update_plane] osd size = 0x100200
>> [  233.096511] [drm:drm_atomic_state_default_clear] Clearing atomic state ecd35c40
>> [  233.098173] [drm:drm_property_unreference_blob] ecc69900: blob ID: 44 (1)
>> [  233.104983] [drm:drm_framebuffer_unreference] edccdf00: FB ID: 42 (5)
>> [  233.111396] [drm:drm_atomic_state_free] Freeing atomic state ecd35c40
>> [  233.117838] [drm:drm_framebuffer_reference] edccdf00: FB ID: 42 (4)
>> [  233.124064] [drm:drm_framebuffer_unreference] edccdf00: FB ID: 42 (5)
>> [  233.130493] [drm:drm_framebuffer_unreference] edccdf00: FB ID: 42 (4)
>> [  233.137083] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCRTC
>> [  233.144415] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  233.152177] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  233.159912] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  233.160805] DEBUG: fimd_irq_handler
>> [  233.160819] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=2, diff=1, hw=0 hw_last=0
>> [  233.180907] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  233.188749] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
>> [  233.196286] [drm:drm_atomic_state_init] Allocated atomic state ecd35180
>> [  233.202800] [drm:drm_property_reference_blob] ede86c80: blob ID: 45 (1)
>> [  233.209385] [drm:drm_atomic_get_crtc_state] Added [CRTC:24:crtc-0] ede13200 state to ecd35180
>> [  233.217896] [drm:drm_atomic_check_only] checking ecd35180
>> [  233.223274] [drm:drm_atomic_helper_crtc_normalize_zpos] [CRTC:24:crtc-0] calculating normalized zpos values
>> [  233.233007] [drm:drm_framebuffer_reference] edccdf00: FB ID: 42 (3)
>> [  233.239244] [drm:drm_atomic_get_plane_state] Added [PLANE:18:plane-0] ecdf0300 state to ecd35180
>> [  233.248015] [drm:drm_atomic_helper_crtc_normalize_zpos] [PLANE:18:plane-0] processing zpos value 0
>> [  233.256950] [drm:drm_atomic_helper_crtc_normalize_zpos] [PLANE:18:plane-0] normalized zpos value 0
>> [  233.265905] [drm:exynos_plane_mode_set] plane : offset_x/y(0,0), width/height(1366,768)
>> [  233.273703] [drm:drm_atomic_commit] commiting ecd35180
>> [  233.279005] [drm:drm_calc_timestamping_constants] crtc 24: hwmode: htotal 1526, vtotal 790, vdisplay 768
>> [  233.288458] [drm:drm_calc_timestamping_constants] crtc 24: clock 85860 kHz framedur 14040764 linedur 17773
>> [  233.298103] [drm:fimd_update_plane] start addr = 0x20100000, end addr = 0x20508000, size = 0x408000
>> [  233.307119] [drm:fimd_update_plane] ovl_width = 1366, ovl_height = 768
>> [  233.313636] [drm:fimd_update_plane] osd pos: tx = 0, ty = 0, bx = 1365, by = 767
>> [  233.321011] [drm:fimd_update_plane] osd size = 0x100200
>> [  233.371523] [drm:drm_atomic_state_default_clear] Clearing atomic state ecd35180
>> [  233.373188] [drm:drm_property_unreference_blob] ede86c80: blob ID: 45 (2)
>> [  233.380004] [drm:drm_framebuffer_unreference] edccdf00: FB ID: 42 (4)
>> [  233.386415] [drm:drm_atomic_state_free] Freeing atomic state ecd35180
>> [  233.744011] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, EXYNOS_G2D_SET_CMDLIST2
>> [  233.745904] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, EXYNOS_G2D_EXEC
>> [  233.964502] DEBUG: fimd_irq_handler
>> [  233.964561] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=3, diff=1, hw=0 hw_last=0
>> [  234.193547] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETCRTC
>> [  234.195454] [drm:drm_mode_setcrtc] [CRTC:24:crtc-0]
>> [  234.200292] [drm:drm_mode_setcrtc] [CONNECTOR:26:VGA-1]
>> [  234.205446] [drm:drm_atomic_state_init] Allocated atomic state ece04b80
>> [  234.212060] [drm:drm_property_reference_blob] ede86c80: blob ID: 45 (1)
>> [  234.218610] [drm:drm_atomic_get_crtc_state] Added [CRTC:24:crtc-0] edd42800 state to ece04b80
>> [  234.227132] [drm:drm_framebuffer_reference] edccdf00: FB ID: 42 (4)
>> [  234.233374] [drm:drm_atomic_get_plane_state] Added [PLANE:18:plane-0] ecc68700 state to ece04b80
>> [  234.242359] [drm:drm_property_unreference_blob] ede86c80: blob ID: 45 (2)
>> [  234.248954] [drm:drm_atomic_set_mode_for_crtc] Set [MODE:] for CRTC state edd42800
>> [  234.256479] [drm:drm_atomic_set_crtc_for_plane] Link plane state ecc68700 to [CRTC:24:crtc-0]
>> [  234.264975] [drm:drm_framebuffer_unreference] edccdf00: FB ID: 42 (5)
>> [  234.271393] [drm:drm_framebuffer_reference] edccdf00: FB ID: 42 (4)
>> [  234.277639] [drm:drm_atomic_set_fb_for_plane] Set [FB:42] for plane state ecc68700
>> [  234.285316] [drm:drm_atomic_get_connector_state] Added [CONNECTOR:26] ece041c0 state to ece04b80
>> [  234.294095] [drm:drm_atomic_add_affected_connectors] Adding all current connectors for [CRTC:24:crtc-0] to ece04b80
>> [  234.304382] [drm:drm_atomic_set_crtc_for_connector] Link connector state ece041c0 to [NOCRTC]
>> [  234.312887] [drm:drm_atomic_set_crtc_for_connector] Link connector state ece041c0 to [CRTC:24:crtc-0]
>> [  234.322084] [drm:drm_atomic_check_only] checking ece04b80
>> [  234.327776] [drm:update_connector_routing] Updating routing for [CONNECTOR:26:VGA-1]
>> [  234.335177] [drm:update_connector_routing] [CONNECTOR:26:VGA-1] keeps [ENCODER:25:TMDS-25], now on [CRTC:24:crtc-0]
>> [  234.345598] [drm:drm_atomic_helper_crtc_normalize_zpos] [CRTC:24:crtc-0] calculating normalized zpos values
>> [  234.355313] [drm:drm_atomic_helper_crtc_normalize_zpos] [PLANE:18:plane-0] processing zpos value 0
>> [  234.364260] [drm:drm_atomic_helper_crtc_normalize_zpos] [PLANE:18:plane-0] normalized zpos value 0
>> [  234.373201] [drm:exynos_plane_mode_set] plane : offset_x/y(0,0), width/height(1366,768)
>> [  234.381009] [drm:drm_atomic_commit] commiting ece04b80
>> [  234.386311] [drm:drm_calc_timestamping_constants] crtc 24: hwmode: htotal 1526, vtotal 790, vdisplay 768
>> [  234.395765] [drm:drm_calc_timestamping_constants] crtc 24: clock 85860 kHz framedur 14040764 linedur 17773
>> [  234.405401] [drm:fimd_update_plane] start addr = 0x20100000, end addr = 0x20508000, size = 0x408000
>> [  234.414426] [drm:fimd_update_plane] ovl_width = 1366, ovl_height = 768
>> [  234.420931] [drm:fimd_update_plane] osd pos: tx = 0, ty = 0, bx = 1365, by = 767
>> [  234.428313] [drm:fimd_update_plane] osd size = 0x100200
>> [  234.481553] [drm:drm_atomic_state_default_clear] Clearing atomic state ece04b80
>> [  234.483222] [drm:drm_property_unreference_blob] ede86c80: blob ID: 45 (1)
>> [  234.490030] [drm:drm_framebuffer_unreference] edccdf00: FB ID: 42 (5)
>> [  234.496482] [drm:drm_atomic_state_free] Freeing atomic state ece04b80
>> [  234.502878] [drm:drm_framebuffer_reference] edccdf00: FB ID: 42 (4)
>> [  234.509115] [drm:drm_framebuffer_unreference] edccdf00: FB ID: 42 (5)
>> [  234.515533] [drm:drm_framebuffer_unreference] edccdf00: FB ID: 42 (4)
>> [  234.521991] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCRTC
>> [  234.529411] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  234.537116] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  234.544869] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  234.552605] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  234.560320] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
>> [  234.568043] [drm:drm_atomic_state_init] Allocated atomic state ecd355c0
>> [  234.574564] [drm:drm_property_reference_blob] ecc68880: blob ID: 44 (1)
>> [  234.581160] [drm:drm_atomic_get_crtc_state] Added [CRTC:24:crtc-0] ede13200 state to ecd355c0
>> [  234.589676] [drm:drm_atomic_check_only] checking ecd355c0
>> [  234.595056] [drm:drm_atomic_helper_crtc_normalize_zpos] [CRTC:24:crtc-0] calculating normalized zpos values
>> [  234.604781] [drm:drm_framebuffer_reference] edccdf00: FB ID: 42 (3)
>> [  234.611019] [drm:drm_atomic_get_plane_state] Added [PLANE:18:plane-0] edc40300 state to ecd355c0
>> [  234.619786] [drm:drm_atomic_helper_crtc_normalize_zpos] [PLANE:18:plane-0] processing zpos value 0
>> [  234.628735] [drm:drm_atomic_helper_crtc_normalize_zpos] [PLANE:18:plane-0] normalized zpos value 0
>> [  234.637672] [drm:exynos_plane_mode_set] plane : offset_x/y(0,0), width/height(1366,768)
>> [  234.645488] [drm:drm_atomic_commit] commiting ecd355c0
>> [  234.650781] [drm:drm_calc_timestamping_constants] crtc 24: hwmode: htotal 1526, vtotal 790, vdisplay 768
>> [  234.660242] [drm:drm_calc_timestamping_constants] crtc 24: clock 85860 kHz framedur 14040764 linedur 17773
>> [  234.669879] [drm:fimd_update_plane] start addr = 0x20100000, end addr = 0x20508000, size = 0x408000
>> [  234.679040] [drm:fimd_update_plane] ovl_width = 1366, ovl_height = 768
>> [  234.685473] [drm:fimd_update_plane] osd pos: tx = 0, ty = 0, bx = 1365, by = 767
>> [  234.692840] [drm:fimd_update_plane] osd size = 0x100200
>> [  234.746495] [drm:drm_atomic_state_default_clear] Clearing atomic state ecd355c0
>> [  234.748158] [drm:drm_property_unreference_blob] ecc68880: blob ID: 44 (2)
>> [  234.754954] [drm:drm_framebuffer_unreference] edccdf00: FB ID: 42 (4)
>> [  234.761376] [drm:drm_atomic_state_free] Freeing atomic state ecd355c0
>> [  234.767843] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  234.768191] DEBUG: fimd_irq_handler
>> [  234.768202] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=4, diff=1, hw=0 hw_last=0
>> [  234.788868] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  234.796603] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  234.804323] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  234.812056] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETPROPERTY
>> [  234.819773] [drm:drm_atomic_state_init] Allocated atomic state ede45180
>> [  234.826308] [drm:drm_property_reference_blob] ecc68880: blob ID: 44 (1)
>> [  234.832896] [drm:drm_atomic_get_crtc_state] Added [CRTC:24:crtc-0] eccde600 state to ede45180
>> [  234.841406] [drm:drm_atomic_check_only] checking ede45180
>> [  234.846787] [drm:drm_atomic_helper_crtc_normalize_zpos] [CRTC:24:crtc-0] calculating normalized zpos values
>> [  234.856516] [drm:drm_framebuffer_reference] edccdf00: FB ID: 42 (3)
>> [  234.862755] [drm:drm_atomic_get_plane_state] Added [PLANE:18:plane-0] edd02800 state to ede45180
>> [  234.871525] [drm:drm_atomic_helper_crtc_normalize_zpos] [PLANE:18:plane-0] processing zpos value 0
>> [  234.880462] [drm:drm_atomic_helper_crtc_normalize_zpos] [PLANE:18:plane-0] normalized zpos value 0
>> [  234.889408] [drm:exynos_plane_mode_set] plane : offset_x/y(0,0), width/height(1366,768)
>> [  234.897321] [drm:drm_atomic_commit] commiting ede45180
>> [  234.902576] [drm:drm_calc_timestamping_constants] crtc 24: hwmode: htotal 1526, vtotal 790, vdisplay 768
>> [  234.911989] [drm:drm_calc_timestamping_constants] crtc 24: clock 85860 kHz framedur 14040764 linedur 17773
>> [  234.921622] [drm:fimd_update_plane] start addr = 0x20100000, end addr = 0x20508000, size = 0x408000
>> [  234.930652] [drm:fimd_update_plane] ovl_width = 1366, ovl_height = 768
>> [  234.937154] [drm:fimd_update_plane] osd pos: tx = 0, ty = 0, bx = 1365, by = 767
>> [  234.944538] [drm:fimd_update_plane] osd size = 0x100200
>> [  234.996522] [drm:drm_atomic_state_default_clear] Clearing atomic state ede45180
>> [  234.998187] [drm:drm_property_unreference_blob] ecc68880: blob ID: 44 (2)
>> [  235.004997] [drm:drm_framebuffer_unreference] edccdf00: FB ID: 42 (4)
>> [  235.011418] [drm:drm_atomic_state_free] Freeing atomic state ede45180
>> [  235.571890] DEBUG: fimd_irq_handler
>> [  235.571956] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=5, diff=1, hw=0 hw_last=0
>> [  235.845261] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, EXYNOS_G2D_SET_CMDLIST2
>> [  235.847168] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, EXYNOS_G2D_EXEC
>> [  235.855127] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, EXYNOS_G2D_SET_CMDLIST2
>> [  235.861577] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, EXYNOS_G2D_EXEC
>> [  235.870251] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, EXYNOS_G2D_SET_CMDLIST2
>> [  235.875819] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, EXYNOS_G2D_EXEC
>> [  235.883917] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, EXYNOS_G2D_SET_CMDLIST2
>> [  235.889982] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, EXYNOS_G2D_EXEC
>> [  235.900597] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, EXYNOS_G2D_SET_CMDLIST2
>> [  235.904212] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, EXYNOS_G2D_EXEC
>> [  235.917253] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, EXYNOS_G2D_SET_CMDLIST2
>> [  235.919115] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, EXYNOS_G2D_EXEC
>> [  236.375657] DEBUG: fimd_irq_handler
>> [  236.375825] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=6, diff=1, hw=0 hw_last=0
>> [  237.179345] DEBUG: fimd_irq_handler
>> [  237.179511] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=7, diff=1, hw=0 hw_last=0
>> [  237.983008] DEBUG: fimd_irq_handler
>> [  237.983127] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=8, diff=1, hw=0 hw_last=0
>> [  238.786728] DEBUG: fimd_irq_handler
>> [  238.786885] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=9, diff=1, hw=0 hw_last=0
>> [  239.590421] DEBUG: fimd_irq_handler
>> [  239.590580] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=10, diff=1, hw=0 hw_last=0
>> [  240.007143] [drm:vblank_disable_fn] disabling vblank on crtc 0
>> [  240.007441] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=11, diff=0, hw=0 hw_last=0
>> [  244.255017] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, EXYNOS_G2D_SET_CMDLIST2
>> [  244.257383] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, EXYNOS_G2D_EXEC
>> [  244.369467] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_RMFB
>> [  244.370989] [drm:drm_framebuffer_unreference] edccd300: FB ID: 41 (1)
>> [  244.377440] [drm:drm_ioctl] pid=2620, dev=0xe200, auth=1, DRM_IOCTL_MODE_DESTROY_DUMB
>> [  244.385422] [drm:exynos_drm_gem_destroy] handle count = 0
>> [  244.390619] [drm:exynos_drm_free_buf] dma_addr(0x20010000), size(0x6000)
>> [  244.403718] [drm:drm_release] open_count = 1
>> [  244.403795] [drm:drm_release] pid = 2620, device = 0xe200, open_count = 1
>> [  244.409165] [drm:drm_framebuffer_unreference] edccdf00: FB ID: 42 (3)
>> [  244.415625] [drm:drm_lastclose] 
>> [  244.418851] [drm:drm_lastclose] driver lastclose completed
>> [  244.424290] [drm:drm_lastclose] lastclose completed
>
>
> dmesg / startx run 2:
>> [  324.975582] [drm:drm_stub_open] 
>> [  324.975653] [drm:drm_open_helper] pid = 2689, minor = 0
>> [  324.978464] [drm:ipp_subdrv_open] done priv[ee2be810]
>> [  324.983506] [drm:drm_setup] 
>> [  324.986367] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_SET_VERSION
>> [  324.993669] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  325.000891] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  325.008285] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_VERSION
>> [  325.014989] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_VERSION
>> [  325.021980] [drm:drm_release] open_count = 1
>> [  325.026157] [drm:drm_release] pid = 2689, device = 0xe200, open_count = 1
>> [  325.032974] [drm:drm_lastclose] 
>> [  325.036105] [drm:drm_lastclose] driver lastclose completed
>> [  325.041634] [drm:drm_lastclose] lastclose completed
>> [  325.104123] [drm:drm_stub_open] 
>> [  325.104195] [drm:drm_open_helper] pid = 2689, minor = 0
>> [  325.107025] [drm:ipp_subdrv_open] done priv[ee2be810]
>> [  325.112077] [drm:drm_setup] 
>> [  325.114895] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_SET_VERSION
>> [  325.122170] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  325.129359] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  325.136879] [drm:drm_release] open_count = 1
>> [  325.140794] [drm:drm_release] pid = 2689, device = 0xe200, open_count = 1
>> [  325.147595] [drm:drm_lastclose] 
>> [  325.150756] [drm:drm_lastclose] driver lastclose completed
>> [  325.156254] [drm:drm_lastclose] lastclose completed
>> [  325.161274] [drm:drm_stub_open] 
>> [  325.164334] [drm:drm_open_helper] pid = 2689, minor = 0
>> [  325.169539] [drm:ipp_subdrv_open] done priv[ee2be810]
>> [  325.174572] [drm:drm_setup] 
>> [  325.177460] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_VERSION
>> [  325.184378] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_VERSION
>> [  325.191343] [drm:drm_release] open_count = 1
>> [  325.195584] [drm:drm_release] pid = 2689, device = 0xe200, open_count = 1
>> [  325.202354] [drm:drm_lastclose] 
>> [  325.205538] [drm:drm_lastclose] driver lastclose completed
>> [  325.211024] [drm:drm_lastclose] lastclose completed
>> [  325.215945] [drm:drm_stub_open] 
>> [  325.219100] [drm:drm_open_helper] pid = 2689, minor = 0
>> [  325.224306] [drm:ipp_subdrv_open] done priv[ee2be810]
>> [  325.229343] [drm:drm_setup] 
>> [  325.232215] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_SET_VERSION
>> [  325.239506] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  325.246702] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  325.254312] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  325.261121] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  325.268468] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_VERSION
>> [  325.275264] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_VERSION
>> [  325.282741] [drm:drm_release] open_count = 1
>> [  325.286452] [drm:drm_release] pid = 2689, device = 0xe200, open_count = 1
>> [  325.293246] [drm:drm_lastclose] 
>> [  325.296407] [drm:drm_lastclose] driver lastclose completed
>> [  325.301911] [drm:drm_lastclose] lastclose completed
>> [  325.307868] [drm:drm_stub_open] 
>> [  325.309954] [drm:drm_open_helper] pid = 2689, minor = 0
>> [  325.315200] [drm:ipp_subdrv_open] done priv[ee2be810]
>> [  325.320226] [drm:drm_setup] 
>> [  325.323101] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_SET_VERSION
>> [  325.330387] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  325.337722] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  325.345067] [drm:drm_release] open_count = 1
>> [  325.349103] [drm:drm_release] pid = 2689, device = 0xe200, open_count = 1
>> [  325.355890] [drm:drm_lastclose] 
>> [  325.359019] [drm:drm_lastclose] driver lastclose completed
>> [  325.364492] [drm:drm_lastclose] lastclose completed
>> [  325.369469] [drm:drm_stub_open] 
>> [  325.372569] [drm:drm_open_helper] pid = 2689, minor = 0
>> [  325.377774] [drm:ipp_subdrv_open] done priv[ee2be810]
>> [  325.382802] [drm:drm_setup] 
>> [  325.385651] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_VERSION
>> [  325.392611] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_VERSION
>> [  325.399561] [drm:drm_release] open_count = 1
>> [  325.403816] [drm:drm_release] pid = 2689, device = 0xe200, open_count = 1
>> [  325.410590] [drm:drm_lastclose] 
>> [  325.413780] [drm:drm_lastclose] driver lastclose completed
>> [  325.419251] [drm:drm_lastclose] lastclose completed
>> [  325.424218] [drm:drm_stub_open] 
>> [  325.427335] [drm:drm_open_helper] pid = 2689, minor = 0
>> [  325.432544] [drm:ipp_subdrv_open] done priv[ee2be810]
>> [  325.437579] [drm:drm_setup] 
>> [  325.440427] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_SET_VERSION
>> [  325.447736] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  325.454939] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  325.462533] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  325.469418] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_GET_UNIQUE
>> [  325.476833] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_VERSION
>> [  325.483553] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_VERSION
>> [  325.490738] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_SET_VERSION
>> [  325.498479] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETRESOURCES
>> [  325.505613] [drm:drm_mode_getresources] CRTC[3] CONNECTORS[3] ENCODERS[3]
>> [  325.512390] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETRESOURCES
>> [  325.520157] [drm:drm_mode_getresources] [CRTC:24:crtc-0]
>> [  325.525424] [drm:drm_mode_getresources] [CRTC:31:crtc-1]
>> [  325.530714] [drm:drm_mode_getresources] [CRTC:37:crtc-2]
>> [  325.536008] [drm:drm_mode_getresources] [ENCODER:25:TMDS-25]
>> [  325.541649] [drm:drm_mode_getresources] [ENCODER:32:TMDS-32]
>> [  325.547293] [drm:drm_mode_getresources] [ENCODER:38:TMDS-38]
>> [  325.552932] [drm:drm_mode_getresources] [CONNECTOR:26:VGA-1]
>> [  325.558738] [drm:drm_mode_getresources] [CONNECTOR:33:HDMI-A-1]
>> [  325.564481] [drm:drm_mode_getresources] [CONNECTOR:39:Virtual-1]
>> [  325.570473] [drm:drm_mode_getresources] CRTC[3] CONNECTORS[3] ENCODERS[3]
>> [  325.578676] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  325.585120] [drm:drm_mode_getconnector] [CONNECTOR:26:?]
>> [  325.590422] DEBUG: in drm_helper_probe_single_connector_modes()
>> [  325.596304] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:26:VGA-1]
>> [  325.603482] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:26:VGA-1] probed modes :
>> [  325.611966] [drm:drm_mode_debug_printmodeline] Modeline 40:"1366x768" 71 85860 1366 1414 1446 1526 768 771 776 790 0x48 0x5
>> [  325.623078] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  325.630879] [drm:drm_mode_getconnector] [CONNECTOR:26:?]
>> [  325.636203] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
>> [  325.644040] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  325.651706] [drm:drm_mode_getconnector] [CONNECTOR:33:?]
>> [  325.656934] DEBUG: in drm_helper_probe_single_connector_modes()
>> [  325.662830] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:33:HDMI-A-1]
>> [  325.670293] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:33:HDMI-A-1] disconnected
>> [  325.678892] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  325.686690] [drm:drm_mode_getconnector] [CONNECTOR:33:?]
>> [  325.692006] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
>> [  325.700090] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  325.707495] [drm:drm_mode_getconnector] [CONNECTOR:39:?]
>> [  325.712807] DEBUG: in drm_helper_probe_single_connector_modes()
>> [  325.718674] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:39:Virtual-1]
>> [  325.726191] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:39:Virtual-1] disconnected
>> [  325.734871] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  325.742678] [drm:drm_mode_getconnector] [CONNECTOR:39:?]
>> [  325.747980] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETENCODER
>> [  325.755833] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  325.763465] [drm:drm_mode_getconnector] [CONNECTOR:26:?]
>> [  325.768722] DEBUG: in drm_helper_probe_single_connector_modes()
>> [  325.774616] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:26:VGA-1]
>> [  325.781988] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:26:VGA-1] probed modes :
>> [  325.790335] [drm:drm_mode_debug_printmodeline] Modeline 40:"1366x768" 71 85860 1366 1414 1446 1526 768 771 776 790 0x48 0x5
>> [  325.801455] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  325.809252] [drm:drm_mode_getconnector] [CONNECTOR:26:?]
>> [  325.814589] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  325.822492] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  325.830287] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPBLOB
>> [  325.838032] [drm:drm_ioctl] ret = -2
>> [  325.841271] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  325.849083] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  325.857178] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  325.864599] [drm:drm_mode_getconnector] [CONNECTOR:33:?]
>> [  325.869886] DEBUG: in drm_helper_probe_single_connector_modes()
>> [  325.875740] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:33:HDMI-A-1]
>> [  325.883216] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:33:HDMI-A-1] disconnected
>> [  325.891807] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  325.899607] [drm:drm_mode_getconnector] [CONNECTOR:33:?]
>> [  325.905166] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  325.912785] [drm:drm_mode_getconnector] [CONNECTOR:39:?]
>> [  325.918007] DEBUG: in drm_helper_probe_single_connector_modes()
>> [  325.923914] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:39:Virtual-1]
>> [  325.931464] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:39:Virtual-1] disconnected
>> [  325.940152] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETCONNECTOR
>> [  325.947956] [drm:drm_mode_getconnector] [CONNECTOR:39:?]
>> [  325.959806] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, EXYNOS_GEM_CREATE
>> [  325.961228] [drm:exynos_drm_gem_init] created file object = ecec6b40
>> [  325.975894] [drm:exynos_drm_alloc_buf] dma_addr(0x20600000), size(0x408000)
>> [  325.977301] [drm:exynos_drm_gem_handle_create] gem handle = 0x1
>> [  325.983336] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_MAP_DUMB
>> [  325.990672] [drm:exynos_drm_gem_dumb_map_offset] offset = 0x10408000
>> [  325.997182] [drm:exynos_drm_gem_mmap] flags = 0x5
>> [  326.007978] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, EXYNOS_G2D_GET_VER2
>> [  326.010899] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANERESOURCES
>> [  326.017845] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANERESOURCES
>> [  326.026075] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANE
>> [  326.033544] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANE
>> [  326.041090] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
>> [  326.049287] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
>> [  326.057526] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  326.065309] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  326.073053] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  326.080695] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  326.088384] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANE
>> [  326.095776] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANE
>> [  326.103248] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
>> [  326.111545] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
>> [  326.119801] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  326.127519] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  326.135252] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  326.142971] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  326.150708] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANE
>> [  326.158098] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANE
>> [  326.165590] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
>> [  326.173897] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
>> [  326.182148] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  326.189869] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  326.197597] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  326.205303] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  326.213004] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANE
>> [  326.220485] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANE
>> [  326.227902] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
>> [  326.236191] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
>> [  326.244446] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  326.252165] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  326.259892] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  326.267613] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  326.275344] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANE
>> [  326.282743] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPLANE
>> [  326.290215] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
>> [  326.298516] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_OBJ_GETPROPERTIES
>> [  326.306815] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  326.314488] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  326.322218] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  326.329945] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_GETPROPERTY
>> [  326.337673] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, EXYNOS_GEM_CREATE
>> [  326.344569] [drm:exynos_drm_gem_init] created file object = ecec7180
>> [  326.350993] [drm:exynos_drm_alloc_buf] dma_addr(0x20010000), size(0x6000)
>> [  326.357666] [drm:exynos_drm_gem_handle_create] gem handle = 0x2
>> [  326.363561] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_ADDFB2
>> [  326.370856] [drm:drm_mode_addfb2] [FB:41]
>> [  326.375058] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_ADDFB
>> [  326.382105] [drm:drm_mode_addfb2] [FB:43]
>> [  326.386161] [drm:drm_ioctl] pid=2689, dev=0xe200, auth=1, DRM_IOCTL_MODE_SETCRTC
>> [  326.393490] [drm:drm_mode_setcrtc] [CRTC:24:crtc-0]
>> [  326.398299] [drm:drm_mode_setcrtc] [CONNECTOR:26:VGA-1]
>> [  326.403486] [drm:drm_atomic_state_init] Allocated atomic state ece04440
>> [  326.410085] [drm:drm_property_reference_blob] ecc68880: blob ID: 44 (1)
>> [  326.416669] [drm:drm_atomic_get_crtc_state] Added [CRTC:24:crtc-0] edf51000 state to ece04440
>> [  326.425185] [drm:drm_framebuffer_reference] edccdf00: FB ID: 42 (2)
>> [  326.431425] [drm:drm_atomic_get_plane_state] Added [PLANE:18:plane-0] ecdf0300 state to ece04440
>> [  326.440254] [drm:drm_property_unreference_blob] ecc68880: blob ID: 44 (2)
>> [  326.446974] [drm:drm_atomic_set_mode_for_crtc] Set [MODE:] for CRTC state edf51000
>> [  326.454520] [drm:drm_atomic_set_crtc_for_plane] Link plane state ecdf0300 to [CRTC:24:crtc-0]
>> [  326.463027] [drm:drm_framebuffer_unreference] edccdf00: FB ID: 42 (3)
>> [  326.469447] [drm:drm_framebuffer_reference] eddb7240: FB ID: 43 (2)
>> [  326.475692] [drm:drm_atomic_set_fb_for_plane] Set [FB:43] for plane state ecdf0300
>> [  326.483259] [drm:drm_atomic_get_connector_state] Added [CONNECTOR:26] ece04b40 state to ece04440
>> [  326.492014] [drm:drm_atomic_add_affected_connectors] Adding all current connectors for [CRTC:24:crtc-0] to ece04440
>> [  326.502434] [drm:drm_atomic_set_crtc_for_connector] Link connector state ece04b40 to [NOCRTC]
>> [  326.510933] [drm:drm_atomic_set_crtc_for_connector] Link connector state ece04b40 to [CRTC:24:crtc-0]
>> [  326.520139] [drm:drm_atomic_check_only] checking ece04440
>> [  326.525519] [drm:update_connector_routing] Updating routing for [CONNECTOR:26:VGA-1]
>> [  326.533251] [drm:update_connector_routing] [CONNECTOR:26:VGA-1] keeps [ENCODER:25:TMDS-25], now on [CRTC:24:crtc-0]
>> [  326.543659] [drm:drm_atomic_helper_crtc_normalize_zpos] [CRTC:24:crtc-0] calculating normalized zpos values
>> [  326.553386] [drm:drm_atomic_helper_crtc_normalize_zpos] [PLANE:18:plane-0] processing zpos value 0
>> [  326.562320] [drm:drm_atomic_helper_crtc_normalize_zpos] [PLANE:18:plane-0] normalized zpos value 0
>> [  326.571273] [drm:exynos_plane_mode_set] plane : offset_x/y(0,0), width/height(1366,768)
>> [  326.579108] [drm:drm_atomic_commit] commiting ece04440
>> [  326.584379] [drm:drm_calc_timestamping_constants] crtc 24: hwmode: htotal 1526, vtotal 790, vdisplay 768
>> [  326.593829] [drm:drm_calc_timestamping_constants] crtc 24: clock 85860 kHz framedur 14040764 linedur 17773
>> [  326.603473] [drm:fimd_update_plane] start addr = 0x20600000, end addr = 0x20a08000, size = 0x408000
>> [  326.612489] [drm:fimd_update_plane] ovl_width = 1366, ovl_height = 768
>> [  326.619004] [drm:fimd_update_plane] osd pos: tx = 0, ty = 0, bx = 1365, by = 767
>> [  326.626376] [drm:fimd_update_plane] osd size = 0x100200
>> [  326.631595] [drm:drm_vblank_enable] enabling vblank on crtc 0, ret: 0
>> [  326.637990] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=11, diff=0, hw=0 hw_last=0
>> [  326.696788] [drm:drm_atomic_state_default_clear] Clearing atomic state ece04440
>> [  326.698446] [drm:drm_property_unreference_blob] ecc68880: blob ID: 44 (1)
>> [  326.705249] [drm:drm_framebuffer_unreference] edccdf00: FB ID: 42 (2)
>> [  326.711664] [drm:drm_atomic_state_free] Freeing atomic state ece04440
>> [  326.718097] [drm:drm_framebuffer_reference] eddb7240: FB ID: 43 (3)
>> [  326.724332] [drm:drm_framebuffer_unreference] edccdf00: FB ID: 42 (1)
>> [  326.730788] [drm:exynos_drm_gem_destroy] handle count = 0
>> [  326.736137] [drm:exynos_drm_free_buf] dma_addr(0x20100000), size(0x408000)
>> [  326.743218] exynos-sysmmu 11e20000.sysmmu: PAGE FAULT occurred at 0x202ba780 (page table base: 0x6e27c000)
>> [  326.752606] exynos-sysmmu 11e20000.sysmmu:   Lv1 entry: 0x6ea78001
>> [  326.758726] ------------[ cut here ]------------
>> [  326.763281] kernel BUG at drivers/iommu/exynos-iommu.c:410!
>> [  326.768837] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
>> [  326.774653] Modules linked in: cmac ecb bridge stp llc bnep btrfs xor xor_neon zlib_inflate zlib_deflate raid6_pq btusb extcon_odroid_usbotg btbcm btintel bluetooth usb_storage s5p_jpeg videobuf2_dma_contig videobuf2_memops v4l2_mem2mem videobuf2_v4l2 videobuf2_core
>> [  326.798178] CPU: 0 PID: 2689 Comm: X Tainted: G        W       4.5.3-debug+ #9
>> [  326.805379] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
>> [  326.811456] task: eeb60c80 ti: eea9a000 task.ti: eea9a000
>> [  326.816844] PC is at exynos_sysmmu_irq+0x2b8/0x418
>> [  326.821614] LR is at __lock_is_held+0x50/0x70
>> [  326.825952] pc : [<c03070e0>]    lr : [<c007372c>]    psr: a00b01d3
>> [  326.825952] sp : eea9b9f8  ip : eea9b9a8  fp : eea9ba44
>> [  326.837408] r10: c082a4d4  r9 : ee867830  r8 : c086f9e8
>> [  326.842616] r7 : c061cc74  r6 : c086db8b  r5 : ee867810  r4 : 00000000
>> [  326.849126] r3 : ffffffda  r2 : 00010002  r1 : c0834e0c  r0 : 00000001
>> [  326.855637] Flags: NzCv  IRQs off  FIQs off  Mode SVC_32  ISA ARM  Segment none
>> [  326.862928] Control: 10c5387d  Table: 6b47004a  DAC: 00000051
>> [  326.868657] Process X (pid: 2689, stack limit = 0xeea9a218)
>> [  326.874212] Stack: (0xeea9b9f8 to 0xeea9c000)
>> [  326.878552] b9e0:                                                       ee867864 600b01d3
>> [  326.886713] ba00: ee9d7310 eea9a000 00000000 eeb16010 ffffffda 0000001c c084d940 ee8fed40
>> [  326.894872] ba20: ee9d7360 ee9d7310 eea9a000 0000002f 00000000 c082a4d4 eea9ba94 eea9ba48
>> [  326.903031] ba40: c0087474 c0306e34 c008790c 600b01d3 00000000 ee9d7300 c086d6d8 c086e0fc
>> [  326.911190] ba60: c086e0e8 00000000 600b01d3 ee9d7300 ee9d7360 ee9d7310 ee802464 c082a83c
>> [  326.919350] ba80: ee808000 eea9bb78 eea9bab4 eea9ba98 c0087914 c00873fc c0822390 ee9d7300
>> [  326.927509] baa0: ee9d7360 ee9d7310 eea9bad4 eea9bab8 c008ac68 c00878e0 c008aba4 0000000a
>> [  326.935668] bac0: ee807500 ee807510 eea9bae4 eea9bad8 c00869f4 c008abb0 eea9bb0c eea9bae8
>> [  326.943827] bae0: c02ab9dc c00869d4 c02ab958 c0823688 00000000 00000015 00000000 00000001
>> [  326.951987] bb00: eea9bb1c eea9bb10 c00869f4 c02ab964 eea9bb4c eea9bb20 c0086d48 c00869d4
>> [  326.960146] bb20: eea9bb78 c082a83c c084dc34 f082000c eea9bb78 f0820000 f0821000 ee05e390
>> [  326.968305] bb40: eea9bb74 eea9bb50 c0009508 c0086cd0 c05de798 200b0053 ffffffff eea9bbac
>> [  326.976464] bb60: 20200000 ee05e33c eea9bbdc eea9bb78 c0015638 c00094b8 00000001 eeb611b0
>> [  326.984623] bb80: 00000000 600b00d3 600b0053 ee05e390 800b00d3 00000040 20200000 ee05e33c
>> [  326.992783] bba0: ee05e390 eea9bbdc c09e2c78 eea9bbc8 c0076654 c05de798 200b0053 ffffffff
>> [  327.000942] bbc0: 00000051 c0076888 ee9dcf30 ee05e380 eea9bc24 eea9bbe0 c0306160 c05de72c
>> [  327.009101] bbe0: 00000000 c02a71fc 00000000 c086db26 600b0053 00100000 c02a72c8 00100000
>> [  327.017260] bc00: 20200000 ee05e3d0 00408000 20100000 f0f5f000 eeb26034 eea9bc54 eea9bc28
>> [  327.025419] bc20: c0300d48 c0305ef8 00000014 00408000 20100000 ee05c340 eeb16010 20100000
>> [  327.033579] bc40: f0f5f000 eeb26034 eea9bc7c eea9bc58 c001d058 c0300ca4 00408000 ee3a9ca4
>> [  327.041738] bc60: f0f5f000 eeb16010 20100000 f0f5f000 eea9bca4 eea9bc80 c001eb14 c001d024
>> [  327.049897] bc80: ee3a9c00 eeb16010 20100000 c083005c f0f5f000 00408000 eea9bcd4 eea9bca8
>> [  327.058056] bca0: c03382c0 c001ea9c ee3a9ca4 00000000 eeb26000 ee3a9c00 edccdf00 c0337bbc
>> [  327.066215] bcc0: c0337bbc edccdf80 eea9bce4 eea9bcd8 c03389bc c03381d8 eea9bcfc eea9bce8
>> [  327.074375] bce0: c0317c78 c03389b8 ee3a9c00 edccdf8c eea9bd44 eea9bd00 c0337c58 c0317c4c
>> [  327.082534] bd00: c0076890 c0076688 eea9bd34 eea9bd18 c05db584 eeb26000 edccdf04 edccdf04
>> [  327.090693] bd20: eeb2638c eeb26000 edccdf00 eeb262d8 eea9a000 c103008c eea9bd6c eea9bd48
>> [  327.098852] bd40: c0321bd0 c0337b58 00000000 edccdf00 eebd9c00 00000000 00000000 eddb7000
>> [  327.107011] bd60: eea9bd8c eea9bd70 c03221c8 c0321b64 00000001 eebd9c00 eeb26000 eebd9c00
>> [  327.115170] bd80: eea9bdac eea9bd90 c0322d98 c032217c eddb7240 00000001 eeb26000 ece04c40
>> [  327.123330] bda0: eea9be14 eea9bdb0 c0328130 c0322cec eddb7240 c0085d68 ee2bf058 eddb7000
>> [  327.131489] bdc0: eebd9c00 eddb7240 eea9be08 eddb7240 eebd9c00 eddb7000 00000000 00000000
>> [  327.139648] bde0: ece04c40 00000001 00000000 eea9be4c 00000051 c082a448 c061e0e4 c103008c
>> [  327.147807] be00: eeb26000 000000a2 eea9befc eea9be18 c0319838 c0327fe4 00000001 c0756388
>> [  327.155966] be20: eeb61150 00000001 eea9be8c edf50e00 c0327fd8 bef19a90 edf50e00 00000068
>> [  327.164126] be40: eea9be4c c06864a2 ecf5f0a0 015d83c0 00000000 00000001 00000018 0000002b
>> [  327.172285] be60: 00000000 00000000 00000000 00000001 00014f64 05860556 05f605a6 03000000
>> [  327.180444] be80: 03080303 00000316 00000000 00000005 00000000 00000000 00000000 00000000
>> [  327.188603] bea0: 00000000 00000000 00000000 00000000 00000000 eea9bec0 c0073798 c00736e8
>> [  327.196762] bec0: 00000000 00000000 00000000 dc8ba703 c00900e4 bef19a90 ee2b93e0 ecec72c0
>> [  327.204922] bee0: c015ef3c 00000006 eea9a000 00000000 eea9bf7c eea9bf00 c015e5f4 c03196ec
>> [  327.213081] bf00: c00722a0 c0054264 60010053 edd30a34 00000026 eb839790 eea9bf3c eea9bf28
>> [  327.221240] bf20: c007241c c007224c 00008000 ecd468c0 eea9bf4c eea9bf40 c014d9ec c00723fc
>> [  327.229399] bf40: eea9bf6c eea9bf50 c016b6c8 c008fdf8 00000001 ecec72c0 bef19a90 ecec72c0
>> [  327.237558] bf60: c06864a2 00000006 eea9a000 00000000 eea9bfa4 eea9bf80 c015ef3c c015e558
>> [  327.245718] bf80: 00000001 bef19a90 bef19a90 c06864a2 00000036 c0010044 00000000 eea9bfa8
>> [  327.253877] bfa0: c000fea0 c015ef0c bef19a90 bef19a90 00000006 c06864a2 bef19a90 00000001
>> [  327.262036] bfc0: bef19a90 bef19a90 c06864a2 00000036 015d83c0 0000002b 00000018 00000000
>> [  327.270195] bfe0: b6da307c bef19a74 b6d8b094 b6b9164c 400b0050 00000006 00000000 00000000
>> [  327.278351] Backtrace: 
>> [  327.280790] [<c0306e28>] (exynos_sysmmu_irq) from [<c0087474>] (handle_irq_event_percpu+0x84/0x4e4)
>> [  327.289810]  r10:c082a4d4 r9:00000000 r8:0000002f r7:eea9a000 r6:ee9d7310 r5:ee9d7360
>> [  327.297621]  r4:ee8fed40
>> [  327.300142] [<c00873f0>] (handle_irq_event_percpu) from [<c0087914>] (handle_irq_event+0x40/0x64)
>> [  327.308992]  r10:eea9bb78 r9:ee808000 r8:c082a83c r7:ee802464 r6:ee9d7310 r5:ee9d7360
>> [  327.316804]  r4:ee9d7300
>> [  327.319325] [<c00878d4>] (handle_irq_event) from [<c008ac68>] (handle_level_irq+0xc4/0x148)
>> [  327.327655]  r6:ee9d7310 r5:ee9d7360 r4:ee9d7300 r3:c0822390
>> [  327.333299] [<c008aba4>] (handle_level_irq) from [<c00869f4>] (generic_handle_irq+0x2c/0x3c)
>> [  327.341716]  r6:ee807510 r5:ee807500 r4:0000000a r3:c008aba4
>> [  327.347363] [<c00869c8>] (generic_handle_irq) from [<c02ab9dc>] (combiner_handle_cascade_irq+0x84/0xe8)
>> [  327.356735] [<c02ab958>] (combiner_handle_cascade_irq) from [<c00869f4>] (generic_handle_irq+0x2c/0x3c)
>> [  327.366107]  r8:00000001 r7:00000000 r6:00000015 r5:00000000 r4:c0823688 r3:c02ab958
>> [  327.373835] [<c00869c8>] (generic_handle_irq) from [<c0086d48>] (__handle_domain_irq+0x84/0xf4)
>> [  327.382516] [<c0086cc4>] (__handle_domain_irq) from [<c0009508>] (gic_handle_irq+0x5c/0x9c)
>> [  327.390844]  r10:ee05e390 r9:f0821000 r8:f0820000 r7:eea9bb78 r6:f082000c r5:c084dc34
>> [  327.398656]  r4:c082a83c r3:eea9bb78
>> [  327.402219] [<c00094ac>] (gic_handle_irq) from [<c0015638>] (__irq_svc+0x58/0x98)
>> [  327.409681] Exception stack(0xeea9bb78 to 0xeea9bbc0)
>> [  327.414716] bb60:                                                       00000001 eeb611b0
>> [  327.422877] bb80: 00000000 600b00d3 600b0053 ee05e390 800b00d3 00000040 20200000 ee05e33c
>> [  327.431036] bba0: ee05e390 eea9bbdc c09e2c78 eea9bbc8 c0076654 c05de798 200b0053 ffffffff
>> [  327.439192]  r9:ee05e33c r8:20200000 r7:eea9bbac r6:ffffffff r5:200b0053 r4:c05de798
>> [  327.446925] [<c05de720>] (_raw_spin_unlock_irqrestore) from [<c0306160>] (exynos_iommu_unmap+0x274/0x518)
>> [  327.456465]  r5:ee05e380 r4:ee9dcf30
>> [  327.460028] [<c0305eec>] (exynos_iommu_unmap) from [<c0300d48>] (iommu_unmap+0xb0/0x2c0)
>> [  327.468096]  r10:eeb26034 r9:f0f5f000 r8:20100000 r7:00408000 r6:ee05e3d0 r5:20200000
>> [  327.475908]  r4:00100000
>> [  327.478429] [<c0300c98>] (iommu_unmap) from [<c001d058>] (__iommu_remove_mapping+0x40/0xd4)
>> [  327.486758]  r10:eeb26034 r9:f0f5f000 r8:20100000 r7:eeb16010 r6:ee05c340 r5:20100000
>> [  327.494570]  r4:00408000 r3:00000014
>> [  327.498133] [<c001d018>] (__iommu_remove_mapping) from [<c001eb14>] (arm_iommu_free_attrs+0x84/0xf0)
>> [  327.507243]  r9:f0f5f000 r8:20100000 r7:eeb16010 r6:f0f5f000 r5:ee3a9ca4 r4:00408000
>> [  327.514975] [<c001ea90>] (arm_iommu_free_attrs) from [<c03382c0>] (exynos_drm_gem_destroy+0xf4/0x17c)
>> [  327.524169]  r9:00408000 r8:f0f5f000 r7:c083005c r6:20100000 r5:eeb16010 r4:ee3a9c00
>> [  327.531899] [<c03381cc>] (exynos_drm_gem_destroy) from [<c03389bc>] (exynos_drm_gem_free_object+0x10/0x14)
>> [  327.541529]  r9:edccdf80 r8:c0337bbc r7:c0337bbc r6:edccdf00 r5:ee3a9c00 r4:eeb26000
>> [  327.549261] [<c03389ac>] (exynos_drm_gem_free_object) from [<c0317c78>] (drm_gem_object_free+0x38/0x50)
>> [  327.558633] [<c0317c40>] (drm_gem_object_free) from [<c0337c58>] (exynos_drm_fb_destroy+0x10c/0x134)
>> [  327.567743]  r5:edccdf8c r4:ee3a9c00
>> [  327.571307] [<c0337b4c>] (exynos_drm_fb_destroy) from [<c0321bd0>] (drm_framebuffer_free+0x78/0x7c)
>> [  327.580329]  r10:c103008c r9:eea9a000 r8:eeb262d8 r7:edccdf00 r6:eeb26000 r5:eeb2638c
>> [  327.588141]  r4:edccdf04
>> [  327.590661] [<c0321b58>] (drm_framebuffer_free) from [<c03221c8>] (drm_framebuffer_unreference+0x58/0x88)
>> [  327.600206]  r8:eddb7000 r7:00000000 r6:00000000 r5:eebd9c00 r4:edccdf00 r3:00000000
>> [  327.607935] [<c0322170>] (drm_framebuffer_unreference) from [<c0322d98>] (drm_mode_set_config_internal+0xb8/0xe4)
>> [  327.618174]  r4:eebd9c00
>> [  327.620695] [<c0322ce0>] (drm_mode_set_config_internal) from [<c0328130>] (drm_mode_setcrtc+0x158/0x4e4)
>> [  327.630152]  r7:ece04c40 r6:eeb26000 r5:00000001 r4:eddb7240
>> [  327.635799] [<c0327fd8>] (drm_mode_setcrtc) from [<c0319838>] (drm_ioctl+0x158/0x524)
>> [  327.643606]  r10:000000a2 r9:eeb26000 r8:c103008c r7:c061e0e4 r6:c082a448 r5:00000051
>> [  327.651418]  r4:eea9be4c
>> [  327.653941] [<c03196e0>] (drm_ioctl) from [<c015e5f4>] (do_vfs_ioctl+0xa8/0x9b4)
>> [  327.661313]  r10:00000000 r9:eea9a000 r8:00000006 r7:c015ef3c r6:ecec72c0 r5:ee2b93e0
>> [  327.669125]  r4:bef19a90
>> [  327.671646] [<c015e54c>] (do_vfs_ioctl) from [<c015ef3c>] (SyS_ioctl+0x3c/0x64)
>> [  327.678934]  r10:00000000 r9:eea9a000 r8:00000006 r7:c06864a2 r6:ecec72c0 r5:bef19a90
>> [  327.686745]  r4:ecec72c0
>> [  327.689268] [<c015ef00>] (SyS_ioctl) from [<c000fea0>] (ret_fast_syscall+0x0/0x1c)
>> [  327.696815]  r8:c0010044 r7:00000036 r6:c06864a2 r5:bef19a90 r4:bef19a90 r3:00000001
>> [  327.704543] Code: eb013198 e5950040 e3500000 1affffa3 (e7f001f2) 
>> [  327.710620] ---[ end trace 89125c1379da6049 ]---
>> [  327.715218] Kernel panic - not syncing: Fatal exception in interrupt
>> [  327.721558] CPU2: stopping
>> [  327.724248] CPU: 2 PID: 0 Comm: swapper/2 Tainted: G      D W       4.5.3-debug+ #9
>> [  327.731883] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
>> [  327.737958] Backtrace: 
>> [  327.740395] [<c001486c>] (dump_backtrace) from [<c0014a68>] (show_stack+0x18/0x1c)
>> [  327.747940]  r6:c084d760 r5:200701d3 r4:00000000 r3:dc8ba703
>> [  327.753589] [<c0014a50>] (show_stack) from [<c028831c>] (dump_stack+0xb0/0xdc)
>> [  327.760790] [<c028826c>] (dump_stack) from [<c00172e8>] (handle_IPI+0x3b0/0x42c)
>> [  327.768165]  r8:f0828000 r7:c05e0430 r6:c086e048 r5:c0823688 r4:00000004 r3:00000000
>> [  327.775892] [<c0016f38>] (handle_IPI) from [<c0009544>] (gic_handle_irq+0x98/0x9c)
>> [  327.783441]  r10:c086d6b5 r9:f0829000 r8:f0828000 r7:ee8bbf48 r6:f082800c r5:c084dc34
>> [  327.791253]  r4:c082a83c
>> [  327.793773] [<c00094ac>] (gic_handle_irq) from [<c0015638>] (__irq_svc+0x58/0x98)
>> [  327.801236] Exception stack(0xee8bbf48 to 0xee8bbf90)
>> [  327.806272] bf40:                   c00109d4 00000000 00000000 c0022e40 ee8ba000 c086e6b0
>> [  327.814432] bf60: c082a4d4 00000000 00000000 c082a520 c086d6b5 ee8bbfa4 ee8bbf88 ee8bbf98
>> [  327.822589] bf80: c0076890 c00109d8 60070053 ffffffff
>> [  327.827623]  r9:c082a520 r8:00000000 r7:ee8bbf7c r6:ffffffff r5:60070053 r4:c00109d8
>> [  327.835354] [<c00109ac>] (arch_cpu_idle) from [<c0070478>] (default_idle_call+0x28/0x38)
>> [  327.843423] [<c0070450>] (default_idle_call) from [<c0070830>] (cpu_startup_entry+0x3a8/0x484)
>> [  327.852017] [<c0070488>] (cpu_startup_entry) from [<c0016d4c>] (secondary_start_kernel+0x108/0x110)
>> [  327.861040]  r7:c0873328
>> [  327.863561] [<c0016c44>] (secondary_start_kernel) from [<400095ec>] (0x400095ec)
>> [  327.870936]  r5:00000051 r4:6e89406a
>> [  327.874495] CPU3: stopping
>> [  327.877188] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G      D W       4.5.3-debug+ #9
>> [  327.884824] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
>> [  327.890899] Backtrace: 
>> [  327.893336] [<c001486c>] (dump_backtrace) from [<c0014a68>] (show_stack+0x18/0x1c)
>> [  327.900882]  r6:c084d760 r5:200101d3 r4:00000000 r3:dc8ba703
>> [  327.906528] [<c0014a50>] (show_stack) from [<c028831c>] (dump_stack+0xb0/0xdc)
>> [  327.913731] [<c028826c>] (dump_stack) from [<c00172e8>] (handle_IPI+0x3b0/0x42c)
>> [  327.921106]  r8:f082c000 r7:c05e0430 r6:c086e048 r5:c0823688 r4:00000004 r3:00000000
>> [  327.928834] [<c0016f38>] (handle_IPI) from [<c0009544>] (gic_handle_irq+0x98/0x9c)
>> [  327.936383]  r10:c086d6b5 r9:f082d000 r8:f082c000 r7:ee8bdf48 r6:f082c00c r5:c084dc34
>> [  327.944194]  r4:c082a83c
>> [  327.946714] [<c00094ac>] (gic_handle_irq) from [<c0015638>] (__irq_svc+0x58/0x98)
>> [  327.954177] Exception stack(0xee8bdf48 to 0xee8bdf90)
>> [  327.959214] df40:                   c00109d4 00000000 00000000 c0022e40 ee8bc000 c086e6b0
>> [  327.967373] df60: c082a4d4 00000000 00000000 c082a520 c086d6b5 ee8bdfa4 ee8bdf88 ee8bdf98
>> [  327.975531] df80: c0076890 c00109d8 60010053 ffffffff
>> [  327.980564]  r9:c082a520 r8:00000000 r7:ee8bdf7c r6:ffffffff r5:60010053 r4:c00109d8
>> [  327.988294] [<c00109ac>] (arch_cpu_idle) from [<c0070478>] (default_idle_call+0x28/0x38)
>> [  327.996365] [<c0070450>] (default_idle_call) from [<c0070830>] (cpu_startup_entry+0x3a8/0x484)
>> [  328.004958] [<c0070488>] (cpu_startup_entry) from [<c0016d4c>] (secondary_start_kernel+0x108/0x110)
>> [  328.013982]  r7:c0873328
>> [  328.016501] [<c0016c44>] (secondary_start_kernel) from [<400095ec>] (0x400095ec)
>> [  328.023877]  r5:00000051 r4:6e89406a
>> [  328.027437] CPU1: stopping
>> [  328.030130] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D W       4.5.3-debug+ #9
>> [  328.037765] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
>> [  328.043841] Backtrace: 
>> [  328.046277] [<c001486c>] (dump_backtrace) from [<c0014a68>] (show_stack+0x18/0x1c)
>> [  328.053823]  r6:c084d760 r5:200a01d3 r4:00000000 r3:dc8ba703
>> [  328.059469] [<c0014a50>] (show_stack) from [<c028831c>] (dump_stack+0xb0/0xdc)
>> [  328.066673] [<c028826c>] (dump_stack) from [<c00172e8>] (handle_IPI+0x3b0/0x42c)
>> [  328.074047]  r8:f0824000 r7:c05e0430 r6:c086e048 r5:c0823688 r4:00000004 r3:00000000
>> [  328.081775] [<c0016f38>] (handle_IPI) from [<c0009544>] (gic_handle_irq+0x98/0x9c)
>> [  328.089324]  r10:c086d6b5 r9:f0825000 r8:f0824000 r7:ee8b9f48 r6:f082400c r5:c084dc34
>> [  328.097136]  r4:c082a83c
>> [  328.099656] [<c00094ac>] (gic_handle_irq) from [<c0015638>] (__irq_svc+0x58/0x98)
>> [  328.107119] Exception stack(0xee8b9f48 to 0xee8b9f90)
>> [  328.112155] 9f40:                   c00109d4 00000000 00000000 c0022e40 ee8b8000 c086e6b0
>> [  328.120315] 9f60: c082a4d4 00000000 00000000 c082a520 c086d6b5 ee8b9fa4 ee8b9f88 ee8b9f98
>> [  328.128472] 9f80: c0076890 c00109d8 600a0053 ffffffff
>> [  328.133505]  r9:c082a520 r8:00000000 r7:ee8b9f7c r6:ffffffff r5:600a0053 r4:c00109d8
>> [  328.141235] [<c00109ac>] (arch_cpu_idle) from [<c0070478>] (default_idle_call+0x28/0x38)
>> [  328.149307] [<c0070450>] (default_idle_call) from [<c0070830>] (cpu_startup_entry+0x3a8/0x484)
>> [  328.157899] [<c0070488>] (cpu_startup_entry) from [<c0016d4c>] (secondary_start_kernel+0x108/0x110)
>> [  328.166923]  r7:c0873328
>> [  328.169443] [<c0016c44>] (secondary_start_kernel) from [<400095ec>] (0x400095ec)
>> [  328.176818]  r5:00000051 r4:6e89406a
>> [  328.180384] ---[ end Kernel panic - not syncing: Fatal exception in interrupt
>
>
