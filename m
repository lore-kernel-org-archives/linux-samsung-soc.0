From: padma venkat <padma.kvr@gmail.com>
Subject: Re: [RFC][PATCH 1/2] S5PV210: SPI: Add clkdev support
Date: Wed, 10 Aug 2011 17:34:33 +0530
Message-ID: <CAAgF-BftGYkZ6aaSZgxd8gk1Zy9-sJEroZcaijd6zN3Qr9MEhQ@mail.gmail.com>
References: <1312898222-7165-1-git-send-email-padma.v@samsung.com>
	<4E413941.10307@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:33149 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753676Ab1HJMEf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Aug 2011 08:04:35 -0400
In-Reply-To: <4E413941.10307@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, kgene.kim@samsung.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, grant.likely@secretlab.ca, jassi Brar <jassisinghbrar@gmail.com>

Hi Sylwester,

On Tue, Aug 9, 2011 at 7:12 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> [corrected Jassi's email address]
>
> On 08/09/2011 03:57 PM, Padmavathi Venna wrote:
>> Create a clkdev alias for spi bus clock and modify the spi
>> driver to lookup the clock using the alias name instead of
>> passing clock name and clock number from SPI platform data.
>>
>> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
>> ---
>> This patch is tested for S5PV210 platform and similar
>> changes can be adopted for rest of the Samsung's s3c
>> and s5p platforms, if this approach is accepted.
>
> It is a bit surprising to me how you do intend to use the clock alias=
es.
> Are we seriously going to be creating clock con_id aliases for most
> of the available devices ? It doesn't sound sane to me..
We don't need to create the alias names for all the devices. But we nee=
d
to create only for those which need clock information from platform dat=
a.
As far as I know we need to create for spi,hsmmc,uart and iis.
>
> Wouldn't it be possible to avoid the aliases by correcting the clock
> registration process ?
Yes it is possible but we don't have the flexibility to create the alia=
s names
only for the required clocks.
>
>> =A0arch/arm/mach-s5pv210/dev-spi.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 31 ++++++++++++++++++---
>> =A0arch/arm/plat-samsung/include/plat/s3c64xx-spi.h | =A0 =A07 +----
>> =A02 files changed, 27 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5pv210/dev-spi.c b/arch/arm/mach-s5pv210=
/dev-spi.c
> ...
>> -void __init s5pv210_spi_set_info(int cntrlr, int src_clk_nr, int nu=
m_cs)
>> +void __init s5pv210_spi_set_info(int cntrlr, int num_cs)
>> =A0{
>> =A0 =A0 =A0 struct s3c64xx_spi_info *pd;
>> + =A0 =A0 struct device *dev;
>> + =A0 =A0 char devname[16], clk_alias_name[16];
>> + =A0 =A0 int ret, i;
>>
>> =A0 =A0 =A0 /* Reject invalid configuration */
>> - =A0 =A0 if (!num_cs || src_clk_nr < 0
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 || src_clk_nr > S5PV210_SP=
I_SRCCLK_SCLK) {
>> + =A0 =A0 if (!num_cs) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "%s: Invalid SPI configu=
ration\n", __func__);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
>> =A0 =A0 =A0 }
>> @@ -159,9 +162,11 @@ void __init s5pv210_spi_set_info(int cntrlr, in=
t src_clk_nr, int num_cs)
>> =A0 =A0 =A0 switch (cntrlr) {
>> =A0 =A0 =A0 case 0:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 pd =3D &s5pv210_spi0_pdata;
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev =3D &s5pv210_device_spi0.dev;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 case 1:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 pd =3D &s5pv210_spi1_pdata;
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev =3D &s5pv210_device_spi1.dev;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 default:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "%s: Invalid SPI control=
ler(%d)\n",
>> @@ -169,7 +174,23 @@ void __init s5pv210_spi_set_info(int cntrlr, in=
t src_clk_nr, int num_cs)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
>> =A0 =A0 =A0 }
>>
>> + =A0 =A0 sprintf(devname, "s3c64xx-spi.%d", cntrlr);
>> +
>> + =A0 =A0 for (i =3D 0; i < ARRAY_SIZE(spi_src_clks); i++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 sprintf(clk_alias_name, "clk_spi_bus%d", i=
);
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!strcmp(spi_src_clks[i], "pclk"))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D clk_add_alias(clk_=
alias_name, devname,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 spi_src_clks[i], NULL);
>> + =A0 =A0 =A0 =A0 =A0 =A0 else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D clk_add_alias(clk_=
alias_name, devname,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 spi_src_clks[i], dev);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (ret) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "failed to=
 create alias for"
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 " SPI%d so=
urce clock%d\n", cntrlr, i);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 }
>> +
>> =A0 =A0 =A0 pd->num_cs =3D num_cs;
>> - =A0 =A0 pd->src_clk_nr =3D src_clk_nr;
>> - =A0 =A0 pd->src_clk_name =3D spi_src_clks[src_clk_nr];
>> =A0}
> ...
>
> --
> Thanks,
> Sylwester
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
