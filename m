From: Inki Dae <daeinki@gmail.com>
Subject: Re: [PATCH v2 0/7] drm/exynos: add pm runtime support
Date: Thu, 26 Nov 2015 00:52:31 +0900
Message-ID: <CAAQKjZOqvNW96Vxou4c8VaVYfftnN-yC9MSci6QPebVZaNCXhA@mail.gmail.com>
References: <1446547629-12521-1-git-send-email-inki.dae@samsung.com>
 <564DE209.8030004@osg.samsung.com> <564DE2DB.6050608@osg.samsung.com>
 <564DEFEC.50802@osg.samsung.com> <564EFD13.7040409@samsung.com>
 <564F0053.6020401@samsung.com> <564F4DF5.2010301@osg.samsung.com>
 <CAAQKjZOSe3TSny07DHf8hstB-bWchS1WusPCnOhKvU5seK4JRA@mail.gmail.com>
 <CAPj87rOBJh417xkomoJkTse6fY8p1o-6VvVyXk91c9ik5atzsw@mail.gmail.com>
 <CAAQKjZNBeW9u6CtuL__mej1QLGV53Ft2A_RxPz8RMuda0wegLg@mail.gmail.com>
 <565305D3.8060006@osg.samsung.com> <CAAQKjZPj54G53aXz0aOKU8Jvv8bWPGXFgM+2w7r=9QU-1ozhNg@mail.gmail.com>
 <56535D0F.4050303@osg.samsung.com> <5653CB45.4060101@samsung.com> <565463CF.6060907@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f173.google.com ([209.85.160.173]:34634 "EHLO
	mail-yk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751704AbbKYPxL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Nov 2015 10:53:11 -0500
Received: by ykfs79 with SMTP id s79so60524022ykf.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2015 07:53:11 -0800 (PST)
In-Reply-To: <565463CF.6060907@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tyler Baker <tyler.baker@linaro.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Kevin Hilman <khilman@linaro.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Javier,

2015-11-24 22:19 GMT+09:00 Javier Martinez Canillas <javier@osg.samsung=
=2Ecom>:
> Hello Inki,
>
> On 11/23/2015 11:28 PM, Inki Dae wrote:
>> Hi Javier,
>>
>> 2015=EB=85=84 11=EC=9B=94 24=EC=9D=BC 03:38=EC=97=90 Javier Martinez=
 Canillas =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>>> Hello Inki,
>>>
>>> On 11/23/2015 01:47 PM, Inki Dae wrote:
>>>> 2015-11-23 21:25 GMT+09:00 Javier Martinez Canillas <javier@osg.sa=
msung.com>:
>>>>> Hello,
>>>>>
>>>>> On 11/21/2015 11:59 AM, Inki Dae wrote:
>>>>>> Hi Daniel,
>>>>>>
>>>>>>
>>>>>> 2015-11-21 22:40 GMT+09:00 Daniel Stone <daniel@fooishbar.org>:
>>>>>>> Hi Inki,
>>>>>>>
>>>>>>> On 21 November 2015 at 09:38, Inki Dae <daeinki@gmail.com> wrot=
e:
>>>>>>>> 2015-11-21 1:44 GMT+09:00 Javier Martinez Canillas <javier@osg=
=2Esamsung.com>:
>>>>>>>>> On 11/20/2015 08:13 AM, Inki Dae wrote:
>>>>>>>>>> The boot log says,
>>>>>>>>>> [    5.754493] vdd_ldo9: supplied by vdd_2v
>>>>>>>>>> [    5.765510] of_graph_get_next_endpoint(): no port node fo=
und in /dp-controller@145B0000
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> This message is a red herring for the reported issue, the mes=
sage is also
>>>>>>>>> present when the machine boots and the display is brought cor=
rectly.
>>>>>>>>>
>>>>>>>>>> Seems this error is because exynos5800-peach-pit.dts file do=
esn't have 'ports' node in dp node.
>>>>>>>>>>
>>>>>>>>>> Below is dp node description of exynos5420-peach-pit.dts fil=
e.
>>>>>>>>>> &dp {
>>>>>>>>>>       status =3D "okay";
>>>>>>>>>>       pinctrl-names =3D "default";
>>>>>>>>>>       pinctrl-0 =3D <&dp_hpd_gpio>;
>>>>>>>>>>       samsung,color-space =3D <0>;
>>>>>>>>>>       samsung,dynamic-range =3D <0>;
>>>>>>>>>>       samsung,ycbcr-coeff =3D <0>;
>>>>>>>>>>       samsung,color-depth =3D <1>;
>>>>>>>>>>       samsung,link-rate =3D <0x06>;
>>>>>>>>>>       samsung,lane-count =3D <2>;
>>>>>>>>>>       samsung,hpd-gpio =3D <&gpx2 6 GPIO_ACTIVE_HIGH>;
>>>>>>>>>>
>>>>>>>>>>       ports {
>>>>>>>>>>               port@0 {
>>>>>>>>>>                       dp_out: endpoint {
>>>>>>>>>>                               remote-endpoint =3D <&bridge_i=
n>;
>>>>>>>>>>                       };
>>>>>>>>>>               };
>>>>>>>>>>       };
>>>>>>>>>> };
>>>>>>>>>>
>>>>>>>>>> And below is for exynos5800-peash-pit.dts,
>>>>>>>>>> &dp {
>>>>>>>>>>       status =3D "okay";
>>>>>>>>>>       pinctrl-names =3D "default";
>>>>>>>>>>       pinctrl-0 =3D <&dp_hpd_gpio>;
>>>>>>>>>>       samsung,color-space =3D <0>;
>>>>>>>>>>       samsung,dynamic-range =3D <0>;
>>>>>>>>>>       samsung,ycbcr-coeff =3D <0>;
>>>>>>>>>>       samsung,color-depth =3D <1>;
>>>>>>>>>>       samsung,link-rate =3D <0x0a>;
>>>>>>>>>>       samsung,lane-count =3D <2>;
>>>>>>>>>>       samsung,hpd-gpio =3D <&gpx2 6 GPIO_ACTIVE_HIGH>;
>>>>>>>>>>       panel =3D <&panel>;
>>>>>>>>>> };
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> The difference is because the Exynos5420 Peach Pit Display Po=
rt is not
>>>>>>>>> attached directly to the display panel, there is an eDP/LVDS =
bridge chip
>>>>>>>>> in the middle (PS8622) while the Exynos5800 Peach Pi doesn't =
have that.
>>>>>>>>>
>>>>>>>>> The Exynos DP driver lookups for either a panel phandle or an=
 OF graph
>>>>>>>>> endpoint that points to a bridge chip and the bridge enpoint =
has a port
>>>>>>>>> that points to the panel.
>>>>>>>>>
>>>>>>>>> So the DT is correct but of_graph_get_next_endpoint() always =
prints an
>>>>>>>>
>>>>>>>> Then, the DT is really incorrect. As you mentioned, if the Exy=
nos5800 Peach PI
>>>>>>>> board doesn't use eDP, then the dp node __should be removed__ =
from
>>>>>>>> exynos5800-peach-pit.dts.
>>>>>>>>
>>>>>>>> From a common-sense standpoint, there is no any reason to buil=
d
>>>>>>>> and probe dp driver if the board doesn't use dp hardware.
>>>>>>>
>>>>>>> I agree with what you say, but unfortunately you've slightly mi=
sread
>>>>>>> what Javier has said. :) exynos5420-peach-pit has an LVDS panel=
, with
>>>>>>> the eDP -> LVDS bridge in between (ps8622). exynos5800-peach-pi=
 (from
>>>>>>> which I am writing this) has an eDP panel directly connected. T=
he DT
>>>>>
>>>>> Thanks a lot Daniel for clarifying my comments to Inki :)
>>>>>
>>>>>>> describes both the eDP connector from FIMD and the eDP panel, e=
xcept
>>>>>>> that there is no connection between the DT nodes.
>>>>>
>>>>> There *is* a connection between the FIMD eDP connector and the eD=
P panel
>>>>> nodes but these are connected using a phandle while the connectio=
n for
>>>>> the FIMD eDP connector and the eDP/LVDS bridge is using the OF gr=
aph DT
>>>>> bindings (Documentation/devicetree/bindings/graph.txt).
>>>>>
>>>>> And also the connection between the eDP/LVDS bridge and the LVDS =
panel
>>>>> is using an OF graph node, so what I meant is that it would be mu=
ch more
>>>>> consistent if both the eDP -> panel and eDP -> eDP/LVDS bridge ->=
 panel
