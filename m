From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for analogix_dp
Date: Mon, 24 Aug 2015 18:16:39 +0200
Message-ID: <1749941.uaVRIcm7Pc@phil>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com> <20150824125758.GA7557@n2100.arm.linux.org.uk> <CAL_JsqKZYMMzV9Sc2r3K_rnM0FNuyb1TyJEhjGq1Hf7dTiWFKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:46285 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754878AbbHXQRJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Aug 2015 12:17:09 -0400
In-Reply-To: <CAL_JsqKZYMMzV9Sc2r3K_rnM0FNuyb1TyJEhjGq1Hf7dTiWFKQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Yakir Yang <ykk@rock-chips.com>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Sean Paul <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, linux-rockchip@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, David Airlie <airlied@linux.ie>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Doug Anderson <dianders@google.com>, Rob Herring <rob>

Am Montag, 24. August 2015, 09:48:27 schrieb Rob Herring:
> On Mon, Aug 24, 2015 at 7:57 AM, Russell King - ARM Linux
> > When we adopted the graph bindings for iMX DRM, I thought exactly at that
> > time "it would be nice if this could become the standard for binding DRM
> > components together" but I don't have the authority from either the DT
> > perspective or the DRM perspective to mandate that.  Neither does anyone
> > else.  That's the _real_ problem here.
> > 
> > I've seen several DRM bindings go by which don't use the of-graph stuff,
> > which means that they'll never be compatible with generic components
> > which do use the of-graph stuff.
> 
> It goes beyond bindings IMO. The use of the component framework or not
> has been at the whim of driver writers as well. It is either used or
> private APIs are created. I'm using components and my need for it
> boils down to passing the struct drm_device pointer to the encoder.
> Other components like panels and bridges have different ways to attach
> to the DRM driver.

but that is then simply implementation specific. Panels and bridges can very 
well be part of and created from an of_graph description without needing to be 
a (linux-)component - see patch 7.
