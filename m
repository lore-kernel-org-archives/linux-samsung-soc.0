From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCHv3 1/4] drm/exynos: add device tree support for rotator
Date: Mon, 19 Aug 2013 11:03:31 +0900
Message-ID: <CAAQKjZPSM=Nj_FptqCyTzqG-NgnZp71nC0sx2JiztMrY6tjX7A@mail.gmail.com>
References: <1376370779-26930-1-git-send-email-chanho61.park@samsung.com>
	<1376370779-26930-2-git-send-email-chanho61.park@samsung.com>
	<52111EA5.5000800@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1738683883=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <52111EA5.5000800@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "sachin.kamat@linaro.org" <sachin.kamat@linaro.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>, Chanho Park <chanho61.park@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1738683883==
Content-Type: multipart/alternative; boundary=089e013c6a4ed677e704e4435891

--089e013c6a4ed677e704e4435891
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: quoted-printable

2013=B3=E2 8=BF=F9 19=C0=CF =BF=F9=BF=E4=C0=CF=BF=A1 Kukjin Kim<kgene.kim@s=
amsung.com>=B4=D4=C0=CC =C0=DB=BC=BA:
> On 08/13/13 14:12, Chanho Park wrote:
>>
>> The exynos4 platform is only dt-based since 3.10, we should convert
driver data
>> and ids to dt-based parsing methods. The rotator driver has a limit
table to get
>> size limit of input picture. Each SoCs has slightly different limit valu=
e
>> compared with any others.
>> For example, exynos4210's max_size of RGB888 is 16k x 16k. But, others
have
>> 8k x 8k. Another example the exynos5250 should have multiple of 2 pixel
size
>> for its X/Y axis. Thus, we should keep different tables for each of them=
.
>> This patch also includes desciptions of each nodes for the rotator and
specifies
>> a example how to bind it.
>>
>> Signed-off-by: Chanho Park<chanho61.park@samsung.com>
>> Cc: Inki Dae<inki.dae@samsung.com>
>
> Inki, do you OK on this? If so, let me take this whole series into the
samsung tree.

Signed-off-by: Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

