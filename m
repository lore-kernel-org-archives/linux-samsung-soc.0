From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v4 0/11] Misc fixup and add RK3399 eDP support to Analogix
 DP driver[Involving remittance information, please pay attention to the
 safety of property]
Date: Thu, 30 Jun 2016 14:31:53 +0800
Message-ID: <5774BCD9.7050700@rock-chips.com>
References: <1467191657-16941-1-git-send-email-ykk@rock-chips.com>
 <CAOw6vbLWJJP=5Erkrz0chTJEyzsF2dfG_naJk2UFG6NO9i20eg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.130]:48724 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751052AbcF3Gc0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 02:32:26 -0400
In-Reply-To: <CAOw6vbLWJJP=5Erkrz0chTJEyzsF2dfG_naJk2UFG6NO9i20eg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <treding@nvidia.com>, Douglas Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Emil Velikov <emil.l.velikov@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org

Sean,

On 06/29/2016 10:01 PM, Sean Paul wrote:
> On Wed, Jun 29, 2016 at 5:14 AM, Yakir Yang <ykk@rock-chips.com> wrot=
e:
>> RK3399 and RK3288 shared the same eDP IP controller, only some light
>> difference with VOP configure and GRF configure.
>>
> The whole set looks good to me. All patches should have my R-b now,
> thanks for the update.

Thanks  :-D

- Yakir

