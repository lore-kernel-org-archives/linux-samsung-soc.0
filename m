From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: Samsung SoCs: preparation for single kernel
Date: Thu, 24 Jun 2010 11:08:09 +0900
Message-ID: <AANLkTimqQyHLm4KcxYwYC8slSoy9udi2gganKdsD_8Nw@mail.gmail.com>
References: <AANLkTinGwWzIAOe2tj6V2kCrMiPT7PHlYs1kFS-IsiN4@mail.gmail.com>
	<AANLkTil-AOEqhMOXydaiA1X_v0rjoNQxALrO0UY638AS@mail.gmail.com>
	<AANLkTil1i_ZGI8bY14HhjrAk9RooVreAJsTteqqrMgqJ@mail.gmail.com>
	<AANLkTikDml6gQAsiRrCjIt4bUD3hnpAATr1erqCGOJMd@mail.gmail.com>
	<002301cb129c$ec59fe30$c50dfa90$%szyprowski@samsung.com>
	<AANLkTikspf9zHuSKe86wDQxI12HpJo_occBlLUXBkjef@mail.gmail.com>
	<003e01cb12b5$656c0670$30441350$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:44145 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752927Ab0FXCIx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jun 2010 22:08:53 -0400
Received: by pxi7 with SMTP id 7so505299pxi.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Jun 2010 19:08:18 -0700 (PDT)
In-Reply-To: <003e01cb12b5$656c0670$30441350$%szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Eric Miao <eric.y.miao@gmail.com>, linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, arm-linux <linux-arm-kernel@lists.infradead.org>, Ben Dooks <ben-linux@fluff.org>

On Wed, Jun 23, 2010 at 6:20 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hello,
>
> On Wednesday, June 23, 2010 10:02 AM Eric Miao wrote:
>
>> >> Now you have
>> >>
>> >> s5pv210_device_hsmmc0
>> >> s5pc100_device_hsmmc0
>> >> s3c64xx_device_hsmmc0
>> >> ....
>> >>
>> >> each with a different base.
>> >
>> > There is no need for such code duplication.
>>
>> However, I believe this is the right way to go. A certain level of
>> duplication is the price to pay for a generic and clean solution.
>>
>> When a peripheral controller or IP is moved from one SoC to the
>> next generation, there are several things could have been changed:
>>
>> 1. new base address and IRQ number
>> 2. fixes and enhancements to the original IP
>>
>> 1. will result in a different 'struct resource', and 2. will result =
in a
>> different 'struct platform_device' with a different name, so the dri=
ver
>> can match the platform_device_id table as you agreed I'm right on
>> that recommendation.
>>
>> They are actually _two_ different devices.
>
> Right, they are separate entities, but would be really good if a simi=
lar
> git brcode could be merged together.
>
>> > Ben is working on a solution for
>> > a single kernel which supports multiple SoCs. Some of his work in
>> progress can
>> > be found here: git://git.fluff.org/bjdooks/linux branch wip-samsun=
g-dev
>> and
>> > wip-samsung-dev2.
>>
>> Could you describe it a bit here and bring it on table for discussio=
n?
>
> The idea behind his patches is to provide a table for each SoC with s=
hort
> description of all available devices and generate platform_device ent=
ries
> dynamically from that table.
>
> Here is a short code example:
>
> struct s3c_pdev_table s3c6xxx_dev_table[] __initdata =3D {
> =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_UART,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c6400-uart",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D 0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S3C_PA_UART0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_S3CUART_RX0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.template =3D &template_uart_s3c64xx,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_UART,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c6400-uart",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D 1,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S3C_PA_UART1,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_S3CUART_RX1,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.template =3D &template_uart_s3c64xx,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_UART,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c6400-uart",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D 2,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S3C_PA_UART2,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_S3CUART_RX2,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.template =3D &template_uart_s3c64xx,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_UART,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c6400-uart",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D 3,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S3C_PA_UART3,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_S3CUART_RX3,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.template =3D &template_uart_s3c64xx,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_WATCHDOG,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c2410-wdt",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D -1,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S3C64XX_PA_WATCHDOG,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_WDT,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_SDHCI,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c-sdhci",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D 0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S3C64XX_PA_HSMMC0 ,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_HSMMC0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.dma =A0 =A0=3D &samsung_std_dma_mask,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_SDHCI,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c-sdhci",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D 1,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S3C64XX_PA_HSMMC1,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_HSMMC1,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.dma =A0 =A0=3D &samsung_std_dma_mask,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_SDHCI,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c-sdhci",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D 2,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S3C64XX_PA_HSMMC2,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_HSMMC1,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.dma =A0 =A0=3D &samsung_std_dma_mask,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_OHCI,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c2410-ohci",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D -1,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S3C64XX_PA_USBHOST,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_USBH,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.dma =A0 =A0=3D &samsung_std_dma_mask,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_NAND,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c6400-nand",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D -1,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D 0x4E000000,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_NFC,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =3D SAMSUNG_DEVICE_I2C,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c2440-i2c",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.index =A0=3D 0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D S3C64XX_PA_IIC0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq =A0 =A0=3D IRQ_IIC,
> =A0 =A0 =A0 =A0}, {
> ...
>
> This solution is imho really clean an easy to understand. It is also
> easy to check which SoC has which peripherals defined and how.

Question. recently it's changed to use MMC0, MMC2, MMC3, then how to de=
fine it?
More basically, where these info are defined for chip or board?
If chip, the how to handle several variants?

Thank you,
Kyungmin Park

>
> I hope Ben will be able to finish it soon and all Samsung platforms c=
an
> be converted for it. Then creating a single kernel for more than one =
SoC
> should be possible with only a few additional changes.
>
>> PS: My feeling of commenting several of the samsung patches so far t=
urns
>> out to be quite frustrated, or I'm just too sensitive. NOTE neither =
am I
>> NAKing Samsung patches, nor am I interested to be involved, I'm just=
 givin
>> my suggestions.
>
> I'm sorry if I offended You. I just wanted to show that the solution =
has
> been already found.
>
> Best regards
> --
> Marek Szyprowski
> Samsung Poland R&D Center
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
