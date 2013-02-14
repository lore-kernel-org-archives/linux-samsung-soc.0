From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 7/7] ARM: dts: Add Samsung G2D DT bindings documentation
Date: Thu, 14 Feb 2013 21:15:51 +0530
Message-ID: <CAK9yfHyEfEhRE-7CUeu7x7GbqJZL4aJfgHso2kXoGCWRrxiYWw@mail.gmail.com>
References: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org>
 <1360151477-26460-8-git-send-email-sachin.kamat@linaro.org>
 <511C1462.5060106@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4175752102429326526=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <511C1462.5060106-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============4175752102429326526==
Content-Type: multipart/alternative; boundary=f46d043c80264582bf04d5b127ae

--f46d043c80264582bf04d5b127ae
Content-Type: text/plain; charset=ISO-8859-1

On Thursday, 14 February 2013, Sylwester Nawrocki <
sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 02/06/2013 12:51 PM, Sachin Kamat wrote:
>>
>> Added documentaion about G2D bindings.
>
> s/documentaion/documentation

Ok.
>
>> Signed-off-by: Sachin Kamat<sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>   .../devicetree/bindings/gpu/samsung-g2d.txt        |   30
++++++++++++++++++++
>>   1 files changed, 30 insertions(+), 0 deletions(-)
>>   create mode 100644
Documentation/devicetree/bindings/gpu/samsung-g2d.txt
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
>> new file mode 100644
>> index 0000000..838b26b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
>> @@ -0,0 +1,30 @@
>> +* Samsung 2D Graphics Accelerator
>> +
>
>> +Samsung FIMG2D is a 2D graphics accelerator which supports Bit Block
Transfer.
>> +We set the drawing-context registers for configuring the rendering
parameters
>> +and then start rendering.
>> +The G2D has V4L2 as well as DRM framework based driver support.
>
> IMHO this whole paragraph is irrelevant and could be dropped.

Ok. Had formatted this based on mfc document.
>
>> +Required properties:
>> +  - compatible : value should be one among the following
>
> missing colon at the end of line ?

Hmm. I think so.

>
>> +       (a) "samsung,s5pv210-g2d" for G2D IP present in S5PV210&
 Exynos4210 SoC
>> +       (b) "samsung,exynos4212-g2d" for G2D IP present in Exynos4x12
SoCs
>> +       (b) "samsung,exynos5250-g2d" for G2D IP present in Exynos5250 SoC
>
> s/(b)/(c)

Yes, copy paste error :)

>
>> +
>> +  - reg : Physical base address of the IP registers and length of memory
>> +         mapped region.
>> +
>> +  - interrupts : G2D interrupt number to the CPU.
>> +
>> +Optional properties:
>> +  - samsung,power-domain : power-domain property defined with a phandle
>> +                          to respective power domain.
>> +
>> +Example:
>> +       g2d@12800000 {
>> +               compatible = "samsung,s5pv210-g2d";
>> +               reg =<0x12800000 0x1000>;
>> +               interrupts =<0 89 0>;
>> +               samsung,power-domain =<&pd_lcd0>;
>> +               status = "disabled";
>> +       };
>
> Otherwise looks good to me.

Thanks for reviewing. Does the filename look good or should it be
exynos-g2d?

Regards,
Sachin.

-- 
With warm regards,
Sachin

