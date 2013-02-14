From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 7/7] ARM: dts: Add Samsung G2D DT bindings documentation
Date: Thu, 14 Feb 2013 21:19:49 +0530
Message-ID: <CAK9yfHxcZ41rLK5i_hZ2QoBKsxUHEk252XLOHSMHeS2WvGrcrQ@mail.gmail.com>
References: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org>
 <1360151477-26460-8-git-send-email-sachin.kamat@linaro.org>
 <104679815.9jiIT0ld5D@flatron>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5868735959972967079=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <104679815.9jiIT0ld5D@flatron>
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
Cc: "kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============5868735959972967079==
Content-Type: multipart/alternative; boundary=f46d044796fd700de704d5b1350f

--f46d044796fd700de704d5b1350f
Content-Type: text/plain; charset=ISO-8859-1

Hi Tomasz,

On Thursday, 14 February 2013, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Sachin,
>
> On Wednesday 06 of February 2013 17:21:17 Sachin Kamat wrote:
>> Added documentaion about G2D bindings.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  .../devicetree/bindings/gpu/samsung-g2d.txt        |   30
>> ++++++++++++++++++++ 1 files changed, 30 insertions(+), 0 deletions(-)
>>  create mode 100644
>> Documentation/devicetree/bindings/gpu/samsung-g2d.txt
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
>> b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt new file mode
>> 100644
>> index 0000000..838b26b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
>> @@ -0,0 +1,30 @@
>> +* Samsung 2D Graphics Accelerator
>> +
>> +Samsung FIMG2D is a 2D graphics accelerator which supports Bit Block
>> Transfer. +We set the drawing-context registers for configuring the
>> rendering parameters +and then start rendering.
>> +The G2D has V4L2 as well as DRM framework based driver support.
>> +
>> +Required properties:
>> +  - compatible : value should be one among the following
>> +     (a) "samsung,s5pv210-g2d" for G2D IP present in S5PV210 &
Exynos4210
>> SoC + (b) "samsung,exynos4212-g2d" for G2D IP present in Exynos4x12
>> SoCs +        (b) "samsung,exynos5250-g2d" for G2D IP present in
Exynos5250
>> SoC +
>> +  - reg : Physical base address of the IP registers and length of
>> memory +        mapped region.
>> +
>> +  - interrupts : G2D interrupt number to the CPU.
>> +
>> +Optional properties:
>> +  - samsung,power-domain : power-domain property defined with a phandle
>> +                        to respective power domain.
>
> I'm not sure if samsung,power-domain should be mentioned in this
> documentation file. The driver itself does not use this property.

Oh ok. I will check this again and remove if unnecessary.

>
> Otherwise looks fine.
>
> Best regards,
> Tomasz
>
>> +
>> +Example:
>> +     g2d@12800000 {
>> +             compatible = "samsung,s5pv210-g2d";
>> +             reg = <0x12800000 0x1000>;
>> +             interrupts = <0 89 0>;
>> +             samsung,power-domain = <&pd_lcd0>;
>> +             status = "disabled";
>> +     };
> --
> To unsubscribe from this list: send the line "unsubscribe
linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
With warm regards,
Sachin

--f46d044796fd700de704d5b1350f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Tomasz,<br><br>On Thursday, 14 February 2013, Tomasz Figa &lt;<a href=3D=
"mailto:tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>&gt;=
 Hi Sachin,<br>&gt;<br>&gt; On Wednesday 06 of February 2013 17:21:17 Sachi=
