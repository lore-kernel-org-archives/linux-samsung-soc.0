From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v2 4/8] drm: rockchip/dp: add rockchip platform dp driver
Date: Wed, 19 Aug 2015 18:23:39 +0800
Message-ID: <55D4592B.2000704@rock-chips.com>
References: <1438943674-18191-1-git-send-email-ykk@rock-chips.com>
 <1438944380-18897-1-git-send-email-ykk@rock-chips.com>
 <1730542.s7otqjtiXD@diego> <55C57D7E.6080800@rock-chips.com>
 <20150810100055.GB7850@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2032496654=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150810100055.GB7850@ulmo.nvidia.com>
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
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, seanpaul@google.com, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Ajay Kumar <ajaykumar.rs@samsung.com>, linux-arm-ker@NULL.NULL, linux-samsung-soc@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Russell King <rmk+kernel@arm.linux.org.uk>, dianders@google.com, ajaynumb@gmail.com, Fabio Estevam <fabio.estevam@freescale.com>, nel@lists.infradead.org, Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, djkurtz@google.com, joe@perches.com, Andy Yan <andy.yan@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============2032496654==
Content-Type: multipart/alternative;
 boundary="------------060409070306030501020306"

This is a multi-part message in MIME format.
--------------060409070306030501020306
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Thierry

When I'm preparing v3 series, I meet some trobules from your comment,=20
wish you could give some advise?  ;)

=E5=9C=A8 2015/8/10 18:00, Thierry Reding =E5=86=99=E9=81=93:
> On Sat, Aug 08, 2015 at 11:54:38AM +0800, Yakir Yang wrote:
> [...]
>>          edp: edp@ff970000 {
> [...]
>>                  samsung,color-space =3D <0>;
>>                  samsung,dynamic-range =3D <0>;
>>                  samsung,ycbcr-coeff =3D <0>;
> I think these should also come from EDID, though I'm not sure if we
> store this in internal data structures yet.
>
>>                  samsung,color-depth =3D <1>;
> This is probably drm_display_info.bpc.
"samsung,color_space" and "samsung,color-depth"

The drm_display_info's color_formats and bpc indicate the monitor=20
display ability, but
the edp driver could not take it as input video format directly.

For example, with my DP TV I would found "RGB444 & YCRCB422 & & YCRCB444"
support in drm_display_info.color_formats and 16bit bpc support, but=20
RK3288 crtc
driver could only output RGB & ITU formats, so finally=20
analogix_dp-rockchip driver
config crtc to RGBaaa 10bpc mode.

In this sutiation, the analogix_dp core driver would pazzled by the=20
drm_display_info,
can't chose the right color_space and bpc.

And this is the place that confused me, wish you could give some ideas=20
about this one :-)
-------------------------------------------------------------------------=
------------------------

Besides, The dynamic_range and ycbcr_coeff haven't been record in=20
drm_display_info, but
I though we can parse it by the video code.

The dynamic_range would have two values "CEA range" and "VESA range", so=20
I though if
the currect mode have a no-zero vic (drm_match_cea_mode()) then config=20
it to "CEA range",
otherwhise config it to "VESA range".

YCbCr Coefficients would have two values "ITU709" and "ITU601". I see=20
dw_hdmi driver have
been set the colorimetry to ITU_601 when vic is 6/7/21/22/2/3/17/18, I=20
thouht we can stole this
to analogix_dp driver.

    /* dynamic_range & colorimetry */
         vic =3D drm_match_cea_mode(mode);
         if ((vic =3D=3D 6) || (vic =3D=3D 7) || (vic =3D=3D 21) || (vic =
=3D=3D 22) ||
             (vic =3D=3D 2) || (vic =3D=3D 3) || (vic =3D=3D 17) || (vic =
=3D=3D 18)) {
                 video_info->dynamic_range =3D CEA;
                 video_info->ycbcr_coeff =3D COLOR_YCBCR601;
         } else if (vic) {
                 video_info->dynamic_range =3D CEA;
                 video_info->ycbcr_coeff =3D COLOR_YCBCR709;
         } else {
                 video_info->dynamic_range =3D VESA;
                 video_info->ycbcr_coeff =3D COLOR_YCBCR709;
         }

I'm not sure whether this is right, also wish you could give some=20
suggests ;)


>>                  samsung,link-rate =3D <0x0a>;
>>                  samsung,lane-count =3D <1>;
> And these should really be derived from values in the DPCD and adjusted
> (if necessary) during link training.
>
> Why would you ever want to hard-code the above?
>

And I though we should keep those DT properties now. I try to remove=20
those DT
property, so analogix dp driver would always use the max link_rate and=20
lane_count
which read from dpcd. For my 2K DP TV, link rate would reach to 5.4Gbps,=20
lane cout
would reach 4 lances, if so analogix dp driver could not light my DP TV=20
up any more.

After that I found that RK3288 eDP TRM have indicated some limites about=20
those
that RK3288 only support 4 physical lanes of 2.7/1.62 Gbps/lane, which=20
means 5.4Gbps
link rate is too high for RK3288.

So I think we could treate them as hardware max values, is it okay?

Thanks,
- Yakir

--------------060409070306030501020306
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Hi Thierry<br>
    <br>
    When I'm preparing v3 series, I meet some trobules from your
    comment, wish you could give some advise?=C2=A0 ;)<br>
    <br>
    <div class=3D"moz-cite-prefix">=E5=9C=A8 2015/8/10 18:00, Thierry Red=
