From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v1 2/2] drm/bridge: analogix_dp: turn off the panel when
 eDP need to disable
Date: Fri, 22 Jul 2016 09:00:01 +0800
Message-ID: <57917011.6000108@rock-chips.com>
References: <1469106874-4912-1-git-send-email-ykk@rock-chips.com>
 <1469106886-4979-1-git-send-email-ykk@rock-chips.com>
 <CAOw6vbK7CnFwH_Tyrq6ab4DBxVLa8-JCYEM-Tu+mOYsKmNULtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1366488861=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAOw6vbK7CnFwH_Tyrq6ab4DBxVLa8-JCYEM-Tu+mOYsKmNULtg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sean Paul <seanpaul@chromium.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org, Mark Yao <yzq@rock-chips.com>, Jingoo Han <jingoohan1@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>, Douglas Anderson <dianders@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, Tomasz Figa <tfiga@chromium.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, Thierry Reding <treding@nvidia.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============1366488861==
Content-Type: multipart/alternative;
 boundary="------------030503050201010402000606"

This is a multi-part message in MIME format.
--------------030503050201010402000606
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Sean,

Thanks for your fast respond :-)

But this patch is not the latest one, I have upgraded this to "v1.1" 
version to fix the eDP can't be disabled problem:
     [PATCH v1.1 2/2] drm/bridge: analogix_dp: turn off the panel when 
eDP need to disable
         Changes in v1.1: - unprepare the panel at the end of 
bridge->disable() function

In spite of this, I would take your comments with my "v1.1" patch.

