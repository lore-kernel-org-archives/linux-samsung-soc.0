From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for
 analogix_dp
Date: Sun, 23 Aug 2015 21:42:14 -0500
Message-ID: <55DA8486.1000803@rock-chips.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>	<1439995834-18363-1-git-send-email-ykk@rock-chips.com>	<CAL_JsqLz+8RtBucctUj4euXZ3Ac0DvB52N9ONpAerh5T9BiTJg@mail.gmail.com> <CAJKOXPeEm8exg_UG0tDnaEGO40ejBKZ-ok=bKbVrwYvXnDaMdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPeEm8exg_UG0tDnaEGO40ejBKZ-ok=bKbVrwYvXnDaMdg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robherring2@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, David Airlie <airlied@linux.ie>, Doug Anderson <dianders@google.com>, Inki Dae <inki.dae@samsung.com>, Ajay kumar <ajaynumb@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.i>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

=E5=9C=A8 08/23/2015 07:43 PM, Krzysztof Kozlowski =E5=86=99=E9=81=93:
> 2015-08-24 8:23 GMT+09:00 Rob Herring <robherring2@gmail.com>:
>> On Wed, Aug 19, 2015 at 9:50 AM, Yakir Yang <ykk@rock-chips.com> wro=
te:
>>> Analogix dp driver is split from exynos dp driver, so we just
>>> make an copy of exynos_dp.txt, and then simplify exynos_dp.txt
>>>
>>> Beside update some exynos dtsi file with the latest change
>>> according to the devicetree binding documents.
>> You can't just change the exynos bindings and break compatibility. I=
s
>> there some agreement with exynos folks to do this?
> No, there is no agreement. This wasn't even sent to Exynos maintainer=
s.

Sorry about this one, actually I have add Exynos maintainers in version=
=20
1 & version 2,
but lose some maintainers in version 3, I would fix it in bellow versio=
ns.

> Additionally the patchset did not look interesting to me because of
> misleading subject - Documentation instead of "ARM: dts:".
>
> Yakir, please:
> 1. Provide backward compatibility. Mark old properties as deprecated
> but still support them.

Do you mean that I should keep the old properties declare in exynos-dp.=
txt,
but just mark them as deprecated flag. Let me show same examples, make
me understand your suggest rightly.

1. "samsung,ycbcr-coeff" is abandoned in latest analogix-dp driver,=20
absolutely
     I should not carry this to analogix-dp.txt document. But I should=20
keep this in
     exynos-dp.txt document, and mark them with an little "deprecated" =
flag.

[Documentation/devicetree/bindings/video/exynos_dp.txt]
Required properties for dp-controller:
    [...]
     -samsung,ycbcr-coeff (DEPRECATED):
         YCbCr co-efficients for input video.
             COLOR_YCBCR601 =3D 0, COLOR_YCBCR709 =3D 1

Is it right ?

> 2. Separate all DTS changes to a separate patch, unless bisectability
> would be hurt. Anyway you should prepare it in a such way that
> separation would be possible without breaking bisectability.

So I should separate this patch into two parts, one is name "Document:"=
,
the other is "ARM: dts: ".

Honestly, I don't understand what the "bisectability" means in this cas=
e.

> 3. Use proper subject for the patch changing DTS. This is not
> documentation change!

Hmm... when I separate this patch into two parts, I though I can keep
"Documentation" proper subject in this patch, and the other is the "ARM=
:=20
dts"
proper subject. Am I right ?

> 4. Please use script get_maintainers to obtain list of valid
> maintainers and CC-them with at least cover letter and patches
> requiring their attention.

Yeah, thanks.


Thanks a lot,
- Yakir

