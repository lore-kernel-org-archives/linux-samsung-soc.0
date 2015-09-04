From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v4 03/16] drm: bridge: analogix/dp: split exynos dp driver to bridge dir
Date: Fri, 04 Sep 2015 23:29:30 +0200
Message-ID: <3704589.SqgGPobGdG@phil>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com> <2618155.E00Pak1qvi@phil> <CAL_JsqLvOOF0Wk=E1kz0rWXg0+6ay0=4OTbCpjdGCfL7_qFN8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:50888 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751033AbbIDVis (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Sep 2015 17:38:48 -0400
In-Reply-To: <CAL_JsqLvOOF0Wk=E1kz0rWXg0+6ay0=4OTbCpjdGCfL7_qFN8Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Yakir Yang <ykk@rock-chips.com>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Yao <mark.yao@rock-chips.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Ajay kumar <ajaynumb@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, architt@codeaurora.org, dri-devel <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>"linux-kernel@vger.kernel.org" <l>

Am Freitag, 4. September 2015, 16:06:02 schrieb Rob Herring:
> On Tue, Sep 1, 2015 at 3:46 PM, Heiko Stuebner <heiko@sntech.de> wrote:
> > Am Dienstag, 1. September 2015, 13:49:58 schrieb Yakir Yang:
> >> Split the dp core driver from exynos directory to bridge
> >> directory, and rename the core driver to analogix_dp_*,
> >> leave the platform code to analogix_dp-exynos.
> >> 
> >> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> > 
> > [...]
> > 
> >> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c
> >> b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c similarity index 50%
> >> rename from drivers/gpu/drm/exynos/exynos_dp_core.c
> >> rename to drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> >> index bed0252..7d62f22 100644
> >> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> >> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > 
> > [...]
> > 
> >>       connector->polled = DRM_CONNECTOR_POLL_HPD;
> >>       
> >>       ret = drm_connector_init(dp->drm_dev, connector,
> >> 
> >> -                              &exynos_dp_connector_funcs,
> >> +                              &analogix_dp_connector_funcs,
> >> 
> >>                                DRM_MODE_CONNECTOR_eDP);
> >>       
> >>       if (ret) {
> >>       
> >>               DRM_ERROR("Failed to initialize connector with drm\n");
> >>               return ret;
> >>       
> >>       }
> >> 
> >> -     drm_connector_helper_add(connector,
> >> &exynos_dp_connector_helper_funcs); +    
> >> drm_connector_helper_add(connector,
> >> +                              &analogix_dp_connector_helper_funcs);
> >> 
> >>       drm_connector_register(connector);
> > 
> > this should only run on exynos, as we're doing all our connector
> > registration in the core driver after all components are bound, so I
> > guess something like> 
> > the following is needed:
> >        if (dp->plat_data && dp->plat_data->dev_type == EXYNOS_DP)
> >        
> >                drm_connector_register(connector);
> 
> Yuck!
> 
> Surely there is a better way. From what I've seen of DRM, I have no
> doubt this is needed, but really a better solution is needed. Surely
> there can be a more generic way for the driver to determine if it
> should handle the connector or not. This seems like a common problem
> including one I have seen. What I'm working on has onchip DSI encoder
> -> ADV7533 -> HDMI. The DSI encoder can also have a direct attached
> panel. So I have to check for a bridge in the encoder driver and only
> register the connector for the panel if a bridge is not attached.

I'm also only a part-time drm meddler, so things may be inaccurate.

This conditional is not meant to prevent the registration of the dp connector, 
only delay it for non-exynos drms. The connector registration does publish it 
to userspace, so like i.MX we're doing that for all connectors at the same 
time after all components are bound - to also make x11 happy. Exynos on the 
other hand seems to register its connectors individually and I'm not sure if 
they would be willing to change that.

see d3007dabeff4 ("drm/rockchip: register all connectors after bind") or 
simply rockchip_drm_drv.c line 178.

and e355e7dd607b ("imx-drm: delay publishing sysfs connector entries")


Heiko
