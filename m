From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v4 0/16] Add Analogix Core Display Port Driver
Date: Mon, 21 Sep 2015 19:43:05 +0800
Message-ID: <55FFED49.8030604@rock-chips.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <3233920.KG0buE86B2@phil> <55E65BCD.7090804@rock-chips.com>
 <55FFC3B8.9030108@rock-chips.com> <20150921091537.GA20992@ulmo.nvidia.com>
 <55FFDB9C.1030901@rock-chips.com> <20150921112246.GD20992@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1133958622=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150921112246.GD20992@ulmo.nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <treding@nvidia.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, s.infradead.org@NULL.NULL, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, seanpaul@chromium.com, djkurtz@chromium.com, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, robherring2@gmail.com, Russell King <rmk+kernel@arm.linux.org.uk>, linux-arm-kernel@list.NULL.NULL, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, ajaynumb@gmail.com, Rob Herring <robh+dt@kernel.org>, dianders@chromium.com, Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Kumar Gala <galak@codeaurora.org>, joe@perches.com, Andy Yan <andy.yan@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============1133958622==
Content-Type: multipart/alternative;
 boundary="------------090204000209030106030501"

This is a multi-part message in MIME format.
--------------090204000209030106030501
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

On 09/21/2015 07:22 PM, Thierry Reding wrote:
> On Mon, Sep 21, 2015 at 06:27:40PM +0800, Yakir Yang wrote:
>> Hi Thierry,
>>
>> Thanks for your suggest :)
>>
>> On 09/21/2015 05:15 PM, Thierry Reding wrote:
>>> On Mon, Sep 21, 2015 at 04:45:44PM +0800, Yakir Yang wrote:
>>>> Hi Heiko,
>>>>
>>>> On 09/02/2015 10:15 AM, Yakir Yang wrote:
>>>>> Hi Heiko,
>>>>>
>>>>> =E5=9C=A8 09/02/2015 05:47 AM, Heiko Stuebner =E5=86=99=E9=81=93:
>>>>>> Hi Yakir,
>>>>>>
>>>>>> Am Dienstag, 1. September 2015, 13:46:11 schrieb Yakir Yang:
>>>>>>>     The Samsung Exynos eDP controller and Rockchip RK3288 eDP
>>>>>>> controller
>>>>>>> share the same IP, so a lot of parts can be re-used. I split the =
common
>>>>>>> code into bridge directory, then rk3288 and exynos only need to k=
eep
>>>>>>> some platform code. Cause I can't find the exact IP name of exyno=
s dp
>>>>>>> controller, so I decide to name dp core driver with "analogix" wh=
ich I
>>>>>>> find in rk3288 eDP TRM ;)
>>>>>>>
>>>>>>> Beyond that, there are three light registers setting differents b=
ewteen
>>>>>>> exynos and rk3288.
>>>>>>> 1. RK3288 have five special pll resigters which not indicata in e=
xynos
>>>>>>>     dp controller.
>>>>>>> 2. The address of DP_PHY_PD(dp phy power manager register) are
>>>>>>> different
>>>>>>>     between rk3288 and exynos.
>>>>>>> 3. Rk3288 and exynos have different setting with AUX_HW_RETRY_CTL=
(dp
>>>>>>> debug
>>>>>>>     register).
>>>>>>>
>>>>>>> I have verified this series on two kinds of rockchip platform boa=
rd,
>>>>>>> one
>>>>>>> is rk3288 sdk board which connect with a 2K display port monitor,=
 the
>>>>>>> other
>>>>>>> is google jerry chromebook which connect with a eDP screen
>>>>>>> "cnm,n116bgeea2",
>>>>>>> both of them works rightlly.
>>>>>> it looks like during the rebase something did go wrong and I found=
 some
>>>>>> issues
>>>>>> I mentioned in the replies to individual patches.
>>>>>>
>>>>>> I did prepare a branch based on mainline [0] with both the old and=
 the
