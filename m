From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v5 0/17] Add Analogix Core Display Port Driver
Date: Wed, 07 Oct 2015 19:05:15 +0800
Message-ID: <5614FC6B.4080702@rock-chips.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1442906428-2609-1-git-send-email-ykk@rock-chips.com>
 <5614BADD.1070307@rock-chips.com> <5614DBE2.6080102@osg.samsung.com>
 <5614DFBC.8060105@rock-chips.com> <5614E553.6060108@osg.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1028182125=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5614E553.6060108@osg.samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Javier Martinez Canillas <javier@osg.samsung.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>, Thierry Reding <treding@nvidia.com>, joe@perches.com, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, emil.l.velikov@gmail.com, dianders@chromium.org, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org, Kumar Gala <galak@codeaurora.org>, ajaynumb@gmail.com, robherring2@gmail.com, Andy Yan <andy.yan@rock-chips.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============1028182125==
Content-Type: multipart/alternative;
 boundary="------------040407000308030704080101"

This is a multi-part message in MIME format.
--------------040407000308030704080101
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Javier,

On 10/07/2015 05:26 PM, Javier Martinez Canillas wrote:
> Hello Yakir,
>
> On 10/07/2015 11:02 AM, Yakir Yang wrote:
>> Hi Javier,
>>
>> On 10/07/2015 04:46 PM, Javier Martinez Canillas wrote:
>>> Hello Yakir,
>>>
>>> On 10/07/2015 08:25 AM, Yakir Yang wrote:
>>>> Hi all,
>>>>
>>>> Friendly ping.....   :)
>>>>
>>>>
>>>> Best regards,
>>>> - Yakir
>>>>
>>>>
>>> Do you have a tree that I can use to test these patches?
>> Wow, thanks a lot, I do have a tree on github [https://github.com/yakir-Yang/linux/tree/analogix_dp],
>> crossing my finger, wish things works......    ;)
>>
> I tried your analogix_dp branch on an Exynos5800 Peach Pi Chromebook
> but the machine didn't boot. Unfortunately I need to do some soldering
> to have a serial console on this board so don't have a kernel boot log.
>
> I'll let you know if I can get more info about this issue.

Whoops, sorry for the failed, much appreciated for your works.

Besides, I thought maybe I can find a Peach Pit Chromebook in my side,
I remember that some of our guys have brought one, but previously I
thought that mainline kernel wouldn't run on Peach Pit directly.

Maybe you can email me the method the run mainline kernel on Peach
Pit, so I can debug the analogix_dp driver at the same time, that would
be great.
> Also, there is Kconfig recursive dependency that you may want to fix:
>
> $ make exynos_defconfig
> drivers/video/fbdev/Kconfig:5:error: recursive dependency detected!
> drivers/video/fbdev/Kconfig:5: symbol FB is selected by DRM_KMS_FB_HELPER
> drivers/gpu/drm/Kconfig:34: symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
> drivers/gpu/drm/Kconfig:28: symbol DRM_KMS_HELPER is selected by DRM_ANALOGIX_DP
> drivers/gpu/drm/bridge/analogix/Kconfig:1: symbol DRM_ANALOGIX_DP is selected by DRM_EXYNOS_DP
> drivers/gpu/drm/exynos/Kconfig:57: symbol DRM_EXYNOS_DP depends on DRM_EXYNOS_FIMD
> drivers/gpu/drm/exynos/Kconfig:19: symbol DRM_EXYNOS_FIMD depends on FB_S3C
> drivers/video/fbdev/Kconfig:2023: symbol FB_S3C depends on FB
>   

Yeah, recursive dependency detected, guess I should remove the
"DRM_KMS_HELPER" from bridge analogix_dp Kconfig file, thanks
for your remind.

--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -1,4 +1,3 @@
  config DRM_ANALOGIX_DP
         tristate
         depends on DRM
-       select DRM_KMS_HELPER


Thanks,
- Yakir
>> Thanks,
>> - Yakir
>>
> Best regards,


--------------040407000308030704080101
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dwindows-1252"
      http-equiv=3D"Content-Type">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Hi Javier,<br>
    <br>
    <div class=3D"moz-cite-prefix">On 10/07/2015 05:26 PM, Javier Martine=
z
      Canillas wrote:<br>
    </div>
    <blockquote cite=3D"mid:5614E553.6060108@osg.samsung.com" type=3D"cit=
