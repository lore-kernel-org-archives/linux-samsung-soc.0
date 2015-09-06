From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v4 10/16] phy: Add driver for rockchip Display Port PHY
Date: Sun, 06 Sep 2015 12:09:53 +0800
Message-ID: <55EBBC91.5060708@rock-chips.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com> <CAL_JsqJG3wGO3PC2raWvc588rrwF-zHD9+3WwBJxEwntm19k7Q@mail.gmail.com> <55E7BD8C.5070803@rock-chips.com> <3242714.Wxby7z5YyH@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:45023 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750804AbbIFEKl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 6 Sep 2015 00:10:41 -0400
In-Reply-To: <3242714.Wxby7z5YyH@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robherring2@gmail.com>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Yao <mark.yao@rock-chips.com>, Russell King <rmk+kernel@arm.linux.org.uk>, djkurtz@chromium.com, dianders@chromium.com, seanpaul@chromium.com, Ajay kumar <ajaynumb@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, architt@codeaurora.org, dri-devel <dri-devel@lists.free>

Hi Heiko,

=E5=9C=A8 09/03/2015 09:52 PM, Heiko Stuebner =E5=86=99=E9=81=93:
> Am Donnerstag, 3. September 2015, 11:25:00 schrieb Yakir Yang:
>> =E5=9C=A8 09/02/2015 09:27 PM, Rob Herring =E5=86=99=E9=81=93:
>>> On Tue, Sep 1, 2015 at 1:04 AM, Yakir Yang <ykk@rock-chips.com> wro=
te:
>>>> +- clocks: from common clock binding: handle to dp clock.
>>>> +       of memory mapped region.
>>>> +- clock-names: from common clock binding:
>>>> +       Required elements: "sclk_dp" "sclk_dp_24m"
>>>> +
>>>> +- rockchip,grf: this soc should set GRF regs, so need get grf her=
e.
>>> I have no idea what GRF means.
>> GRF is an module of our IC chip, the full name is General Register F=
iles.
>> I would rather to pick some words from our TRM.
>>
>> The general register file will be used to do static set by software,=
 which
>> is composed of many registers for system control.
> The general register files are present on all Rockchip SoCs I've seen=
 so far
> and really are just an aggregation of registers for settings and stat=
us
> indications, ranging from memory stuff, dma-controller settings, usb-=
phy and
> settings for a lot of other phys, etc.
>
> The most prevalent description in dt-bindings is currently:
>
> - rockchip,grf: phandle to the syscon managing the "general register =
files"

Wow, thanks for your explain, and your "rockchip,grf" DT property
description is better, I would like to copy it :)

Thanks,
- Yakir
>
> Heiko
>
>
>
