From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v4 0/16] Add Analogix Core Display Port Driver
Date: Mon, 21 Sep 2015 16:45:44 +0800
Message-ID: <55FFC3B8.9030108@rock-chips.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <3233920.KG0buE86B2@phil> <55E65BCD.7090804@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2000519299=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <55E65BCD.7090804@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, s.infradead.org@NULL.NULL, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, seanpaul@chromium.com, djkurtz@chromium.com, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, robherring2@gmail.com, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@list.NULL.NULL, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, ajaynumb@gmail.com, Rob Herring <robh+dt@kernel.org>, dianders@chromium.com, Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Kumar Gala <galak@codeaurora.org>, joe@perches.com, Andy Yan <andy.yan@r>
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============2000519299==
Content-Type: multipart/alternative;
 boundary="------------010604030904040404060708"

This is a multi-part message in MIME format.
--------------010604030904040404060708
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On 09/02/2015 10:15 AM, Yakir Yang wrote:
> Hi Heiko,
>
> =E5=9C=A8 09/02/2015 05:47 AM, Heiko Stuebner =E5=86=99=E9=81=93:
>> Hi Yakir,
>>
>> Am Dienstag, 1. September 2015, 13:46:11 schrieb Yakir Yang:
>>>     The Samsung Exynos eDP controller and Rockchip RK3288 eDP=20
>>> controller
>>> share the same IP, so a lot of parts can be re-used. I split the comm=
on
>>> code into bridge directory, then rk3288 and exynos only need to keep
>>> some platform code. Cause I can't find the exact IP name of exynos dp
>>> controller, so I decide to name dp core driver with "analogix" which =
I
>>> find in rk3288 eDP TRM ;)
>>>
>>> Beyond that, there are three light registers setting differents bewte=
en
>>> exynos and rk3288.
>>> 1. RK3288 have five special pll resigters which not indicata in exyno=
s
>>>     dp controller.
>>> 2. The address of DP_PHY_PD(dp phy power manager register) are=20
>>> different
>>>     between rk3288 and exynos.
>>> 3. Rk3288 and exynos have different setting with AUX_HW_RETRY_CTL(dp=20
>>> debug
>>>     register).
>>>
>>> I have verified this series on two kinds of rockchip platform board,=20
>>> one
>>> is rk3288 sdk board which connect with a 2K display port monitor,=20
>>> the other
>>> is google jerry chromebook which connect with a eDP screen=20
>>> "cnm,n116bgeea2",
>>> both of them works rightlly.
>> it looks like during the rebase something did go wrong and I found=20
>> some issues
>> I mentioned in the replies to individual patches.
>>
>> I did prepare a branch based on mainline [0] with both the old and=20
>> the new edp
>> driver - rk3288_veyron_defconfig build both drivers into the image.
>>
>> While the old driver still works, I wasn't able to make the new one=20
>> work yet
>> ... the drm core does find the connector, but not that anything is=20
>> connected
>> to it. I'll try to dig deeper tomorrow, but maybe you'll see anything
>> interesting before then.
>
> Many thanks for your comment and debug, I would rebase on your
> "edp-with-veyron" branch and fix the broken, make sure v6 would
> work rightly at least in your side and my side.

Just like we talk off line, I guess there are two tricky questions which=20
make analogix_dp just crash/failed on rockchip platform:

-  One is how to reach a agreement with the common way to register=20
connector. There would be a conflict with Exynos & IMX & Rockchip.
      On analogix_dp thread, Exynos want to register connector when that=20
connector is ready.
      On dw_hdmi thread, IMX want to register connector when all=20
component is already.
      So Exynos & IMX & Rockchip should reach a common way to register=20
connector to fix this issue.

-  The other is atomic API.
       The rockchip drm haven't implemented the atomic API, but the=20
original exynos_dp have used the atomic API on connector helper=20
function. That's why analogix_dp just keep crash on your side.

I have prepared the v5 version, although those would work directly on=20
rockchip side, but I could upload some HACK patches to gerrit  to make=20
this works,  hope we can keep the discussion going forward.

Thanks,
- Yakir

>
> - Yakir
>
>>
>> Heiko
>>
>> [0] https://github.com/mmind/linux-rockchip/tree/tmp/edp-with-veyron
>>
>>
>>
>>
>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


--------------010604030904040404060708
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Hi Heiko,<br>
    <br>
    <div class=3D"moz-cite-prefix">On 09/02/2015 10:15 AM, Yakir Yang
      wrote:<br>
    </div>
    <blockquote cite=3D"mid:55E65BCD.7090804@rock-chips.com" type=3D"cite=
">Hi
      Heiko,
      <br>
      <br>
      =E5=9C=A8 09/02/2015 05:47 AM, Heiko Stuebner =E5=86=99=E9=81=93:
      <br>
      <blockquote type=3D"cite">Hi Yakir,
        <br>
        <br>
        Am Dienstag, 1. September 2015, 13:46:11 schrieb Yakir Yang:
        <br>
        <blockquote type=3D"cite">=C2=A0=C2=A0=C2=A0 The Samsung Exynos e=