n Kamat wrote:<br>
&gt;&gt; Added documentaion about G2D bindings.<br>&gt;&gt;<br>&gt;&gt; Sig=
ned-off-by: Sachin Kamat &lt;<a href=3D"mailto:sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">sac=
hin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt; =A0.../devicetree/=
bindings/gpu/samsung-g2d.txt =A0 =A0 =A0 =A0| =A0 30<br>
&gt;&gt; ++++++++++++++++++++ 1 files changed, 30 insertions(+), 0 deletion=
s(-)<br>&gt;&gt; =A0create mode 100644<br>&gt;&gt; Documentation/devicetree=
/bindings/gpu/samsung-g2d.txt<br>&gt;&gt;<br>&gt;&gt; diff --git a/Document=
ation/devicetree/bindings/gpu/samsung-g2d.txt<br>
&gt;&gt; b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt new file m=
ode<br>&gt;&gt; 100644<br>&gt;&gt; index 0000000..838b26b<br>&gt;&gt; --- /=
dev/null<br>&gt;&gt; +++ b/Documentation/devicetree/bindings/gpu/samsung-g2=
d.txt<br>
&gt;&gt; @@ -0,0 +1,30 @@<br>&gt;&gt; +* Samsung 2D Graphics Accelerator<br=
>&gt;&gt; +<br>&gt;&gt; +Samsung FIMG2D is a 2D graphics accelerator which =
supports Bit Block<br>&gt;&gt; Transfer. +We set the drawing-context regist=
ers for configuring the<br>
&gt;&gt; rendering parameters +and then start rendering.<br>&gt;&gt; +The G=
2D has V4L2 as well as DRM framework based driver support.<br>&gt;&gt; +<br=
>&gt;&gt; +Required properties:<br>&gt;&gt; + =A0- compatible : value shoul=
d be one among the following<br>
&gt;&gt; + =A0 =A0 (a) &quot;samsung,s5pv210-g2d&quot; for G2D IP present i=
n S5PV210 &amp; Exynos4210<br>&gt;&gt; SoC + (b) &quot;samsung,exynos4212-g=
2d&quot; for G2D IP present in Exynos4x12<br>&gt;&gt; SoCs + =A0 =A0 =A0 =
=A0(b) &quot;samsung,exynos5250-g2d&quot; for G2D IP present in Exynos5250<=
br>
&gt;&gt; SoC +<br>&gt;&gt; + =A0- reg : Physical base address of the IP reg=
isters and length of<br>&gt;&gt; memory + =A0 =A0 =A0 =A0mapped region.<br>=
&gt;&gt; +<br>&gt;&gt; + =A0- interrupts : G2D interrupt number to the CPU.=
<br>&gt;&gt; +<br>
&gt;&gt; +Optional properties:<br>&gt;&gt; + =A0- samsung,power-domain : po=
wer-domain property defined with a phandle<br>&gt;&gt; + =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0to respective power domain.<br>&gt;<br>&gt; =
I&#39;m not sure if samsung,power-domain should be mentioned in this<br>
&gt; documentation file. The driver itself does not use this property.<br><=
br>Oh ok. I will check this again and remove if unnecessary.<br><br>&gt;<br=
>&gt; Otherwise looks fine.<br>&gt;<br>&gt; Best regards,<br>&gt; Tomasz<br=
>
&gt;<br>&gt;&gt; +<br>&gt;&gt; +Example:<br>&gt;&gt; + =A0 =A0 g2d@12800000=
 {<br>&gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;samsung,s5pv2=
10-g2d&quot;;<br>&gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x12800000 =
0x1000&gt;;<br>&gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D &lt;0 89 0=
&gt;;<br>
&gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 samsung,power-domain =3D &lt;&amp;pd_lcd=
0&gt;;<br>&gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 status =3D &quot;disabled&quot=
;;<br>&gt;&gt; + =A0 =A0 };<br>&gt; --<br>&gt; To unsubscribe from this lis=
t: send the line &quot;unsubscribe linux-samsung-soc&quot; in<br>
&gt; the body of a message to <a href=3D"mailto:majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org">=
majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org</a><br>&gt; More majordomo info at =A0<a href=3D"=
http://vger.kernel.org/majordomo-info.html">http://vger.kernel.org/majordom=
o-info.html</a><br>
&gt;<br><br>-- <br><div>With warm regards,</div>
<div>Sachin</div><br>

--f46d044796fd700de704d5b1350f--

--===============5868735959972967079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5868735959972967079==--
