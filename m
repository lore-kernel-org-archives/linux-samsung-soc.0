From: Vikas Sajjan <vikas.sajjan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v11 0/3] Add DRM FIMD DT support for Exynos4 DT Machines
Date: Mon, 8 Apr 2013 14:09:30 +0530
Message-ID: <CAD025ySVQ_cRA9FMWDzJEP0_4-Qakd2m1_ZukKM-ycHTQi-GFg@mail.gmail.com>
References: <1365157062-8669-1-git-send-email-vikas.sajjan@linaro.org>
 <2c9101ce3429$ea91f2e0$bfb5d8a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8438670628475809994=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <2c9101ce3429$ea91f2e0$bfb5d8a0$%kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: InKi Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sunil joshi <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============8438670628475809994==
Content-Type: multipart/alternative; boundary=047d7b34338051e38804d9d5616e

--047d7b34338051e38804d9d5616e
Content-Type: text/plain; charset=ISO-8859-1

Thank you.


On 8 April 2013 12:53, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:

> Vikas Sajjan wrote:
> >
> > This patch series adds support for DRM FIMD DT for Exynos4 DT Machines,
> > specifically for Exynos4412 SoC.
> >
> > changes since v10:
> >       - addressed comments from Sylwester Nawrocki
> > <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >
> > changes since v9:
> >       - dropped the patch "ARM: dts: Add lcd pinctrl node entries for
> > EXYNOS4412 SoC"
> >       as the gpios in the newly added nodes "lcd_en" and "lcd_sync" in
> > this patch
> >       were already PULLed high by existing "lcd_clk" node.
> >       - addressed comments from Sylwester Nawrocki
> > <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >       and Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >
> > changes since v8:
> >       - addressed comments to add missing documentation for clock and
> > clock-names
> >       properties as pointed out by Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
> >
> >
> > changes since v7:
> >       - rebased to kgene's "for-next"
> >       - Migrated to Common Clock Framework
> >       - removed the patch "ARM: dts: Add FIMD AUXDATA node entry for
> > exynos4 DT",
> >       as migration to Common Clock Framework will NOT need this.
> >       - addressed the comments raised by Sachin Kamat
> > <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >
> > changes since v6:
> >       - addressed comments and added interrupt-names = "fifo", "vsync",
> > "lcd_sys"
> >       in exynos4.dtsi and re-ordered the interrupt numbering to match the
> > order in
> >       interrupt combiner IP as suggested by Sylwester Nawrocki
> > <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>.
> >
> > changes since v5:
> >       - renamed the fimd binding documentation file name as "samsung-
> > fimd.txt",
> >       since it not only talks about exynos display controller but also
> > about
> >       previous samsung display controllers.
> >       - rephrased an abmigious statement about the interrupt combiner in
> > the
> >       fimd binding documentation as pointed out by
> >       Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >
> > changes since v4:
> >       - moved the fimd binding documentation to
> > Documentation/devicetree/bindings/video/
> >       as suggested by Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >
> >       - added more fimd compatiblity strings in fimd documentation as
> >       discussed at  https://patchwork.kernel.org/patch/2144861/ with
> >       Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> and
> >       Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >
> >       - modified compatible string for exynos4 fimd as "exynos4210-fimd"
> >       exynos5 fimd as "exynos5250-fimd" to stick to the rule that
> > compatible
> >       value should be named after first specific SoC model in which this
> >       particular IP version was included as discussed at
> >       https://patchwork.kernel.org/patch/2144861/
> >
> >       - documented more about the interrupt combiner and their order as
> >       suggested by Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >
> > changes since v3:
> >       - rebased on
> >       http://git.kernel.org/?p=linux/kernel/git/kgene/linux-
> > samsung.git;a=shortlog;h=refs/heads/for-next-next
> >
> > changes since v2:
> >       - added alias to 'fimd@11c00000' node
> >               (reported by: Rahul Sharma <r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>)
> >       - removed 'lcd0_data' node as there was already a similar node
> > lcd_data24
> >               (reported by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >       - replaced spaces with tabs in display-timing node
> >
> > changes since v1:
> >       - added new patch to add FIMD DT binding Documentation
> >       - removed patch enabling SAMSUNG_DEV_BACKLIGHT and SAMSUNG_DEV_PMW
> >       for mach-exynos4 DT
> >       - added 'status' property to fimd DT node
> >
> > Is based on branch kgene's "for-next"
> > https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-
> > samsung.git/log/?h=for-next
> >
> > Vikas Sajjan (3):
> >   ARM: dts: Add FIMD node to exynos4
> >   ARM: dts: Add FIMD node and display timing node to
> >     exynos4412-origen.dts
> >   ARM: dts: Add FIMD DT binding Documentation
> >
> >  .../devicetree/bindings/video/samsung-fimd.txt     |   65
> > ++++++++++++++++++++
> >  arch/arm/boot/dts/exynos4.dtsi                     |   12 ++++
> >  arch/arm/boot/dts/exynos4412-origen.dts            |   21 +++++++
> >  3 files changed, 98 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/video/samsung-
> > fimd.txt
> >
> > --
> > 1.7.9.5
>
> Looks good to me, applied.
>
> Thanks.
>
> - Kukjin
>
>


-- 
Thanks and Regards
 Vikas Sajjan

--047d7b34338051e38804d9d5616e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you.</div><div class=3D"gmail_extra"><br><br><div cl=
ass=3D"gmail_quote">On 8 April 2013 12:53, Kukjin Kim <span dir=3D"ltr">&lt=
;<a href=3D"mailto:kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" target=3D"_blank">kgene.kim@samsu=
ng.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">Vika=
s Sajjan wrote:<br>
&gt;<br>
&gt; This patch series adds support for DRM FIMD DT for Exynos4 DT Machines=
,<br>
&gt; specifically for Exynos4412 SoC.<br>
&gt;<br>
&gt; changes since v10:<br>
&gt; =A0 =A0 =A0 - addressed comments from Sylwester Nawrocki<br>
&gt; &lt;<a href=3D"mailto:sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">sylvester.nawrocki=
@gmail.com</a>&gt;<br>
&gt;<br>
&gt; changes since v9:<br>
&gt; =A0 =A0 =A0 - dropped the patch &quot;ARM: dts: Add lcd pinctrl node e=
ntries for<br>
&gt; EXYNOS4412 SoC&quot;<br>
&gt; =A0 =A0 =A0 as the gpios in the newly added nodes &quot;lcd_en&quot; a=
nd &quot;lcd_sync&quot; in<br>
&gt; this patch<br>
&gt; =A0 =A0 =A0 were already PULLed high by existing &quot;lcd_clk&quot; n=
ode.<br>
&gt; =A0 =A0 =A0 - addressed comments from Sylwester Nawrocki<br>
&gt; &lt;<a href=3D"mailto:sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">sylvester.nawrocki=
@gmail.com</a>&gt;<br>
&gt; =A0 =A0 =A0 and Thomas Abraham &lt;<a href=3D"mailto:thomas.abraham@li=
naro.org">thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt;<br>
&gt; changes since v8:<br>
&gt; =A0 =A0 =A0 - addressed comments to add missing documentation for cloc=
k and<br>
&gt; clock-names<br>
&gt; =A0 =A0 =A0 properties as pointed out by Sachin Kamat &lt;<a href=3D"m=
ailto:sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt;<br>
&gt; changes since v7:<br>
&gt; =A0 =A0 =A0 - rebased to kgene&#39;s &quot;for-next&quot;<br>
&gt; =A0 =A0 =A0 - Migrated to Common Clock Framework<br>
&gt; =A0 =A0 =A0 - removed the patch &quot;ARM: dts: Add FIMD AUXDATA node =
entry for<br>
&gt; exynos4 DT&quot;,<br>
&gt; =A0 =A0 =A0 as migration to Common Clock Framework will NOT need this.=
<br>
&gt; =A0 =A0 =A0 - addressed the comments raised by Sachin Kamat<br>
&gt; &lt;<a href=3D"mailto:sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org=
</a>&gt;<br>
&gt;<br>
&gt; changes since v6:<br>
&gt; =A0 =A0 =A0 - addressed comments and added interrupt-names =3D &quot;f=
ifo&quot;, &quot;vsync&quot;,<br>
&gt; &quot;lcd_sys&quot;<br>
&gt; =A0 =A0 =A0 in exynos4.dtsi and re-ordered the interrupt numbering to =
match the<br>
&gt; order in<br>
&gt; =A0 =A0 =A0 interrupt combiner IP as suggested by Sylwester Nawrocki<b=
r>
&gt; &lt;<a href=3D"mailto:sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">sylvester.nawrocki=
@gmail.com</a>&gt;.<br>
&gt;<br>
&gt; changes since v5:<br>
&gt; =A0 =A0 =A0 - renamed the fimd binding documentation file name as &quo=
t;samsung-<br>
&gt; fimd.txt&quot;,<br>
&gt; =A0 =A0 =A0 since it not only talks about exynos display controller bu=
t also<br>
&gt; about<br>
&gt; =A0 =A0 =A0 previous samsung display controllers.<br>
&gt; =A0 =A0 =A0 - rephrased an abmigious statement about the interrupt com=
biner in<br>
&gt; the<br>
&gt; =A0 =A0 =A0 fimd binding documentation as pointed out by<br>
&gt; =A0 =A0 =A0 Sachin Kamat &lt;<a href=3D"mailto:sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org=
">sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt;<br>
&gt; changes since v4:<br>
&gt; =A0 =A0 =A0 - moved the fimd binding documentation to<br>
&gt; Documentation/devicetree/bindings/video/<br>
&gt; =A0 =A0 =A0 as suggested by Sylwester Nawrocki &lt;<a href=3D"mailto:s=
ylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
&gt;<br>
&gt; =A0 =A0 =A0 - added more fimd compatiblity strings in fimd documentati=
on as<br>
&gt; =A0 =A0 =A0 discussed at =A0<a href=3D"https://patchwork.kernel.org/pa=
tch/2144861/" target=3D"_blank">https://patchwork.kernel.org/patch/2144861/=
</a> with<br>
&gt; =A0 =A0 =A0 Sylwester Nawrocki &lt;<a href=3D"mailto:sylvester.nawrock=
i@gmail.com">sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; and<br>
&gt; =A0 =A0 =A0 Tomasz Figa &lt;<a href=3D"mailto:tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">t=
omasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
&gt;<br>
&gt; =A0 =A0 =A0 - modified compatible string for exynos4 fimd as &quot;exy=
nos4210-fimd&quot;<br>
&gt; =A0 =A0 =A0 exynos5 fimd as &quot;exynos5250-fimd&quot; to stick to th=
e rule that<br>
&gt; compatible<br>
&gt; =A0 =A0 =A0 value should be named after first specific SoC model in wh=
ich this<br>
&gt; =A0 =A0 =A0 particular IP version was included as discussed at<br>
&gt; =A0 =A0 =A0 <a href=3D"https://patchwork.kernel.org/patch/2144861/" ta=
rget=3D"_blank">https://patchwork.kernel.org/patch/2144861/</a><br>
&gt;<br>
&gt; =A0 =A0 =A0 - documented more about the interrupt combiner and their o=
rder as<br>
&gt; =A0 =A0 =A0 suggested by Sylwester Nawrocki &lt;<a href=3D"mailto:sylv=
ester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
&gt;<br>
&gt; changes since v3:<br>
&gt; =A0 =A0 =A0 - rebased on<br>
&gt; =A0 =A0 =A0 <a href=3D"http://git.kernel.org/?p=3Dlinux/kernel/git/kge=
ne/linux-" target=3D"_blank">http://git.kernel.org/?p=3Dlinux/kernel/git/kg=
ene/linux-</a><br>
&gt; samsung.git;a=3Dshortlog;h=3Drefs/heads/for-next-next<br>
&gt;<br>
&gt; changes since v2:<br>
&gt; =A0 =A0 =A0 - added alias to &#39;fimd@11c00000&#39; node<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 (reported by: Rahul Sharma &lt;<a href=3D"=
mailto:r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;)<br>
&gt; =A0 =A0 =A0 - removed &#39;lcd0_data&#39; node as there was already a =
similar node<br>
&gt; lcd_data24<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 (reported by: Jingoo Han &lt;<a href=3D"ma=
ilto:jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org">jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org</a>&gt;<br>
&gt; =A0 =A0 =A0 - replaced spaces with tabs in display-timing node<br>
&gt;<br>
&gt; changes since v1:<br>
&gt; =A0 =A0 =A0 - added new patch to add FIMD DT binding Documentation<br>
&gt; =A0 =A0 =A0 - removed patch enabling SAMSUNG_DEV_BACKLIGHT and SAMSUNG=
_DEV_PMW<br>
&gt; =A0 =A0 =A0 for mach-exynos4 DT<br>
&gt; =A0 =A0 =A0 - added &#39;status&#39; property to fimd DT node<br>
&gt;<br>
&gt; Is based on branch kgene&#39;s &quot;for-next&quot;<br>
&gt; <a href=3D"https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-" =
target=3D"_blank">https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-=
</a><br>
&gt; samsung.git/log/?h=3Dfor-next<br>
&gt;<br>
&gt; Vikas Sajjan (3):<br>
&gt; =A0 ARM: dts: Add FIMD node to exynos4<br>
&gt; =A0 ARM: dts: Add FIMD node and display timing node to<br>
&gt; =A0 =A0 exynos4412-origen.dts<br>
&gt; =A0 ARM: dts: Add FIMD DT binding Documentation<br>
&gt;<br>
&gt; =A0.../devicetree/bindings/video/samsung-fimd.txt =A0 =A0 | =A0 65<br>
&gt; ++++++++++++++++++++<br>
&gt; =A0arch/arm/boot/dts/exynos4.dtsi =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 12 ++++<br>
&gt; =A0arch/arm/boot/dts/exynos4412-origen.dts =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 21 +++++++<br>
&gt; =A03 files changed, 98 insertions(+)<br>
&gt; =A0create mode 100644 Documentation/devicetree/bindings/video/samsung-=
<br>
&gt; fimd.txt<br>
&gt;<br>
&gt; --<br>
&gt; 1.7.9.5<br>
<br>
</div></div>Looks good to me, applied.<br>
<br>
Thanks.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
- Kukjin<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>Thanks and Regards<div>=A0Vikas Sajjan</div>
</div>

--047d7b34338051e38804d9d5616e--

--===============8438670628475809994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8438670628475809994==--
