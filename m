From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: fix multiple definition build error
Date: Fri, 26 Apr 2013 17:20:06 +0900
Message-ID: <CAAQKjZPQ4LWTka0rfgPypsh+a-B5gzBv5hEbRYdkrry_C5J6Hg@mail.gmail.com>
References: <1366952590-11652-1-git-send-email-inki.dae@samsung.com>
	<1835608.J1o7g8oiCZ@flatron>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1895174377=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1835608.J1o7g8oiCZ@flatron>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1895174377==
Content-Type: multipart/alternative; boundary=089e0122883ede0bc504db3f33e9

--089e0122883ede0bc504db3f33e9
Content-Type: text/plain; charset=ISO-8859-1

Hi Tomasz,


2013/4/26 Tomasz Figa <tomasz.figa@gmail.com>

> Hi Inki,
>
> On Friday 26 of April 2013 14:03:10 Inki Dae wrote:
> > This patch fixes multiple definition error like below when building it
> > as moudle with device tree support.
> >
> > drivers/gpu/drm/exynos/exynos_drm_g2d.o: In function `.LANCHOR1':
> > exynos_drm_g2d.c:(.rodata+0x6c): multiple definition of
> > `__mod_of_device_table'
> > drivers/gpu/drm/exynos/exynos_drm_fimd.o:exynos_drm_fimd.c:(.rodata+0x1
> > 44): first defined here
> >
> > Signed-off-by: Inki Dae <inki.dae@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_fimd.c |    2 +-
> >  drivers/gpu/drm/exynos/exynos_drm_g2d.c  |    2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > b/drivers/gpu/drm/exynos/exynos_drm_fimd.c index 746b282..1e02d13
> > 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > @@ -117,7 +117,7 @@ static const struct of_device_id
> > fimd_driver_dt_match[] = { .data = &exynos5_fimd_driver_data },
> >       {},
> >  };
> > -MODULE_DEVICE_TABLE(of, fimd_driver_dt_match);
> > +MODULE_DEVICE_TABLE(of_fimd, fimd_driver_dt_match);
>
> I wonder if this change wouldn't break the purpose of having
> MODULE_DEVICE_TABLE at all.
>
> As far as I remember, this is used to create a symbol with well known name
> that userspace tools can use to identify what devices are handled in this
> module. For example
>
> MODULE_DEVICE_TABLE(of, fimd_driver_dt_match);
>
> results in creation of __mod_of_device_table symbol, of which tools, such
> as depmod are aware and can build a list of supported devices.
>
> Your change will result in creation of __mod_of_fimd_device_table, which
> is unknown and won't be of any use.
>
> By the way, looking at the definition of MODULE_DEVICE_TABLE, which is
>
> 139 #define MODULE_DEVICE_TABLE(type,name)          \
> 140   MODULE_GENERIC_TABLE(type##_device,name)
>
> and then MODULE_GENERIC_TABLE
>
>  85 #ifdef MODULE
>  86 #define MODULE_GENERIC_TABLE(gtype,name)                        \
>  87 extern const struct gtype##_id __mod_##gtype##_table            \
>  88   __attribute__ ((unused, alias(__stringify(name))))
>  89
>  90 #else  /* !MODULE */
>  91 #define MODULE_GENERIC_TABLE(gtype,name)
>  92 #endif
>
> it seems like the exact line that will be generated after your change,
> will be
>
> extern const struct of_fimd_device_id __mod_of_fimd_device_table
>         __attribute__ ((unused, alias(__stringify(name))));
>

Exactly right. it's my mistake. But now it seems that
__mode_of_device_table is multi defined at fimd and g2d side so there still
is module build error. :(

Thanks,
Inki Dae



>
> which seems wrong, because of_fimd_device_id is not a correct struct type.
>
> Best regards,
> Tomasz
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--089e0122883ede0bc504db3f33e9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Tomasz,<br><div class=3D"gmail_extra"><br><br><div clas=
s=3D"gmail_quote">2013/4/26 Tomasz Figa <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:tomasz.figa@gmail.com" target=3D"_blank">tomasz.figa@gmail.com</a>&gt;=
</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi Inki,<br>
<div class=3D"im"><br>
On Friday 26 of April 2013 14:03:10 Inki Dae wrote:<br>
&gt; This patch fixes multiple definition error like below when building it=
<br>
&gt; as moudle with device tree support.<br>
&gt;<br>
&gt; drivers/gpu/drm/exynos/exynos_drm_g2d.o: In function `.LANCHOR1&#39;:<=
br>
&gt; exynos_drm_g2d.c:(.rodata+0x6c): multiple definition of<br>
&gt; `__mod_of_device_table&#39;<br>
&gt; drivers/gpu/drm/exynos/exynos_drm_fimd.o:exynos_drm_fimd.c:(.rodata+0x=
1<br>
&gt; 44): first defined here<br>
&gt;<br>
&gt; Signed-off-by: Inki Dae &lt;<a href=3D"mailto:inki.dae@samsung.com">in=
ki.dae@samsung.com</a>&gt;<br>
&gt; Signed-off-by: Kyungmin Park &lt;<a href=3D"mailto:kyungmin.park@samsu=
ng.com">kyungmin.park@samsung.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0drivers/gpu/drm/exynos/exynos_drm_fimd.c | =A0 =A02 +-<br>
&gt; =A0drivers/gpu/drm/exynos/exynos_drm_g2d.c =A0| =A0 =A02 +-<br>
&gt; =A02 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
&gt; b/drivers/gpu/drm/exynos/exynos_drm_fimd.c index 746b282..1e02d13<br>
&gt; 100644<br>
&gt; --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
&gt; +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
&gt; @@ -117,7 +117,7 @@ static const struct of_device_id<br>
&gt; fimd_driver_dt_match[] =3D { .data =3D &amp;exynos5_fimd_driver_data }=
,<br>
&gt; =A0 =A0 =A0 {},<br>
&gt; =A0};<br>
&gt; -MODULE_DEVICE_TABLE(of, fimd_driver_dt_match);<br>
&gt; +MODULE_DEVICE_TABLE(of_fimd, fimd_driver_dt_match);<br>
<br>
</div>I wonder if this change wouldn&#39;t break the purpose of having<br>
MODULE_DEVICE_TABLE at all.<br>
<br>
As far as I remember, this is used to create a symbol with well known name<=
br>
that userspace tools can use to identify what devices are handled in this<b=
r>
module. For example<br>
<br>
MODULE_DEVICE_TABLE(of, fimd_driver_dt_match);<br>
<br>
results in creation of __mod_of_device_table symbol, of which tools, such<b=
r>
as depmod are aware and can build a list of supported devices.<br>
<br>
Your change will result in creation of __mod_of_fimd_device_table, which<br=
>
is unknown and won&#39;t be of any use.<br>
<br>
By the way, looking at the definition of MODULE_DEVICE_TABLE, which is<br>
<br>
139 #define MODULE_DEVICE_TABLE(type,name) =A0 =A0 =A0 =A0 =A0\<br>
140 =A0 MODULE_GENERIC_TABLE(type##_device,name)<br>
<br>
and then MODULE_GENERIC_TABLE<br>
<br>
=A085 #ifdef MODULE<br>
=A086 #define MODULE_GENERIC_TABLE(gtype,name) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0\<br>
=A087 extern const struct gtype##_id __mod_##gtype##_table =A0 =A0 =A0 =A0 =
=A0 =A0\<br>
=A088 =A0 __attribute__ ((unused, alias(__stringify(name))))<br>
=A089<br>
=A090 #else =A0/* !MODULE */<br>
=A091 #define MODULE_GENERIC_TABLE(gtype,name)<br>
=A092 #endif<br>
<br>
it seems like the exact line that will be generated after your change,<br>
will be<br>
<br>
extern const struct of_fimd_device_id __mod_of_fimd_device_table<br>
=A0 =A0 =A0 =A0 __attribute__ ((unused, alias(__stringify(name))));<br></bl=
ockquote><div><br></div><div>Exactly right. it&#39;s my mistake. But now it=
 seems that __mode_of_device_table is multi defined at fimd and g2d side so=
 there still is module build error. :(<br>
<br></div><div>Thanks,<br>Inki Dae<br></div><div><br>=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<br>
which seems wrong, because of_fimd_device_id is not a correct struct type.<=
br>
<br>
Best regards,<br>
Tomasz<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</div></div></blockquote></div><br></div></div>

--089e0122883ede0bc504db3f33e9--

--===============1895174377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1895174377==--