>>>>>> new edp
>>>>>> driver - rk3288_veyron_defconfig build both drivers into the image=
.
>>>>>>
>>>>>> While the old driver still works, I wasn't able to make the new on=
e work
>>>>>> yet
>>>>>> ... the drm core does find the connector, but not that anything is
>>>>>> connected
>>>>>> to it. I'll try to dig deeper tomorrow, but maybe you'll see anyth=
ing
>>>>>> interesting before then.
>>>>> Many thanks for your comment and debug, I would rebase on your
>>>>> "edp-with-veyron" branch and fix the broken, make sure v6 would
>>>>> work rightly at least in your side and my side.
>>>> Just like we talk off line, I guess there are two tricky questions w=
hich
>>>> make analogix_dp just crash/failed on rockchip platform:
>>>>
>>>> -  One is how to reach a agreement with the common way to register
>>>> connector. There would be a conflict with Exynos & IMX & Rockchip.
>>>>       On analogix_dp thread, Exynos want to register connector when =
that
>>>> connector is ready.
>>>>       On dw_hdmi thread, IMX want to register connector when all com=
ponent is
>>>> already.
>>>>       So Exynos & IMX & Rockchip should reach a common way to regist=
er
>>>> connector to fix this issue.
>>>>
>>>> -  The other is atomic API.
>>>>        The rockchip drm haven't implemented the atomic API, but the =
original
>>>> exynos_dp have used the atomic API on connector helper function. Tha=
t's why
>>>> analogix_dp just keep crash on your side.
>>> There's really no reason not to convert Rockchip to atomic. It will h=
ave
>>> to happen eventually anyway.
>> Do agree on this point, and I see Tomasz Figa have done some WIP
>> works on implementing the atomic_commit, maybe would upstream
>> in further.(https://chromium-review.googlesource.com/#/c/284560/1)
>>
>>
>>> That said, there's another option that would allow you to side-step b=
oth
>>> of the above problems at the same time. If you turn the common code i=
nto
>>> a helper library that should give you enough flexibility to integrate=
 it
>>> into all existing users. For example you could leave out the connecto=
r
>>> registration and let the drivers do that. Similarly since the helpers
>>> are only hooked up at registration time you could probably find a way=
 to
>>> share the low-level code but again leave it up to the drivers to glue=
 it
>>> all together at registration time (drivers could wrap the low-level c=
ode
>>> with atomic or non-atomic callbacks).
>> Wow, sounds good, but I'm not sure I understand this rightly. Do you
>> mean that I could support two kinds of callbacks in analogix_dp_core
>> driver, and export them out. And move the connector registration code
>> into the helper driver (like exynos_dp.c), so helper driver could chos=
e to
>> use the atomic or non-atomic callbacks. like:
>>
>> -- analogix_dp_core.c
>> --------------------------------------------------------------------
>> ...
>> struct drm_connector_funcs analogix_dp_connector_atomic_funcs =3D {
>>          .dpms =3D drm_atomic_helper_connector_dpms,
>>          .fill_modes =3D drm_helper_probe_single_connector_modes,
>>          .detect =3D analogix_dp_detect,
>>          .destroy =3D analogix_dp_connector_destroy,
>>          .reset =3D drm_atomic_helper_connector_reset,
>>          .atomic_duplicate_state =3D
>> drm_atomic_helper_connector_duplicate_state,
>>          .atomic_destroy_state =3D drm_atomic_helper_connector_destroy=
_state,
>> };
>> EXPORT_SYMBOL(analogix_dp_connector_atomic_funcs);
>>
>> struct drm_connector_funcs analogix_dp_connector_funcs =3D {
>>          .dpms =3D drm_helper_connector_dpms,
>>          .fill_modes =3D drm_helper_probe_single_connector_modes,
>>          .detect =3D analogix_dp_detect,
>>          .destroy =3D analogix_dp_connector_destroy,
>> };
>> EXPORT_SYMBOL(analogix_dp_connector_funcs);
>>
>> struct drm_connector_helper_funcs analogix_dp_connector_helper_funcs =3D=
 {
>>          .get_modes =3D analogix_dp_get_modes,
>>          .best_encoder =3D analogix_dp_best_encoder,
>> };
>> EXPORT_SYMBOL(analogix_dp_connector_helper_funcs);
>> ...
>>
>> -- exynos_dp
>> ----------------------------------------------------------------------=
------
>>          ret =3D drm_connector_init(dp->drm_dev, connector,
>> &analogix_dp_connector_atomic_funcs,
>>                                   DRM_MODE_CONNECTOR_eDP);
>>          if (ret) {
>>                  DRM_ERROR("Failed to initialize connector with drm\n"=
);
>>                  return ret;
>>          }
>>
>>          drm_connector_helper_add(connector,
>> &analogix_dp_connector_helper_funcs);
>>          drm_connector_register(connector);
>>          drm_mode_connector_attach_encoder(connector, encoder);
>>
>> -- analogix_dp-rockchip
>> ----------------------------------------------------------------------=
------
>>          ret =3D drm_connector_init(dp->drm_dev, connector,
>>                                   &analogix_dp_connector_funcs,
>>                                   DRM_MODE_CONNECTOR_eDP);
>>          if (ret) {
>>                  DRM_ERROR("Failed to initialize connector with drm\n"=
);
>>                  return ret;
>>          }
>>
>>          drm_connector_helper_add(connector,
>> &analogix_dp_connector_helper_funcs);
>>          drm_mode_connector_attach_encoder(connector, encoder);
>>
>>
>> Are those code corresponding to your suggestion.   :)
> Yes, that looks about right. You could also move the implementations
> into the Exynos and Rockchip drivers, respectively, if they're only use=
d
> from one place. Then you can simply export the low-level analogix_dp_*(=
)
> functions. That might give you even more flexibility, but the above
> would probably work well enough.