On 07/21/2016 10:28 PM, Sean Paul wrote:
> On Thu, Jul 21, 2016 at 9:14 AM, Yakir Yang <ykk@rock-chips.com> wrote:
>> Some panels (like Sharp LQ123P1JX31) need to be turn off when eDP
>> controller stop to send valid video signal, otherwhise panel would
>> go burn in, and keep flicker and flicker.
>>
>> So it's better to turn off the panel when eDP need to disable, and
>> we need to turn on the panel in connector->detect() callback, so
>> that driver would detect panel status rightly.
>>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>> ---
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 18 ++++++++++--------
>>   1 file changed, 10 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 32715da..ea059b3 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -961,6 +961,14 @@ analogix_dp_detect(struct drm_connector *connector, bool force)
>>   {
>>          struct analogix_dp_device *dp = to_dp(connector);
>>
>> +       /*
>> +        * Panle would prepare for several times here, but don't worry it
> s/Panle/Panel/

Done

>> +        * would only enable the hardware at the first prepare time.
>
> Errr, this shouldn't go in detect. How about putting this in
> bridge_enable instead?

Nope, if we put this in bridge_enable, then eDP would never be enabled. 
Here're the calling flow.

--> analogix_dp_probe
   --> analogix_dp_bind  # we still haven't prepared the panel here, 
that means panel have been powered up
     --> analogix_dp_detect  # Oops, losing panel valid hotplug signal, 
cause panel have been powered up
     --> ** Keep detecting **

>> +        */
>> +       if (dp->plat_data->panel)
>> +               if (drm_panel_prepare(dp->plat_data->panel))
> Personally, I don't like doing work in a conditional since you're
> throwing the return code away. Could you break this out into:
>
> ret = drm_panel_prepare(dp->plat_data->panel);
> if (ret)
>    DRM_ERROR("failed to setup the panel ret=%d\n", ret);

Okay

>
>> +                       DRM_ERROR("failed to setup the panel\n");
>> +
>>          if (analogix_dp_detect_hpd(dp))
>>                  return connector_status_disconnected;
>>
>> @@ -1063,7 +1071,8 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
>>                  return;
>>
>>          if (dp->plat_data->panel) {
>> -               if (drm_panel_disable(dp->plat_data->panel)) {
>> +               if (drm_panel_disable(dp->plat_data->panel) ||
>> +                   drm_panel_unprepare(dp->plat_data->panel)) {
> Same comment here, please break this out into separate statements for
> better readability/logging.

Okay,


Thanks,
- Yakir

>
>>                          DRM_ERROR("failed to disable the panel\n");
>>                          return;
>>                  }
>> @@ -1333,13 +1342,6 @@ int analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
>>
>>          phy_power_on(dp->phy);
>>
>> -       if (dp->plat_data->panel) {
>> -               if (drm_panel_prepare(dp->plat_data->panel)) {
>> -                       DRM_ERROR("failed to setup the panel\n");
>> -                       return -EBUSY;
>> -               }
>> -       }
>> -
>>          analogix_dp_init_dp(dp);
>>
>>          ret = devm_request_threaded_irq(&pdev->dev, dp->irq,
>> --
>> 1.9.1
>>
>>
>
>


--------------030503050201010402000606
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Sean,<br>
    <br>
    Thanks for your fast respond :-)<br>
    <br>
    But this patch is not the latest one, I have upgraded this to "v1.1"
    version to fix the eDP can't be disabled problem:<br>
    =C2=A0=C2=A0=C2=A0 [PATCH v1.1 2/2] drm/bridge: analogix_dp: turn off=
 the panel
    when eDP need to disable<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Changes in v1.1:
    - unprepare the panel at the end of bridge-&gt;disable() function<br>
    <br>
    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf=
-8">
    In spite of this, I would take your comments with my "v1.1" patch.=C2=
=A0
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 07/21/2016 10:28 PM, Sean Paul
      wrote:<br>
    </div>
    <blockquote
cite=3D"mid:CAOw6vbK7CnFwH_Tyrq6ab4DBxVLa8-JCYEM-Tu+mOYsKmNULtg@mail.gmai=
l.com"
      type=3D"cite">
      <pre wrap=3D"">On Thu, Jul 21, 2016 at 9:14 AM, Yakir Yang <a class=
=3D"moz-txt-link-rfc2396E" href=3D"mailto:ykk@rock-chips.com">&lt;ykk@roc=
k-chips.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">Some panels (like Sharp LQ123P1JX31) need to be tu=
rn off when eDP
controller stop to send valid video signal, otherwhise panel would
go burn in, and keep flicker and flicker.

So it's better to turn off the panel when eDP need to disable, and
we need to turn on the panel in connector-&gt;detect() callback, so
that driver would detect panel status rightly.

Signed-off-by: Yakir Yang <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:ykk@rock-chips.com">&lt;ykk@rock-chips.com&gt;</a>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 18 ++++++++++------=
--
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
index 32715da..ea059b3 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -961,6 +961,14 @@ analogix_dp_detect(struct drm_connector *connector, =
bool force)
 {
        struct analogix_dp_device *dp =3D to_dp(connector);

+       /*
+        * Panle would prepare for several times here, but don't worry it
</pre>
      </blockquote>
      <pre wrap=3D"">
s/Panle/Panel/
</pre>
    </blockquote>
    <br>
    Done<br>
    <br>
    <blockquote
cite=3D"mid:CAOw6vbK7CnFwH_Tyrq6ab4DBxVLa8-JCYEM-Tu+mOYsKmNULtg@mail.gmai=
l.com"
      type=3D"cite">
      <pre wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">+        * would only enable the hardware at the f=
irst prepare time.
</pre>
      </blockquote>
      <pre wrap=3D"">

Errr, this shouldn't go in detect. How about putting this in
bridge_enable instead?
</pre>
    </blockquote>
    <br>
    Nope, if we put this in bridge_enable, then eDP would never be
    enabled. Here're the calling flow.<br>
    <br>
    --&gt; analogix_dp_probe<br>
    =C2=A0 --&gt; analogix_dp_bind=C2=A0 # we still haven't prepared the =
panel
    here, that means panel have been powered up<br>
    =C2=A0=C2=A0=C2=A0 --&gt; analogix_dp_detect=C2=A0 # Oops, losing pan=
el valid hotplug
    signal, cause panel have been powered up<br>
    =C2=A0=C2=A0=C2=A0 --&gt; ** Keep detecting **<br>
    <br>
    <blockquote
cite=3D"mid:CAOw6vbK7CnFwH_Tyrq6ab4DBxVLa8-JCYEM-Tu+mOYsKmNULtg@mail.gmai=
l.com"
      type=3D"cite">
      <pre wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">+        */
+       if (dp-&gt;plat_data-&gt;panel)
+               if (drm_panel_prepare(dp-&gt;plat_data-&gt;panel))
</pre>
      </blockquote>
      <pre wrap=3D"">
Personally, I don't like doing work in a conditional since you're
throwing the return code away. Could you break this out into:

ret =3D drm_panel_prepare(dp-&gt;plat_data-&gt;panel);
if (ret)
  DRM_ERROR("failed to setup the panel ret=3D%d\n", ret);</pre>
    </blockquote>
    <br>
    Okay<br>
    <br>
    <blockquote
cite=3D"mid:CAOw6vbK7CnFwH_Tyrq6ab4DBxVLa8-JCYEM-Tu+mOYsKmNULtg@mail.gmai=
l.com"
      type=3D"cite">
      <pre wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">+                       DRM_ERROR("failed to setup=
 the panel\n");
+
        if (analogix_dp_detect_hpd(dp))
                return connector_status_disconnected;

@@ -1063,7 +1071,8 @@ static void analogix_dp_bridge_disable(struct drm_b=
ridge *bridge)
                return;

        if (dp-&gt;plat_data-&gt;panel) {
-               if (drm_panel_disable(dp-&gt;plat_data-&gt;panel)) {
+               if (drm_panel_disable(dp-&gt;plat_data-&gt;panel) ||
+                   drm_panel_unprepare(dp-&gt;plat_data-&gt;panel)) {
</pre>
      </blockquote>
      <pre wrap=3D"">
Same comment here, please break this out into separate statements for
better readability/logging.</pre>
    </blockquote>
    <br>
    Okay, <br>
    <br>
    <br>
    Thanks,<br>
    - Yakir<br>
    <br>
    <blockquote
cite=3D"mid:CAOw6vbK7CnFwH_Tyrq6ab4DBxVLa8-JCYEM-Tu+mOYsKmNULtg@mail.gmai=
l.com"
      type=3D"cite">
      <pre wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">                        DRM_ERROR("failed to disab=
le the panel\n");
                        return;
                }
@@ -1333,13 +1342,6 @@ int analogix_dp_bind(struct device *dev, struct dr=
m_device *drm_dev,

        phy_power_on(dp-&gt;phy);

-       if (dp-&gt;plat_data-&gt;panel) {
-               if (drm_panel_prepare(dp-&gt;plat_data-&gt;panel)) {
-                       DRM_ERROR("failed to setup the panel\n");
-                       return -EBUSY;
-               }
-       }
-
        analogix_dp_init_dp(dp);

        ret =3D devm_request_threaded_irq(&amp;pdev-&gt;dev, dp-&gt;irq,
--
1.9.1


</pre>
      </blockquote>
      <pre wrap=3D"">


</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------030503050201010402000606--


--===============1366488861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1366488861==--
