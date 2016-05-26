From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v2 0/10] Add RK3399 eDP support and fix some bugs to
 analogix_dp driver.
Date: Thu, 26 May 2016 17:34:25 +0800
Message-ID: <5746C321.9000707@rock-chips.com>
References: <1464066086-21967-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.133]:57851 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750803AbcEZJeg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 May 2016 05:34:36 -0400
In-Reply-To: <1464066086-21967-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Mark Yao <yzq@rock-chips.com>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org

Hi Javier,

On 05/24/2016 01:01 PM, Yakir Yang wrote:
> Hi all,
>
> This series have been posted about one month, still no comments, help here :(
This series works rightly on Rockchip platform, and most of them haven't 
touch the
common analogix_dp driver (except for the hotplug fixed). So i guess 
Exynos platform
should also happy with this changes.

But not sure about that. So, is it possible that you could help to check 
this on Exynos
Chromebook, if so i would be very grateful about that.

Thanks,
- Yakir
>
> RK3399 and RK3288 shared the same eDP IP controller, only some light
> difference with VOP configure and GRF configure.
>
> Also same misc fix to analogix_dp driver:
> - Hotplug invalid which report by Dan Carpenter
> - Make panel detect to an optional action
> - correct the register bit define error in ANALOGIX_DP_PLL_REG_1
>
>
> Changes in v2:
> - new patch in v2
> - rebase with drm-next, fix some conflicts
> - new patch in v2
>
> Yakir Yang (10):
>    drm/bridge: analogix_dp: rename RK3288_DP to ROCKCHIP_DP
>    drm/rockchip: analogix_dp: split the lcdc select setting into device
>      data
>    drm/bridge: analogix_dp: correct the register bit define error in
>      ANALOGIX_DP_PLL_REG_1
>    drm/bridge: analogix_dp: some rockchip chips need to flip REF_CLK bit
>      setting
>    drm/rockchip: analogix_dp: add rk3399 eDP support
>    drm/rockchip: analogix_dp: make panel detect to an optional action
>    drm/bridge: analogix_dp: introduce connector mode_valid callback to
>      plat driver
>    drm/rockchip: analogix_dp: correct the connector display color format
>      and bpc
>    drm/rockchip: analogix_dp: update the comments about why need to
>      hardcode VOP output mode
>    drm/bridge: analogix_dp: fix no drm hpd event when panel plug in
>
>   .../bindings/display/bridge/analogix_dp.txt        |   1 +
>   .../display/rockchip/analogix_dp-rockchip.txt      |   2 +-
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  19 ++-
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   8 +-
>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |  12 +-
>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h  |   5 +-
>   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 157 ++++++++++++++-------
>   include/drm/bridge/analogix_dp.h                   |  10 ++
>   8 files changed, 152 insertions(+), 62 deletions(-)
>