>>>>> connections used the OF graph DT bindings.
>>>>>
>>>>>>
>>>>>> Right. I misread what Javier said. :)
>>>>>>
>>>>>>>
>>>>>>>>> error if the port so OF graph endpoints it seems can't be opt=
ional as
>>>>>>>>> used in this driver. Maybe that message should be change to d=
ebug then?
>>>>>>>>>
>>>>>>>>> Another option is to extend the DP driver DT binding to be mo=
re generic
>>>>>>>>> supporting having a port to a panel besides a bridge, so we c=
ould have
>>>>>>>>> something like this for Exynos5800 Peach and be consistent in=
 both cases:
>>>>>>>>
>>>>>>>> It's really not good. This would make it more complex. The bes=
t
>>>>>>>> solution is just to
>>>>>>>> remove the dt node from the device tree file.
>>>>>>>
>>>>>>> Given the above, not really. Javier's patch seems correct to me=
 - as
>>>>>>> you can see, there is a panel node, and that is the panel that'=
s
>>>>>>> really connected.
>>>>>>
>>>>>> Indeed. Javier's patch will correct it.
>>>>>>
>>>>>
>>>>> Just to be clear, my patch is not correct since the Exynos DP dri=
ver and
>>>>> its DT binding does not support to connect an FIMD eDP connector =
to an
>>>>> eDP panel directly using OF graph ports / endpoints (only a phand=
le). But
>>>>> is an example of how the DT will look like if we extend to suppor=
t that.
>>>>
>>>> Yes, you added just a port node for the panel device and removed a=
 panel
