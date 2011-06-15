From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [RE-SEND] [PATCH 3/4] s3c-fb: Add support EXYNOS4 FIMD
Date: Wed, 15 Jun 2011 11:44:10 +0530
Message-ID: <BANLkTinuAnaoo2hA6MLBDncXxXtL8NO2pg@mail.gmail.com>
References: <1307693723-14971-1-git-send-email-anand.kn@samsung.com>
	<1307693723-14971-4-git-send-email-anand.kn@samsung.com>
	<4DF39A92.5050609@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:54901 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751319Ab1FOGOM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jun 2011 02:14:12 -0400
Received: by qyg14 with SMTP id 14so40690qyg.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jun 2011 23:14:11 -0700 (PDT)
In-Reply-To: <4DF39A92.5050609@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <snjw23@gmail.com>
Cc: Anand Kumar N <anand.kn@samsung.com>, lethal@linux-sh.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, jonghun.han@samsung.com, thomas.ab@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux@arm.linux.org.uk

Hi Sylwester,

On 11 June 2011 22:10, Sylwester Nawrocki <snjw23@gmail.com> wrote:
> Hello,
>
> On 06/10/2011 10:15 AM, Anand Kumar N wrote:
>> From: Jonghun Han<jonghun.han@samsung.com>
>>
>> This patch adds struct s3c_fb_driverdata s3c_fb_data_exynos4 for EXY=
NOS4.
>> The clk_type is added to distinguish clock type in it and lcd_clk is=
 added
>> in structure s3c_fb to calculate divider for lcd panel.

<snip>

