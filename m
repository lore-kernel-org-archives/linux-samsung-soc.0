From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v4 0/16] Add Analogix Core Display Port Driver
Date: Mon, 21 Sep 2015 18:27:40 +0800
Message-ID: <55FFDB9C.1030901@rock-chips.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com> <3233920.KG0buE86B2@phil> <55E65BCD.7090804@rock-chips.com> <55FFC3B8.9030108@rock-chips.com> <20150921091537.GA20992@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.130]:37263 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756470AbbIUK2W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Sep 2015 06:28:22 -0400
In-Reply-To: <20150921091537.GA20992@ulmo.nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, s.infradead.org@NULL.NULL, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, architt@codeaurora.org, linux-samsung-soc@vger.kernel.org, seanpaul@chromium.com, djkurtz@chromium.com, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, robherring2@gmail.com, Russell King <rmk+kernel@arm.linux.org.uk>, linux-arm-kernel@list.NULL.NULL, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, joe@perches.com, Rob Herring <robh+dt@kernel.org>, dianders@chromium.com, Mark Yao <mark.yao@rock-chips.com>, Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.ke

Hi Thierry,

Thanks for your suggest :)

On 09/21/2015 05:15 PM, Thierry Reding wrote:
> On Mon, Sep 21, 2015 at 04:45:44PM +0800, Yakir Yang wrote:
>> Hi Heiko,
>>
>> On 09/02/2015 10:15 AM, Yakir Yang wrote:
>>> Hi Heiko,
>>>
>>> =E5=9C=A8 09/02/2015 05:47 AM, Heiko Stuebner =E5=86=99=E9=81=93:
>>>> Hi Yakir,
>>>>
>>>> Am Dienstag, 1. September 2015, 13:46:11 schrieb Yakir Yang:
>>>>>     The Samsung Exynos eDP controller and Rockchip RK3288 eDP
>>>>> controller
>>>>> share the same IP, so a lot of parts can be re-used. I split the =
common
>>>>> code into bridge directory, then rk3288 and exynos only need to k=
eep
>>>>> some platform code. Cause I can't find the exact IP name of exyno=
s dp
>>>>> controller, so I decide to name dp core driver with "analogix" wh=
ich I
>>>>> find in rk3288 eDP TRM ;)
>>>>>
>>>>> Beyond that, there are three light registers setting differents b=
ewteen
>>>>> exynos and rk3288.
>>>>> 1. RK3288 have five special pll resigters which not indicata in e=
xynos
>>>>>     dp controller.
>>>>> 2. The address of DP_PHY_PD(dp phy power manager register) are
>>>>> different
>>>>>     between rk3288 and exynos.
>>>>> 3. Rk3288 and exynos have different setting with AUX_HW_RETRY_CTL=
(dp
>>>>> debug
>>>>>     register).
>>>>>
>>>>> I have verified this series on two kinds of rockchip platform boa=
rd,
>>>>> one
>>>>> is rk3288 sdk board which connect with a 2K display port monitor,=
 the
>>>>> other
>>>>> is google jerry chromebook which connect with a eDP screen
>>>>> "cnm,n116bgeea2",
>>>>> both of them works rightlly.
>>>> it looks like during the rebase something did go wrong and I found=
 some
>>>> issues
>>>> I mentioned in the replies to individual patches.
>>>>
>>>> I did prepare a branch based on mainline [0] with both the old and=
 the
>>>> new edp
>>>> driver - rk3288_veyron_defconfig build both drivers into the image=
=2E
>>>>
>>>> While the old driver still works, I wasn't able to make the new on=
e work
>>>> yet
>>>> ... the drm core does find the connector, but not that anything is
>>>> connected
>>>> to it. I'll try to dig deeper tomorrow, but maybe you'll see anyth=
ing
>>>> interesting before then.
>>> Many thanks for your comment and debug, I would rebase on your
>>> "edp-with-veyron" branch and fix the broken, make sure v6 would
>>> work rightly at least in your side and my side.
>> Just like we talk off line, I guess there are two tricky questions w=
hich
>> make analogix_dp just crash/failed on rockchip platform:
>>
>> -  One is how to reach a agreement with the common way to register
>> connector. There would be a conflict with Exynos & IMX & Rockchip.
>>       On analogix_dp thread, Exynos want to register connector when =
that
>> connector is ready.
>>       On dw_hdmi thread, IMX want to register connector when all com=
ponent is
>> already.
>>       So Exynos & IMX & Rockchip should reach a common way to regist=
er
>> connector to fix this issue.
>>
>> -  The other is atomic API.
>>        The rockchip drm haven't implemented the atomic API, but the =
original
>> exynos_dp have used the atomic API on connector helper function. Tha=
t's why
>> analogix_dp just keep crash on your side.
> There's really no reason not to convert Rockchip to atomic. It will h=
ave
> to happen eventually anyway.

