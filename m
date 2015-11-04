From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v9 10/17] phy: Add driver for rockchip Display Port PHY
Date: Tue, 3 Nov 2015 17:13:48 -0800
Message-ID: <20151104011348.GL7274@google.com>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com>
 <1446083918-30809-1-git-send-email-ykk@rock-chips.com>
 <20151103043827.GA17261@localhost>
 <563955E6.7000905@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:32885 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755445AbbKDBNw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Nov 2015 20:13:52 -0500
Content-Disposition: inline
In-Reply-To: <563955E6.7000905@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>, djkurtz@chromium.org, dianders@chromium.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, javier@osg.samsung.com, Kukjin Kim <kgene@kernel.org>, robherring2@gmail.com, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Sean Paul <seanpaul@chromi>

Hi Yakir,

On Wed, Nov 04, 2015 at 08:48:38AM +0800, Yakir Yang wrote:
> On 11/03/2015 12:38 PM, Brian Norris wrote:
> >On Thu, Oct 29, 2015 at 09:58:38AM +0800, Yakir Yang wrote:
> >(FYI, I came across this by inspection when comparing Heiko's
> >'somewhat-stable' branch [1] with this series. The former brings up eDP
> >fine on veyron-jaq, whereas this one doesn't yet, even with the above
> >change. Still debugging the issue.)
> 
> Hmm... I'm not sure whether your eDP screen have the hotplug signal, so I

I believe hotplug is hooked up but...

> think you can try to add "analogix,force-hpd" flag into
> rk3288-veyron-jaq.dts
> 
> &edp {
>     analogix,need-force-hpd;
> }

...already tried, just in case. No luck.

> If that changes couldn't fix the problem, guess you may need max the panel
> power up delay time which pointed by Heiko. Like:
> 
> Thanks,
> - Yakir
> 
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 4fa5f69..546a506 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -82,6 +82,13 @@ static int analogix_dp_detect_hpd(struct
> analogix_dp_device *dp)
>          */
>         dev_dbg(dp->dev, "failed to get hpd plug status, try to
> force hpd\n");
> 
> +       /*
> +        * Hotplug signal would indicate the right time to operate
> +        * panel after poweron, but if the hotplug is missing, then
> +        * panel would need wait hundreds of milliseconds at here.
> +        */
> +       mdelay(100);
> +
>         analogix_dp_force_hpd(dp);
> 
>         if (analogix_dp_get_plug_in_status(dp) != 0) {

I'll give that a try. Per Heiko's suggestion, I've already hacked around
with adding delays in the regulator node, but this could give slightly
different behavior. I doubt it'll help, but I'll let you know if it
does.

Regards,
Brian