>> + =A0 =A0 default:
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "failed to enable clock for F=
IMD\n");
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_sfb;
>> =A0 =A0 =A0 }
>
> I'm not really a clock expert, but IMHO there is an issue in Thomas'
> migration to clkdev proposal [1] that the device clock connection ids
> (con_id) and clock names related to them are identical. Mostly it wor=
ks
> but in situation like this one it is not possible to remap two clocks
> of different names onto a single connection id.
>
> For instance, looking at arch/arm/mach-omap2/clock3xxx_data.c:
>
> static struct clk i2c3_fck =3D {
> =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "i2c3_fck",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ^^^^^^^^^^
> =A0 =A0 =A0 =A0.ops =A0 =A0 =A0 =A0 =A0 =A0=3D &clkops_omap2_dflt_wai=
t,
> =A0 =A0 =A0 =A0.parent =A0 =A0 =A0 =A0 =3D &core_96m_fck,
> =A0 =A0 =A0 =A0...
> };
> static struct clk i2c2_fck =3D {
> =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "i2c2_fck",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0^^^^^^^^^^^
> =A0 =A0 =A0 =A0.ops =A0 =A0 =A0 =A0 =A0 =A0=3D &clkops_omap2_dflt_wai=
t,
> =A0 =A0 =A0 =A0...
> };
>
> static struct omap_clk omap3xxx_clks[] =3D {
> =A0 =A0 =A0 =A0...
> =A0 =A0 =A0 =A0CLK("omap_i2c.3", "fck", &i2c3_fck, CK_3XXX),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0^^^^^^^^^^^^^^^^^
> =A0 =A0 =A0 =A0CLK("omap_i2c.2", "fck", &i2c2_fck, CK_3XXX),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0^^^^^^^^^^^^^^^^^
> =A0 =A0 =A0 =A0...
>
> Different clock names (i2c3_fck, i2c3_fck,..) are mapped to single
> unified id (fck), which the driver only needs to care about.
> The name is common across H/W instances and also SoC variants.
> So it doesn't have to be driver's business to resolve clock differenc=
es.
>
> The same (con_id) name can be used on distinct SoC versionproviding s=
imilar/same peripheral device IP.
> It's aeasy to figure out by just comparing omap3xxx_clks[] and
> omap44xx_clks arrays.

Sorry, I am not quite sure if I understand the problem here. For
instance, all Samsung SoC's and each instance of i2c device in a SoC,
use the same con_id for the i2c 'struct clock' instance. The con_id is
'i2c'. The i2c driver uses the con_id 'i2c' to lookup the 'struct
clock' instance and it works for all Samsung SoC's and all instances
of i2c device in the SoC.

Is your point different than what I understand? Please help.

Thanks,
Thomas.

>
> That said I wouldn't go for a "devname" in struct clk, just create
> an additional table matching device names, con_id and struct clk and
> use it while registering clk_lookup items into clkdev.
>
>>
>> - =A0 =A0 clk_enable(sfb->bus_clk);
>> -
>> =A0 =A0 =A0 pm_runtime_enable(sfb->dev);
>>
>> =A0 =A0 =A0 res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> =A0 =A0 =A0 if (!res) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "failed to find registers\n=
");
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOENT;
>> - =A0 =A0 =A0 =A0 =A0 =A0 goto err_clk;
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto err_lcd_clk;
>> =A0 =A0 =A0 }
>>
>> =A0 =A0 =A0 sfb->regs_res =3D request_mem_region(res->start, resourc=
e_size(res),
>> @@ -1369,7 +1417,7 @@ static int __devinit s3c_fb_probe(struct platf=
orm_device *pdev)
>> =A0 =A0 =A0 if (!sfb->regs_res) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "failed to claim register r=
egion\n");
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOENT;
>> - =A0 =A0 =A0 =A0 =A0 =A0 goto err_clk;
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto err_lcd_clk;
>> =A0 =A0 =A0 }
>>
>> =A0 =A0 =A0 sfb->regs =3D ioremap(res->start, resource_size(res));
>> @@ -1451,9 +1499,15 @@ err_ioremap:
>> =A0 err_req_region:
>> =A0 =A0 =A0 release_mem_region(sfb->regs_res->start, resource_size(s=
fb->regs_res));
>>
>> -err_clk:
>> - =A0 =A0 clk_disable(sfb->bus_clk);
>> - =A0 =A0 clk_put(sfb->bus_clk);
>> +err_lcd_clk:
>> + =A0 =A0 clk_disable(sfb->lcd_clk);
>> + =A0 =A0 clk_put(sfb->lcd_clk);
>> +
>> +err_bus_clk:
>> + =A0 =A0 if (sfb->variant.clk_type !=3D FIMD_CLK_TYPE0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 clk_disable(sfb->bus_clk);
>> + =A0 =A0 =A0 =A0 =A0 =A0 clk_put(sfb->bus_clk);
>> + =A0 =A0 }
>>
>> =A0 err_sfb:
>> =A0 =A0 =A0 kfree(sfb);
>> @@ -1482,8 +1536,20 @@ static int __devexit s3c_fb_remove(struct pla=
tform_device *pdev)
>>
>> =A0 =A0 =A0 iounmap(sfb->regs);
>>
>> - =A0 =A0 clk_disable(sfb->bus_clk);
>> - =A0 =A0 clk_put(sfb->bus_clk);
>> + =A0 =A0 switch (sfb->variant.clk_type) {
>> + =A0 =A0 case FIMD_CLK_TYPE1:
>> + =A0 =A0 =A0 =A0 =A0 =A0 clk_disable(sfb->lcd_clk);
>> + =A0 =A0 =A0 =A0 =A0 =A0 clk_put(sfb->lcd_clk);
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* fall through to default case */
>> + =A0 =A0 case FIMD_CLK_TYPE0:
>> + =A0 =A0 =A0 =A0 =A0 =A0 clk_disable(sfb->bus_clk);
>> + =A0 =A0 =A0 =A0 =A0 =A0 clk_put(sfb->bus_clk);
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 default:
>
> Considering clk_type data type this is unreachable code.
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(sfb->dev, "invalid clock type(%d)\=
n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sfb->varia=
nt.clk_type);
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 }
> ...
>
> --
> Regards,
> Sylwester
>
> [1] http://www.spinics.net/lists/arm-kernel/msg127901.html
> =A0 =A0http://www.spinics.net/lists/arm-kernel/msg127907.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