--f46d043c80264582bf04d5b127ae
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br>On Thursday, 14 February 2013, Sylwester Nawrocki &lt;<a href=3D"ma=
ilto:sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wro=
te:<br>&gt; On 02/06/2013 12:51 PM, Sachin Kamat wrote:<br>&gt;&gt;<br>&gt;=
&gt; Added documentaion about G2D bindings.<br>
&gt;<br>&gt; s/documentaion/documentation<br><br>Ok.<br>&gt;<br>&gt;&gt; Si=
gned-off-by: Sachin Kamat&lt;<a href=3D"mailto:sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">sac=
hin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt; =A0 .../devicetree=
/bindings/gpu/samsung-g2d.txt =A0 =A0 =A0 =A0| =A0 30 ++++++++++++++++++++<=
br>
&gt;&gt; =A0 1 files changed, 30 insertions(+), 0 deletions(-)<br>&gt;&gt; =
=A0 create mode 100644 Documentation/devicetree/bindings/gpu/samsung-g2d.tx=
t<br>&gt;&gt;<br>&gt;&gt; diff --git a/Documentation/devicetree/bindings/gp=
u/samsung-g2d.txt b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt<b=
r>
&gt;&gt; new file mode 100644<br>&gt;&gt; index 0000000..838b26b<br>&gt;&gt=
; --- /dev/null<br>&gt;&gt; +++ b/Documentation/devicetree/bindings/gpu/sam=
sung-g2d.txt<br>&gt;&gt; @@ -0,0 +1,30 @@<br>&gt;&gt; +* Samsung 2D Graphic=
s Accelerator<br>
&gt;&gt; +<br>&gt;<br>&gt;&gt; +Samsung FIMG2D is a 2D graphics accelerator=
 which supports Bit Block Transfer.<br>&gt;&gt; +We set the drawing-context=
 registers for configuring the rendering parameters<br>&gt;&gt; +and then s=
tart rendering.<br>
&gt;&gt; +The G2D has V4L2 as well as DRM framework based driver support.<b=
r>&gt;<br>&gt; IMHO this whole paragraph is irrelevant and could be dropped=
.<br><br>Ok. Had formatted this based on mfc document.<br>&gt;<br>&gt;&gt; =
+Required properties:<br>
&gt;&gt; + =A0- compatible : value should be one among the following<br>&gt=
;<br>&gt; missing colon at the end of line ?<br><br>Hmm. I think so.<br><br=
>&gt;<br>&gt;&gt; + =A0 =A0 =A0 (a) &quot;samsung,s5pv210-g2d&quot; for G2D=
 IP present in S5PV210&amp; =A0Exynos4210 SoC<br>
&gt;&gt; + =A0 =A0 =A0 (b) &quot;samsung,exynos4212-g2d&quot; for G2D IP pr=
esent in Exynos4x12 SoCs<br>&gt;&gt; + =A0 =A0 =A0 (b) &quot;samsung,exynos=
5250-g2d&quot; for G2D IP present in Exynos5250 SoC<br>&gt;<br>&gt; s/(b)/(=
c)<br><br>
Yes, copy paste error :)<br><br>&gt;<br>&gt;&gt; +<br>&gt;&gt; + =A0- reg :=
 Physical base address of the IP registers and length of memory<br>&gt;&gt;=
 + =A0 =A0 =A0 =A0 mapped region.<br>&gt;&gt; +<br>&gt;&gt; + =A0- interrup=
ts : G2D interrupt number to the CPU.<br>
&gt;&gt; +<br>&gt;&gt; +Optional properties:<br>&gt;&gt; + =A0- samsung,pow=
er-domain : power-domain property defined with a phandle<br>&gt;&gt; + =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0to respective power domain.<=
br>&gt;&gt; +<br>&gt;&gt; +Example:<br>
&gt;&gt; + =A0 =A0 =A0 g2d@12800000 {<br>&gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 compatible =3D &quot;samsung,s5pv210-g2d&quot;;<br>&gt;&gt; + =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 reg =3D&lt;0x12800000 0x1000&gt;;<br>&gt;&gt; + =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 interrupts =3D&lt;0 89 0&gt;;<br>
&gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung,power-domain =3D&lt;&amp;pd_=
lcd0&gt;;<br>&gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D &quot;disabl=
ed&quot;;<br>&gt;&gt; + =A0 =A0 =A0 };<br>&gt;<br>&gt; Otherwise looks good=
 to me.<br><br>Thanks for reviewing. Does the filename look good or should =
it be exynos-g2d?<br>
<br>Regards,<br>Sachin.<br><br>-- <br><div>With warm regards,</div>
<div>Sachin</div><br>

--f46d043c80264582bf04d5b127ae--

--===============4175752102429326526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4175752102429326526==--
