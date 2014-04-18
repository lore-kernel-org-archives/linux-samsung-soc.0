From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 4/7] drm/exynos: add exynos_dp_panel driver registration
 to drm driver
Date: Sat, 19 Apr 2014 01:20:41 +0530
Message-ID: <CAEC9eQNR++vy+Hjp2Li9jBM8NgQFLAbE+8uCULqyX=+emMZRaQ@mail.gmail.com>
References: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
 <1397658786-26138-5-git-send-email-ajaykumar.rs@samsung.com>
 <000201cf5ae4$2b073650$8115a2f0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1926274490=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <000201cf5ae4$2b073650$8115a2f0$%han@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jingoo Han <jg1.han@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, abrestic@chromium.org, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, a.hajda@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>, treding@nvidia.com, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1926274490==
Content-Type: multipart/alternative; boundary=bcaec547c623f46b5804f756765f

--bcaec547c623f46b5804f756765f
Content-Type: text/plain; charset=UTF-8

Hi Jingoo,


On Fri, Apr 18, 2014 at 2:27 PM, Jingoo Han <jg1.han@samsung.com> wrote:

> On Wednesday, April 16, 2014 11:33 PM, Ajay Kumar wrote:
> >
> > Register exynos_dp_panel before the list of exynos crtcs and
> > connectors are probed.
> >
> > This is needed because exynos_dp_panel should be registered to
> > the drm_panel list via panel-exynos-dp probe, i.e much before
> > exynos_dp_bind calls of_drm_find_panel().
> >
> > Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_drv.c | 11 +++++++++++
> >  drivers/gpu/drm/exynos/exynos_drm_drv.h |  1 +
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > index 1d1c604..47266e7 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > @@ -560,12 +560,23 @@ static int exynos_drm_platform_probe(struct
> platform_device *pdev)
> >               goto err_unregister_ipp;
> >  #endif
> >
> > +#ifdef CONFIG_DRM_PANEL_EXYNOS_DP
> > +     ret = platform_driver_register(&exynos_dp_panel_driver);
> > +     if (ret < 0)
> > +             goto err_unregister_dp_panel;
> > +#endif
> > +
> >       ret = component_master_add(&pdev->dev, &exynos_drm_ops);
> >       if (ret < 0)
> >               DRM_DEBUG_KMS("re-tried by last sub driver probed
> later.\n");
> >
> >       return 0;
> >
> > +#ifdef CONFIG_DRM_PANEL_EXYNOS_DP
> > +     platform_driver_unregister(&exynos_dp_panel_driver);
> > +err_unregister_dp_panel:
> > +#endif
>
> Please add platform_driver_unregister() to exynos_drm_platform_remove(),
>
Right, I have missed adding it in exynos_drm_platform_remove().

as well as exynos_drm_platform_probe().
>
> I have already added for this case!


> Best regards,
> Jingoo Han
>
> > +
> >  #ifdef CONFIG_DRM_EXYNOS_IPP
> >       exynos_platform_device_ipp_unregister();
> >  err_unregister_ipp:
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> > index 257ce09..f606290 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> > @@ -368,4 +368,5 @@ extern struct platform_driver fimc_driver;
> >  extern struct platform_driver rotator_driver;
> >  extern struct platform_driver gsc_driver;
> >  extern struct platform_driver ipp_driver;
> > +extern struct platform_driver exynos_dp_panel_driver;
> >  #endif
> > --
> > 1.8.1.2
>
>
Thanks and Regards,
Ajay Kumar

--bcaec547c623f46b5804f756765f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jingoo,<br><div><div class=3D"gmail_extra"><br><br><div=
 class=3D"gmail_quote">On Fri, Apr 18, 2014 at 2:27 PM, Jingoo Han <span di=
r=3D"ltr">&lt;<a href=3D"mailto:jg1.han@samsung.com" target=3D"_blank">jg1.=
han@samsung.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D""><div clas=
s=3D"h5">On Wednesday, April 16, 2014 11:33 PM, Ajay Kumar wrote:<br>
&gt;<br>
&gt; Register exynos_dp_panel before the list of exynos crtcs and<br>
&gt; connectors are probed.<br>
&gt;<br>
&gt; This is needed because exynos_dp_panel should be registered to<br>
&gt; the drm_panel list via panel-exynos-dp probe, i.e much before<br>
&gt; exynos_dp_bind calls of_drm_find_panel().<br>
&gt;<br>
&gt; Signed-off-by: Ajay Kumar &lt;<a href=3D"mailto:ajaykumar.rs@samsung.c=
om">ajaykumar.rs@samsung.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0drivers/gpu/drm/exynos/exynos_drm_drv.c | 11 +++++++++++<br>
&gt; =C2=A0drivers/gpu/drm/exynos/exynos_drm_drv.h | =C2=A01 +<br>
&gt; =C2=A02 files changed, 12 insertions(+)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm=
/exynos/exynos_drm_drv.c<br>
&gt; index 1d1c604..47266e7 100644<br>
&gt; --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c<br>
&gt; +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c<br>
&gt; @@ -560,12 +560,23 @@ static int exynos_drm_platform_probe(struct plat=
form_device *pdev)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_unregister_i=
pp;<br>
&gt; =C2=A0#endif<br>
&gt;<br>
&gt; +#ifdef CONFIG_DRM_PANEL_EXYNOS_DP<br>
&gt; + =C2=A0 =C2=A0 ret =3D platform_driver_register(&amp;exynos_dp_panel_=
driver);<br>
&gt; + =C2=A0 =C2=A0 if (ret &lt; 0)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_unregister_dp_pan=
el;<br>
&gt; +#endif<br>
&gt; +<br>
&gt; =C2=A0 =C2=A0 =C2=A0 ret =3D component_master_add(&amp;pdev-&gt;dev, &=
amp;exynos_drm_ops);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_DEBUG_KMS(&quot;r=
e-tried by last sub driver probed later.\n&quot;);<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;<br>
&gt; +#ifdef CONFIG_DRM_PANEL_EXYNOS_DP<br>
&gt; + =C2=A0 =C2=A0 platform_driver_unregister(&amp;exynos_dp_panel_driver=
);<br>
&gt; +err_unregister_dp_panel:<br>
&gt; +#endif<br>
<br>
</div></div>Please add platform_driver_unregister() to exynos_drm_platform_=
remove(),<br></blockquote><div>Right, I have missed adding it in exynos_drm=
_platform_remove().<br><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">

as well as exynos_drm_platform_probe().<br>
<br></blockquote><div>I have already added for this case!<br>=C2=A0<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
Best regards,<br>
Jingoo Han<br>
<div class=3D""><div class=3D"h5"><br>
&gt; +<br>
&gt; =C2=A0#ifdef CONFIG_DRM_EXYNOS_IPP<br>
&gt; =C2=A0 =C2=A0 =C2=A0 exynos_platform_device_ipp_unregister();<br>
&gt; =C2=A0err_unregister_ipp:<br>
&gt; diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm=
/exynos/exynos_drm_drv.h<br>
&gt; index 257ce09..f606290 100644<br>
&gt; --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h<br>
&gt; +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h<br>
&gt; @@ -368,4 +368,5 @@ extern struct platform_driver fimc_driver;<br>
&gt; =C2=A0extern struct platform_driver rotator_driver;<br>
&gt; =C2=A0extern struct platform_driver gsc_driver;<br>
&gt; =C2=A0extern struct platform_driver ipp_driver;<br>
&gt; +extern struct platform_driver exynos_dp_panel_driver;<br>
&gt; =C2=A0#endif<br>
&gt; --<br>
&gt; 1.8.1.2<br>
<br>
</div></div></blockquote></div><br></div><div class=3D"gmail_extra">Thanks =
and Regards,<br>Ajay Kumar<br></div></div></div>

--bcaec547c623f46b5804f756765f--

--===============1926274490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1926274490==--
