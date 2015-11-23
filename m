From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 0/7] drm/exynos: add pm runtime support
Date: Mon, 23 Nov 2015 09:25:55 -0300
Message-ID: <565305D3.8060006@osg.samsung.com>
References: <1446547629-12521-1-git-send-email-inki.dae@samsung.com>
 <564DE209.8030004@osg.samsung.com> <564DE2DB.6050608@osg.samsung.com>
 <564DEFEC.50802@osg.samsung.com> <564EFD13.7040409@samsung.com>
 <564F0053.6020401@samsung.com> <564F4DF5.2010301@osg.samsung.com>
 <CAAQKjZOSe3TSny07DHf8hstB-bWchS1WusPCnOhKvU5seK4JRA@mail.gmail.com>
 <CAPj87rOBJh417xkomoJkTse6fY8p1o-6VvVyXk91c9ik5atzsw@mail.gmail.com>
 <CAAQKjZNBeW9u6CtuL__mej1QLGV53Ft2A_RxPz8RMuda0wegLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:45626 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750853AbbKWM0M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Nov 2015 07:26:12 -0500
In-Reply-To: <CAAQKjZNBeW9u6CtuL__mej1QLGV53Ft2A_RxPz8RMuda0wegLg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <daeinki@gmail.com>, Daniel Stone <daniel@fooishbar.org>
Cc: Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, DRI mailing list <dri-devel@lists.freedesktop.org>

Hello,

On 11/21/2015 11:59 AM, Inki Dae wrote:
> Hi Daniel,
> 
> 
> 2015-11-21 22:40 GMT+09:00 Daniel Stone <daniel@fooishbar.org>:
>> Hi Inki,
>>
>> On 21 November 2015 at 09:38, Inki Dae <daeinki@gmail.com> wrote:
>>> 2015-11-21 1:44 GMT+09:00 Javier Martinez Canillas <javier@osg.samsung.com>:
>>>> On 11/20/2015 08:13 AM, Inki Dae wrote:
>>>>> The boot log says,
>>>>> [    5.754493] vdd_ldo9: supplied by vdd_2v
>>>>> [    5.765510] of_graph_get_next_endpoint(): no port node found in /dp-controller@145B0000
>>>>>
>>>>
>>>> This message is a red herring for the reported issue, the message is also
>>>> present when the machine boots and the display is brought correctly.
>>>>
>>>>> Seems this error is because exynos5800-peach-pit.dts file doesn't have 'ports' node in dp node.
>>>>>
>>>>> Below is dp node description of exynos5420-peach-pit.dts file.
>>>>> &dp {
>>>>>       status = "okay";
>>>>>       pinctrl-names = "default";
>>>>>       pinctrl-0 = <&dp_hpd_gpio>;
>>>>>       samsung,color-space = <0>;
>>>>>       samsung,dynamic-range = <0>;
>>>>>       samsung,ycbcr-coeff = <0>;
>>>>>       samsung,color-depth = <1>;
>>>>>       samsung,link-rate = <0x06>;
>>>>>       samsung,lane-count = <2>;
>>>>>       samsung,hpd-gpio = <&gpx2 6 GPIO_ACTIVE_HIGH>;
>>>>>
>>>>>       ports {
>>>>>               port@0 {
>>>>>                       dp_out: endpoint {
>>>>>                               remote-endpoint = <&bridge_in>;
>>>>>                       };
>>>>>               };
>>>>>       };
>>>>> };
>>>>>
>>>>> And below is for exynos5800-peash-pit.dts,
>>>>> &dp {
>>>>>       status = "okay";
>>>>>       pinctrl-names = "default";
>>>>>       pinctrl-0 = <&dp_hpd_gpio>;
>>>>>       samsung,color-space = <0>;
>>>>>       samsung,dynamic-range = <0>;
>>>>>       samsung,ycbcr-coeff = <0>;
>>>>>       samsung,color-depth = <1>;
>>>>>       samsung,link-rate = <0x0a>;
>>>>>       samsung,lane-count = <2>;
>>>>>       samsung,hpd-gpio = <&gpx2 6 GPIO_ACTIVE_HIGH>;
>>>>>       panel = <&panel>;
>>>>> };
>>>>>
>>>>
>>>> The difference is because the Exynos5420 Peach Pit Display Port is not
>>>> attached directly to the display panel, there is an eDP/LVDS bridge chip
>>>> in the middle (PS8622) while the Exynos5800 Peach Pi doesn't have that.
>>>>
>>>> The Exynos DP driver lookups for either a panel phandle or an OF graph
>>>> endpoint that points to a bridge chip and the bridge enpoint has a port
>>>> that points to the panel.
>>>>
>>>> So the DT is correct but of_graph_get_next_endpoint() always prints an
>>>
>>> Then, the DT is really incorrect. As you mentioned, if the Exynos5800 Peach PI
>>> board doesn't use eDP, then the dp node __should be removed__ from
>>> exynos5800-peach-pit.dts.
>>>
>>> From a common-sense standpoint, there is no any reason to build
>>> and probe dp driver if the board doesn't use dp hardware.
>>
>> I agree with what you say, but unfortunately you've slightly misread
>> what Javier has said. :) exynos5420-peach-pit has an LVDS panel, with
>> the eDP -> LVDS bridge in between (ps8622). exynos5800-peach-pi (from
>> which I am writing this) has an eDP panel directly connected. The DT

