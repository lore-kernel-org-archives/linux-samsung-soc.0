From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: drm/exynos: Add atomic modesetting support
Date: Mon, 18 May 2015 21:35:22 +0100
Message-ID: <CAPj87rOnseYOzPqetbxKpq7_4855Vup2cySzZJmz8JejBHFPMw@mail.gmail.com>
References: <10cea26ae89c8bf2f26c2d258dcabd3a@math.uni-bielefeld.de>
 <20150518195101.GA18856@joana>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0775591969=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150518195101.GA18856@joana>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Gustavo Padovan <gustavo@padovan.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, "inki.dae@samsung.com" <inki.dae@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "liquid.acid@gmx.net" <liquid.acid@gmx.net>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0775591969==
Content-Type: multipart/alternative; boundary=001a1142233a1574dc0516612249

--001a1142233a1574dc0516612249
Content-Type: text/plain; charset=UTF-8

Hi,

On Monday, May 18, 2015, Gustavo Padovan <gustavo@padovan.org> wrote:

> Hi Tobias,
>
> 2015-05-15 Tobias Jakobi <tjakobi@math.uni-bielefeld.de <javascript:;>>:
> > I did another run with drm.debug=0xff and also tried to figure out where
> the
> > div-by-zero comes from.
> >
> > The only division I see is in fimd_calc_clkdiv() (which is called by
> > fimd_commit()). So it looks like 'ideal_clk' is zero when calling
> > DIV_ROUND_UP().
> >
> > 'htotal' and 'vtotal' can't be zero, since this is checked early in
> > fimd_commit(). So 'vrefresh' has to be zero. Maybe this helps?
>
> What is is the output when you run with this patch:
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 12ab80c..f5d215d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -310,6 +310,8 @@ static u32 fimd_calc_clkdiv(struct fimd_context *ctx,
>         unsigned long ideal_clk = mode->htotal * mode->vtotal *
> mode->vrefresh;
>         u32 clkdiv;
>
> +       DRM_DEBUG_KMS("vrefresh %d\n", mode->vrefresh);
> +
>         if (ctx->i80_if) {
>                 /*
>                  * The frame done interrupt should be occurred prior to the
> @@ -328,6 +330,7 @@ static bool fimd_mode_fixup(struct exynos_drm_crtc
> *crtc,
>                 const struct drm_display_mode *mode,
>                 struct drm_display_mode *adjusted_mode)
>  {
> +       DRM_DEBUG_KMS("vrefresh %d\n", adjusted_mode->vrefresh);
>         if (adjusted_mode->vrefresh == 0)
>                 adjusted_mode->vrefresh = FIMD_DEFAULT_FRAMERATE;
>

vrefresh can legitimately be zero, which makes this FIMD_DEFAULT_FRAMERATE
assignment problematic rather than harmless.

If it's zero, you can find a vrefresh value with drm_mode_vrefresh, which
will calculate it for you.

Cheers,
Daniel

--001a1142233a1574dc0516612249
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,<br><br>On Monday, May 18, 2015, Gustavo Padovan &lt;<a href=3D"mailto:g=
ustavo@padovan.org">gustavo@padovan.org</a>&gt; wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hi Tobias,<br>
<br>
2015-05-15 Tobias Jakobi &lt;<a href=3D"javascript:;" onclick=3D"_e(event, =
&#39;cvml&#39;, &#39;tjakobi@math.uni-bielefeld.de&#39;)">tjakobi@math.uni-=
bielefeld.de</a>&gt;:<br>
&gt; I did another run with drm.debug=3D0xff and also tried to figure out w=
here the<br>
&gt; div-by-zero comes from.<br>
&gt;<br>
&gt; The only division I see is in fimd_calc_clkdiv() (which is called by<b=
r>
&gt; fimd_commit()). So it looks like &#39;ideal_clk&#39; is zero when call=
ing<br>
&gt; DIV_ROUND_UP().<br>
&gt;<br>
&gt; &#39;htotal&#39; and &#39;vtotal&#39; can&#39;t be zero, since this is=
 checked early in<br>
&gt; fimd_commit(). So &#39;vrefresh&#39; has to be zero. Maybe this helps?=
<br>
<br>
What is is the output when you run with this patch:<br>
<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exy=
nos/exynos_drm_fimd.c<br>
index 12ab80c..f5d215d 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
@@ -310,6 +310,8 @@ static u32 fimd_calc_clkdiv(struct fimd_context *ctx,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long ideal_clk =3D mode-&gt;htotal * m=
ode-&gt;vtotal * mode-&gt;vrefresh;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 clkdiv;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG_KMS(&quot;vrefresh %d\n&quot;, mode-&=
gt;vrefresh);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;i80_if) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The frame d=
one interrupt should be occurred prior to the<br>
@@ -328,6 +330,7 @@ static bool fimd_mode_fixup(struct exynos_drm_crtc *crt=
c,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct drm_di=
splay_mode *mode,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_display_=
mode *adjusted_mode)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG_KMS(&quot;vrefresh %d\n&quot;, adjust=
ed_mode-&gt;vrefresh);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (adjusted_mode-&gt;vrefresh =3D=3D 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adjusted_mode-&gt;v=
refresh =3D FIMD_DEFAULT_FRAMERATE;<br>
</blockquote><div><br></div><div>vrefresh can legitimately be zero, which m=
akes this FIMD_DEFAULT_FRAMERATE assignment problematic rather than harmles=
s.</div><div><br></div><div>If it&#39;s zero, you can find a vrefresh value=
 with drm_mode_vrefresh, which will calculate it for you.</div><div><br></d=
iv><div>Cheers,</div><div>Daniel=C2=A0</div>

--001a1142233a1574dc0516612249--

--===============0775591969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0775591969==--