DP controller
          and Rockchip RK3288 eDP controller
          <br>
          share the same IP, so a lot of parts can be re-used. I split
          the common
          <br>
          code into bridge directory, then rk3288 and exynos only need
          to keep
          <br>
          some platform code. Cause I can't find the exact IP name of
          exynos dp
          <br>
          controller, so I decide to name dp core driver with "analogix"
          which I
          <br>
          find in rk3288 eDP TRM ;)
          <br>
          <br>
          Beyond that, there are three light registers setting
          differents bewteen
          <br>
          exynos and rk3288.
          <br>
          1. RK3288 have five special pll resigters which not indicata
          in exynos
          <br>
          =C2=A0=C2=A0=C2=A0 dp controller.
          <br>
          2. The address of DP_PHY_PD(dp phy power manager register) are
          different
          <br>
          =C2=A0=C2=A0=C2=A0 between rk3288 and exynos.
          <br>
          3. Rk3288 and exynos have different setting with
          AUX_HW_RETRY_CTL(dp debug
          <br>
          =C2=A0=C2=A0=C2=A0 register).
          <br>
          <br>
          I have verified this series on two kinds of rockchip platform
          board, one
          <br>
          is rk3288 sdk board which connect with a 2K display port
          monitor, the other
          <br>
          is google jerry chromebook which connect with a eDP screen
          "cnm,n116bgeea2",
          <br>
          both of them works rightlly.
          <br>
        </blockquote>
        it looks like during the rebase something did go wrong and I
        found some issues
        <br>
        I mentioned in the replies to individual patches.
        <br>
        <br>
        I did prepare a branch based on mainline [0] with both the old
        and the new edp
        <br>
        driver - rk3288_veyron_defconfig build both drivers into the
        image.
        <br>
        <br>
        While the old driver still works, I wasn't able to make the new
        one work yet
        <br>
        ... the drm core does find the connector, but not that anything
        is connected
        <br>
        to it. I'll try to dig deeper tomorrow, but maybe you'll see
        anything
        <br>
        interesting before then.
        <br>
      </blockquote>
      <br>
      Many thanks for your comment and debug, I would rebase on your
      <br>
      "edp-with-veyron" branch and fix the broken, make sure v6 would
      <br>
      work rightly at least in your side and my side.
      <br>
    </blockquote>
    <br>
    Just like we talk off line, I guess there are two
    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf=
-8">
    tricky questions which make analogix_dp just crash/failed on
    rockchip platform:<br>
    <br>
    -=C2=A0 One is how to reach a agreement with the common way to regist=
er
    connector. There would be a conflict with Exynos &amp; IMX &amp;
    Rockchip.<br>
    =C2=A0 =C2=A0=C2=A0 On analogix_dp thread, Exynos want to register co=
nnector when
    that connector is ready. <br>
    =C2=A0=C2=A0 =C2=A0 On dw_hdmi thread, IMX want to register connector=
 when all
    component is already.<br>
    =C2=A0=C2=A0=C2=A0=C2=A0 So Exynos &amp; IMX &amp; Rockchip should re=
ach a common way to
    register connector to fix this issue.<br>
    <br>
    -=C2=A0 The other is atomic API.<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The rockchip drm haven't
    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf=
-8">
    implemented the atomic API, but the original exynos_dp have used the
    atomic API on connector helper function. That's why analogix_dp just
    keep crash on your side.<br>
    <br>
    I have prepared the v5 version, although those would work directly
    on rockchip side, but I could upload some HACK patches to gerrit=C2=A0=
 to
    make this works,=C2=A0 hope we can keep the discussion going forward.=
<br>
    <br>
    Thanks,<br>
    - Yakir<br>
    <br>
    <blockquote cite=3D"mid:55E65BCD.7090804@rock-chips.com" type=3D"cite=
">
      <br>
      - Yakir
      <br>
      <br>
      <blockquote type=3D"cite">
        <br>
        Heiko
        <br>
        <br>
        [0]
        <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/mmi=
nd/linux-rockchip/tree/tmp/edp-with-veyron">https://github.com/mmind/linu=
x-rockchip/tree/tmp/edp-with-veyron</a>
        <br>
        <br>
        <br>
        <br>
        <br>
      </blockquote>
      <br>
      <br>
      <br>
      _______________________________________________
      <br>
      Linux-rockchip mailing list
      <br>
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Linux-rockchip=
@lists.infradead.org">Linux-rockchip@lists.infradead.org</a>
      <br>
      <a class=3D"moz-txt-link-freetext" href=3D"http://lists.infradead.o=
rg/mailman/listinfo/linux-rockchip">http://lists.infradead.org/mailman/li=
stinfo/linux-rockchip</a>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------010604030904040404060708--


--===============2000519299==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============2000519299==--