> Best regards,
> Krzysztof
>
>
>>
>>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>>> ---
>>> Changes in v3:
>>> - Take Heiko suggest, add devicetree binding documents.
>>> - Take Thierry Reding suggest, remove sync pol & colorimetry proper=
ies
>>>    from the new analogix dp driver devicetree binding.
>>> - Update the exist exynos dtsi file with the latest DP DT properies=
=2E
>>>
>>> Changes in v2: None
>>>
>>>   .../devicetree/bindings/drm/bridge/analogix_dp.txt | 70 +++++++++=
+++++++++++++
>>>   .../devicetree/bindings/video/exynos_dp.txt        | 50 ++++++---=
-------
>>>   arch/arm/boot/dts/exynos5250-arndale.dts           | 10 ++--
>>>   arch/arm/boot/dts/exynos5250-smdk5250.dts          | 10 ++--
>>>   arch/arm/boot/dts/exynos5250-snow.dts              | 12 ++--
>>>   arch/arm/boot/dts/exynos5250-spring.dts            | 12 ++--
>>>   arch/arm/boot/dts/exynos5420-peach-pit.dts         | 12 ++--
>>>   arch/arm/boot/dts/exynos5420-smdk5420.dts          | 10 ++--
>>>   arch/arm/boot/dts/exynos5800-peach-pi.dts          | 12 ++--
>>>   9 files changed, 119 insertions(+), 79 deletions(-)
>>>   create mode 100644 Documentation/devicetree/bindings/drm/bridge/a=
nalogix_dp.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/drm/bridge/analogix_=
dp.txt b/Documentation/devicetree/bindings/drm/bridge/analogix_dp.txt
>>> new file mode 100644
>>> index 0000000..6127018
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/drm/bridge/analogix_dp.txt
>>> @@ -0,0 +1,70 @@
>>> +Analogix Display Port bridge bindings
>>> +
>>> +Required properties for dp-controller:
>>> +       -compatible:
>>> +               platform specific such as:
>>> +                * "samsung,exynos5-dp"
>>> +                * "rockchip,rk3288-dp"
>>> +       -reg:
>>> +               physical base address of the controller and length
>>> +               of memory mapped region.
>>> +       -interrupts:
>>> +               interrupt combiner values.
>>> +       -clocks:
>>> +               from common clock binding: handle to dp clock.
>>> +       -clock-names:
>>> +               from common clock binding: Shall be "dp".
>>> +       -interrupt-parent:
>>> +               phandle to Interrupt combiner node.
>>> +       -phys:
>>> +               from general PHY binding: the phandle for the PHY d=
evice.
>>> +       -phy-names:
>>> +               from general PHY binding: Should be "dp".
>>> +       -analogix,color-space:
>>> +               input video data format.
>>> +                       COLOR_RGB =3D 0, COLOR_YCBCR422 =3D 1, COLO=
R_YCBCR444 =3D 2
>>> +       -analogix,color-depth:
>>> +               number of bits per colour component.
>>> +                       COLOR_6 =3D 0, COLOR_8 =3D 1, COLOR_10 =3D =
2, COLOR_12 =3D 3
>> This seems pretty generic. Just use 6, 8, 10, or 12 for values. And
>> drop the vendor prefix.
>>
>>> +       -analogix,link-rate:
>>> +               max link rate supported by the eDP controller.
>>> +                       LINK_RATE_1_62GBPS =3D 0x6, LINK_RATE_2_70G=
BPS =3D 0x0A,
>>> +                       LINK_RATE_5_40GBPS =3D 0x14
>> Same here. I'd rather see something like "link-rate-mbps" and use th=
e
>> actual rate.
>>
>>> +       -analogix,lane-count:
>>> +               max number of lanes supported by the eDP contoller.
>>> +                       LANE_COUNT1 =3D 1, LANE_COUNT2 =3D 2, LANE_=
COUNT4 =3D 4
>> And drop the vendor prefix here.
>>
>>> +       -port@[X]: SoC specific port nodes with endpoint definition=
s as defined
>>> +               in Documentation/devicetree/bindings/media/video-in=
terfaces.txt,
>>> +               please refer to the SoC specific binding document:
>>> +               * Documentation/devicetree/bindings/video/exynos_dp=
=2Etxt
>>> +               * Documentation/devicetree/bindings/video/analogix_=
dp-rockchip.txt
>>> +
>>> +Optional properties for dp-controller:
>>> +       -analogix,hpd-gpio:
>>> +               Hotplug detect GPIO.
>>> +                       Indicates which GPIO should be used for hot=
plug
>>> +                       detection
>> We should align with "hpd-gpios" used by HDMI connector binding. Or =
do
>> we need a DP connector binding that this should be defined in?
>> Probably so.
>>
>> The DRM related bindings are such a cluster f*ck with everyone picki=
ng
>> their own way to do things. Just grep hpd in bindings for starters.
>> That is just the tip.
>>
>>> +       -video interfaces: Device node can contain video interface =
port
>>> +                           nodes according to [1].
>> Isn't this the same as ports above? How are they optional? 0 ports
>> would be pretty useless.
>>
>>> +
>>> +[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
>>> +------------------------------------------------------------------=
-------------
>>> +
>>> +Example:
>>> +
>>> +       dp-controller {
>>> +               compatible =3D "samsung,exynos5-dp";
>>> +               reg =3D <0x145b0000 0x10000>;
>>> +               interrupts =3D <10 3>;
>>> +               interrupt-parent =3D <&combiner>;
>>> +               clocks =3D <&clock 342>;
>>> +               clock-names =3D "dp";
>>> +
>>> +               phys =3D <&dp_phy>;
>>> +               phy-names =3D "dp";
>>> +
>>> +               analogix,color-space =3D <0>;
>>> +               analogix,color-depth =3D <1>;
>>> +               analogix,link-rate =3D <0x0a>;
>>> +               analogix,lane-count =3D <4>;
>>> +       };
>>> diff --git a/Documentation/devicetree/bindings/video/exynos_dp.txt =
b/Documentation/devicetree/bindings/video/exynos_dp.txt
>>> index 7a3a9cd..177506f 100644
>>> --- a/Documentation/devicetree/bindings/video/exynos_dp.txt
>>> +++ b/Documentation/devicetree/bindings/video/exynos_dp.txt
>>> @@ -31,28 +31,10 @@ Required properties for dp-controller:
>>>                  from general PHY binding: the phandle for the PHY =
device.
>>>          -phy-names:
>>>                  from general PHY binding: Should be "dp".
>>> -       -samsung,color-space:
>>> -               input video data format.
>>> -                       COLOR_RGB =3D 0, COLOR_YCBCR422 =3D 1, COLO=
R_YCBCR444 =3D 2
>>> -       -samsung,dynamic-range:
>>> -               dynamic range for input video data.
>>> -                       VESA =3D 0, CEA =3D 1
>>> -       -samsung,ycbcr-coeff:
>>> -               YCbCr co-efficients for input video.
>>> -                       COLOR_YCBCR601 =3D 0, COLOR_YCBCR709 =3D 1
>>> -       -samsung,color-depth:
>>> -               number of bits per colour component.
>>> -                       COLOR_6 =3D 0, COLOR_8 =3D 1, COLOR_10 =3D =
2, COLOR_12 =3D 3
>>> -       -samsung,link-rate:
>>> -               link rate supported by the panel.
>>> -                       LINK_RATE_1_62GBPS =3D 0x6, LINK_RATE_2_70G=
BPS =3D 0x0A
>>> -       -samsung,lane-count:
>>> -               number of lanes supported by the panel.
>>> -                       LANE_COUNT1 =3D 1, LANE_COUNT2 =3D 2, LANE_=
COUNT4 =3D 4
>>> -       - display-timings: timings for the connected panel as descr=
ibed by
>>> -               Documentation/devicetree/bindings/video/display-tim=
ing.txt
>>>
>>>   Optional properties for dp-controller:
>>> +       - display-timings: timings for the connected panel as descr=
ibed by
>>> +               Documentation/devicetree/bindings/video/display-tim=
ing.txt
>>>          -interlaced:
>>>                  interlace scan mode.
>>>                          Progressive if defined, Interlaced if not =
defined
>>> @@ -62,14 +44,18 @@ Optional properties for dp-controller:
>>>          -hsync-active-high:
>>>                  HSYNC polarity configuration.
>>>                          High if defined, Low if not defined
>>> -       -samsung,hpd-gpio:
>>> -               Hotplug detect GPIO.
>>> -                       Indicates which GPIO should be used for hot=
plug
>>> -                       detection
>>> -       -video interfaces: Device node can contain video interface =
port
>>> -                           nodes according to [1].
>>>
>>> -[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
>>> +For the below properties, please refer to Analogix DP binding docu=
ment:
>>> + * Documentation/devicetree/bindings/drm/bridge/analogix_dp.txt
>>> +       -phys (required)
>>> +       -phy-names (required)
>>> +       -analogix,color-space (required)
>>> +       -analogix,color-depth (required)
>>> +       -analogix,link-rate (required)
>>> +       -analogix,lane-count (required)
>>> +       -analogix,hpd-gpio (optional)
>>> +       -video interfaces (optional)
>>> +------------------------------------------------------------------=
-------------
>>>
>>>   Example:
>>>
>>> @@ -88,12 +74,10 @@ SOC specific portion:
>>>
>>>   Board Specific portion:
>>>          dp-controller {
>>> -               samsung,color-space =3D <0>;
>>> -               samsung,dynamic-range =3D <0>;
>>> -               samsung,ycbcr-coeff =3D <0>;
>>> -               samsung,color-depth =3D <1>;
>>> -               samsung,link-rate =3D <0x0a>;
>>> -               samsung,lane-count =3D <4>;
>>> +               analogix,color-space =3D <0>;
>>> +               analogix,color-depth =3D <1>;
>>> +               analogix,link-rate =3D <0x0a>;
>>> +               analogix,lane-count =3D <4>;
>>>
>>>                  display-timings {
>>>                          native-mode =3D <&lcd_timing>;
>>> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/bo=
ot/dts/exynos5250-arndale.dts
>>> index 7e728a1..e48798d 100644
>>> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
>>> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
>>> @@ -119,12 +119,10 @@
>>>
>>>   &dp {
>>>          status =3D "okay";
>>> -       samsung,color-space =3D <0>;
>>> -       samsung,dynamic-range =3D <0>;
>>> -       samsung,ycbcr-coeff =3D <0>;
>>> -       samsung,color-depth =3D <1>;
>>> -       samsung,link-rate =3D <0x0a>;
>>> -       samsung,lane-count =3D <4>;
>>> +       analogix,color-space =3D <0>;
>>> +       analogix,color-depth =3D <1>;
>>> +       analogix,link-rate =3D <0x0a>;
>>> +       analogix,lane-count =3D <4>;
>>>   };
>>>
>>>   &fimd {
>>> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/b=
oot/dts/exynos5250-smdk5250.dts
>>> index 4fe186d..b8c6b8b 100644
>>> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
>>> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
>>> @@ -75,12 +75,10 @@
>>>   };
>>>
>>>   &dp {
>>> -       samsung,color-space =3D <0>;
>>> -       samsung,dynamic-range =3D <0>;
>>> -       samsung,ycbcr-coeff =3D <0>;
>>> -       samsung,color-depth =3D <1>;
>>> -       samsung,link-rate =3D <0x0a>;
>>> -       samsung,lane-count =3D <4>;
>>> +       analogix,color-space =3D <0>;
>>> +       analogix,color-depth =3D <1>;
>>> +       analogix,link-rate =3D <0x0a>;
>>> +       analogix,lane-count =3D <4>;
>>>
>>>          pinctrl-names =3D "default";
>>>          pinctrl-0 =3D <&dp_hpd>;
>>> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/=
dts/exynos5250-snow.dts
>>> index b7f4122..9ce2b89 100644
>>> --- a/arch/arm/boot/dts/exynos5250-snow.dts
>>> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
>>> @@ -239,13 +239,11 @@
>>>          status =3D "okay";
>>>          pinctrl-names =3D "default";
>>>          pinctrl-0 =3D <&dp_hpd>;
>>> -       samsung,color-space =3D <0>;
>>> -       samsung,dynamic-range =3D <0>;
>>> -       samsung,ycbcr-coeff =3D <0>;
>>> -       samsung,color-depth =3D <1>;
>>> -       samsung,link-rate =3D <0x0a>;
>>> -       samsung,lane-count =3D <2>;
>>> -       samsung,hpd-gpio =3D <&gpx0 7 GPIO_ACTIVE_HIGH>;
>>> +       analogix,color-space =3D <0>;
>>> +       analogix,color-depth =3D <1>;
>>> +       analogix,link-rate =3D <0x0a>;
>>> +       analogix,lane-count =3D <2>;
>>> +       analogix,hpd-gpio =3D <&gpx0 7 GPIO_ACTIVE_HIGH>;
>>>
>>>          ports {
>>>                  port@0 {
>>> diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boo=
t/dts/exynos5250-spring.dts
>>> index d03f9b8..9288ae6 100644
>>> --- a/arch/arm/boot/dts/exynos5250-spring.dts
>>> +++ b/arch/arm/boot/dts/exynos5250-spring.dts
>>> @@ -69,13 +69,11 @@
>>>          status =3D "okay";
>>>          pinctrl-names =3D "default";
>>>          pinctrl-0 =3D <&dp_hpd_gpio>;
>>> -       samsung,color-space =3D <0>;
>>> -       samsung,dynamic-range =3D <0>;
>>> -       samsung,ycbcr-coeff =3D <0>;
>>> -       samsung,color-depth =3D <1>;
>>> -       samsung,link-rate =3D <0x0a>;
>>> -       samsung,lane-count =3D <1>;
>>> -       samsung,hpd-gpio =3D <&gpc3 0 GPIO_ACTIVE_HIGH>;
>>> +       analogix,color-space =3D <0>;
>>> +       analogix,color-depth =3D <1>;
>>> +       analogix,link-rate =3D <0x0a>;
>>> +       analogix,lane-count =3D <1>;
>>> +       analogix,hpd-gpio =3D <&gpc3 0 GPIO_ACTIVE_HIGH>;
>>>   };
>>>
>>>   &ehci {
>>> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/=
boot/dts/exynos5420-peach-pit.dts
>>> index 8f4d76c..695a380 100644
>>> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>> @@ -147,13 +147,11 @@
>>>          status =3D "okay";
>>>          pinctrl-names =3D "default";
>>>          pinctrl-0 =3D <&dp_hpd_gpio>;
>>> -       samsung,color-space =3D <0>;
>>> -       samsung,dynamic-range =3D <0>;
>>> -       samsung,ycbcr-coeff =3D <0>;
>>> -       samsung,color-depth =3D <1>;
>>> -       samsung,link-rate =3D <0x06>;
>>> -       samsung,lane-count =3D <2>;
>>> -       samsung,hpd-gpio =3D <&gpx2 6 0>;
>>> +       analogix,color-space =3D <0>;
>>> +       analogix,color-depth =3D <1>;
>>> +       analogix,link-rate =3D <0x06>;
>>> +       analogix,lane-count =3D <2>;
>>> +       analogix,hpd-gpio =3D <&gpx2 6 0>;
>>>
>>>          ports {
>>>                  port@0 {
>>> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/b=
oot/dts/exynos5420-smdk5420.dts
>>> index 98871f9..fd46714 100644
>>> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
>>> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
>>> @@ -91,12 +91,10 @@
>>>   &dp {
>>>          pinctrl-names =3D "default";
>>>          pinctrl-0 =3D <&dp_hpd>;
>>> -       samsung,color-space =3D <0>;
>>> -       samsung,dynamic-range =3D <0>;
>>> -       samsung,ycbcr-coeff =3D <0>;
>>> -       samsung,color-depth =3D <1>;
>>> -       samsung,link-rate =3D <0x0a>;
>>> -       samsung,lane-count =3D <4>;
>>> +       analogix,color-space =3D <0>;
>>> +       analogix,color-depth =3D <1>;
>>> +       analogix,link-rate =3D <0x0a>;
>>> +       analogix,lane-count =3D <4>;
>>>          status =3D "okay";
>>>   };
>>>
>>> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/b=
oot/dts/exynos5800-peach-pi.dts
>>> index 7d5b386..54b4c63 100644
>>> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
>>> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>>> @@ -141,13 +141,11 @@
>>>          status =3D "okay";
>>>          pinctrl-names =3D "default";
>>>          pinctrl-0 =3D <&dp_hpd_gpio>;
>>> -       samsung,color-space =3D <0>;
>>> -       samsung,dynamic-range =3D <0>;
>>> -       samsung,ycbcr-coeff =3D <0>;
>>> -       samsung,color-depth =3D <1>;
>>> -       samsung,link-rate =3D <0x0a>;
>>> -       samsung,lane-count =3D <2>;
>>> -       samsung,hpd-gpio =3D <&gpx2 6 0>;
>>> +       analogix,color-space =3D <0>;
>>> +       analogix,color-depth =3D <1>;
>>> +       analogix,link-rate =3D <0x0a>;
>>> +       analogix,lane-count =3D <2>;
>>> +       analogix,hpd-gpio =3D <&gpx2 6 0>;
>>>          panel =3D <&panel>;
>>>   };
>>>
>>> --
>>> 1.9.1
>>>
>>>
>>>
>>> _______________________________________________
>>> linux-arm-kernel mailing list
>>> linux-arm-kernel@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
>