ing =E5=86=99=E9=81=93:<br>
    </div>
    <blockquote cite=3D"mid:20150810100055.GB7850@ulmo.nvidia.com"
      type=3D"cite">
      <pre wrap=3D"">On Sat, Aug 08, 2015 at 11:54:38AM +0800, Yakir Yang=
 wrote:
[...]
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">        edp: edp@ff970000 {
</pre>
      </blockquote>
      <pre wrap=3D"">[...]
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">                samsung,color-space =3D &lt;0&gt;;
                samsung,dynamic-range =3D &lt;0&gt;;
                samsung,ycbcr-coeff =3D &lt;0&gt;;
</pre>
      </blockquote>
      <pre wrap=3D"">
I think these should also come from EDID, though I'm not sure if we
store this in internal data structures yet.

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">                samsung,color-depth =3D &lt;1&gt;;
</pre>
      </blockquote>
      <pre wrap=3D"">
This is probably drm_display_info.bpc.
</pre>
    </blockquote>
    "samsung,color_space" and "samsung,color-depth" <br>
    <br>
    The drm_display_info's color_formats and bpc indicate the monitor
    display ability, but<br>
    the edp driver could not take it as input video format directly.<br>
    <br>
    For example, with my DP TV I would found "RGB444 &amp; YCRCB422
    &amp; &amp; YCRCB444"<br>
    support in drm_display_info.color_formats and 16bit bpc support, but
    RK3288 crtc<br>
    driver could only output RGB &amp; ITU formats, so finally
    analogix_dp-rockchip driver<br>
    config crtc to RGBaaa 10bpc mode.<br>
    <br>
    In this sutiation, the analogix_dp core driver would pazzled by the
    drm_display_info,<br>
    can't chose the right color_space and bpc.<br>
    <br>
    And this is the place that confused me, wish you could give some
    ideas about this one :-)<br>
-------------------------------------------------------------------------=
------------------------<br>
    <br>
    Besides, The dynamic_range and ycbcr_coeff haven't been record in
    drm_display_info, but<br>
    I though we can parse it by the video code.<br>
    <br>
    The dynamic_range would have two values "CEA range" and "VESA
    range", so I though if<br>
    the currect mode have a no-zero vic (drm_match_cea_mode()) then
    config it to "CEA range",<br>
    otherwhise config it to "VESA range".<br>
    <br>
    YCbCr Coefficients would have two values "ITU709" and "ITU601". I
    see dw_hdmi driver have<br>
    been set the colorimetry to ITU_601 when vic is 6/7/21/22/2/3/17/18,
    I thouht we can stole this<br>
    to analogix_dp driver.<br>
    <span style=3D"font-family:
      ;font-size:9pt;color:rgb(0,0,0);font-style:normal;font-variant:norm=
al;"><br>
      =C2=A0=C2=A0 /* dynamic_range &amp; colorimetry */<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vic =3D drm_match_cea_mo=
de(mode);<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((vic =3D=3D 6) || (v=
ic =3D=3D 7) || (vic =3D=3D 21) || (vic =3D=3D 22)
      ||<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
(vic =3D=3D 2) || (vic =3D=3D 3) || (vic =3D=3D 17) || (vic =3D=3D
      18)) {<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 video_info-&gt;dynamic_range =3D CEA;<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 video_info-&gt;ycbcr_coeff =3D COLOR_YCBCR601;<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (vic) {<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 video_info-&gt;dynamic_range =3D CEA;<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 video_info-&gt;ycbcr_coeff =3D COLOR_YCBCR709;<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 video_info-&gt;dynamic_range =3D VESA;<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 video_info-&gt;ycbcr_coeff =3D COLOR_YCBCR709;<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
    </span><br>
    I'm not sure whether this is right, also wish you could give some
    suggests ;)<br>
    <br>
    <br>
    <blockquote cite=3D"mid:20150810100055.GB7850@ulmo.nvidia.com"
      type=3D"cite">
      <pre wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">                samsung,link-rate =3D &lt;0x0a&gt;=
;
                samsung,lane-count =3D &lt;1&gt;;
</pre>
      </blockquote>
      <pre wrap=3D"">
And these should really be derived from values in the DPCD and adjusted
(if necessary) during link training.

Why would you ever want to hard-code the above?

</pre>
    </blockquote>
    <br>
    And I though we should keep those DT properties now. I try to remove
    those DT<br>
    property, so analogix dp driver would always use the max link_rate
    and lane_count<br>
    which read from dpcd. For my 2K DP TV, link rate would reach to
    5.4Gbps, lane cout<br>
    would reach 4 lances, if so analogix dp driver could not light my DP
    TV up any more.<br>
    <br>
    After that I found that RK3288 eDP TRM have indicated some limites
    about those<br>
    that RK3288 only support 4 physical lanes of 2.7/1.62 Gbps/lane,
    which means 5.4Gbps<br>
    link rate is too high for RK3288.<br>
    <br>
    So I think we could=C2=A0treate them as hardware max values, is it ok=
ay?<br>
    <br>
    Thanks,<br>
    - Yakir<br>
  </body>
</html>

--------------060409070306030501020306--


--===============2032496654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============2032496654==--
