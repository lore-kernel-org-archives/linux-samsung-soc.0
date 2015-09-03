From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v4 07/16] ARM: dts: exynos/dp: remove some properties
 that deprecated by analogix_dp driver
Date: Thu, 03 Sep 2015 12:51:16 +0800
Message-ID: <55E7D1C4.3010407@rock-chips.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1441087272-25353-1-git-send-email-ykk@rock-chips.com>
 <55E78DCF.1060308@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1542577360=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <55E78DCF.1060308@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, joe@perches.com, Kukjin Kim <kgene@kernel.org>, Mark Yao <mark.yao@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, seanpaul@chromium.com, djkurtz@chromium.com, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, robherring2@gmail.com, Russell King <rmk+kernel@arm.linux.org.uk>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, dianders@chromium.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Kumar Gala <galak@codeaurora.org>, ajaynumb@gmail.com, Andy Yan <andy.yan@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============1542577360==
Content-Type: multipart/alternative;
 boundary="------------090905030703060704060304"

This is a multi-part message in MIME format.
--------------090905030703060704060304
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

=E5=9C=A8 09/03/2015 08:01 AM, Krzysztof Kozlowski =E5=86=99=E9=81=93:
> On 01.09.2015 15:01, Yakir Yang wrote:
>> After exynos_dp have been splited the common IP code into analogix_dp =
driver,
> s/splited/split/

Done  :)
>> the analogix_dp driver have deprecated some samsung platform propertie=
s which
> s/samsung/Samsung/

Done,

>> could be dynamic parsed from EDID/MODE/DPCD message, so this is an upd=
ate for
> s/dynamic/dynamically/
>

thanks,

>> exynos DTS file for dp-controller.
> /exynos/Exynos/

Okay

>> Beside analogix_dp have provide the backward compatibility, so there a=
re no
>> bisectability break that make this change in a separate patch.
> It took me some time to figure out the meaning of this sentence... Did
> you want to say that backward compatibility is fully preserved?

Aha, Yeah, I means I already have provided the backward
compatibility in previous patches, so no kernel broken when
I make this DTS change in separate patch.

> You are removing samsung,dynamic-range and samsung,ycbcr-coeff. I would
> assume that now:
> 1. on all these board these values would be parsed from EDID/MODE/DPCD
> message?
> 2. everything would work as previously?
> Am I understanding it correctly?

