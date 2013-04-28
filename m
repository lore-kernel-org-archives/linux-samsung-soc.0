From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] drm/exynos: fix multiple definition build error
Date: Sun, 28 Apr 2013 21:52:57 +0900
Message-ID: <CAAQKjZNJfqSsmWtzoSk0803KgFctGpPu-1g0zEr4y13D-_LHjw@mail.gmail.com>
References: <1366952590-11652-1-git-send-email-inki.dae@samsung.com>
 <CAAQKjZPQ4LWTka0rfgPypsh+a-B5gzBv5hEbRYdkrry_C5J6Hg@mail.gmail.com>
 <517A4D82.8010306@samsung.com> <4121004.exzbXa8F0p@flatron>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5625853686760950222=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4121004.exzbXa8F0p@flatron>
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
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============5625853686760950222==
Content-Type: multipart/alternative; boundary=047d7b3a84365c11cc04db6b3fa2

--047d7b3a84365c11cc04db6b3fa2
Content-Type: text/plain; charset=ISO-8859-1

2013/4/27 Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> On Friday 26 of April 2013 11:48:50 Sylwester Nawrocki wrote:
> > On 04/26/2013 10:20 AM, Inki Dae wrote:
> > > Exactly right. it's my mistake. But now it seems that
> > > __mode_of_device_table is multi defined at fimd and g2d side so there
> > > still is module build error. :(
> > Since all drivers seem to be linked into single a single module, you
> > likely need to create a separate table of struct of_device_id just for
> > the purpose of MODULE_DEVICE_TABLE(of, ...). This table would contain
> > 'compatible' strings for all devices. Or choose of_device_id for just
> > one device and define MODULE_DEVICE_TABLE() for it in some common place,
> > e.g. exynos_drm_drv.c. I believe all devices should be listed though.
>
> IMHO, the most proper solution would be to split the module into parent
> exynos_drm module and per-device submodules, which would depend on the
> parent module.
>
>
This way had already been used a long time ago and there was some probing
issues so we made exynos drm framework to be one module.


>

This way you would be able to load dynamically any submodule you want,
> without recompiling the modules.
>
> Best regards,
> Tomasz
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--047d7b3a84365c11cc04db6b3fa2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quo=
te">2013/4/27 Tomasz Figa <span dir=3D"ltr">&lt;<a href=3D"mailto:tomasz.fi=
ga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span><br><bl=
ockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-col=
or:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=3D=
"gmail_quote">
<div class=3D"im">On Friday 26 of April 2013 11:48:50 Sylwester Nawrocki wr=
ote:<br>
&gt; On 04/26/2013 10:20 AM, Inki Dae wrote:<br>
&gt; &gt; Exactly right. it&#39;s my mistake. But now it seems that<br>
&gt; &gt; __mode_of_device_table is multi defined at fimd and g2d side so t=
here<br>
&gt; &gt; still is module build error. :(<br>
&gt; Since all drivers seem to be linked into single a single module, you<b=
r>
&gt; likely need to create a separate table of struct of_device_id just for=
<br>
&gt; the purpose of MODULE_DEVICE_TABLE(of, ...). This table would contain<=
br>
&gt; &#39;compatible&#39; strings for all devices. Or choose of_device_id f=
or just<br>
&gt; one device and define MODULE_DEVICE_TABLE() for it in some common plac=
e,<br>
&gt; e.g. exynos_drm_drv.c. I believe all devices should be listed though.<=
br>
<br>
</div>IMHO, the most proper solution would be to split the module into pare=
nt<br>
exynos_drm module and per-device submodules, which would depend on the<br>
parent module.<br>
<br></blockquote><div>=A0</div><div>This way had already been used a long t=
ime ago=A0and there was some probing issues so we made exynos drm framework=
 to be one module.</div><div>=A0</div><blockquote style=3D"margin:0px 0px 0=
px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-left-wi=
dth:1px;border-left-style:solid" class=3D"gmail_quote">
=A0</blockquote><blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:=
1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-left-st=
yle:solid" class=3D"gmail_quote">
This way you would be able to load dynamically any submodule you want,<br>
without recompiling the modules.<br>
<br></blockquote><blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left=
:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-left-s=
tyle:solid" class=3D"gmail_quote">
Best regards,<br>
Tomasz<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">dri-devel-PD4FTy7X32lzq7FAFJ/aeQ@public.gmane.org=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</div></div></blockquote></div><br></div></div>

--047d7b3a84365c11cc04db6b3fa2--

--===============5625853686760950222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5625853686760950222==--
