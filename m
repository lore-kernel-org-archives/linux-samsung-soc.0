From: Vikas Sajjan <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: Add display timing node to
 exynos5250-arndale.dts
Date: Fri, 10 May 2013 09:28:44 +0530
Message-ID: <CAD025yQLDL=0=4QCEPytRO=6MpPvcWDXaaw9rUrN-X5OBDkzuw@mail.gmail.com>
References: <1367992894-20198-1-git-send-email-vikas.sajjan@linaro.org>
 <1367992894-20198-4-git-send-email-vikas.sajjan@linaro.org>
 <4212940.hYf2k9NPUY@flatron>
 <CAD025yRnuk2oK1B40p5XTQ7n+aX+ta2PTdEuceCbvRUEvRgzSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5553216101841137840=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAD025yRnuk2oK1B40p5XTQ7n+aX+ta2PTdEuceCbvRUEvRgzSg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: "kgene.kim" <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sunil joshi <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============5553216101841137840==
Content-Type: multipart/alternative; boundary=047d7b3a814a1b93e804dc5530e5

--047d7b3a814a1b93e804dc5530e5
Content-Type: text/plain; charset=ISO-8859-1

Hi Tomasz,

On 10 May 2013 08:25, Vikas Sajjan <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> Hi Tomasz,
>
>
> On 10 May 2013 05:35, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> Hi Vikas,
>>
>> On Wednesday 08 of May 2013 11:31:34 Vikas Sajjan wrote:
>> > Adds display timing node for a DP panel to Arndale Board DTS file
>> >
>> > Signed-off-by: Vikas Sajjan <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> > ---
>> >  arch/arm/boot/dts/exynos5250-arndale.dts |   16 ++++++++++++++++
>> >  1 file changed, 16 insertions(+)
>> >
>> > diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts
>> > b/arch/arm/boot/dts/exynos5250-arndale.dts index f68b820..c831a5c
>> > 100644
>> > --- a/arch/arm/boot/dts/exynos5250-arndale.dts
>> > +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
>> > @@ -459,4 +459,20 @@
>> >               samsung,lane-count = <4>;
>> >       };
>> >
>> > +     display-timings {
>> > +             native-mode = <&timing0>;
>> > +             timing0: timing@0 {
>> > +                     /* 2560x1600 DP panel */
>> > +                     clock-frequency = <50000>;
>> > +                     hactive = <2560>;
>> > +                     vactive = <1600>;
>> > +                     hfront-porch = <48>;
>> > +                     hback-porch = <80>;
>> > +                     hsync-len = <32>;
>> > +                     vback-porch = <16>;
>> > +                     vfront-porch = <8>;
>> > +                     vsync-len = <6>;
>> > +             };
>> > +     };
>>
>> What display are those timings used for? Shouldn't they be placed inside
>> node of that display?
>>
>> This timing information will be used parsed by the FIMD probe with the
> help of "Video Helper function"  as done in this link
>
>
> https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/commit/?h=exynos-drm-next&id=7f4596f4aebcc9fcf2d50d3fe398508d710c4dd0
>
> Please refer to this patch which is used for exynos4412-origen and
> exynos5250-smdk5250 respectively in similar way
>
>
> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/commit/?h=for-next&id=0207775d6ff7e6a6eddb9931f9328f0f0173a338
>
>
> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/commit/?h=for-next&id=06c460b73f75894cabfb1f5277f27cddbc92745c
>
> And also you can refer to
> Documentation/devicetree/bindings/video/display-timing.txt
>


>
> Best regards,
>> Tomasz
>>
>>
>
>
> --
> Thanks and Regards
>  Vikas Sajjan
>



-- 
Thanks and Regards
 Vikas Sajjan

