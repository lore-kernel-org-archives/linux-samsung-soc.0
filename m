From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v14.1 01/17] drm: bridge: analogix/dp: split exynos dp
 driver to bridge directory
Date: Wed, 8 Jun 2016 10:19:04 -0400
Message-ID: <ddbe174b-c3f8-be97-1b3f-dcdcf45ffc7f@osg.samsung.com>
References: <1455534485-1154-1-git-send-email-ykk@rock-chips.com>
 <1455534576-1486-1-git-send-email-ykk@rock-chips.com>
 <1811552.qvsCm7GUs1@diego>
 <417ed48e-74e1-f747-34b9-0d1031a3d862@osg.samsung.com>
 <575774C0.4000900@rock-chips.com> <20160608084419.602f02d2@arm.com>
 <5757F917.2030506@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:55112 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1161761AbcFHOTZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jun 2016 10:19:25 -0400
In-Reply-To: <5757F917.2030506@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>, Marc Zyngier <marc.zyngier@arm.com>
Cc: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Yao <mark.yao@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, Andy Yan <andy.yan@rock-chips.com>, dri-d

On 06/08/2016 06:53 AM, Yakir Yang wrote:
> Marc, Javier
>=20
> On 06/08/2016 03:44 PM, Marc Zyngier wrote:
>> On Wed, 8 Jun 2016 09:28:32 +0800
>> Yakir Yang <ykk@rock-chips.com> wrote:
>>
>>> Hi Javier,
>>>
>>> On 06/08/2016 01:06 AM, Javier Martinez Canillas wrote:
>>>> Hello Yakir,
>>>>
>>>> On 03/17/2016 05:47 PM, Heiko St=FCbner wrote:
>>>>> Split the dp core driver from exynos directory to bridge director=
y,
>>>>> and rename the core driver to analogix_dp_*, rename the platform
>>>>> code to exynos_dp.
>>>>>
>>>>> Beside the new analogix_dp driver would export six hooks.
>>>>> "analogix_dp_bind()" and "analogix_dp_unbind()"
>>>>> "analogix_dp_suspned()" and "analogix_dp_resume()"
>>>>> "analogix_dp_detect()" and "analogix_dp_get_modes()"
>>>>>
>>>>> The bind/unbind symbols is used for analogix platform driver to c=
onnect
>>>>> with analogix_dp core driver. And the detect/get_modes is used fo=
r analogix
>>>>> platform driver to init the connector.
>>>>>
>>>>> They reason why connector need register in helper driver is rockc=
hip drm
>>>>> haven't implement the atomic API, but Exynos drm have implement i=
t, so
>>>>> there would need two different connector helper functions, that's=
 why we
>>>>> leave the connector register in helper driver.
>>>>>
>>>>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>>>>> ---
>>>> Marc reported that his Exynos5250 Snow Chromebook fails to boot wi=
th v4.7-rc.
>>>>
>>>> I've done a git bisect and tracked down to this commit. The proble=
m is a NULL
>>>> pointer dereference to connector->dev in drm_mode_create(connector=
->dev) when
>>>> called from exynos_dp_get_modes(). The error log is at [1].
>>>>
>>>> I'm trying to figure out the issue but wanted to mention in case y=
ou have any
>>>> hints about what could be the cause. AFAICT the problem is related=
 to the fact
>>>> that drm_connector_init() is called in analogix_dp_bridge_attach()=
 and the
>>>> connector passed as argument is the one in struct analogix_dp_devi=
ce *dp, but
>>>> later exynos_dp_get_modes() calls drm_mode_create() passing the co=
nnector in
>>>> struct exynos_dp_device *dp, which has not been previously initial=
ized.
>>> Agree, this should be the problem, exynos_dp->connector haven't bee=
n
>>> initialized, driver should make exynos_dp->dp to a connector point,=
 and
>>> record the passing connector in exynos_dp_bridge_attach(), that sho=
uld
>>> fix this problem.
>>>
>>>
>>> Thanks,
>>> - Yakir
>>>
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c
>>> b/drivers/gpu/drm/exynos/exynos_dp.c
>>> index 468498e..4c1fb3f 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_dp.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
>>> @@ -34,7 +34,7 @@
>>>
>>>    struct exynos_dp_device {
>>>           struct drm_encoder         encoder;
>>> -       struct drm_connector       connector;
>>> +       struct drm_connector       *connector;
>>>           struct drm_bridge          *ptn_bridge;
>>>           struct drm_device          *drm_dev;
>>>           struct device              *dev;
>>> @@ -70,7 +70,7 @@ static int exynos_dp_poweroff(struct
>>> analogix_dp_plat_data *plat_data)
>>>    static int exynos_dp_get_modes(struct analogix_dp_plat_data *pla=
t_data)
>>>    {
>>>           struct exynos_dp_device *dp =3D to_dp(plat_data);
>>> -       struct drm_connector *connector =3D &dp->connector;
>>> +       struct drm_connector *connector =3D dp->connector;
>>>           struct drm_display_mode *mode;
>>>           int num_modes =3D 0;
>>>
>>> @@ -103,6 +103,7 @@ static int exynos_dp_bridge_attach(struct
>>> analogix_dp_plat_data *plat_data,
>>>           int ret;
>>>
>>>           drm_connector_register(connector);
>>> +       dp->connector =3D connector;
>>>
>>>           /* Pre-empt DP connector creation if there's a bridge */
>>>           if (dp->ptn_bridge) {
>>>
>> I've just tested this change, and in combination with Javier's DT pa=
tch,
>> my Snow is back to its useful state (I'm writing this email from tha=
t
>> very Chromebook).
>>

Great. I also tested and the Snow booted but I don't have physical acce=
ss
to check if the display was brought correctly, So thanks a lot for test=
ing.

>> Once you make this a proper patch, please add my:
>>
>> Tested-by: Marc Zyngier <marc.zyngier@arm.com>
>=20
> I guess Javier should be the best one to create this patch, if he hav=
e no time, i would do it for him. thanks for your report ;)
>

Done.

> - Yakir
>=20
>> to it.
>>
>> Thanks a lot to you and Javier for tracking this down!
>>

Thanks to you for reporting all the issues!

Best regards,
--=20
Javier Martinez Canillas
Open Source Group
Samsung Research America