e">
      <pre wrap=3D"">Hello Yakir,

On 10/07/2015 11:02 AM, Yakir Yang wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">Hi Javier,

On 10/07/2015 04:46 PM, Javier Martinez Canillas wrote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"">Hello Yakir,

On 10/07/2015 08:25 AM, Yakir Yang wrote:
</pre>
          <blockquote type=3D"cite">
            <pre wrap=3D"">Hi all,

Friendly ping.....   :)


Best regards,
- Yakir


</pre>
          </blockquote>
          <pre wrap=3D"">Do you have a tree that I can use to test these =
patches?
</pre>
        </blockquote>
        <pre wrap=3D"">
Wow, thanks a lot, I do have a tree on github [<a class=3D"moz-txt-link-f=
reetext" href=3D"https://github.com/yakir-Yang/linux/tree/analogix_dp">ht=
tps://github.com/yakir-Yang/linux/tree/analogix_dp</a>],
crossing my finger, wish things works......    ;)

</pre>
      </blockquote>
      <pre wrap=3D"">
I tried your analogix_dp branch on an Exynos5800 Peach Pi Chromebook
but the machine didn't boot. Unfortunately I need to do some soldering
to have a serial console on this board so don't have a kernel boot log.

I'll let you know if I can get more info about this issue.</pre>
    </blockquote>
    <br>
    Whoops, sorry for the failed, much appreciated for your works.<br>
    <br>
    Besides, I thought maybe I can find a Peach Pit Chromebook in my
    side,<br>
    I remember that some of our guys have brought one, but previously I<b=
r>
    thought that mainline kernel wouldn't run on Peach Pit directly.<br>
    <br>
    Maybe you can email me the method the run mainline kernel on Peach<br=
>
    Pit, so I can debug the analogix_dp driver at the same time, that
    would<br>
    be great.<br>
    =A0
    <meta http-equiv=3D"content-type" content=3D"text/html;
      charset=3Dwindows-1252">
    <blockquote cite=3D"mid:5614E553.6060108@osg.samsung.com" type=3D"cit=
e">
      <pre wrap=3D"">
Also, there is Kconfig recursive dependency that you may want to fix:

$ make exynos_defconfig
drivers/video/fbdev/Kconfig:5:error: recursive dependency detected!
drivers/video/fbdev/Kconfig:5: symbol FB is selected by DRM_KMS_FB_HELPER
drivers/gpu/drm/Kconfig:34: symbol DRM_KMS_FB_HELPER depends on DRM_KMS_H=
ELPER
drivers/gpu/drm/Kconfig:28: symbol DRM_KMS_HELPER is selected by DRM_ANAL=
OGIX_DP
drivers/gpu/drm/bridge/analogix/Kconfig:1: symbol DRM_ANALOGIX_DP is sele=
cted by DRM_EXYNOS_DP
drivers/gpu/drm/exynos/Kconfig:57: symbol DRM_EXYNOS_DP depends on DRM_EX=
YNOS_FIMD
drivers/gpu/drm/exynos/Kconfig:19: symbol DRM_EXYNOS_FIMD depends on FB_S=
3C
drivers/video/fbdev/Kconfig:2023: symbol FB_S3C depends on FB
 </pre>
    </blockquote>
    <br>
    Yeah, recursive dependency detected, guess I should remove the<br>
    "DRM_KMS_HELPER" from bridge analogix_dp Kconfig file, thanks<br>
    for your remind.<br>
    <br>
    --- a/drivers/gpu/drm/bridge/analogix/Kconfig<br>
    +++ b/drivers/gpu/drm/bridge/analogix/Kconfig<br>
    @@ -1,4 +1,3 @@<br>
    =A0config DRM_ANALOGIX_DP<br>
    =A0=A0=A0=A0=A0=A0=A0 tristate<br>
    =A0=A0=A0=A0=A0=A0=A0 depends on DRM<br>
    -=A0=A0=A0=A0=A0=A0 select DRM_KMS_HELPER<br>
    <br>
    <br>
    Thanks,<br>
    - Yakir<br>
    <blockquote cite=3D"mid:5614E553.6060108@osg.samsung.com" type=3D"cit=
e">
      <pre wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">Thanks,
- Yakir

</pre>
      </blockquote>
      <pre wrap=3D"">
Best regards,
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------040407000308030704080101--


--===============1028182125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1028182125==--
