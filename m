From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 0/14] Add Analogix Core Display Port Driver
Date: Mon, 31 Aug 2015 10:40:38 +0800
Message-ID: <55E3BEA6.50407@rock-chips.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>	<105A0032-83A0-4B75-AE94-258F12451670@gmail.com>	<55D6F6F8.70504@rock-chips.com>	<8384E112-E1F4-4CD3-85BF-A2A25989783F@gmail.com>	<20150821131631.GC22118@ulmo.nvidia.com> <CABgxDoKcsRye43pqzZC=4A=D1+iDj5Bmy9XZjx+K8ekca0=FwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.139]:41079 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752292AbbHaCky (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 30 Aug 2015 22:40:54 -0400
In-Reply-To: <CABgxDoKcsRye43pqzZC=4A=D1+iDj5Bmy9XZjx+K8ekca0=FwQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Romain Perier <romain.perier@gmail.com>, Thierry Reding <treding@nvidia.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, "joe@perches.com" <joe@perches.com>, Russell King <rmk+kernel@arm.linux.org.uk>, "djkurtz@google.com" <djkurtz@google.com>, "dianders@google.com" <dianders@google.com>, "seanpaul@google.com" <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, "ajaynumb@gmail.com" <ajaynumb@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Vincent Palatin <vpalatin@chromium.org>, Mark Yao <mark.yao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel

Hi Romain,

=E5=9C=A8 08/30/2015 08:16 PM, Romain Perier =E5=86=99=E9=81=93:
> Hi,
>
> Could you rebase your serie onto linux-next or 4.2-rc8 ? it does not
> apply here...

Thanks for try to applied, and feel sorry for that failed.

This v3 series was rebased on github.com/torvalds/linux.git, so I shoul=
d
rebase on kernel/next/linux-next.git when I'm preparing v4 series.

Thanks,
- Yakir

> Regards,
> Romain
>
> 2015-08-21 15:16 GMT+02:00 Thierry Reding <treding@nvidia.com>:
>> On Fri, Aug 21, 2015 at 08:24:16PM +0900, Jingoo Han wrote:
>>> On 2015. 8. 21., at PM 7:01, Yakir Yang <ykk@rock-chips.com> wrote:
>>>> Hi Jingoo,
>>>>
>>>>> =E5=9C=A8 2015/8/21 16:20, Jingoo Han =E5=86=99=E9=81=93:
>>>>>> On 2015. 8. 19., at PM 11:48, Yakir Yang <ykk@rock-chips.com> wr=
ote:
>>>>> .....
>>>>>
>>>>>> .../bindings/video/analogix_dp-rockchip.txt        |   83 ++
>>>>>> .../devicetree/bindings/video/exynos_dp.txt        |   51 +-
>>>>>> arch/arm/boot/dts/exynos5250-arndale.dts           |   10 +-
>>>>>> arch/arm/boot/dts/exynos5250-smdk5250.dts          |   10 +-
>>>>>> arch/arm/boot/dts/exynos5250-snow.dts              |   12 +-
>>>>>> arch/arm/boot/dts/exynos5250-spring.dts            |   12 +-
>>>>>> arch/arm/boot/dts/exynos5420-peach-pit.dts         |   12 +-
>>>>>> arch/arm/boot/dts/exynos5420-smdk5420.dts          |   10 +-
>>>>>> arch/arm/boot/dts/exynos5800-peach-pi.dts          |   12 +-
>>>>>> drivers/gpu/drm/bridge/Kconfig                     |    5 +
>>>>>> drivers/gpu/drm/bridge/Makefile                    |    1 +
>>>>>> drivers/gpu/drm/bridge/analogix_dp_core.c          | 1382 ++++++=
+++++++++++++
>>>>>> drivers/gpu/drm/bridge/analogix_dp_core.h          |  286 ++++
>>>>>> drivers/gpu/drm/bridge/analogix_dp_reg.c           | 1294 ++++++=
++++++++++++
>>>>>> .../exynos_dp_reg.h =3D> bridge/analogix_dp_reg.h}   |  270 ++--
>>>>>> drivers/gpu/drm/exynos/Kconfig                     |    5 +-
>>>>>> drivers/gpu/drm/exynos/Makefile                    |    2 +-
>>>>>> drivers/gpu/drm/exynos/analogix_dp-exynos.c        |  347 +++++
>>>>> Would you change this file name to "exynos_dp.c"?
>>>> Sorry, I don't think so  ;(
>>>>
>>>> I think IP_name+Soc_name would be better in this re-use case.
>>> So? Is there the naming rule such as "IP_name+SoC_name"?
>>>
>>>> Beside I see
>>>> there are lots of driver named with this format in kernel, such as=
 dw_hdmi & dw_mmc
>>> Please look at other dw cases.
>>> For example, look at dw_pcie.
>>>
>>> drivers/pci/host/
>>> pcie-designware.c
>>> pci-spear13xx.c
>>> pci-exynos.c
>>>
>>> In this case, pci-spear13xx.c and pci-exynos.c do not use "IP_name+=
SoC_name", even though these are dw IPs.
>>>
>>> Also, naming consistency is more important.
>>> Now, Exynos DRM files are using "exynos_drm_" prefix.
>>>
>>> drivers/gpu/drm/exynos/
>>> exynos_drm_buf.c
>>> exynos_drm_core.c
>>> ....
>>>
>>> However, "analogix_dp-exynos.c" looks very inconsistent.
>>>
>>> If there is no strict naming rule, please use "exynos_dp.c"
>>> or "exynos_drm_dp.c".
>> Exynos DRM maintainers get to pick their filenames, so Yakir, please
>> rename as Jingoo suggested.
>>
>> Even if you didn't the first thing that would go into the Exynos DRM
>> driver tree after this is merged is a rename patch anyway.
>>
>> Thierry
>
>