Yeah, you are right. I think dynamic-range and ycbcr-coeff can parse from
the vic value of mode, and this works rightly on my side whether the TV a=
nd
simple panel (if we ignored the mistake I make in v4 :(  ).

But I do have a concern about the ycbcr-coeff. I just copy the judge=20
rule from
dw_hdmi code, and don't understand very well about it, wish some guys cou=
ld
share some ideas.

   if ((vic =3D=3D 2) || (vic =3D=3D 3) || (vic =3D=3D 6) ||

        (vic =3D=3D 7) || (vic =3D=3D 17) || (vic =3D=3D 18) ||

     (vic =3D=3D 21) || (vic =3D=3D 22))

      hdmi->mode_data.colorimetry =3D eITU601;

     else

     hdmi->mode_data.colorimetry =3D eITU709;


Beside, most panel timing would not match the cea mode, that's to say pan=
el
timing would get vic to zero in most time. So after the previous rule,=20
ycbcr would
set to ITU709 which is "1" in eDP controller. But I see Exynos always=20
set 0 to this
bit, so this is the place I am worry about.

- Yakir

> The patch itself looks good.

Thanks.

> Best regards,
> Krzysztof
>
>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>> ---
>> Changes in v4:
>> - Take Krzysztof suggest, separate all DTS changes to a separate patch=
.
>>
>> Changes in v3: None
>> Changes in v2: None
>>
>>   arch/arm/boot/dts/exynos5250-arndale.dts   | 2 --
>>   arch/arm/boot/dts/exynos5250-smdk5250.dts  | 2 --
>>   arch/arm/boot/dts/exynos5250-snow.dts      | 4 +---
>>   arch/arm/boot/dts/exynos5250-spring.dts    | 4 +---
>>   arch/arm/boot/dts/exynos5420-peach-pit.dts | 4 +---
>>   arch/arm/boot/dts/exynos5420-smdk5420.dts  | 2 --
>>   arch/arm/boot/dts/exynos5800-peach-pi.dts  | 4 +---
>>   7 files changed, 4 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/=
dts/exynos5250-arndale.dts
>> index db3f65f..4636862 100644
>> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
>> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
>> @@ -124,8 +124,6 @@
>>   &dp {
>>   	status =3D "okay";
>>   	samsung,color-space =3D <0>;
>> -	samsung,dynamic-range =3D <0>;
>> -	samsung,ycbcr-coeff =3D <0>;
>>   	samsung,color-depth =3D <1>;
>>   	samsung,link-rate =3D <0x0a>;
>>   	samsung,lane-count =3D <4>;
>> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot=
/dts/exynos5250-smdk5250.dts
>> index c625e71..cd424d6 100644
>> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> @@ -80,8 +80,6 @@
>>  =20
>>   &dp {
>>   	samsung,color-space =3D <0>;
>> -	samsung,dynamic-range =3D <0>;
>> -	samsung,ycbcr-coeff =3D <0>;
>>   	samsung,color-depth =3D <1>;
>>   	samsung,link-rate =3D <0x0a>;
>>   	samsung,lane-count =3D <4>;
>> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts=
/exynos5250-snow.dts
>> index 0720caa..242b621 100644
>> --- a/arch/arm/boot/dts/exynos5250-snow.dts
>> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
>> @@ -244,12 +244,10 @@
>>   	pinctrl-names =3D "default";
>>   	pinctrl-0 =3D <&dp_hpd>;
>>   	samsung,color-space =3D <0>;
>> -	samsung,dynamic-range =3D <0>;
>> -	samsung,ycbcr-coeff =3D <0>;
>>   	samsung,color-depth =3D <1>;
>>   	samsung,link-rate =3D <0x0a>;
>>   	samsung,lane-count =3D <2>;
>> -	samsung,hpd-gpio =3D <&gpx0 7 GPIO_ACTIVE_HIGH>;
>> +	hpd-gpios =3D <&gpx0 7 GPIO_ACTIVE_HIGH>;
>>  =20
>>   	ports {
>>   		port@0 {
>> diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/d=
ts/exynos5250-spring.dts
>> index c1edd6d..91881d7 100644
>> --- a/arch/arm/boot/dts/exynos5250-spring.dts
>> +++ b/arch/arm/boot/dts/exynos5250-spring.dts
>> @@ -74,12 +74,10 @@
>>   	pinctrl-names =3D "default";
>>   	pinctrl-0 =3D <&dp_hpd_gpio>;
>>   	samsung,color-space =3D <0>;
>> -	samsung,dynamic-range =3D <0>;
>> -	samsung,ycbcr-coeff =3D <0>;
>>   	samsung,color-depth =3D <1>;
>>   	samsung,link-rate =3D <0x0a>;
>>   	samsung,lane-count =3D <1>;
>> -	samsung,hpd-gpio =3D <&gpc3 0 GPIO_ACTIVE_HIGH>;
>> +	hpd-gpios =3D <&gpc3 0 GPIO_ACTIVE_HIGH>;
>>   };
>>  =20
>>   &ehci {
>> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boo=
t/dts/exynos5420-peach-pit.dts
>> index 8f4d76c..7433683 100644
>> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
>> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>> @@ -148,12 +148,10 @@
>>   	pinctrl-names =3D "default";
>>   	pinctrl-0 =3D <&dp_hpd_gpio>;
>>   	samsung,color-space =3D <0>;
>> -	samsung,dynamic-range =3D <0>;
>> -	samsung,ycbcr-coeff =3D <0>;
>>   	samsung,color-depth =3D <1>;
>>   	samsung,link-rate =3D <0x06>;
>>   	samsung,lane-count =3D <2>;
>> -	samsung,hpd-gpio =3D <&gpx2 6 0>;
>> +	hpd-gpio =3D <&gpx2 6 0>;
>>  =20
>>   	ports {
>>   		port@0 {
>> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot=
/dts/exynos5420-smdk5420.dts
>> index 98871f9..b3df3c1 100644
>> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> @@ -92,8 +92,6 @@
>>   	pinctrl-names =3D "default";
>>   	pinctrl-0 =3D <&dp_hpd>;
>>   	samsung,color-space =3D <0>;
>> -	samsung,dynamic-range =3D <0>;
>> -	samsung,ycbcr-coeff =3D <0>;
>>   	samsung,color-depth =3D <1>;
>>   	samsung,link-rate =3D <0x0a>;
>>   	samsung,lane-count =3D <4>;
>> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot=
/dts/exynos5800-peach-pi.dts
>> index 7d5b386..b89bff5 100644
>> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
>> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>> @@ -142,12 +142,10 @@
>>   	pinctrl-names =3D "default";
>>   	pinctrl-0 =3D <&dp_hpd_gpio>;
>>   	samsung,color-space =3D <0>;
>> -	samsung,dynamic-range =3D <0>;
>> -	samsung,ycbcr-coeff =3D <0>;
>>   	samsung,color-depth =3D <1>;
>>   	samsung,link-rate =3D <0x0a>;
>>   	samsung,lane-count =3D <2>;
>> -	samsung,hpd-gpio =3D <&gpx2 6 0>;
>> +	hpd-gpios =3D <&gpx2 6 0>;
>>   	panel =3D <&panel>;
>>   };
>>  =20
>>
>
>
>


--------------090905030703060704060304
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Hi Krzysztof,<br>
    <br>
    <div class=3D"moz-cite-prefix">=E5=9C=A8 09/03/2015 08:01 AM, Krzyszt=
of
      Kozlowski =E5=86=99=E9=81=93:<br>
    </div>
    <blockquote cite=3D"mid:55E78DCF.1060308@samsung.com" type=3D"cite">
      <pre wrap=3D"">On 01.09.2015 15:01, Yakir Yang wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">After exynos_dp have been splited the common IP co=
de into analogix_dp driver,
</pre>
      </blockquote>
      <pre wrap=3D"">s/splited/split/
</pre>
    </blockquote>
    <br>
    Done=C2=A0 :)<br>
    <blockquote cite=3D"mid:55E78DCF.1060308@samsung.com" type=3D"cite">
      <pre wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">the analogix_dp driver have deprecated some samsun=
g platform properties which
</pre>
      </blockquote>
      <pre wrap=3D"">
s/samsung/Samsung/
</pre>
    </blockquote>
    <br>
    Done,<br>
    <br>
    <blockquote cite=3D"mid:55E78DCF.1060308@samsung.com" type=3D"cite">
      <pre wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">could be dynamic parsed from EDID/MODE/DPCD messag=
e, so this is an update for
</pre>
      </blockquote>
      <pre wrap=3D"">
s/dynamic/dynamically/

</pre>
    </blockquote>
    <br>
    thanks,<br>
    <br>
    <blockquote cite=3D"mid:55E78DCF.1060308@samsung.com" type=3D"cite">
      <blockquote type=3D"cite">
        <pre wrap=3D"">exynos DTS file for dp-controller.
</pre>
      </blockquote>
      <pre wrap=3D"">/exynos/Exynos/
</pre>
    </blockquote>
    <br>
    Okay<br>
    <br>
    <blockquote cite=3D"mid:55E78DCF.1060308@samsung.com" type=3D"cite">
      <pre wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">
Beside analogix_dp have provide the backward compatibility, so there are =
no
bisectability break that make this change in a separate patch.
</pre>
      </blockquote>
      <pre wrap=3D"">
It took me some time to figure out the meaning of this sentence... Did
you want to say that backward compatibility is fully preserved?</pre>
    </blockquote>
    <br>
    Aha, Yeah, I means I already have provided the backward<br>
    compatibility in previous patches, so no kernel broken when<br>
    I make this DTS change in separate patch.<br>
    <br>
    <blockquote cite=3D"mid:55E78DCF.1060308@samsung.com" type=3D"cite">
      <pre wrap=3D"">
You are removing samsung,dynamic-range and samsung,ycbcr-coeff. I would
assume that now:
1. on all these board these values would be parsed from EDID/MODE/DPCD
message?
2. everything would work as previously?
Am I understanding it correctly?
</pre>
    </blockquote>
    <br>
    Yeah, you are right. I think dynamic-range and ycbcr-coeff can parse
    from<br>
    the vic value of mode, and this works rightly on my side whether the
    TV and<br>
    simple panel (if we ignored the mistake I make in v4 :(=C2=A0 ).<br>
    <br>
    But I do have a concern about the ycbcr-coeff. I just copy the judge
    rule from<br>
    dw_hdmi code, and don't understand very well about it, wish some
    guys could<br>
    share some ideas.<br>
    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
    <p style=3D"margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 14px; font-family: arial,
      helvetica, 'helvetica neue', verdana, sans-serif; vertical-align:
      baseline; color: rgb(81, 98, 111); font-variant: normal;
      letter-spacing: normal; line-height: 21px; orphans: auto;
      text-align: left; text-indent: 0px; text-transform: none;
      white-space: normal; widows: 1; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
      255);"><span style=3D"margin: 0px; padding: 0px; border: 0px;
        font-weight: inherit; font-style: inherit; font-size: 10pt;
        font-family: terminal, monaco; vertical-align: baseline;">=C2=A0=C2=
=A0=C2=A0 =C2=A0
        =C2=A0 if ((vic =3D=3D 2) || (vic =3D=3D 3) || (vic =3D=3D 6) ||<=
/span></p>
    <p style=3D"margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 14px; font-family: arial,
      helvetica, 'helvetica neue', verdana, sans-serif; vertical-align:
      baseline; color: rgb(81, 98, 111); font-variant: normal;
      letter-spacing: normal; line-height: 21px; orphans: auto;
      text-align: left; text-indent: 0px; text-transform: none;
      white-space: normal; widows: 1; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
      255);"><span style=3D"margin: 0px; padding: 0px; border: 0px;
        font-weight: inherit; font-style: inherit; font-size: 10pt;
        font-family: terminal, monaco; vertical-align: baseline;">=C2=A0=C2=
=A0=C2=A0=C2=A0
        =C2=A0=C2=A0 =C2=A0 =C2=A0 (vic =3D=3D 7) || (vic =3D=3D 17) || (=
vic =3D=3D 18) ||</span></p>
    <p style=3D"margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 14px; font-family: arial,
      helvetica, 'helvetica neue', verdana, sans-serif; vertical-align:
      baseline; color: rgb(81, 98, 111); font-variant: normal;
      letter-spacing: normal; line-height: 21px; orphans: auto;
      text-align: left; text-indent: 0px; text-transform: none;
      white-space: normal; widows: 1; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
      255);"><span style=3D"margin: 0px; padding: 0px; border: 0px;
        font-weight: inherit; font-style: inherit; font-size: 10pt;
        font-family: terminal, monaco; vertical-align: baseline;">=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0 (vic =3D=3D 21) || (vic =3D=3D 22))</span></p>
    <p style=3D"margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 14px; font-family: arial,
      helvetica, 'helvetica neue', verdana, sans-serif; vertical-align:
      baseline; color: rgb(81, 98, 111); font-variant: normal;
      letter-spacing: normal; line-height: 21px; orphans: auto;
      text-align: left; text-indent: 0px; text-transform: none;
      white-space: normal; widows: 1; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
      255);"><span style=3D"margin: 0px; padding: 0px; border: 0px;
        font-weight: inherit; font-style: inherit; font-size: 10pt;
        font-family: terminal, monaco; vertical-align: baseline;">=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0 =C2=A0 hdmi-&gt;mode_data.colorimetry =3D eITU601;</=
span></p>
    <p style=3D"margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 14px; font-family: arial,
      helvetica, 'helvetica neue', verdana, sans-serif; vertical-align:
      baseline; color: rgb(81, 98, 111); font-variant: normal;
      letter-spacing: normal; line-height: 21px; orphans: auto;
      text-align: left; text-indent: 0px; text-transform: none;
      white-space: normal; widows: 1; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
      255);"><span style=3D"margin: 0px; padding: 0px; border: 0px;
        font-weight: inherit; font-style: inherit; font-size: 10pt;
        font-family: terminal, monaco; vertical-align: baseline;">=C2=A0=C2=
=A0=C2=A0
        =C2=A0=C2=A0=C2=A0 else</span></p>
    <p style=3D"margin: 0px; padding: 0px; border: 0px; font-weight:
      normal; font-style: normal; font-size: 14px; font-family: arial,
      helvetica, 'helvetica neue', verdana, sans-serif; vertical-align:
      baseline; color: rgb(81, 98, 111); font-variant: normal;
      letter-spacing: normal; line-height: 21px; orphans: auto;
      text-align: left; text-indent: 0px; text-transform: none;
      white-space: normal; widows: 1; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
      255);"><span style=3D"margin: 0px; padding: 0px; border: 0px;
        font-weight: inherit; font-style: inherit; font-size: 10pt;
        font-family: terminal, monaco; vertical-align: baseline;">=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
        =C2=A0=C2=A0=C2=A0 hdmi-&gt;mode_data.colorimetry =3D eITU709;</s=
pan></p>
    <br class=3D"Apple-interchange-newline">
    Beside, most panel timing would not match the cea mode, that's to
    say panel<br>
    timing would get vic to zero in most time. So after the previous
    rule, ycbcr would<br>
    set to ITU709 which is "1" in eDP controller. But I see Exynos
    always set 0 to this<br>
    bit, so this is the place I am worry about.<br>
    <br>
    - Yakir<br>
    <br>
    <blockquote cite=3D"mid:55E78DCF.1060308@samsung.com" type=3D"cite">
      <pre wrap=3D"">
The patch itself looks good.
</pre>
    </blockquote>
    <br>
    Thanks.<br>
    <br>
    <blockquote cite=3D"mid:55E78DCF.1060308@samsung.com" type=3D"cite">
      <pre wrap=3D"">
Best regards,
Krzysztof


</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">
Signed-off-by: Yakir Yang <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:ykk@rock-chips.com">&lt;ykk@rock-chips.com&gt;</a>
---
Changes in v4:
- Take Krzysztof suggest, separate all DTS changes to a separate patch.

Changes in v3: None
Changes in v2: None

 arch/arm/boot/dts/exynos5250-arndale.dts   | 2 --
 arch/arm/boot/dts/exynos5250-smdk5250.dts  | 2 --
 arch/arm/boot/dts/exynos5250-snow.dts      | 4 +---
 arch/arm/boot/dts/exynos5250-spring.dts    | 4 +---
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 4 +---
 arch/arm/boot/dts/exynos5420-smdk5420.dts  | 2 --
 arch/arm/boot/dts/exynos5800-peach-pi.dts  | 4 +---
 7 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts=
/exynos5250-arndale.dts
index db3f65f..4636862 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -124,8 +124,6 @@
 &amp;dp {
 	status =3D "okay";
 	samsung,color-space =3D &lt;0&gt;;
-	samsung,dynamic-range =3D &lt;0&gt;;
-	samsung,ycbcr-coeff =3D &lt;0&gt;;
 	samsung,color-depth =3D &lt;1&gt;;
 	samsung,link-rate =3D &lt;0x0a&gt;;
 	samsung,lane-count =3D &lt;4&gt;;
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dt=
s/exynos5250-smdk5250.dts
index c625e71..cd424d6 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -80,8 +80,6 @@
=20
 &amp;dp {
 	samsung,color-space =3D &lt;0&gt;;
-	samsung,dynamic-range =3D &lt;0&gt;;
-	samsung,ycbcr-coeff =3D &lt;0&gt;;
 	samsung,color-depth =3D &lt;1&gt;;
 	samsung,link-rate =3D &lt;0x0a&gt;;
 	samsung,lane-count =3D &lt;4&gt;;
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/ex=
ynos5250-snow.dts
index 0720caa..242b621 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -244,12 +244,10 @@
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D &lt;&amp;dp_hpd&gt;;
 	samsung,color-space =3D &lt;0&gt;;
-	samsung,dynamic-range =3D &lt;0&gt;;
-	samsung,ycbcr-coeff =3D &lt;0&gt;;
 	samsung,color-depth =3D &lt;1&gt;;
 	samsung,link-rate =3D &lt;0x0a&gt;;
 	samsung,lane-count =3D &lt;2&gt;;
-	samsung,hpd-gpio =3D &lt;&amp;gpx0 7 GPIO_ACTIVE_HIGH&gt;;
+	hpd-gpios =3D &lt;&amp;gpx0 7 GPIO_ACTIVE_HIGH&gt;;
=20
 	ports {
 		port@0 {
diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/dts/=
exynos5250-spring.dts
index c1edd6d..91881d7 100644
--- a/arch/arm/boot/dts/exynos5250-spring.dts
+++ b/arch/arm/boot/dts/exynos5250-spring.dts
@@ -74,12 +74,10 @@
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D &lt;&amp;dp_hpd_gpio&gt;;
 	samsung,color-space =3D &lt;0&gt;;
-	samsung,dynamic-range =3D &lt;0&gt;;
-	samsung,ycbcr-coeff =3D &lt;0&gt;;
 	samsung,color-depth =3D &lt;1&gt;;
 	samsung,link-rate =3D &lt;0x0a&gt;;
 	samsung,lane-count =3D &lt;1&gt;;
-	samsung,hpd-gpio =3D &lt;&amp;gpc3 0 GPIO_ACTIVE_HIGH&gt;;
+	hpd-gpios =3D &lt;&amp;gpc3 0 GPIO_ACTIVE_HIGH&gt;;
 };
=20
 &amp;ehci {
diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/d=
ts/exynos5420-peach-pit.dts
index 8f4d76c..7433683 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -148,12 +148,10 @@
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D &lt;&amp;dp_hpd_gpio&gt;;
 	samsung,color-space =3D &lt;0&gt;;
-	samsung,dynamic-range =3D &lt;0&gt;;
-	samsung,ycbcr-coeff =3D &lt;0&gt;;
 	samsung,color-depth =3D &lt;1&gt;;
 	samsung,link-rate =3D &lt;0x06&gt;;
 	samsung,lane-count =3D &lt;2&gt;;
-	samsung,hpd-gpio =3D &lt;&amp;gpx2 6 0&gt;;
+	hpd-gpio =3D &lt;&amp;gpx2 6 0&gt;;
=20
 	ports {
 		port@0 {
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dt=
s/exynos5420-smdk5420.dts
index 98871f9..b3df3c1 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -92,8 +92,6 @@
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D &lt;&amp;dp_hpd&gt;;
 	samsung,color-space =3D &lt;0&gt;;
-	samsung,dynamic-range =3D &lt;0&gt;;
-	samsung,ycbcr-coeff =3D &lt;0&gt;;
 	samsung,color-depth =3D &lt;1&gt;;
 	samsung,link-rate =3D &lt;0x0a&gt;;
 	samsung,lane-count =3D &lt;4&gt;;
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dt=
s/exynos5800-peach-pi.dts
index 7d5b386..b89bff5 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -142,12 +142,10 @@
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D &lt;&amp;dp_hpd_gpio&gt;;
 	samsung,color-space =3D &lt;0&gt;;
-	samsung,dynamic-range =3D &lt;0&gt;;
-	samsung,ycbcr-coeff =3D &lt;0&gt;;
 	samsung,color-depth =3D &lt;1&gt;;
 	samsung,link-rate =3D &lt;0x0a&gt;;
 	samsung,lane-count =3D &lt;2&gt;;
-	samsung,hpd-gpio =3D &lt;&amp;gpx2 6 0&gt;;
+	hpd-gpios =3D &lt;&amp;gpx2 6 0&gt;;
 	panel =3D &lt;&amp;panel&gt;;
 };
=20

</pre>
      </blockquote>
      <pre wrap=3D"">



</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------090905030703060704060304--


--===============1542577360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1542577360==--