Wow, much better, so I just need to export two low-level functions,

  * analogix_dp_detect()
  * analogix_dp_get_modes()

Pretty cool.

Thanks,
- Yakir

> Thierry


--------------090204000209030106030501
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Hi Thierry,<br>
    <br>
    <div class=3D"moz-cite-prefix">On 09/21/2015 07:22 PM, Thierry Reding
      wrote:<br>
    </div>
    <blockquote cite=3D"mid:20150921112246.GD20992@ulmo.nvidia.com"
      type=3D"cite">
      <pre wrap=3D"">On Mon, Sep 21, 2015 at 06:27:40PM +0800, Yakir Yang=
 wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">Hi Thierry,

Thanks for your suggest :)

On 09/21/2015 05:15 PM, Thierry Reding wrote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"">On Mon, Sep 21, 2015 at 04:45:44PM +0800, Yakir =
Yang wrote:
</pre>
          <blockquote type=3D"cite">
            <pre wrap=3D"">Hi Heiko,

On 09/02/2015 10:15 AM, Yakir Yang wrote:
</pre>
            <blockquote type=3D"cite">
              <pre wrap=3D"">Hi Heiko,

=E5=9C=A8 09/02/2015 05:47 AM, Heiko Stuebner =E5=86=99=E9=81=93:
</pre>
              <blockquote type=3D"cite">
                <pre wrap=3D"">Hi Yakir,

Am Dienstag, 1. September 2015, 13:46:11 schrieb Yakir Yang:
</pre>
                <blockquote type=3D"cite">
                  <pre wrap=3D"">   The Samsung Exynos eDP controller and=
 Rockchip RK3288 eDP
controller
share the same IP, so a lot of parts can be re-used. I split the common
code into bridge directory, then rk3288 and exynos only need to keep
some platform code. Cause I can't find the exact IP name of exynos dp
controller, so I decide to name dp core driver with "analogix" which I
find in rk3288 eDP TRM ;)

Beyond that, there are three light registers setting differents bewteen
exynos and rk3288.
1. RK3288 have five special pll resigters which not indicata in exynos
   dp controller.
2. The address of DP_PHY_PD(dp phy power manager register) are
different
   between rk3288 and exynos.
3. Rk3288 and exynos have different setting with AUX_HW_RETRY_CTL(dp
debug
   register).

I have verified this series on two kinds of rockchip platform board,
one
is rk3288 sdk board which connect with a 2K display port monitor, the
other
is google jerry chromebook which connect with a eDP screen
"cnm,n116bgeea2",
both of them works rightlly.
</pre>
                </blockquote>
                <pre wrap=3D"">it looks like during the rebase something =
did go wrong and I found some
issues
I mentioned in the replies to individual patches.

I did prepare a branch based on mainline [0] with both the old and the
new edp
driver - rk3288_veyron_defconfig build both drivers into the image.

While the old driver still works, I wasn't able to make the new one work
yet
... the drm core does find the connector, but not that anything is
connected
to it. I'll try to dig deeper tomorrow, but maybe you'll see anything
interesting before then.
</pre>
              </blockquote>
              <pre wrap=3D"">Many thanks for your comment and debug, I wo=
uld rebase on your
"edp-with-veyron" branch and fix the broken, make sure v6 would
work rightly at least in your side and my side.
</pre>
            </blockquote>
            <pre wrap=3D"">Just like we talk off line, I guess there are =
two tricky questions which
make analogix_dp just crash/failed on rockchip platform:

-  One is how to reach a agreement with the common way to register
connector. There would be a conflict with Exynos &amp; IMX &amp; Rockchip=
.
     On analogix_dp thread, Exynos want to register connector when that
connector is ready.
     On dw_hdmi thread, IMX want to register connector when all component=
 is
already.
     So Exynos &amp; IMX &amp; Rockchip should reach a common way to regi=
ster
connector to fix this issue.

-  The other is atomic API.
      The rockchip drm haven't implemented the atomic API, but the origin=
al
exynos_dp have used the atomic API on connector helper function. That's w=
hy
analogix_dp just keep crash on your side.
</pre>
          </blockquote>
          <pre wrap=3D"">There's really no reason not to convert Rockchip=
 to atomic. It will have
