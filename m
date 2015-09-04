From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v4 14/16] drm: bridge: analogix/dp: try force hpd after
 plug in lookup failed
Date: Fri, 4 Sep 2015 11:20:03 +0100
Message-ID: <20150904102003.GE21084@n2100.arm.linux.org.uk>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1441088079-25809-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqJDALnjVaVoEqGGsSLeE31m3MKOfbSoZ3M+g+zPZR2MFg@mail.gmail.com>
 <55E7CC43.7040608@rock-chips.com>
 <20150903090421.GC3784@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:49816 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750902AbbIDKUi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Sep 2015 06:20:38 -0400
Content-Disposition: inline
In-Reply-To: <20150903090421.GC3784@ulmo.nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>
Cc: Yakir Yang <ykk@rock-chips.com>, Rob Herring <robherring2@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Yao <mark.yao@rock-chips.com>, djkurtz@chromium.com, dianders@chromium.com, seanpaul@chromium.com, Ajay kumar <ajaynumb@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, architt@codeaurora.org, dri-devel <dri-devel@lists.freedesktop.org>

On Thu, Sep 03, 2015 at 11:04:40AM +0200, Thierry Reding wrote:
> Conversely, if the panel isn't capable of generating an HPD signal, then
> I don't think it would be appropriate to make it a DT property. It would
> be better to hard-code it in the driver, lest someone forget to set the
> property in DT and get stuck with a device that isn't operational.

There is another way to deal with this: DRM supports the idea of connector
forcing - where you can force the connector to think that it's connected
or disconnected.

One of the problems is that not many ARM DRM drivers implement it - maybe
it should be a requirement for code to be accepted? :)

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
