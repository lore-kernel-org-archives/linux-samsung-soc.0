From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [RFC PATCH 0/8] Add Analogix Core Display Port Driver
Date: Fri, 7 Aug 2015 16:17:43 +0800
Message-ID: <55C469A7.90507@rock-chips.com>
References: <1438868947-22132-1-git-send-email-ykk@rock-chips.com>
 <000201d0d056$06cff040$146fd0c0$@com> <55C3769F.2010405@rock-chips.com>
 <CAEC9eQNBU4oQnAFtWRNJonHOB-1XNhCO0r7fUiHohBErJE_sFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0490297834=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQNBU4oQnAFtWRNJonHOB-1XNhCO0r7fUiHohBErJE_sFQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay kumar <ajaynumb@gmail.com>, Sean Paul <seanpaul@google.com>, Sean Paul <seanpaul@chromium.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, Kukjin Kim <kgene@kernel.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, "dianders@google.com" <dianders@google.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Fabio Estevam <fabio.estevam@freescale.com>, Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@s>
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============0490297834==
Content-Type: multipart/alternative;
 boundary="------------000505040805060908020309"

This is a multi-part message in MIME format.
--------------000505040805060908020309
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Ajay,

=E5=9C=A8 2015/8/7 14:11, Ajay kumar =E5=86=99=E9=81=93:
> +Sean
>

Woh, okay, I will loop you and Sean to cc list in follow versions ;)

-Yakir
> On Thursday, August 6, 2015, Yakir Yang <ykk@rock-chips.com=20
> <mailto:ykk@rock-chips.com>> wrote:
>
>     Jingoo,
>
>     =E5=9C=A8 2015/8/6 22:41, Jingoo Han =E5=86=99=E9=81=93:
>
>         On Thursday, August 06, 2015 10:49 PM, Yakir Yang wrote:
>
>             Hi all,
>                 Samsung exynos and Rockchip rk3288 almost share same
>             dp controller,
>             so I split the common code out, then rk3288 and exynos can
>             re-used the
>             same dp core driver. Cause I can't find the exact IP name
>             of exynos dp
>             controller, so I decide to name dp core driver with
>             "analogix" which I
>             find in rk3288 eDP TRM ;)
>
>
>         OK, I see.
>         The Samsung Exynos eDP contoller and Rockchip rk3288 eDP
>         contoller share
>         the same IP. So, a lot of parts can be re-used. I agree with th=
is.
>         However, we have to review the code carefully, as others did.
>
>     Yeah, feel happy to be reviewed  ;)
>
>         I also cannot find the exact IP name. The "analogix" may be
>         the vendor name
>         of this IP.
>
>     Okay, so "analogix" is okay for now
>
>     Thanks,
>     - Yakir
>
>         Best regards,
>         Jingoo Han
>
>             Beyond that, there are three light registers setting
>             differents bewteen
>             exynos and rk3288.
>             1. RK3288 have five special pll resigters which not
>             indicata in exynos
>                 dp controller.
>             2. The address of DP_PHY_PD(dp phy power manager register)
>             are different
>                 between rk3288 and exynos.
>             3. Rk3288 and exynos have different setting with
>             AUX_HW_RETRY_CTL(dp debug
>                 register).
>
>             My series patches can be divider into two parts: One for
>             spliting the
>             analogix_dp code from exynos dp driver. Another are trying
>             to add rk3288
>             dp driver support.
>
>             Best regards,
>             - Yakir
>
>
>             --
>             2.1.2
>
>
>
>
>
>
>
>     --
>     To unsubscribe from this list: send the line "unsubscribe
>     linux-samsung-soc" in
>     the body of a message to majordomo@vger.kernel.org
>     More majordomo info at http://vger.kernel.org/majordomo-info.html
>


--------------000505040805060908020309
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Ajay,<br>
    <br>
    <div class=3D"moz-cite-prefix">=E5=9C=A8 2015/8/7 14:11, Ajay kumar =E5=
=86=99=E9=81=93:<br>
    </div>
    <blockquote
