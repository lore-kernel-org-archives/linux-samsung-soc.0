From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v5 05/17] drm: bridge: analogix/dp: dynamic parse sync_pol
 & interlace & dynamic_range
Date: Wed, 30 Sep 2015 16:20:03 +0800
Message-ID: <560B9B33.2060409@rock-chips.com>
References: <1442906428-2609-1-git-send-email-ykk@rock-chips.com>
 <1442907477-3283-1-git-send-email-ykk@rock-chips.com>
 <560B73D4.30109@samsung.com> <560B8CF1.7050102@rock-chips.com>
 <560B9075.1000304@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0700629068=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <560B9075.1000304@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>, Thierry Reding <treding@nvidia.com>, joe@perches.com, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, emil.l.velikov@gmail.com, dianders@chromium.org, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org, Kumar Gala <galak@codeaurora.org>, ajaynumb@gmail.com, robherring2@gmail.com, Andy Yan <andy.yan@rock-chips.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============0700629068==
Content-Type: multipart/alternative;
 boundary="------------060104040801090205080705"

This is a multi-part message in MIME format.
--------------060104040801090205080705
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 09/30/2015 03:34 PM, Krzysztof Kozlowski wrote:
> On 30.09.2015 16:19, Yakir Yang wrote:
>> Hi Krzysztof,
>>
>> On 09/30/2015 01:32 PM, Krzysztof Kozlowski wrote:
>>> On 22.09.2015 16:37, Yakir Yang wrote:
>>>> Both hsync/vsync polarity and interlace mode can be parsed from
>>>> drm display mode, and dynamic_range and ycbcr_coeff can be judge
>>>> by the video code.
>>>>
>>>> But presumably Exynos still relies on the DT properties, so take
>>>> good use of mode_fixup() in to achieve the compatibility hacks.
>>>>
>>>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>>>> ---
>>>> Changes in v5:
>>>> - Switch video timing type to "u32", so driver could use "of_property_read_u32"
>>>>    to get the backword timing values.
>>> Okay
>>>
>>>> Krzysztof suggest me that driver could use
>>>>    the "of_property_read_bool" to get backword timing values, but that interfacs
>>>>    would modify the original drm_display_mode timing directly (whether those
>>>>    properties exists or not).
>>> Hmm, I don't understand. You have a:
>>> 	struct video_info {
>>> 		bool h_sync_polarity;
>>> 		bool v_sync_polarity;
>>> 		bool interlaced;
>>> 	};
>>>
>>> so what is wrong with:
>>> 	dp_video_config->h_sync_polarity =
>>> 		of_property_read_bool(dp_node, "hsync-active-high");
>>>
>>> Is it exactly the same binding as previously?
>> Yes, it is the same binding as previously. But just a note that we already
>> mark those DT binding as deprecated.
>>
>> +-interlaced:            deprecated prop that can parsed frm drm_display_mode.
>> +-vsync-active-high:     deprecated prop that can parsed frm drm_display_mode.
>> +-hsync-active-high:     deprecated prop that can parsed frm drm_display_mode.
>>
>>
>> For now those values should come from "struct drm_display_mode",
>> and we already parsed them out from "drm_display_mode" before
>> driver provide the backward compatibility.
>>
>> Let's used the "hsync-active-high" example:
>>      As for now the code would like:
>>      static void analogix_dp_bridge_mode_set(...)
>>      {
>>          // Parsed timing value from "drm_display_mode"
>>          video->h_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);
>>
>>          // Try to detect the deprecated property, providing
>>          // the backward compatibility
>>          of_property_read_u32(dp_node, "hsync-active-high",
>>                                   &video->h_sync_polarity);
>>
>>          /*
>>           * In this case, if "hsync-active-high" property haven't been
>>           * found, then the video timing "h_sync_polarity" would  keep
>>           * no change, keeping the parsed value from "drm_display_mode"
>>           */
>>      }
>>
>>      But if keep the "of_property_read_bool", then code would like:
>>      static void analogix_dp_bridge_mode_set(...)
>>      {
>>          // Parsed timing value from "drm_display_mode"
>>          video->h_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);
>>
>>          // Try to detect the deprecated property, providing
>>          // the backward compatibility
>>          video->h_sync_polarity =
>>                      of_property_read_bool(dp_node, "hsync-active-high");
>>     
>>
>>          /*
>>           * In this case, if "hsync-active-high" property haven't been
>>           * found, then the video timing "h_sync_polarity" would just
>>           * modify to "false". That is the place we don't want, cause
>>           * it would always modify the timing value parsed from
>>           * "drm_display_mode"
>>           */
>>      }
>>
> OK, I see the point of overwriting values from drm_display_mode. However
> I think you changed the binding. I believe the of_property_read_u32()
> will behave differently for such DTS:
>
> exynos_dp {
> 	...
> 	hsync-active-high;
> }
>
> It will return -EOVERFLOW which means it would be broken now...

Whoops, thanks for your remind, after try that, I do see over flow error.
static void *of_find_property_value_of_size(const struct device_node *np,
                         const char *propname, u32 len)
{
         ....
         if (len > prop->length)
                 return ERR_PTR(-EOVERFLOW);
         ...
}

So I though code should be:
     if (of_property_read_bool(dp_node, "hsync-active-high"))
         video->h_sync_polarity = true;

And we can't provide full backward compatibility for this property, cause
the previous exynos_dp driver would set this timing value to "false" when
property not defined, but analogix_dp driver keep this timing value
corresponding to "drm_display_mode" when property not found.


Thanks,
- Yakir

> Best regards,
> Krzysztof
>
>
>
>
>


