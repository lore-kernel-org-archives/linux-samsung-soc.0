From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 7/9] drm/exynos: use of_get_named_gpio to get hdmi hpd gpio
Date: Mon, 17 Jun 2013 11:52:30 +0900
Message-ID: <CAAQKjZNGuhpWck4VqbpP+Ge5fWDP0hkLSHj2zVAKc5sUPok2Xg@mail.gmail.com>
References: <1370959891-8923-1-git-send-email-rahul.sharma@samsung.com>
 <1370959891-8923-8-git-send-email-rahul.sharma@samsung.com>
 <51BAC3A0.7000002@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7568305524659637437=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51BAC3A0.7000002-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, sunil joshi <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============7568305524659637437==
Content-Type: multipart/alternative; boundary=001a1133e4140a95d804df50b09c

--001a1133e4140a95d804df50b09c
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: quoted-printable

Applied.

Thanks,
Inki Dae


2013/6/14 =B1=E8=BD=C2=BF=EC <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

> Hello Rahul,
>
> this patch is not related with others and it looks good to me.
>
> On 2013=B3=E2 06=BF=F9 11=C0=CF 23:11, Rahul Sharma wrote:
> > Cleanup by removing flags variable from drm_hdmi_dt_parse_pdata
> > which is not used anywhere. Swtiching to of_get_named_gpio instead
> > of of_get_named_gpio_flags solved this.
> >
> > Signed-off-by: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> Acked-by: Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> > ---
> >  drivers/gpu/drm/exynos/exynos_hdmi.c |    3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c
> b/drivers/gpu/drm/exynos/exynos_hdmi.c
> > index 1eb5ffb..fc6a9b0 100644
> > --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> > @@ -2081,7 +2081,6 @@ static struct s5p_hdmi_platform_data
> *drm_hdmi_dt_parse_pdata
> >  {
> >       struct device_node *np =3D dev->of_node;
> >       struct s5p_hdmi_platform_data *pd;
> > -     enum of_gpio_flags flags;
> >       u32 value;
> >
> >       pd =3D devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
> > @@ -2095,7 +2094,7 @@ static struct s5p_hdmi_platform_data
> *drm_hdmi_dt_parse_pdata
> >               goto err_data;
> >       }
> >
> > -     pd->hpd_gpio =3D of_get_named_gpio_flags(np, "hpd-gpio", 0, &flag=
s);
> > +     pd->hpd_gpio =3D of_get_named_gpio(np, "hpd-gpio", 0);
> >
> >       return pd;
> >
> >
>
> --
> Seung-Woo Kim
> Samsung Software R&D Center
> --
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--001a1133e4140a95d804df50b09c
Content-Type: text/html; charset=EUC-KR
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Applied.<br><br>Thanks,<br>Inki Dae<br></div><div class=3D=
"gmail_extra"><br><br><div class=3D"gmail_quote">2013/6/14 =B1=E8=BD=C2=BF=
=EC <span dir=3D"ltr">&lt;<a href=3D"mailto:sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" target=
=3D"_blank">sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hello Rahul,<br>
<br>
this patch is not related with others and it looks good to me.<br>
<div class=3D"im"><br>
On 2013=B3=E2 06=BF=F9 11=C0=CF 23:11, Rahul Sharma wrote:<br>
&gt; Cleanup by removing flags variable from drm_hdmi_dt_parse_pdata<br>
&gt; which is not used anywhere. Swtiching to of_get_named_gpio instead<br>
&gt; of of_get_named_gpio_flags solved this.<br>
&gt;<br>
&gt; Signed-off-by: Rahul Sharma &lt;<a href=3D"mailto:rahul.sharma@samsung=
.com">rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;<br>
<br>
</div>Acked-by: Seung-Woo Kim &lt;<a href=3D"mailto:sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org"=
>sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;<br>
<div class=3D"im"><br>
&gt; ---<br>
&gt; &nbsp;drivers/gpu/drm/exynos/exynos_hdmi.c | &nbsp; &nbsp;3 +--<br>
&gt; &nbsp;1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/ex=
ynos/exynos_hdmi.c<br>
&gt; index 1eb5ffb..fc6a9b0 100644<br>
&gt; --- a/drivers/gpu/drm/exynos/exynos_hdmi.c<br>
&gt; +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c<br>
&gt; @@ -2081,7 +2081,6 @@ static struct s5p_hdmi_platform_data *drm_hdmi_d=
t_parse_pdata<br>
&gt; &nbsp;{<br>
&gt; &nbsp; &nbsp; &nbsp; struct device_node *np =3D dev-&gt;of_node;<br>
&gt; &nbsp; &nbsp; &nbsp; struct s5p_hdmi_platform_data *pd;<br>
&gt; - &nbsp; &nbsp; enum of_gpio_flags flags;<br>
&gt; &nbsp; &nbsp; &nbsp; u32 value;<br>
&gt;<br>
&gt; &nbsp; &nbsp; &nbsp; pd =3D devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL)=
;<br>
&gt; @@ -2095,7 +2094,7 @@ static struct s5p_hdmi_platform_data *drm_hdmi_d=
t_parse_pdata<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto err_data;<br>
&gt; &nbsp; &nbsp; &nbsp; }<br>
&gt;<br>
&gt; - &nbsp; &nbsp; pd-&gt;hpd_gpio =3D of_get_named_gpio_flags(np, &quot;=
hpd-gpio&quot;, 0, &amp;flags);<br>
&gt; + &nbsp; &nbsp; pd-&gt;hpd_gpio =3D of_get_named_gpio(np, &quot;hpd-gp=
io&quot;, 0);<br>
&gt;<br>
&gt; &nbsp; &nbsp; &nbsp; return pd;<br>
&gt;<br>
&gt;<br>
<br>
--<br>
</div>Seung-Woo Kim<br>
Samsung Software R&amp;D Center<br>
--<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-samsun=
g-soc&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org">major=
domo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org</a><br>
More majordomo info at &nbsp;<a href=3D"http://vger.kernel.org/majordomo-in=
fo.html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><b=
r>
</div></div></blockquote></div><br></div>

--001a1133e4140a95d804df50b09c--

--===============7568305524659637437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7568305524659637437==--
