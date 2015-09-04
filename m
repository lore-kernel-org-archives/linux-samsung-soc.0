From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v4 14/16] drm: bridge: analogix/dp: try force hpd after
 plug in lookup failed
Date: Fri, 4 Sep 2015 16:46:01 -0500
Message-ID: <CAL_JsqKoyZOAA7yzSATA-Ys8N1q9Edi-3ctPU09UVeV=7sTWTg@mail.gmail.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1441088079-25809-1-git-send-email-ykk@rock-chips.com> <CAL_JsqJDALnjVaVoEqGGsSLeE31m3MKOfbSoZ3M+g+zPZR2MFg@mail.gmail.com>
 <55E7CC43.7040608@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f172.google.com ([209.85.160.172]:36444 "EHLO
	mail-yk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751033AbbIDVqV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Sep 2015 17:46:21 -0400
In-Reply-To: <55E7CC43.7040608@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Yao <mark.yao@rock-chips.com>, Russell King <rmk+kernel@arm.linux.org.uk>, djkurtz@chromium.com, dianders@chromium.com, seanpaul@chromium.com, Ajay kumar <ajaynumb@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, architt@codeaurora.org, dri-devel <dri-devel@lists.freedes>

On Wed, Sep 2, 2015 at 11:27 PM, Yakir Yang <ykk@rock-chips.com> wrote:
> Hi Rob,
>
> =E5=9C=A8 09/03/2015 04:17 AM, Rob Herring =E5=86=99=E9=81=93:
>>
>> On Tue, Sep 1, 2015 at 1:14 AM, Yakir Yang <ykk@rock-chips.com> wrot=
e:
>>>
>>> Some edp screen do not have hpd signal, so we can't just return
>>> failed when hpd plug in detect failed.
>>
>> This is a property of the panel (or connector perhaps), so this
>> property should be located there. At least, it is a common issue and
>> not specific to this chip. We could have an HDMI connector and faile=
d
>> to hook up HPD for example. A connector node is also where hpd-gpios
>> should be located instead (and are already defined by
>> ../bindings/video/hdmi-connector.txt). Perhaps we need a eDP connect=
or
>> binding, too.
>
>
> Yep, I agree with your front point, it is a property of panel, not sp=
ecific
> to eDP controller, so this code should handle in connector logic.
>
> But another question, if we just leave this property to connector,
> then we would need to parse this property in analogix_dp-rockchip.c,
> and then make an hook in analogix_dp_core.c driver. This is not nice,
> and if there are some coming platform which alse want to use analogix=
_dp
> code and meet this "no-hpd" situation,  then they would need duplicat=
e
> to parse this property and fill the hook in analogix_dp_core.c driver=
=2E
> So it's little bit conflict  :-)

Ideally, you would be able to just retrieve this quirk from the
connector or panel. Getting this property from your node vs. the port
you are attached to should not be much harder. Either the connector
struct can have this info or there can be a DT function that can walk
the graph and get it. Just don't open code the graph traversal in your
driver.

> Beside I can not understand your example very well. Do you mean
> that there are some HDMI monitor which also do not have HPD
> signal (just like some eDP panel do not have hpd too), and then
> the "hpd-gpios" ? Hmm... I don't know how the "hpd-gpios" want
> to help in this case, would you mind show some sample code  :-D

I don't know that there is h/w, but it is always possible HPD is not
hooked up or hooked up incorrectly some how.

If there is no HPD support, then hpd-gpios is not going to help you.

I think there are 3 cases to handle:
- HPD handled by bridge chip - The bridge driver knows it has this
capability. No DT properties are needed and no HPD properties on the
connector node imply the bridge chip should handle HPD functions.
- HPD handled by GPIO line (or some other block) - Indicated by
hpd-gpios present
- No or broken HPD - Indicated by "hpd-force" property.

>
>> Are there any eDP panels which don't have EDID and need panel detail=
s in
>> DT?
>
>
> Oh, I think you want to collect some info that belong to panel
> property but no indicate in panel EDID message, so those can
> be collect in eDP connector binding, is it right ?

Yes, and as Thierry pointed out we may need to know the exact panel eve=
n.

Rob
