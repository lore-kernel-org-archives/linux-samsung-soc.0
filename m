From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v4 03/16] drm: bridge: analogix/dp: split exynos dp driver
 to bridge dir
Date: Mon, 07 Sep 2015 10:27:25 +0800
Message-ID: <55ECF60D.4060208@rock-chips.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com> <1441086598-24995-1-git-send-email-ykk@rock-chips.com> <55E79B41.6010301@samsung.com> <55E7DAE1.6070308@rock-chips.com> <55E8E8BE.8010300@samsung.com> <55EBF024.3070304@rock-chips.com> <55ECD8CB.7060408@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55ECD8CB.7060408-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, djkurtz-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, dianders-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, seanpaul-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

=E5=9C=A8 09/07/2015 08:22 AM, Krzysztof Kozlowski =E5=86=99=E9=81=93:
> On 06.09.2015 16:49, Yakir Yang wrote:
>> Hi Krzysztof,
>>
>> =E5=9C=A8 09/04/2015 08:41 AM, Krzysztof Kozlowski =E5=86=99=E9=81=93=
:
>>> On 03.09.2015 14:30, Yakir Yang wrote:
>>>> Hi Krzysztof,
>>>>
>>>> =E5=9C=A8 09/03/2015 08:58 AM, Krzysztof Kozlowski =E5=86=99=E9=81=
=93:
>>>>> On 01.09.2015 14:49, Yakir Yang wrote:
>>>>>> Split the dp core driver from exynos directory to bridge
>>>>>> directory, and rename the core driver to analogix_dp_*,
>>>>>> leave the platform code to analogix_dp-exynos.
>>>>>>
>>>>>> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>>>>> ---
>>>>>> Changes in v4:
>>>>>> - Take Rob suggest, update "analogix,hpd-gpios" to "hpd-gpios" D=
T
>>>>>> propery.
>>>>>> - Take Jingoo suggest, rename "analogix_dp-exynos.c" file name t=
o
>>>>>> "exynos_dp.c"
>>>>>> - Take Archit suggest, create a separate folder for analogix cod=
e in
>>>>>> bridge/
>>>>>>
>>>>>> Changes in v3:
>>>>>> - Take Thierry Reding suggest, move exynos's video_timing code
>>>>>>      to analogix_dp-exynos platform driver, add get_modes method
>>>>>>      to struct analogix_dp_plat_data.
>>>>>> - Take Heiko suggest, rename some "samsung*" dts propery to
>>>>>> "analogix*".
>>>>>>
>>>>>> Changes in v2:
>>>>>> - Take Jingoo Han suggest, remove new copyright
>>>>>> - Fix compiled failed dut to analogix_dp_device misspell
>> [.....]
>>
>>>>>> -static int exynos_dp_bridge_attach(struct drm_bridge *bridge)
>>>>>> +static int analogix_dp_bridge_attach(struct drm_bridge *bridge)
>>>>>>     {
>>>>>> -    struct exynos_dp_device *dp =3D bridge->driver_private;
>>>>>> -    struct drm_encoder *encoder =3D &dp->encoder;
>>>>>> +    struct analogix_dp_device *dp =3D bridge->driver_private;
>>>>>> +    struct drm_encoder *encoder =3D dp->encoder;
>>>>>>         struct drm_connector *connector =3D &dp->connector;
>>>>>>         int ret;
>>>>>>     -    /* Pre-empt DP connector creation if there's a bridge *=
/
>>>>>> -    if (dp->ptn_bridge) {
>>>>>> -        ret =3D exynos_drm_attach_lcd_bridge(dp, encoder);
>>>>>> -        if (!ret)
>>>>>> -            return 0;
>>>>>> +    if (!bridge->encoder) {
>>>>>> +        DRM_ERROR("Parent encoder object not found");
>>>>>> +        return -ENODEV;
>>>>>>         }
>>>>>>     +    encoder->bridge =3D bridge;
>>>>>> +
>>>>>>         connector->polled =3D DRM_CONNECTOR_POLL_HPD;
>>>>>>           ret =3D drm_connector_init(dp->drm_dev, connector,
>>>>>> -                 &exynos_dp_connector_funcs,
>>>>>> +                 &analogix_dp_connector_funcs,
>>>>>>                      DRM_MODE_CONNECTOR_eDP);
>>>>>>         if (ret) {
>>>>>>             DRM_ERROR("Failed to initialize connector with drm\n=
");
>>>>>>             return ret;
>>>>>>         }
>>>>>>     -    drm_connector_helper_add(connector,
>>>>>> &exynos_dp_connector_helper_funcs);
>>>>>> +    drm_connector_helper_add(connector,
>>>>>> +                 &analogix_dp_connector_helper_funcs);
>>>>>>         drm_connector_register(connector);
>>>>>>         drm_mode_connector_attach_encoder(connector, encoder);
>>>>>>     -    if (dp->panel)
>>>>>> -        ret =3D drm_panel_attach(dp->panel, &dp->connector);
>>>>>> +    if (dp->plat_data && dp->plat_data->panel) {
>>>>>> +        ret =3D drm_panel_attach(dp->plat_data->panel, &dp->con=
nector);
>>>>>> +        if (ret) {
>>>>>> +            DRM_ERROR("Failed to attach panel\n");
>>>>>> +            return ret;
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    /*
>>>>>> +     * This should be the end of attach function, caused
>>>>>> +     * we should ensure dp bridge could attach first.
>>>>>> +     */
>>>>>> +     if (dp->plat_data && dp->plat_data->attach) {
>>>>>> +         ret =3D dp->plat_data->attach(dp->plat_data, bridge);
>>>>>> +         if (ret) {
>>>>>> +             DRM_ERROR("Failed at platform attch func\n");
>>>>> Two new error paths appeared here and above. Don't you have to
>>>>> cleanup something? I don't know, just wondering...
>>>> Hmm... I think both panel & platform_attch need ERROR remind when
>>>> it failed. But if it still need clean, I though it should clean th=
e
>>>> platform attch
>>>> error,
>>>> this is not relate to DRM directly, just analogix driver logic, so
>>>> code would like,
>>>>
>>>> -    if (dp->panel)
>>>> -        ret =3D drm_panel_attach(dp->panel, &dp->connector);
>>>> +    if (dp->plat_data && dp->plat_data->panel) {
>>>> +        ret =3D drm_panel_attach(dp->plat_data->panel, &dp->conne=
ctor);
>>>> +        if (ret) {
>>>> +            DRM_ERROR("Failed to attach panel\n");
>>>> +            return ret;
>>>> +        }
>>>> +    }
>>>>
>>>> +    /*
>>>> +     * This should be the end of attach function, caused
>>>> +     * we should ensure dp bridge could attach first.
>>>> +     */
>>>> +     if (dp->plat_data && dp->plat_data->attach) {
>>>> +         ret =3D dp->plat_data->attach(dp->plat_data, bridge);
>>>>
>>>>             return ret;
>>> I am lost... the code looks the same. What did you change?
>> I just remove the DRM_ERROR after dp->plat_data->attach(),
>> maybe I should paste the change that rebase on this patch,
>> here are they,
>>
>>      /*
>>       * This should be the end of attach function, caused
>>       * we should ensure dp bridge could attach first.
>>       */
>> -     if (dp->plat_data && dp->plat_data->attach) {
>> +     if (dp->plat_data && dp->plat_data->attach)
>>             ret =3D dp->plat_data->attach(dp->plat_data, bridge);
>> -          if (ret) {
>> -              DRM_ERROR("Failed at platform attch func\n");
>> -              return ret;
>> -          }
>> -      }
>>
>> -    return 0;
>> +   return ret;
>>
>>
>> If this haven't meet your comment, I maybe start to think that
>> your comment  "Two new error paths appeared here and above"
>> indicated that those two function is the same.
>>      "dp->plat_data->attach(dp->plat_data, bridge); "
>>      "drm_panel_attach(dp->plat_data->panel, &dp->connector); "
> I wasn't talking about error message but rather about possible need o=
f
> clean up in error path. Previously there was only drm_panel_attach().
> Now you have two of them (drm_panel_attach() and
> dp->plat_data->attach()). If the second fails don't you have to clean=
 up
> before exit? I don't know, just asking.

Oh... Sorry about missing your words. Yes,=20
drm_panel_detach(dp->plat_data->panel)
was missed in this error path.

Thanks,
- Yakir

>
> Best regards,
> Krzysztof
>
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