>
> Thanks,
> Kukjin
>
>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>> ---
>>   .../devicetree/bindings/gpu/samsung-rotator.txt    |   27 +++++
>>   drivers/gpu/drm/exynos/exynos_drm_rotator.c        |  108
+++++++++++++++-----
>>   2 files changed, 107 insertions(+), 28 deletions(-)
>>   create mode 100644
Documentation/devicetree/bindings/gpu/samsung-rotator.txt
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/samsung-rotator.txt
b/Documentation/devicetree/bindings/gpu/samsung-rotator.txt
>> new file mode 100644
>> index 0000000..82cd1ed
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpu/samsung-rotator.txt
>> @@ -0,0 +1,27 @@
>> +* Samsung Image Rotator
>> +
>> +Required properties:
>> +  - compatible : value should be one of the following:
>> +       (a) "samsung,exynos4210-rotator" for Rotator IP in Exynos4210
>> +       (b) "samsung,exynos4212-rotator" for Rotator IP in
Exynos4212/4412
>> +       (c) "samsung,exynos5250-rotator" for Rotator IP in Exynos5250
>> +
>> +  - reg : Physical base address of the IP registers and length of memor=
y
>> +         mapped region.
>> +
>> +  - interrupts : Interrupt specifier for rotator interrupt, according
to format
>> +                specific to interrupt parent.
>> +
>> +  - clocks : Clock specifier for rotator clock, according to generic
clock
>> +            bindings. (See
Documentation/devicetree/bindings/clock/exynos*.txt)
>> +
>> +  - clock-names : Names of clocks. For exynos rotator, it should be
"rotator".
>> +
>> +Example:
>> +       rotator@12810000 {
>> +               compatible =3D "samsung,exynos4210-rotator";
>> +               reg =3D<0x12810000 0x1000>;
>> +               interrupts =3D<0 83 0>;
>> +               clocks =3D<&clock 278>;
>> +               clock-names =3D "rotator";
>> +       };
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
>> index 427640a..0485aea5 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
>> @@ -632,21 +632,98 @@ static int rotator_ippdrv_start(struct device
*dev, enum drm_exynos_ipp_cmd cmd)
>>         return 0;
>>   }
>>
>> +static struct rot_limit_table rot_limit_tbl_4210 =3D {
>> +       .ycbcr420_2p =3D {
>> +               .min_w =3D 32,
>> +               .min_h =3D 32,
>> +               .max_w =3D SZ_64K,
>> +               .max_h =3D SZ_64K,
>> +               .align =3D 3,
>> +       },
>> +       .rgb888 =3D {
>> +               .min_w =3D 8,
>> +               .min_h =3D 8,
>> +               .max_w =3D SZ_16K,
>> +               .max_h =3D SZ_16K,
>> +               .align =3D 2,
>> +       },
>> +};
>> +
>> +static struct rot_limit_table rot_limit_tbl_4x12 =3D {
>> +       .ycbcr420_2p =3D {
>> +               .min_w =3D 32,
>> +               .min_h =3D 32,
>> +               .max_w =3D SZ_32K,
>> +               .max_h =3D SZ_32K,
>> +               .align =3D 3,
>> +       },
>> +       .rgb888 =3D {
>> +               .min_w =3D 8,
>> +               .min_h =3D 8,
>> +               .max_w =3D SZ_8K,
>> +               .max_h =3D SZ_8K,
>> +               .align =3D 2,
>> +       },
>> +};
>> +
>> +static struct rot_limit_table rot_limit_tbl_5250 =3D {
>> +       .ycbcr420_2p =3D {
>> +               .min_w =3D 32,
>> +               .min_h =3D 32,
>> +               .max_w =3D SZ_32K,
>> +               .max_h =3D SZ_32K,
>> +               .align =3D 3,
>> +       },
>> +       .rgb888 =3D {
>> +               .min_w =3D 8,
>> +               .min_h =3D 8,
>> +               .max_w =3D SZ_8K,
>> +               .max_h =3D SZ_8K,
>> +               .align =3D 1,
>> +       },
>> +};
>> +
>> +static const struct of_device_id exynos_rotator_match[] =3D {
>> +       {
>> +               .compatible =3D "samsung,exynos4210-rotator",
>> +               .data =3D&rot_limit_tbl_4210,
>> +       },
>> +       {
>> +               .compatible =3D "samsung,exynos4212-rotator",
>> +               .data =3D&rot_limit_tbl_4x12,
>> +       },
>> +       {
>> +               .compatible =3D "samsung,exynos5250-rotator",
>> +               .data =3D&rot_limit_tbl_5250,
>> +       },
>> +       {},
>> +};
>> +
>>   static int rotator_probe(struct platform_device *pdev)
>>   {
>>         struct device *dev =3D&pdev->dev;
>>         struct rot_context *rot;
>>         struct exynos_drm_ippdrv *ippdrv;
>> +       const struct of_device_id *match;
>>         int ret;
>>
>> +       if (!dev->of_node) {
>> +               dev_err(dev, "cannot find of_node.\n");
>> +               return -ENODEV;
>> +       }
>> +
>>         rot =3D devm_kzalloc(dev, sizeof(*rot), GFP_KERNEL);
>>         if (!rot) {
>>                 dev_err(dev, "failed to allocate rot\n");
>>                 return -ENOMEM;
>>         }
>>
>> -       rot->limit_tbl =3D (struct rot_limit_table *)
>> -
platform_get_device_id(pdev)->driver_data;
>> +       match =3D of_match_node(exynos_rotator_match, dev->of_node);
>> +       if (!match) {
>> +               dev_err(dev, "failed to match node\n");
>> +               return -ENODEV;
>> +       }
>> +       rot->limit_tbl =3D (struct rot_limit_table *)match->data;
>>
>>         rot->regs_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0)=
;
>>         rot->regs =3D devm_ioremap_resource(dev, rot->regs_res);
>> @@ -718,31 +795,6 @@ static int rotator_remove(struct platform_device
*pdev)
>>         return 0;
>>   }
>>
>> -static struct rot_limit_table rot_limit_tbl =3D {
>> -       .ycbcr420_2p =3D {
>> -               .min_w =3D 32,
>> -               .min_h =3D 32,
>> -               .max_w =3D SZ_32K,
>> -               .max_h =3D SZ_32K,
>> -               .align =3D 3,
>> -       },
>> -       .rgb888 =3D {
>> -               .min_w =3D 8,
>> -               .min_h =3D 8,
>> -               .max_w =3D SZ_8K,
>> -               .max_h =3D SZ_8K,
>> -               .align =3D 2,
>> -       },
>> -};
>> -
>> -static struct platform_device_id rotator_driver_ids[] =3D {
>> -       {
>> -               .name           =3D "exynos-rot",
>> -               .driver_data    =3D (unsigned long)&rot_limit_tbl,
>> -       },
>> -       {},
>> -};
>> -
>>   static int rotator_clk_crtl(struct rot_context *rot, bool enable)
>>   {
>>         if (enable) {
>> @@ -804,10 +856,10 @@ static const struct dev_pm_ops rotator_pm_ops =3D =
{
>>   struct platform_driver rotator_driver =3D {
>>         .probe          =3D rotator_probe,
>>         .remove         =3D rotator_remove,
>> -       .id_table       =3D rotator_driver_ids,
>>         .driver         =3D {
>>                 .name   =3D "exynos-rot",
>>                 .owner  =3D THIS_MODULE,
>>                 .pm     =3D&rotator_pm_ops,
>> +               .of_match_table =3D exynos_rotator_match,
>>         },
>>   };
>
> --
> To unsubscribe from this list: send the line "unsubscribe
linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--089e013c6a4ed677e704e4435891
Content-Type: text/html; charset=EUC-KR
Content-Transfer-Encoding: quoted-printable

<br><br>2013=B3=E2 8=BF=F9 19=C0=CF =BF=F9=BF=E4=C0=CF=BF=A1 Kukjin Kim&lt;=
<a href=3D"mailto:kgene.kim@samsung.com">kgene.kim@samsung.com</a>&gt;=B4=
=D4=C0=CC =C0=DB=BC=BA:<br>&gt; On 08/13/13 14:12, Chanho Park wrote:<br>&g=
t;&gt;<br>&gt;&gt; The exynos4 platform is only dt-based since 3.10, we sho=
uld convert driver data<br>
&gt;&gt; and ids to dt-based parsing methods. The rotator driver has a limi=
t table to get<br>&gt;&gt; size limit of input picture. Each SoCs has sligh=
tly different limit value<br>&gt;&gt; compared with any others.<br>&gt;&gt;=
 For example, exynos4210&#39;s max_size of RGB888 is 16k x 16k. But, others=
 have<br>
&gt;&gt; 8k x 8k. Another example the exynos5250 should have multiple of 2 =
pixel size<br>&gt;&gt; for its X/Y axis. Thus, we should keep different tab=
les for each of them.<br>&gt;&gt; This patch also includes desciptions of e=
ach nodes for the rotator and specifies<br>
&gt;&gt; a example how to bind it.<br>&gt;&gt;<br>&gt;&gt; Signed-off-by: C=
hanho Park&lt;<a href=3D"mailto:chanho61.park@samsung.com">chanho61.park@sa=
msung.com</a>&gt;<br>&gt;&gt; Cc: Inki Dae&lt;<a href=3D"mailto:inki.dae@sa=
msung.com">inki.dae@samsung.com</a>&gt;<br>
&gt;<br>&gt; Inki, do you OK on this? If so, let me take this whole series =
into the samsung tree.<br><br>Signed-off-by: Inki Dae &lt;<a href=3D"mailto=
:inki.dae@samsung.com">inki.dae@samsung.com</a>&gt;<br><br>Thanks,<br>Inki =
Dae<br>
<br>&gt;<br>&gt; Thanks,<br>&gt; Kukjin<br>&gt;<br>&gt;&gt; Signed-off-by: =
Kyungmin Park&lt;<a href=3D"mailto:kyungmin.park@samsung.com">kyungmin.park=
@samsung.com</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt; &nbsp; .../devicetree/bind=
ings/gpu/samsung-rotator.txt &nbsp; &nbsp;| &nbsp; 27 +++++<br>
&gt;&gt; &nbsp; drivers/gpu/drm/exynos/exynos_drm_rotator.c &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp;108 +++++++++++++++-----<br>&gt;&gt; &nbsp; 2 files cha=
nged, 107 insertions(+), 28 deletions(-)<br>&gt;&gt; &nbsp; create mode 100=
644 Documentation/devicetree/bindings/gpu/samsung-rotator.txt<br>
&gt;&gt;<br>&gt;&gt; diff --git a/Documentation/devicetree/bindings/gpu/sam=
sung-rotator.txt b/Documentation/devicetree/bindings/gpu/samsung-rotator.tx=
t<br>&gt;&gt; new file mode 100644<br>&gt;&gt; index 0000000..82cd1ed<br>
&gt;&gt; --- /dev/null<br>&gt;&gt; +++ b/Documentation/devicetree/bindings/=
gpu/samsung-rotator.txt<br>&gt;&gt; @@ -0,0 +1,27 @@<br>&gt;&gt; +* Samsung=
 Image Rotator<br>&gt;&gt; +<br>&gt;&gt; +Required properties:<br>&gt;&gt; =
+ &nbsp;- compatible : value should be one of the following:<br>
&gt;&gt; + &nbsp; &nbsp; &nbsp; (a) &quot;samsung,exynos4210-rotator&quot; =
for Rotator IP in Exynos4210<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; (b) &quot;s=
amsung,exynos4212-rotator&quot; for Rotator IP in Exynos4212/4412<br>&gt;&g=
t; + &nbsp; &nbsp; &nbsp; (c) &quot;samsung,exynos5250-rotator&quot; for Ro=
tator IP in Exynos5250<br>
&gt;&gt; +<br>&gt;&gt; + &nbsp;- reg : Physical base address of the IP regi=
sters and length of memory<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; mapped=
 region.<br>&gt;&gt; +<br>&gt;&gt; + &nbsp;- interrupts : Interrupt specifi=
er for rotator interrupt, according to format<br>
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;specific =
to interrupt parent.<br>&gt;&gt; +<br>&gt;&gt; + &nbsp;- clocks : Clock spe=
cifier for rotator clock, according to generic clock<br>&gt;&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bindings. (See Documentation/devicetree/bi=
ndings/clock/exynos*.txt)<br>
&gt;&gt; +<br>&gt;&gt; + &nbsp;- clock-names : Names of clocks. For exynos =
rotator, it should be &quot;rotator&quot;.<br>&gt;&gt; +<br>&gt;&gt; +Examp=
le:<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; rotator@12810000 {<br>&gt;&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; compatible =3D &quot;samsung,=
exynos4210-rotator&quot;;<br>
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =3D&lt;0x12=
810000 0x1000&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; interrupts =3D&lt;0 83 0&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; clocks =3D&lt;&amp;clock 278&gt;;<br>&gt;&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; clock-names =3D &quot;rotato=
r&quot;;<br>
&gt;&gt; + &nbsp; &nbsp; &nbsp; };<br>&gt;&gt; diff --git a/drivers/gpu/drm=
/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c<=
br>&gt;&gt; index 427640a..0485aea5 100644<br>&gt;&gt; --- a/drivers/gpu/dr=
m/exynos/exynos_drm_rotator.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c<br>&gt;&gt; @@ -=
632,21 +632,98 @@ static int rotator_ippdrv_start(struct device *dev, enum =
drm_exynos_ipp_cmd cmd)<br>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; return 0;<b=
r>&gt;&gt; &nbsp; }<br>
&gt;&gt;<br>&gt;&gt; +static struct rot_limit_table rot_limit_tbl_4210 =3D =
{<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; .ycbcr420_2p =3D {<br>&gt;&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .min_w =3D 32,<br>&gt;&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .min_h =3D 32,<br>&gt;&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .max_w =3D SZ_64K,<br>
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .max_h =3D SZ_6=
4K,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .align =
=3D 3,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; },<br>&gt;&gt; + &nbsp; &nbsp; &n=
bsp; .rgb888 =3D {<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; .min_w =3D 8,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; .min_h =3D 8,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; .max_w =3D SZ_16K,<br>
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .max_h =3D SZ_1=
6K,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .align =
=3D 2,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; },<br>&gt;&gt; +};<br>&gt;&gt; +<=
br>&gt;&gt; +static struct rot_limit_table rot_limit_tbl_4x12 =3D {<br>&gt;=
&gt; + &nbsp; &nbsp; &nbsp; .ycbcr420_2p =3D {<br>
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .min_w =3D 32,<=
br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .min_h =3D 3=
2,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .max_w =
=3D SZ_32K,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
.max_h =3D SZ_32K,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; .align =3D 3,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; },<br>
&gt;&gt; + &nbsp; &nbsp; &nbsp; .rgb888 =3D {<br>&gt;&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .min_w =3D 8,<br>&gt;&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .min_h =3D 8,<br>&gt;&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .max_w =3D SZ_8K,<br>&gt;&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .max_h =3D SZ_8K,<br>&gt;&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .align =3D 2,<br>
&gt;&gt; + &nbsp; &nbsp; &nbsp; },<br>&gt;&gt; +};<br>&gt;&gt; +<br>&gt;&gt=
; +static struct rot_limit_table rot_limit_tbl_5250 =3D {<br>&gt;&gt; + &nb=
sp; &nbsp; &nbsp; .ycbcr420_2p =3D {<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; .min_w =3D 32,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; .min_h =3D 32,<br>
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .max_w =3D SZ_3=
2K,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .max_h =
=3D SZ_32K,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
.align =3D 3,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; },<br>&gt;&gt; + &nbsp; &n=
bsp; &nbsp; .rgb888 =3D {<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; .min_w =3D 8,<br>
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .min_h =3D 8,<b=
r>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .max_w =3D SZ=
_8K,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .max_h =
=3D SZ_8K,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .=
align =3D 1,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; },<br>&gt;&gt; +};<br>&gt;&=
gt; +<br>
&gt;&gt; +static const struct of_device_id exynos_rotator_match[] =3D {<br>=
&gt;&gt; + &nbsp; &nbsp; &nbsp; {<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; .compatible =3D &quot;samsung,exynos4210-rotator&quot=
;,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .data =3D=
&amp;rot_limit_tbl_4210,<br>
&gt;&gt; + &nbsp; &nbsp; &nbsp; },<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; {<br>=
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .compatible =3D=
 &quot;samsung,exynos4212-rotator&quot;,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; .data =3D&amp;rot_limit_tbl_4x12,<br>&gt;&gt; =
+ &nbsp; &nbsp; &nbsp; },<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; {<br>
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .compatible =3D=
 &quot;samsung,exynos5250-rotator&quot;,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; .data =3D&amp;rot_limit_tbl_5250,<br>&gt;&gt; =
+ &nbsp; &nbsp; &nbsp; },<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; {},<br>&gt;&gt=
; +};<br>&gt;&gt; +<br>&gt;&gt; &nbsp; static int rotator_probe(struct plat=
form_device *pdev)<br>
&gt;&gt; &nbsp; {<br>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; struct device *de=
v =3D&amp;pdev-&gt;dev;<br>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; struct rot_=
context *rot;<br>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; struct exynos_drm_ipp=
drv *ippdrv;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; const struct of_device_id *=
match;<br>
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; int ret;<br>&gt;&gt;<br>&gt;&gt; + &nb=
sp; &nbsp; &nbsp; if (!dev-&gt;of_node) {<br>&gt;&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; dev_err(dev, &quot;cannot find of_node.\n&quo=
t;);<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return =
-ENODEV;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; }<br>
&gt;&gt; +<br>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; rot =3D devm_kzalloc(dev=
, sizeof(*rot), GFP_KERNEL);<br>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; if (!r=
ot) {<br>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; d=
ev_err(dev, &quot;failed to allocate rot\n&quot;);<br>&gt;&gt; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -ENOMEM;<br>
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; }<br>&gt;&gt;<br>&gt;&gt; - &nbsp; &nb=
sp; &nbsp; rot-&gt;limit_tbl =3D (struct rot_limit_table *)<br>&gt;&gt; - &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; platform_get_device_id(pdev)-&gt;driver_data;<=
br>&gt;&gt; + &nbsp; &nbsp; &nbsp; match =3D of_match_node(exynos_rotator_m=
atch, dev-&gt;of_node);<br>
&gt;&gt; + &nbsp; &nbsp; &nbsp; if (!match) {<br>&gt;&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dev_err(dev, &quot;failed to match node\n=
&quot;);<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret=
urn -ENODEV;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; }<br>&gt;&gt; + &nbsp; &nbs=
p; &nbsp; rot-&gt;limit_tbl =3D (struct rot_limit_table *)match-&gt;data;<b=
r>
&gt;&gt;<br>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; rot-&gt;regs_res =3D platf=
orm_get_resource(pdev, IORESOURCE_MEM, 0);<br>&gt;&gt; &nbsp; &nbsp; &nbsp;=
 &nbsp; rot-&gt;regs =3D devm_ioremap_resource(dev, rot-&gt;regs_res);<br>&=
gt;&gt; @@ -718,31 +795,6 @@ static int rotator_remove(struct platform_devi=
ce *pdev)<br>
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; return 0;<br>&gt;&gt; &nbsp; }<br>&gt;=
&gt;<br>&gt;&gt; -static struct rot_limit_table rot_limit_tbl =3D {<br>&gt;=
&gt; - &nbsp; &nbsp; &nbsp; .ycbcr420_2p =3D {<br>&gt;&gt; - &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .min_w =3D 32,<br>&gt;&gt; - &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .min_h =3D 32,<br>
&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .max_w =3D SZ_3=
2K,<br>&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .max_h =
=3D SZ_32K,<br>&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
.align =3D 3,<br>&gt;&gt; - &nbsp; &nbsp; &nbsp; },<br>&gt;&gt; - &nbsp; &n=
bsp; &nbsp; .rgb888 =3D {<br>&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; .min_w =3D 8,<br>
&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .min_h =3D 8,<b=
r>&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .max_w =3D SZ=
_8K,<br>&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .max_h =
=3D SZ_8K,<br>&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .=
align =3D 2,<br>&gt;&gt; - &nbsp; &nbsp; &nbsp; },<br>&gt;&gt; -};<br>&gt;&=
gt; -<br>
&gt;&gt; -static struct platform_device_id rotator_driver_ids[] =3D {<br>&g=
t;&gt; - &nbsp; &nbsp; &nbsp; {<br>&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; .name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D &quot;exyn=
os-rot&quot;,<br>&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; .driver_data &nbsp; &nbsp;=3D (unsigned long)&amp;rot_limit_tbl,<br>
&gt;&gt; - &nbsp; &nbsp; &nbsp; },<br>&gt;&gt; - &nbsp; &nbsp; &nbsp; {},<b=
r>&gt;&gt; -};<br>&gt;&gt; -<br>&gt;&gt; &nbsp; static int rotator_clk_crtl=
(struct rot_context *rot, bool enable)<br>&gt;&gt; &nbsp; {<br>&gt;&gt; &nb=
sp; &nbsp; &nbsp; &nbsp; if (enable) {<br>&gt;&gt; @@ -804,10 +856,10 @@ st=
atic const struct dev_pm_ops rotator_pm_ops =3D {<br>
&gt;&gt; &nbsp; struct platform_driver rotator_driver =3D {<br>&gt;&gt; &nb=
sp; &nbsp; &nbsp; &nbsp; .probe &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D rotat=
or_probe,<br>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; .remove &nbsp; &nbsp; &nb=
sp; &nbsp; =3D rotator_remove,<br>&gt;&gt; - &nbsp; &nbsp; &nbsp; .id_table=
 &nbsp; &nbsp; &nbsp; =3D rotator_driver_ids,<br>
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; .driver &nbsp; &nbsp; &nbsp; &nbsp; =
=3D {<br>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .=
name &nbsp; =3D &quot;exynos-rot&quot;,<br>&gt;&gt; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; .owner &nbsp;=3D THIS_MODULE,<br>&gt;&gt; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .pm &nbsp; &nbsp; =
=3D&amp;rotator_pm_ops,<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; .of_match_table =3D exynos_rotator_match,<br>
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; },<br>&gt;&gt; &nbsp; };<br>&gt;<br>&g=
t; --<br>&gt; To unsubscribe from this list: send the line &quot;unsubscrib=
e linux-samsung-soc&quot; in<br>&gt; the body of a message to <a href=3D"ma=
ilto:majordomo@vger.kernel.org">majordomo@vger.kernel.org</a><br>
&gt; More majordomo info at &nbsp;<a href=3D"http://vger.kernel.org/majordo=
mo-info.html">http://vger.kernel.org/majordomo-info.html</a><br>&gt;

--089e013c6a4ed677e704e4435891--

--===============1738683883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1738683883==--