>>>> property from the device tree file so now dp driver cannot get a d=
evice node
>>>> object of panel node because now dp driver isn't considered for it=
 yet.
>>>>
>>>> I think there are two ways to correct it. One is,
>>>> 1. Add a port node for the panel device to the device tree file.
>>>> 2. Add of_graph dt bindings support for getting the panel node to =
dp driver
>>>>    and remove existing of_parse_phandle function call for getting =
a device
>>>>    node object for the panel device.
>>>>
>>>
>>> Exactly.
>>>
>>>> Other is,
>>>> 1. Revive a panel property and remove the port node you added.
>>>>
>>>
>>> Yes, this is the current code that works. Is just that is not consi=
stent but
>>> I don't really mind. I just wanted to explain why the DTS was diffe=
rent for
>>> both boards but it seems that I created more confusion than anythin=
g else :)
>>>
>>>> In addition, it seems that existing bridge of_graph dt bindings co=
des of now
>>>> dp driver should be modified like below,
>>>>
>>>> endpoint =3D of_graph_get_next_endpoint(dev->of_node, panel_endpoi=
nt_node);
>>>> if (endpoint) {
>>>>         bridge_node =3D of_graph_get_remote_port_parent(endpoint);
>>>>         if (bridge_node) {
>>>>                 dp->bridge =3D of_drm_find_bridge(bridge_node);
>>>>                 of_node_put(bridge_node);
>>>>                 if (!dp->bridge)
>>>>                         return -EPROBE_DEFER;
>>>>         } else {
>>>>                 DRM_ERROR("has no port node for the bridge deivce"=
);
>>>>                 return -ENXIO;
>>>>         }
>>>> }
>>>>
>>>> If some board has a bridge device then of_graph_get_remote_port_pa=
rent(endpoint)
>>>> shouldn't be NULL.
>>>>
>>>> The former looks more reasonable to me.
>>>>
>>>
>>> I'm not too familiar with the OF graph API but I agree that returni=
ng a
>>> -EPROBE_DEFER when of_graph_get_remote_port_parent() returns NULL s=
eems
>>> like the wrong thing to do.
>>>
>>> Now I don't know if -ENXIO is the right errno code, maybe -EINVAL (=
since
>>> means the DTS is invalid)? or maybe just omit that case as it is om=
mited
>>> if of_graph_get_next_endpoint() fails?
>>>
>>>>>
>>>>> IIRC at the beginning only eDP -> panel was supported and the pha=
ndle
>>>>> was used and later when the eDP -> eDP/LVDS bridge -> LVDS panel =
use
>>>>> case was needed, then a bridge phandle was added but Ajay was ask=
ed to
>>>>> use OF graph instead a phandle and we ended with different approa=
ches
>>>>> to connect components depending if a bridge is used or not.
>>>>
>>>> Well, wouldn't it be enough to remove the panel phandle relevant c=
odes
>>>> from dp driver and add of_graph dt bindings support for the panel =
device
>>>> to the dp driver instead?
>>>>
>>>
>>> The problem is that removing the panel phandle is not an option wit=
hout
>>> breaking DT backward compatibility since now an eDP -> panel lookup=
 by
>>> using a phandle is a DT ABI and old DTBs could be shipped that use =
it.
>>
>> Right. The backward compatibility should be kept.
>> For this, I think we could update the dp driver like below,
>>
>>       panel_node =3D NULL;
>>
>>       /* This is for the backward compatibility. */
>>       panel_node =3D of_parse_phandle(dev->of_node, "panel", 0);
>>       if (panel_node) {
>>               ...
>>       } else {
>>               endpoint =3D of_graph_get_next_endpoint(dev->of_node, =
NULL);
>>               if (endpoint) {
>>                       panel_node =3D of_graph_get_remote_port_parent=
(endpoint);
>>                       if (panel_node) {
>>                               ...
>>                       } else {
>>                               ...
>>                       }
>>               }
>>       }
>>
>>       endpoint =3D of_graph_get_next_endpoint(dev->of_node, panel_no=
de);
>>       ...
>>
>> With the change, we could not only follow the graph concept but also=
 keep the backward compatibility.
>> Javier, do you have other opinion?
>>
>
> Assuming you can make a distinction if the endpoint is a panel or a b=
ridge,
> then yes, I agree with the idea of the patch. Please feel free to cc =
me if
> you post such a patch and I'll gladly test it on my Exynos5800 Peach =
Pi.

Thanks a lot. I will post the patch set soon CCing you. :)

Thanks,
Inki Dae

>
>> Thanks,
>> Inki Dae
>>
>
> Best regards,
> --
> Javier Martinez Canillas
> Open Source Group
> Samsung Research America
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
