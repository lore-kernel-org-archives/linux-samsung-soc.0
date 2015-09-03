From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v4 10/16] phy: Add driver for rockchip Display Port PHY
Date: Thu, 03 Sep 2015 15:52:48 +0200
Message-ID: <3242714.Wxby7z5YyH@phil>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com> <CAL_JsqJG3wGO3PC2raWvc588rrwF-zHD9+3WwBJxEwntm19k7Q@mail.gmail.com> <55E7BD8C.5070803@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:44513 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754043AbbICNxV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Sep 2015 09:53:21 -0400
In-Reply-To: <55E7BD8C.5070803@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Rob Herring <robherring2@gmail.com>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Yao <mark.yao@rock-chips.com>, Russell King <rmk+kernel@arm.linux.org.uk>, djkurtz@chromium.com, dianders@chromium.com, seanpaul@chromium.com, Ajay kumar <ajaynumb@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, architt@codeaurora.org, dri-devel <dri-devel@lists.free>

Am Donnerstag, 3. September 2015, 11:25:00 schrieb Yakir Yang:
> =E5=9C=A8 09/02/2015 09:27 PM, Rob Herring =E5=86=99=E9=81=93:
> > On Tue, Sep 1, 2015 at 1:04 AM, Yakir Yang <ykk@rock-chips.com> wro=
te:
> >> +- clocks: from common clock binding: handle to dp clock.
> >> +       of memory mapped region.
> >> +- clock-names: from common clock binding:
> >> +       Required elements: "sclk_dp" "sclk_dp_24m"
> >> +
> >> +- rockchip,grf: this soc should set GRF regs, so need get grf her=
e.
> >=20
> > I have no idea what GRF means.
>=20
> GRF is an module of our IC chip, the full name is General Register Fi=
les.
> I would rather to pick some words from our TRM.
>=20
> The general register file will be used to do static set by software, =
which
> is composed of many registers for system control.

The general register files are present on all Rockchip SoCs I've seen s=
o far=20
and really are just an aggregation of registers for settings and status=
=20
indications, ranging from memory stuff, dma-controller settings, usb-ph=
y and=20
settings for a lot of other phys, etc.

The most prevalent description in dt-bindings is currently:

- rockchip,grf: phandle to the syscon managing the "general register fi=
les"


Heiko
