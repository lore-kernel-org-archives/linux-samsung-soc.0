From: Vikas Sajjan <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: Add display timing node to
 exynos5250-arndale.dts
Date: Fri, 10 May 2013 11:57:34 +0530
Message-ID: <CAD025ySx39kOphk3BNrnM+i7-9KHQr607cRYZXKa7uJ6GBXSiA@mail.gmail.com>
References: <1367992894-20198-1-git-send-email-vikas.sajjan@linaro.org>
 <1367992894-20198-4-git-send-email-vikas.sajjan@linaro.org>
 <4212940.hYf2k9NPUY@flatron>
 <CAD025yRnuk2oK1B40p5XTQ7n+aX+ta2PTdEuceCbvRUEvRgzSg@mail.gmail.com>
 <CAOesGMg0LLhC7=EYtWxaDL5x=v=ZA6ov5K_j-nxhzev4L-w-Rg@mail.gmail.com>
 <CAD025yQ+vnNc1RqoqoBw9JqYUp6aAY2wTowhVyV+zoDZq9sJ6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0293832027757489628=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAD025yQ+vnNc1RqoqoBw9JqYUp6aAY2wTowhVyV+zoDZq9sJ6g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, InKi Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "kgene.kim" <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0293832027757489628==
Content-Type: multipart/alternative; boundary=001a11c34a3a697dc404dc574420

--001a11c34a3a697dc404dc574420
Content-Type: text/plain; charset=ISO-8859-1

Hi Olof,


On 10 May 2013 11:51, Vikas Sajjan <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> Hi Olof,
>
>
> On 10 May 2013 11:08, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>
>> On Thu, May 9, 2013 at 7:55 PM, Vikas Sajjan <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> wrote:
>> > Hi Tomasz,
>> >
>> >
>> > On 10 May 2013 05:35, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> >>
>> >> Hi Vikas,
>> >>
>> >> On Wednesday 08 of May 2013 11:31:34 Vikas Sajjan wrote:
>> >> > Adds display timing node for a DP panel to Arndale Board DTS file
>> >> >
>> >> > Signed-off-by: Vikas Sajjan <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> >> > ---
>> >> >  arch/arm/boot/dts/exynos5250-arndale.dts |   16 ++++++++++++++++
>> >> >  1 file changed, 16 insertions(+)
>> >> >
>> >> > diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts
>> >> > b/arch/arm/boot/dts/exynos5250-arndale.dts index f68b820..c831a5c
>> >> > 100644
>> >> > --- a/arch/arm/boot/dts/exynos5250-arndale.dts
>> >> > +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
>> >> > @@ -459,4 +459,20 @@
>> >> >               samsung,lane-count = <4>;
>> >> >       };
>> >> >
>> >> > +     display-timings {
>> >> > +             native-mode = <&timing0>;
>> >> > +             timing0: timing@0 {
>> >> > +                     /* 2560x1600 DP panel */
>> >> > +                     clock-frequency = <50000>;
>> >> > +                     hactive = <2560>;
>> >> > +                     vactive = <1600>;
>> >> > +                     hfront-porch = <48>;
>> >> > +                     hback-porch = <80>;
>> >> > +                     hsync-len = <32>;
>> >> > +                     vback-porch = <16>;
>> >> > +                     vfront-porch = <8>;
>> >> > +                     vsync-len = <6>;
>> >> > +             };
>> >> > +     };
>> >>
>> >> What display are those timings used for? Shouldn't they be placed
>> inside
>> >> node of that display?
>> >>
>> >
>> > This timing information will be used parsed by the FIMD probe with the
>> help
>> > of "Video Helper function"  as done in this link
>> >
>> >
>> https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/commit/?h=exynos-drm-next&id=7f4596f4aebcc9fcf2d50d3fe398508d710c4dd0
>>
>> That function passes in a device node pointer to the FIMD device node,
>> and only looks for a display-timings node under there. Tomasz is
>> right, as far as I can tell.
>>
>> Placing display timings at the root of the device tree seems completely
>> wrong.
>>
>>         I referred this "
Documentation/devicetree/bindings/video/display-timing.txt" for example

            here it dosen't mention about whether display timings node can
be placed at the root of the device tree or NOT.
 Not sure how we should be placing the node then.


>
>
>> > Please refer to this patch which is used for exynos4412-origen and
>> > exynos5250-smdk5250 respectively in similar way
>> >
>> >
>> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/commit/?h=for-next&id=0207775d6ff7e6a6eddb9931f9328f0f0173a338
>> >
>> >
>> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/commit/?h=for-next&id=06c460b73f75894cabfb1f5277f27cddbc92745c
>>
>> That needs to be fixed up as well, thanks for pointing it out.
>>
>>
>> -Olof
>>
>
>
>
> --
> Thanks and Regards
>  Vikas Sajjan
>



-- 
Thanks and Regards
 Vikas Sajjan

--001a11c34a3a697dc404dc574420
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Olof,<br><div class=3D"gmail_extra"><br><br><div class=
=3D"gmail_quote">On 10 May 2013 11:51, Vikas Sajjan <span dir=3D"ltr">&lt;<=
a href=3D"mailto:vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" target=3D"_blank">vikas.sajjan@li=
naro.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Olof,=
<br><div class=3D"gmail_extra"><div><div class=3D"h5"><br><br><div class=3D=
"gmail_quote">

On 10 May 2013 11:08, Olof Johansson <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" target=3D"_blank">olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org</a>&gt;</span> wrote:<br=
>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div><div>On Thu, May 9, =
2013 at 7:55 PM, Vikas Sajjan &lt;<a href=3D"mailto:vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org=
" target=3D"_blank">vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt; wrote:<br>