--047d7b3a814a1b93e804dc5530e5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Tomasz,<br><div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On 10 May 2013 08:25, Vikas Sajjan <span dir=3D"ltr">&lt=
;<a href=3D"mailto:vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" target=3D"_blank">vikas.sajjan@=
linaro.org</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Tomas=
z,<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote"><div><d=
iv>
On 10 May 2013 05:35, Tomasz Figa <span dir=3D"ltr">&lt;<a href=3D"mailto:t=
omasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span=
> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi Vikas,<br>
<div><div><br>
On Wednesday 08 of May 2013 11:31:34 Vikas Sajjan wrote:<br>
&gt; Adds display timing node for a DP panel to Arndale Board DTS file<br>
&gt;<br>
&gt; Signed-off-by: Vikas Sajjan &lt;<a href=3D"mailto:vikas.sajjan@linaro.=
org" target=3D"_blank">vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt; ---<br>
&gt; =A0arch/arm/boot/dts/exynos5250-arndale.dts | =A0 16 ++++++++++++++++<=
br>
&gt; =A01 file changed, 16 insertions(+)<br>
&gt;<br>
&gt; diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts<br>
&gt; b/arch/arm/boot/dts/exynos5250-arndale.dts index f68b820..c831a5c<br>
&gt; 100644<br>
&gt; --- a/arch/arm/boot/dts/exynos5250-arndale.dts<br>
&gt; +++ b/arch/arm/boot/dts/exynos5250-arndale.dts<br>
&gt; @@ -459,4 +459,20 @@<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung,lane-count =3D &lt;4&gt;;<br>
&gt; =A0 =A0 =A0 };<br>
&gt;<br>
&gt; + =A0 =A0 display-timings {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 native-mode =3D &lt;&amp;timing0&gt;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 timing0: timing@0 {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 2560x1600 DP panel */<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D &lt;5000=
0&gt;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hactive =3D &lt;2560&gt;;<br=
>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vactive =3D &lt;1600&gt;;<br=
>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hfront-porch =3D &lt;48&gt;;=
<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hback-porch =3D &lt;80&gt;;<=
br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hsync-len =3D &lt;32&gt;;<br=
>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vback-porch =3D &lt;16&gt;;<=
br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vfront-porch =3D &lt;8&gt;;<=
br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vsync-len =3D &lt;6&gt;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 };<br>
&gt; + =A0 =A0 };<br>
<br>
</div></div>What display are those timings used for? Shouldn&#39;t they be =
placed inside<br>
node of that display?<br>
<br></blockquote></div></div><div>This timing information will be used pars=
ed by the FIMD probe with the help of &quot;Video Helper function&quot;=A0 =
as done in this link <br><br><a href=3D"https://git.kernel.org/cgit/linux/k=
ernel/git/daeinki/drm-exynos.git/commit/?h=3Dexynos-drm-next&amp;id=3D7f459=
6f4aebcc9fcf2d50d3fe398508d710c4dd0" target=3D"_blank">https://git.kernel.o=
rg/cgit/linux/kernel/git/daeinki/drm-exynos.git/commit/?h=3Dexynos-drm-next=
&amp;id=3D7f4596f4aebcc9fcf2d50d3fe398508d710c4dd0</a><br>



<br>Please refer to this patch which is used for exynos4412-origen and exyn=
os5250-smdk5250 respectively in similar way<br><br><a href=3D"https://git.k=
ernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/commit/?h=3Dfor-nex=
t&amp;id=3D0207775d6ff7e6a6eddb9931f9328f0f0173a338" target=3D"_blank">http=
s://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/commit/?h=
=3Dfor-next&amp;id=3D0207775d6ff7e6a6eddb9931f9328f0f0173a338</a><br>



<br><a href=3D"https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-sam=
sung.git/commit/?h=3Dfor-next&amp;id=3D06c460b73f75894cabfb1f5277f27cddbc92=
745c" target=3D"_blank">https://git.kernel.org/cgit/linux/kernel/git/kgene/=
linux-samsung.git/commit/?h=3Dfor-next&amp;id=3D06c460b73f75894cabfb1f5277f=
27cddbc92745c</a><br>



=A0<br></div><div>And also you can refer to Documentation/devicetree/bindin=
gs/video/display-timing.txt <br></div></div></div></div></blockquote><div>=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">


<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Best regards,<br>
Tomasz<br>
<br><span><font color=3D"#888888">
</font></span></blockquote></div><span><font color=3D"#888888"><br><br clea=
r=3D"all"><br>-- <br>Thanks and Regards<div>=A0Vikas Sajjan</div>
</font></span></div></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br>Thanks and Regards<div>=
=A0Vikas Sajjan</div>
</div></div></div>

--047d7b3a814a1b93e804dc5530e5--

--===============5553216101841137840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5553216101841137840==--
