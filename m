From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v2 4/8] drm: rockchip/dp: add rockchip platform dp driver
Date: Tue, 11 Aug 2015 00:23:54 +0800
Message-ID: <55C8D01A.7010508@rock-chips.com>
References: <1438943674-18191-1-git-send-email-ykk@rock-chips.com>
 <1438944380-18897-1-git-send-email-ykk@rock-chips.com>
 <1730542.s7otqjtiXD@diego> <55C57D7E.6080800@rock-chips.com>
 <20150810100055.GB7850@ulmo.nvidia.com> <55C8A040.8090405@rock-chips.com>
 <20150810131709.GA7302@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.139]:41141 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754041AbbHJQYP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Aug 2015 12:24:15 -0400
In-Reply-To: <20150810131709.GA7302@ulmo.nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Thierry Reding <treding@nvidia.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Russell King <rmk+kernel@arm.linux.org.uk>, Fabio Estevam <fabio.estevam@freescale.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, djkurtz@google.com, dianders@google.com, seanpaul@google.com, joe@perches.com, Takashi Iwai <tiwai@suse.de>, Andrzej Hajda <a.hajda@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, Mark Yao <mark.yao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, ajaynum

Hi Thierry,

=E5=9C=A8 2015/8/10 21:17, Thierry Reding =E5=86=99=E9=81=93:
> On Mon, Aug 10, 2015 at 08:59:44PM +0800, Yakir Yang wrote:
>> Hi Thierry,
>>
>> =E5=9C=A8 2015/8/10 18:00, Thierry Reding =E5=86=99=E9=81=93:
>>> On Sat, Aug 08, 2015 at 11:54:38AM +0800, Yakir Yang wrote:
>>> [...]
>>>>          edp: edp@ff970000 {
>>> [...]
>>>>                  hsync-active-high =3D <0>;
>>>>                  vsync-active-high =3D <0>;
>>>>                  interlaced =3D <0>;
>>> These look like they should come from the display mode definition (=
EDID)
>>> rather than device tree.
>> I do think so, those numbers can parse from struct drm_mode. But I h=
aven't
>> send those changes yet, cause I want to merge the split analogix_dp =
first,
>> and
>> then send some patches to improve it. If you think it's better to im=
ptoved
>> those
>> now, I would like to do it , please let me know ;)
>>
>>>>                  samsung,color-space =3D <0>;
>>>>                  samsung,dynamic-range =3D <0>;
>>>>                  samsung,ycbcr-coeff =3D <0>;
>>> I think these should also come from EDID, though I'm not sure if we
>>> store this in internal data structures yet.
>> Same to previous reply
>>
>>>>                  samsung,color-depth =3D <1>;
>>> This is probably drm_display_info.bpc.
>> Same to previous reply
>>
>>>>                  samsung,link-rate =3D <0x0a>;
>>>>                  samsung,lane-count =3D <1>;
>>> And these should really be derived from values in the DPCD and adju=
sted
>>> (if necessary) during link training.
>>>
>>> Why would you ever want to hard-code the above?
>> Yes, I do meet the problem that my eDP screen need lane-count to 4, =
but my
>> DP TV need lane-count to 1. Just like previous reply, if you think I=
 should
>> improved
>> them in this series, I would rather to do it.
> The problem with these is that if you keep them in for your initial
> submission, you can never (or only under extreme pain) remove them.
> Anything in DTB needs to be effectively supported forever.
>
> Also since these don't make sense to hard-code, just improve the code
> and get rid of the need for these DT properties. Mind you that you st=
ill
> need to keep the code to parse them, because presumably Exynos relies=
 on
> them. But depending on how you split up the driver you might be able =
to
> restrict these compatibility hacks to Exynos and not carry them forwa=
rd
> into your new driver.

Okay, thanks for your remind ;)

>>>>>> +	dp->clk_24m =3D devm_clk_get(dev, "clk_dp_24m");
>>>>> Same here, maybe "dp_24m".
>>>> Like my previous reply. And actually as those two clocks all have
>>>> a common prefix "SCLK" in rk3288 clock tree, I thinkt we can name
>>>> them to "sclk_dp" & "sclk_dp_24m", is it okay ?
>>> I don't think there's a need for these common prefixes. The names h=
ere
>>> are identifiers in the context of the IP block, so any SoC-specific
>>> prefixes are irrelevant. Also they do appear, in DT and in code, in=
 the
>>> context of clocks already, so "sclk_" or "clk_" is completely redun=
dant
>>> in these names.
>> The sclk_dp & sclk_dp_24m is not IP common ask, it's only exist in R=
K3288
>> SoC (Like exynos
>> only got one "dp" clock), and actually I add this to rockchip platfo=
rm dp
>> driver not analogix
>> dp driver. So I think it's okay to add some platform some common pre=
fixes.
>>
>> And I got a better idea for those clock. "sclk_dp" & "sclk_dp_24m" i=
s
>> provided for the eDP phy,
>> and I just take Heiko suggest that add an new phy-rockchip-dp.c driv=
er, so
>> it's better to move
>> those clock to phy driver, and rename them to "dp-phy" && "dp-phy-24=
m".
> I agree that dealing with these in a PHY driver sounds like the bette=
r
> option. However, I still think that the dp-phy prefix is redundant. T=
he
> names are in a per-driver scope, so "dp-phy" is implied by the device
> tree binding and driver already. You could simply use shorter names s=
uch
> as "phy" and "24m" for example.
>
> Also note that the clock provider will already have the proper names =
for
> these, so the clock tree will end up showing the provider names. The
> names in the binding are merely the "consumer" names.

Agree, thanks

- Yakir
> Thierry