Thanks a lot Daniel for clarifying my comments to Inki :)

>> describes both the eDP connector from FIMD and the eDP panel, except
>> that there is no connection between the DT nodes.

There *is* a connection between the FIMD eDP connector and the eDP panel
nodes but these are connected using a phandle while the connection for
the FIMD eDP connector and the eDP/LVDS bridge is using the OF graph DT
bindings (Documentation/devicetree/bindings/graph.txt).

And also the connection between the eDP/LVDS bridge and the LVDS panel
is using an OF graph node, so what I meant is that it would be much more
consistent if both the eDP -> panel and eDP -> eDP/LVDS bridge -> panel
connections used the OF graph DT bindings.

>
> Right. I misread what Javier said. :)
>
>>
>>>> error if the port so OF graph endpoints it seems can't be optional as
>>>> used in this driver. Maybe that message should be change to debug then?
>>>>
>>>> Another option is to extend the DP driver DT binding to be more generic
>>>> supporting having a port to a panel besides a bridge, so we could have
>>>> something like this for Exynos5800 Peach and be consistent in both cases:
>>>
>>> It's really not good. This would make it more complex. The best
>>> solution is just to
>>> remove the dt node from the device tree file.
>>
>> Given the above, not really. Javier's patch seems correct to me - as
>> you can see, there is a panel node, and that is the panel that's
>> really connected.
> 
> Indeed. Javier's patch will correct it.
>

Just to be clear, my patch is not correct since the Exynos DP driver and
its DT binding does not support to connect an FIMD eDP connector to an
eDP panel directly using OF graph ports / endpoints (only a phandle). But
is an example of how the DT will look like if we extend to support that.

IIRC at the beginning only eDP -> panel was supported and the phandle
was used and later when the eDP -> eDP/LVDS bridge -> LVDS panel use
case was needed, then a bridge phandle was added but Ajay was asked to
use OF graph instead a phandle and we ended with different approaches
to connect components depending if a bridge is used or not.

> Thanks,
> Inki Dae
> 
>>
>>>> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
>>>> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>>>> @@ -122,6 +122,12 @@
>>>>                 compatible = "auo,b133htn01";
>>>>                 power-supply = <&tps65090_fet6>;
>>>>                 backlight = <&backlight>;
>>>> +
>>>> +               port {
>>>> +                       panel_in: endpoint {
>>>> +                               remote-endpoint = <&dp_out>;
>>>> +                       };
>>>> +               };
>>>>         };
>>>>
>>>>         mmc1_pwrseq: mmc1_pwrseq {
>>>> @@ -148,7 +154,14 @@
>>>>         samsung,link-rate = <0x0a>;
>>>>         samsung,lane-count = <2>;
>>>>         samsung,hpd-gpio = <&gpx2 6 GPIO_ACTIVE_HIGH>;
>>>> -       panel = <&panel>;
>>>> +
>>>> +       ports {
>>>> +               port@0 {
>>>> +                       dp_out: endpoint {
>>>> +                               remote-endpoint = <&panel_in>;
>>>> +                       };
>>>> +               };
>>>> +       };
>>>>  };
>>
>> Cheers,
>> Daniel
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