&gt; Hi Tomasz,<br>
&gt;<br>
&gt;<br>
&gt; On 10 May 2013 05:35, Tomasz Figa &lt;<a href=3D"mailto:tomasz.figa@gm=
ail.com" target=3D"_blank">tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Vikas,<br>
&gt;&gt;<br>
&gt;&gt; On Wednesday 08 of May 2013 11:31:34 Vikas Sajjan wrote:<br>
&gt;&gt; &gt; Adds display timing node for a DP panel to Arndale Board DTS =
file<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Vikas Sajjan &lt;<a href=3D"mailto:vikas.sajja=
n@linaro.org" target=3D"_blank">vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt; =A0arch/arm/boot/dts/exynos5250-arndale.dts | =A0 16 ++++++++=
++++++++<br>
&gt;&gt; &gt; =A01 file changed, 16 insertions(+)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts<br>
&gt;&gt; &gt; b/arch/arm/boot/dts/exynos5250-arndale.dts index f68b820..c83=
1a5c<br>
&gt;&gt; &gt; 100644<br>
&gt;&gt; &gt; --- a/arch/arm/boot/dts/exynos5250-arndale.dts<br>
&gt;&gt; &gt; +++ b/arch/arm/boot/dts/exynos5250-arndale.dts<br>
&gt;&gt; &gt; @@ -459,4 +459,20 @@<br>
&gt;&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung,lane-count =3D &lt;4&gt;;=
<br>
&gt;&gt; &gt; =A0 =A0 =A0 };<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; + =A0 =A0 display-timings {<br>
&gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 native-mode =3D &lt;&amp;timing0&gt=
;;<br>
&gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 timing0: timing@0 {<br>
&gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 2560x1600 DP pan=
el */<br>
&gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D=
 &lt;50000&gt;;<br>
&gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hactive =3D &lt;256=
0&gt;;<br>
&gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vactive =3D &lt;160=
0&gt;;<br>
&gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hfront-porch =3D &l=
t;48&gt;;<br>
&gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hback-porch =3D &lt=
;80&gt;;<br>
&gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hsync-len =3D &lt;3=
2&gt;;<br>
&gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vback-porch =3D &lt=
;16&gt;;<br>
&gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vfront-porch =3D &l=
t;8&gt;;<br>
&gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vsync-len =3D &lt;6=
&gt;;<br>
&gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 };<br>
&gt;&gt; &gt; + =A0 =A0 };<br>
&gt;&gt;<br>
&gt;&gt; What display are those timings used for? Shouldn&#39;t they be pla=
ced inside<br>
&gt;&gt; node of that display?<br>
&gt;&gt;<br>
&gt;<br>
&gt; This timing information will be used parsed by the FIMD probe with the=
 help<br>
&gt; of &quot;Video Helper function&quot; =A0as done in this link<br>
&gt;<br>
&gt; <a href=3D"https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-ex=
ynos.git/commit/?h=3Dexynos-drm-next&amp;id=3D7f4596f4aebcc9fcf2d50d3fe3985=
08d710c4dd0" target=3D"_blank">https://git.kernel.org/cgit/linux/kernel/git=
/daeinki/drm-exynos.git/commit/?h=3Dexynos-drm-next&amp;id=3D7f4596f4aebcc9=
fcf2d50d3fe398508d710c4dd0</a><br>



<br>
</div></div>That function passes in a device node pointer to the FIMD devic=
e node,<br>
and only looks for a display-timings node under there. Tomasz is<br>
right, as far as I can tell.<br>
<br>
Placing display timings at the root of the device tree seems completely wro=
ng.<br>
<div><br></div></blockquote></div></div></div></div></div></blockquote><div=
>=A0 =A0 =A0 =A0 I referred this &quot; Documentation/devicetree/bindings/v=
ideo/display-timing.txt&quot; for example<br><br></div><div>=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 here it dosen&#39;t mention about whether display timing=
s node can be placed at the root of the device tree or NOT.<br>

</div><div>=A0Not sure how we should be placing the node then.<br></div><di=
v>=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr">

<div class=3D"gmail_extra"><div><div class=3D"h5"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div></div></blockquote=
><div>

=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
&gt; Please refer to this patch which is used for exynos4412-origen and<br>
&gt; exynos5250-smdk5250 respectively in similar way<br>
&gt;<br>
&gt; <a href=3D"https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-sa=
msung.git/commit/?h=3Dfor-next&amp;id=3D0207775d6ff7e6a6eddb9931f9328f0f017=
3a338" target=3D"_blank">https://git.kernel.org/cgit/linux/kernel/git/kgene=
/linux-samsung.git/commit/?h=3Dfor-next&amp;id=3D0207775d6ff7e6a6eddb9931f9=
328f0f0173a338</a><br>



&gt;<br>
&gt; <a href=3D"https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-sa=
msung.git/commit/?h=3Dfor-next&amp;id=3D06c460b73f75894cabfb1f5277f27cddbc9=
2745c" target=3D"_blank">https://git.kernel.org/cgit/linux/kernel/git/kgene=
/linux-samsung.git/commit/?h=3Dfor-next&amp;id=3D06c460b73f75894cabfb1f5277=
f27cddbc92745c</a><br>



<br>
</div>That needs to be fixed up as well, thanks for pointing it out.<br>
<span><font color=3D"#888888"><br>
<br>
-Olof<br>
</font></span></blockquote></div><br><br clear=3D"all"><br></div></div><div=
 class=3D"im">-- <br>Thanks and Regards<div>=A0Vikas Sajjan</div>
</div></div></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br>Thanks and Regards<div>=
=A0Vikas Sajjan</div>
</div></div>

--001a11c34a3a697dc404dc574420--

--===============0293832027757489628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0293832027757489628==--
