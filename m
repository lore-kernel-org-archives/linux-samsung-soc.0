From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v4 14/16] drm: bridge: analogix/dp: try force hpd after
 plug in lookup failed
Date: Sun, 06 Sep 2015 16:20:39 +0800
Message-ID: <55EBF757.20108@rock-chips.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com> <1441088079-25809-1-git-send-email-ykk@rock-chips.com> <CAL_JsqJDALnjVaVoEqGGsSLeE31m3MKOfbSoZ3M+g+zPZR2MFg@mail.gmail.com> <55E7CC43.7040608@rock-chips.com> <CAL_JsqKoyZOAA7yzSATA-Ys8N1q9Edi-3ctPU09UVeV=7sTWTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKoyZOAA7yzSATA-Ys8N1q9Edi-3ctPU09UVeV=7sTWTg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, djkurtz-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, dianders-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, seanpaul-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, Ajay kumar <ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dri-devel <dri-devel-PD4FTy7X32mqWrfYKbYh0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Rob,

=E5=9C=A8 09/05/2015 05:46 AM, Rob Herring =E5=86=99=E9=81=93:
> On Wed, Sep 2, 2015 at 11:27 PM, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrot=
e:
>> Hi Rob,
>>
>> =E5=9C=A8 09/03/2015 04:17 AM, Rob Herring =E5=86=99=E9=81=93:
>>> On Tue, Sep 1, 2015 at 1:14 AM, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wro=
te:
>>>> Some edp screen do not have hpd signal, so we can't just return
>>>> failed when hpd plug in detect failed.
>>> This is a property of the panel (or connector perhaps), so this
>>> property should be located there. At least, it is a common issue an=
d
>>> not specific to this chip. We could have an HDMI connector and fail=
ed
>>> to hook up HPD for example. A connector node is also where hpd-gpio=
s
>>> should be located instead (and are already defined by
>>> ../bindings/video/hdmi-connector.txt). Perhaps we need a eDP connec=
tor
>>> binding, too.
>>
>> Yep, I agree with your front point, it is a property of panel, not s=
pecific
>> to eDP controller, so this code should handle in connector logic.
>>
>> But another question, if we just leave this property to connector,
>> then we would need to parse this property in analogix_dp-rockchip.c,
>> and then make an hook in analogix_dp_core.c driver. This is not nice=
,
>> and if there are some coming platform which alse want to use analogi=
x_dp
>> code and meet this "no-hpd" situation,  then they would need duplica=
te
>> to parse this property and fill the hook in analogix_dp_core.c drive=
r.
>> So it's little bit conflict  :-)
> Ideally, you would be able to just retrieve this quirk from the
> connector or panel. Getting this property from your node vs. the port
> you are attached to should not be much harder. Either the connector
> struct can have this info or there can be a DT function that can walk
> the graph and get it. Just don't open code the graph traversal in you=
r
> driver.
>
>> Beside I can not understand your example very well. Do you mean
>> that there are some HDMI monitor which also do not have HPD
>> signal (just like some eDP panel do not have hpd too), and then
>> the "hpd-gpios" ? Hmm... I don't know how the "hpd-gpios" want
>> to help in this case, would you mind show some sample code  :-D
> I don't know that there is h/w, but it is always possible HPD is not
> hooked up or hooked up incorrectly some how.
>
> If there is no HPD support, then hpd-gpios is not going to help you.
>
> I think there are 3 cases to handle:
> - HPD handled by bridge chip - The bridge driver knows it has this
> capability. No DT properties are needed and no HPD properties on the
> connector node imply the bridge chip should handle HPD functions.
> - HPD handled by GPIO line (or some other block) - Indicated by
> hpd-gpios present
> - No or broken HPD - Indicated by "hpd-force" property.

Oh, I think the first/second case isn't suitable in this case, my panel
"cnm,n116bgeea2" haven't included HPD signal.

>
>>> Are there any eDP panels which don't have EDID and need panel detai=
ls in
>>> DT?
>>
>> Oh, I think you want to collect some info that belong to panel
>> property but no indicate in panel EDID message, so those can
>> be collect in eDP connector binding, is it right ?
> Yes, and as Thierry pointed out we may need to know the exact panel e=
ven.

Yeah, just like I reply to Thierry, this is a panel quirk. And he=20
suggest we should
handle this in panel driver, but I have no idea how to handle this in=20
common panel
driver.   :)

- Yakir

> Rob
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