to happen eventually anyway.
</pre>
        </blockquote>
        <pre wrap=3D"">
Do agree on this point, and I see Tomasz Figa have done some WIP
works on implementing the atomic_commit, maybe would upstream
in further.(<a class=3D"moz-txt-link-freetext" href=3D"https://chromium-r=
eview.googlesource.com/#/c/284560/1">https://chromium-review.googlesource=
.com/#/c/284560/1</a>)


</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"">That said, there's another option that would all=
ow you to side-step both
of the above problems at the same time. If you turn the common code into
a helper library that should give you enough flexibility to integrate it
into all existing users. For example you could leave out the connector
registration and let the drivers do that. Similarly since the helpers
are only hooked up at registration time you could probably find a way to
share the low-level code but again leave it up to the drivers to glue it
all together at registration time (drivers could wrap the low-level code
with atomic or non-atomic callbacks).
</pre>
        </blockquote>
        <pre wrap=3D"">
Wow, sounds good, but I'm not sure I understand this rightly. Do you
mean that I could support two kinds of callbacks in analogix_dp_core
driver, and export them out. And move the connector registration code
into the helper driver (like exynos_dp.c), so helper driver could chose t=
o
use the atomic or non-atomic callbacks. like:

-- analogix_dp_core.c
--------------------------------------------------------------------
...
struct drm_connector_funcs analogix_dp_connector_atomic_funcs =3D {
        .dpms =3D drm_atomic_helper_connector_dpms,
        .fill_modes =3D drm_helper_probe_single_connector_modes,
        .detect =3D analogix_dp_detect,
        .destroy =3D analogix_dp_connector_destroy,
        .reset =3D drm_atomic_helper_connector_reset,
        .atomic_duplicate_state =3D
drm_atomic_helper_connector_duplicate_state,
        .atomic_destroy_state =3D drm_atomic_helper_connector_destroy_sta=
te,
};
EXPORT_SYMBOL(analogix_dp_connector_atomic_funcs);

struct drm_connector_funcs analogix_dp_connector_funcs =3D {
        .dpms =3D drm_helper_connector_dpms,
        .fill_modes =3D drm_helper_probe_single_connector_modes,
        .detect =3D analogix_dp_detect,
        .destroy =3D analogix_dp_connector_destroy,
};
EXPORT_SYMBOL(analogix_dp_connector_funcs);

struct drm_connector_helper_funcs analogix_dp_connector_helper_funcs =3D =
{
        .get_modes =3D analogix_dp_get_modes,
        .best_encoder =3D analogix_dp_best_encoder,
};
EXPORT_SYMBOL(analogix_dp_connector_helper_funcs);
...

-- exynos_dp
-------------------------------------------------------------------------=
---
        ret =3D drm_connector_init(dp-&gt;drm_dev, connector,
&amp;analogix_dp_connector_atomic_funcs,
                                 DRM_MODE_CONNECTOR_eDP);
        if (ret) {
                DRM_ERROR("Failed to initialize connector with drm\n");
                return ret;
        }

        drm_connector_helper_add(connector,
&amp;analogix_dp_connector_helper_funcs);
        drm_connector_register(connector);
        drm_mode_connector_attach_encoder(connector, encoder);

-- analogix_dp-rockchip
-------------------------------------------------------------------------=
---
        ret =3D drm_connector_init(dp-&gt;drm_dev, connector,
                                 &amp;analogix_dp_connector_funcs,
                                 DRM_MODE_CONNECTOR_eDP);
        if (ret) {
                DRM_ERROR("Failed to initialize connector with drm\n");
                return ret;
        }

        drm_connector_helper_add(connector,
&amp;analogix_dp_connector_helper_funcs);
        drm_mode_connector_attach_encoder(connector, encoder);


Are those code corresponding to your suggestion.   :)
</pre>
      </blockquote>
      <pre wrap=3D"">
Yes, that looks about right. You could also move the implementations
into the Exynos and Rockchip drivers, respectively, if they're only used
from one place. Then you can simply export the low-level analogix_dp_*()
functions. That might give you even more flexibility, but the above
would probably work well enough.
</pre>
    </blockquote>
    <br>
    Wow, much better, so I just need to export two low-level functions,<b=
r>
    <ul>
      <li>analogix_dp_detect()</li>
      <li>analogix_dp_get_modes()</li>
    </ul>
    Pretty cool.<br>
    <br>
    Thanks,<br>
    - Yakir <br>
    <br>
    <blockquote cite=3D"mid:20150921112246.GD20992@ulmo.nvidia.com"
      type=3D"cite">
      <pre wrap=3D"">
Thierry
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------090204000209030106030501--


--===============1133958622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1133958622==--