Do agree on this point, and I see Tomasz Figa have done some WIP
works on implementing the atomic_commit, maybe would upstream
in further.(https://chromium-review.googlesource.com/#/c/284560/1)


> That said, there's another option that would allow you to side-step b=
oth
> of the above problems at the same time. If you turn the common code i=
nto
> a helper library that should give you enough flexibility to integrate=
 it
> into all existing users. For example you could leave out the connecto=
r
> registration and let the drivers do that. Similarly since the helpers
> are only hooked up at registration time you could probably find a way=
 to
> share the low-level code but again leave it up to the drivers to glue=
 it
> all together at registration time (drivers could wrap the low-level c=
ode
> with atomic or non-atomic callbacks).

Wow, sounds good, but I'm not sure I understand this rightly. Do you
mean that I could support two kinds of callbacks in analogix_dp_core
driver, and export them out. And move the connector registration code
into the helper driver (like exynos_dp.c), so helper driver could chose=
 to
use the atomic or non-atomic callbacks. like:

-- analogix_dp_core.c=20
--------------------------------------------------------------------
=2E..
struct drm_connector_funcs analogix_dp_connector_atomic_funcs =3D {
         .dpms =3D drm_atomic_helper_connector_dpms,
         .fill_modes =3D drm_helper_probe_single_connector_modes,
         .detect =3D analogix_dp_detect,
         .destroy =3D analogix_dp_connector_destroy,
         .reset =3D drm_atomic_helper_connector_reset,
         .atomic_duplicate_state =3D=20
drm_atomic_helper_connector_duplicate_state,
         .atomic_destroy_state =3D drm_atomic_helper_connector_destroy_=
state,
};
EXPORT_SYMBOL(analogix_dp_connector_atomic_funcs);

struct drm_connector_funcs analogix_dp_connector_funcs =3D {
         .dpms =3D drm_helper_connector_dpms,
         .fill_modes =3D drm_helper_probe_single_connector_modes,
         .detect =3D analogix_dp_detect,
         .destroy =3D analogix_dp_connector_destroy,
};
EXPORT_SYMBOL(analogix_dp_connector_funcs);

struct drm_connector_helper_funcs analogix_dp_connector_helper_funcs =3D=
 {
         .get_modes =3D analogix_dp_get_modes,
         .best_encoder =3D analogix_dp_best_encoder,
};
EXPORT_SYMBOL(analogix_dp_connector_helper_funcs);
=2E..

-- exynos_dp=20
-----------------------------------------------------------------------=
-----
         ret =3D drm_connector_init(dp->drm_dev, connector,
&analogix_dp_connector_atomic_funcs,
                                  DRM_MODE_CONNECTOR_eDP);
         if (ret) {
                 DRM_ERROR("Failed to initialize connector with drm\n")=
;
                 return ret;
         }

         drm_connector_helper_add(connector,=20
&analogix_dp_connector_helper_funcs);
         drm_connector_register(connector);
         drm_mode_connector_attach_encoder(connector, encoder);

-- analogix_dp-rockchip=20
-----------------------------------------------------------------------=
-----
         ret =3D drm_connector_init(dp->drm_dev, connector,
                                  &analogix_dp_connector_funcs,
                                  DRM_MODE_CONNECTOR_eDP);
         if (ret) {
                 DRM_ERROR("Failed to initialize connector with drm\n")=
;
                 return ret;
         }

         drm_connector_helper_add(connector,=20
&analogix_dp_connector_helper_funcs);
         drm_mode_connector_attach_encoder(connector, encoder);


Are those code corresponding to your suggestion.   :)

Thanks
- Yakir

> This option may also have the benefit of loosening the coupling betwe=
en
> DRM drivers and the helper code for this IP, which may be handy in ca=
se
> the drivers diverge again in the future, or ease transitions to new A=
PI.
>
> Thierry