> Sean
>
>
>
>> Also same misc fix to analogix_dp driver:
>> - Hotplug invalid which report by Dan Carpenter
>> - Make panel detect to an optional action
>> - correct the register bit define error in ANALOGIX_DP_PLL_REG_1
>>
>> Changes in v4:
>> - Assigned the GRF setting magic numbers to a #define that correspon=
ds to
>>    a TRM name. (Sean & Heiko)
>> - Pass the chip type to device type directly. (Sean)
>> - Add reviewed flag from Tomasz.
>> - Add reviewed flag from Sean
>> - Remove subdev_type number, and add 'is_rockchip(type)' helper func=
tion (Sean)
>> - Add reviewed flag from Tomasz.
>> - Improved the overly complicated .atomic_check function. (Sean)
>> - Add reviewed flag from Tomasz
>> - Move of_node_put(panel_node) directly below of_drm_find_panel (Sea=
n)
>> - Add reviewed flag from Tomasz
>> - Add reviewed flag from Sean.
>> - Add reviewed flag from Tomasz.
>> - Using mask variable to collect the YUV video format. (Sean)
>> - Add reviewed flag from Tomasz.
>> - Correct the misspell of 'contoller'. (Sean)
>> - Add reviewed flag from Sean.
>> - Add reviewed flag from Tomasz.
>> - Add reviewed flag from Doug.
>> - Add reviewed flag from Tomasz.
>> - Fix compiled error, sorry.
>>    "dp->cgfclk"  -->  'dp->grfclk'
>> - Check the the error code properly, 'EPROBE_DEFER' should be return=
ed,
>>    'ENOENT' should assign a NULL point to grfclk, other errors shoul=
d be
>>    regarded as failed. (Tomasz, Doug, reviewed at Google Gerrit)
>>      [https://chromium-review.googlesource.com/#/c/351821/20/drivers=
/gpu/drm/rockchip/analogix_dp-rockchip.c@249]
>> - Add the document about optional 'grf' clock (Tomasz, Doug, reviewe=
d at Google Gerrit)
>>      [https://chromium-review.googlesource.com/#/c/351821/]
>> - Add reviewed flag from Doug.
>> - Add reviewed flag from Tomasz.
>>
>> Changes in v3:
>> - Write a kerneldoc-style comment explaining the chips data fields (=
Tomasz, reviewed at Google Gerrit)
>>      [https://chromium-review.googlesource.com/#/c/346313/10/drivers=
/gpu/drm/rockchip/analogix_dp-rockchip.c@39]
>> - Drop the '.lcdcsel_mask' number in chips data field (Tomasz, revie=
wed at Google Gerrit)
>>      [https://chromium-review.googlesource.com/#/c/346313/10/drivers=
/gpu/drm/rockchip/analogix_dp-rockchip.c@382]
>> - Add acked flag from Mark.
>> - Add reviewed flag from Tomasz.
>>      [https://chromium-review.googlesource.com/#/c/346315/15]
>> - Add tested flag from Javier
>> - Make this hack code more clear (Tomasz, reviewed at Google Gerrit)
>>    reg =3D ~reg & REF_CLK_MASK;  --->  reg ^=3D REF_CLK_MASK;
>>      [https://chromium-review.googlesource.com/#/c/346852/7/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.c@80]
>> - Add tested flag from Javier
>> - Give the "rk3399-edp" a separate line for clarity in document (Tom=
asz, reviewed at Google Gerrit)
>>      [https://chromium-review.googlesource.com/#/c/346314/10/Documen=
tation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt@5]
>> - Move 'output_type' setting before the return statement (Tomasz, re=
viewed at Google Gerrit)
>>      [https://chromium-review.googlesource.com/#/c/346314/10/drivers=
/gpu/drm/rockchip/analogix_dp-rockchip.c@154]
>> - Add the acked flag from Mark.
>> - Add the acked flag from Mark.
>> - Avoid to change any internal driver state in .mode_valid interface=
=2E (Tomasz, reviewed at Google Gerrit)
>>      [https://chromium-review.googlesource.com/#/c/346318/10/drivers=
/gpu/drm/rockchip/analogix_dp-rockchip.c@113]
>> - Hook the connector's color_formats in .get_modes directly. (Tomasz=
, reviewed at Google Gerrit)
>>      [https://chromium-review.googlesource.com/#/c/346317/15]
>> - Add the acked flag from Mark.
>> - Add the reviewed flag from Tomasz.
>>      [https://chromium-review.googlesource.com/#/c/346853/12]
>> - Add the acked flag from Mark.
>> - Add reviewed flag from St=C3=A9phane.
>>      [https://chromium-review.googlesource.com/#/c/346319/15]
>> - Add tested flag from Javier
>> - Add this patch in v3
>> - Add this patch in v3
>>
>> Yakir Yang (11):
>>    drm/rockchip: analogix_dp: split the lcdc select setting into dev=
ice
>>      data
>>    drm/bridge: analogix_dp: correct the register bit define error in
>>      ANALOGIX_DP_PLL_REG_1
>>    drm/bridge: analogix_dp: some rockchip chips need to flip REF_CLK=
 bit
>>      setting
>>    drm/rockchip: analogix_dp: add rk3399 eDP support
>>    drm/rockchip: analogix_dp: make panel detect to an optional actio=
n
>>    drm/bridge: analogix_dp: passing the connector as an argument in
>>      .get_modes()
>>    drm/rockchip: analogix_dp: correct the connector display color fo=
rmat
>>      and bpc
>>    drm/rockchip: analogix_dp: update the comments about why need to
>>      hardcode VOP output mode
>>    drm/bridge: analogix_dp: fix no drm hpd event when panel plug in
>>    drm/rockchip: analogix_dp: introduce the pclk for grf
>>    dt-bindings: analogix_dp: rockchip: correct the wrong compatible =
name
>>
>>   .../bindings/display/bridge/analogix_dp.txt        |   1 +
>>   .../display/rockchip/analogix_dp-rockchip.txt      |   9 +-
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   2 +-
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   8 +-
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |  12 +-
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h  |   5 +-
>>   drivers/gpu/drm/exynos/exynos_dp.c                 |   4 +-
>>   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 174 +++++++++=
++++++------
>>   include/drm/bridge/analogix_dp.h                   |   9 +-
>>   9 files changed, 160 insertions(+), 64 deletions(-)
>>
>> --
>> 1.9.1
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