--------------060104040801090205080705
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dwindows-1252"
      http-equiv=3D"Content-Type">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Hi Krzysztof,<br>
    <br>
    <div class=3D"moz-cite-prefix">On 09/30/2015 03:34 PM, Krzysztof
      Kozlowski wrote:<br>
    </div>
    <blockquote cite=3D"mid:560B9075.1000304@samsung.com" type=3D"cite">
      <pre wrap=3D"">On 30.09.2015 16:19, Yakir Yang wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">Hi Krzysztof,

On 09/30/2015 01:32 PM, Krzysztof Kozlowski wrote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"">On 22.09.2015 16:37, Yakir Yang wrote:
</pre>
          <blockquote type=3D"cite">
            <pre wrap=3D"">Both hsync/vsync polarity and interlace mode c=
an be parsed from
drm display mode, and dynamic_range and ycbcr_coeff can be judge
by the video code.

But presumably Exynos still relies on the DT properties, so take
good use of mode_fixup() in to achieve the compatibility hacks.

Signed-off-by: Yakir Yang <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:ykk@rock-chips.com">&lt;ykk@rock-chips.com&gt;</a>
---
Changes in v5:
- Switch video timing type to "u32", so driver could use "of_property_rea=
d_u32"
  to get the backword timing values.=20
</pre>
          </blockquote>
          <pre wrap=3D"">Okay

</pre>
          <blockquote type=3D"cite">
            <pre wrap=3D"">Krzysztof suggest me that driver could use
  the "of_property_read_bool" to get backword timing values, but that int=
erfacs
  would modify the original drm_display_mode timing directly (whether tho=
se
  properties exists or not).
</pre>
          </blockquote>
          <pre wrap=3D"">Hmm, I don't understand. You have a:
	struct video_info {
		bool h_sync_polarity;
		bool v_sync_polarity;
		bool interlaced;
	};

so what is wrong with:
	dp_video_config-&gt;h_sync_polarity =3D
		of_property_read_bool(dp_node, "hsync-active-high");

Is it exactly the same binding as previously?
</pre>
        </blockquote>
        <pre wrap=3D"">
Yes, it is the same binding as previously. But just a note that we alread=
y
mark those DT binding as deprecated.

+-interlaced:            deprecated prop that can parsed frm drm_display_=
mode.
+-vsync-active-high:     deprecated prop that can parsed frm drm_display_=
mode.
+-hsync-active-high:     deprecated prop that can parsed frm drm_display_=
mode.


For now those values should come from "struct drm_display_mode",
and we already parsed them out from "drm_display_mode" before
driver provide the backward compatibility.

Let's used the "hsync-active-high" example:
    As for now the code would like:
    static void analogix_dp_bridge_mode_set(...)
    {
        // Parsed timing value from "drm_display_mode"
        video-&gt;h_sync_polarity =3D !!(mode-&gt;flags &amp; DRM_MODE_FL=
AG_NHSYNC);

        // Try to detect the deprecated property, providing
        // the backward compatibility
        of_property_read_u32(dp_node, "hsync-active-high",
                                 &amp;video-&gt;h_sync_polarity);   =20

        /*
         * In this case, if "hsync-active-high" property haven't been
         * found, then the video timing "h_sync_polarity" would  keep
         * no change, keeping the parsed value from "drm_display_mode"
         */    =20
    }  =20

    But if keep the "of_property_read_bool", then code would like:
    static void analogix_dp_bridge_mode_set(...)
    {
        // Parsed timing value from "drm_display_mode"
        video-&gt;h_sync_polarity =3D !!(mode-&gt;flags &amp; DRM_MODE_FL=
AG_NHSYNC);

        // Try to detect the deprecated property, providing
        // the backward compatibility
        video-&gt;h_sync_polarity =3D
                    of_property_read_bool(dp_node, "hsync-active-high");
  =20

        /*
         * In this case, if "hsync-active-high" property haven't been
         * found, then the video timing "h_sync_polarity" would just
         * modify to "false". That is the place we don't want, cause
         * it would always modify the timing value parsed from
         * "drm_display_mode"
         */ =20
    }  =20

</pre>
      </blockquote>
      <pre wrap=3D"">
OK, I see the point of overwriting values from drm_display_mode. However
I think you changed the binding. I believe the of_property_read_u32()
will behave differently for such DTS:

exynos_dp {
	...
	hsync-active-high;
}

It will return -EOVERFLOW which means it would be broken now...
</pre>
    </blockquote>
    <br>
    Whoops, thanks for your remind, after try that, I do see over flow
    error. <br>
    <small>static void *of_find_property_value_of_size(const struct
      device_node *np,<br>
      =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 const char *propname, u32 len)<br>
      {<br>
      =A0=A0=A0 =A0=A0=A0 ....<br>
      =A0=A0=A0=A0=A0=A0=A0 if (len &gt; prop-&gt;length)<br>
      =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ERR_PTR(-EOVER=
FLOW);<br>
      =A0=A0=A0 =A0=A0=A0 ...<br>
      }<br>
    </small><br>
    So I though code should be:<br>
    =A0=A0=A0 if (of_property_read_bool(dp_node, "hsync-active-high"))<br=
>
    =A0=A0=A0 =A0=A0=A0 video-&gt;h_sync_polarity =3D true;<br>
    <br>
    And we can't provide full backward compatibility for this property,
    cause<br>
    the previous exynos_dp driver would set this timing value to "false"
    when<br>
    property not defined, but analogix_dp driver keep this timing value<b=
r>
    corresponding to "drm_display_mode" when property not found.<br>
    <br>
    <br>
    Thanks,<br>
    - Yakir<br>
    <br>
    <blockquote cite=3D"mid:560B9075.1000304@samsung.com" type=3D"cite">
      <pre wrap=3D"">
Best regards,
Krzysztof





</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------060104040801090205080705--


--===============0700629068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0700629068==--