cite=3D"mid:CAEC9eQNBU4oQnAFtWRNJonHOB-1XNhCO0r7fUiHohBErJE_sFQ@mail.gmai=
l.com"
      type=3D"cite">+Sean<br>
      <br>
    </blockquote>
    <br>
    Woh, okay, I will loop you and Sean to cc list in follow versions=C2=A0
    ;)<br>
    <br>
    -Yakir<br>
    <blockquote
cite=3D"mid:CAEC9eQNBU4oQnAFtWRNJonHOB-1XNhCO0r7fUiHohBErJE_sFQ@mail.gmai=
l.com"
      type=3D"cite">On Thursday, August 6, 2015, Yakir Yang &lt;<a
        moz-do-not-send=3D"true" href=3D"mailto:ykk@rock-chips.com"><a cl=
ass=3D"moz-txt-link-abbreviated" href=3D"mailto:ykk@rock-chips.com">ykk@r=
ock-chips.com</a></a>&gt;
      wrote:<br>
      <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
        .8ex;border-left:1px #ccc solid;padding-left:1ex">Jingoo,<br>
        <br>
        =E5=9C=A8 2015/8/6 22:41, Jingoo Han =E5=86=99=E9=81=93:<br>
        <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          On Thursday, August 06, 2015 10:49 PM, Yakir Yang wrote:<br>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            Hi all,<br>
            =C2=A0 =C2=A0 Samsung exynos and Rockchip rk3288 almost share=
 same dp
            controller,<br>
            so I split the common code out, then rk3288 and exynos can
            re-used the<br>
            same dp core driver. Cause I can't find the exact IP name of
            exynos dp<br>
            controller, so I decide to name dp core driver with
            "analogix" which I<br>
            find in rk3288 eDP TRM ;)<br>
          </blockquote>
          <br>
          OK, I see.<br>
          The Samsung Exynos eDP contoller and Rockchip rk3288 eDP
          contoller share<br>
          the same IP. So, a lot of parts can be re-used. I agree with
          this.<br>
          However, we have to review the code carefully, as others did.<b=
r>
        </blockquote>
        Yeah, feel happy to be reviewed=C2=A0 ;)<br>
        <br>
        <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          I also cannot find the exact IP name. The "analogix" may be
          the vendor name<br>
          of this IP.<br>
        </blockquote>
        Okay, so "analogix" is okay for now<br>
        <br>
        Thanks,<br>
        - Yakir<br>
        <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          Best regards,<br>
          Jingoo Han<br>
          <br>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            Beyond that, there are three light registers setting
            differents bewteen<br>
            exynos and rk3288.<br>
            1. RK3288 have five special pll resigters which not indicata
            in exynos<br>
            =C2=A0 =C2=A0 dp controller.<br>
            2. The address of DP_PHY_PD(dp phy power manager register)
            are different<br>
            =C2=A0 =C2=A0 between rk3288 and exynos.<br>
            3. Rk3288 and exynos have different setting with
            AUX_HW_RETRY_CTL(dp debug<br>
            =C2=A0 =C2=A0 register).<br>
            <br>
            My series patches can be divider into two parts: One for
            spliting the<br>
            analogix_dp code from exynos dp driver. Another are trying
            to add rk3288<br>
            dp driver support.<br>
            <br>
            Best regards,<br>
            - Yakir<br>
            <br>
            <br>
            --<br>
            2.1.2<br>
          </blockquote>
          <br>
          <br>
          <br>
          <br>
        </blockquote>
        <br>
        <br>
        --<br>
        To unsubscribe from this list: send the line "unsubscribe
        linux-samsung-soc" in<br>
        the body of a message to <a moz-do-not-send=3D"true">majordomo@vg=
er.kernel.org</a><br>
        More majordomo info at=C2=A0 <a moz-do-not-send=3D"true"
          href=3D"http://vger.kernel.org/majordomo-info.html"
          target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a=
><br>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------000505040805060908020309--


--===============0490297834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0490297834==--
