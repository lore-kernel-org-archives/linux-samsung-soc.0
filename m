From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/6] serial: samsung: Keep a copy of platform data in
 driver's private data
Date: Tue, 21 Jun 2011 16:37:44 +0530
Message-ID: <BANLkTi=m9QYhVoj-e916D-u79ymZFTup4A@mail.gmail.com>
References: <1308567752-13451-1-git-send-email-thomas.abraham@linaro.org>
	<1308567752-13451-2-git-send-email-thomas.abraham@linaro.org>
	<BANLkTikLfbiL0ZpLiysA6qUxv8sj-AVS+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:33692 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754529Ab1FULHp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 07:07:45 -0400
Received: by qyk9 with SMTP id 9so1600688qyk.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jun 2011 04:07:44 -0700 (PDT)
In-Reply-To: <BANLkTikLfbiL0ZpLiysA6qUxv8sj-AVS+A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

Hi Grant,

On 20 June 2011 21:24, Grant Likely <grant.likely@secretlab.ca> wrote:
> On Mon, Jun 20, 2011 at 5:02 AM, Thomas Abraham
> <thomas.abraham@linaro.org> wrote:
>> The driver depends on pdev->dev.platform_data to retrive information
>> about the platform data even after the initialization. To add device
>> tree support, this has to be changed in way that the platform data
>> is avialable from driver's private data. This patch adds support
>> for keeping a copy of the plaform data in s3c24xx_uart_info and usin=
g
>> it when needed after the initialization.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0drivers/tty/serial/s5pv210.c | =A0 12 ++++++++++--
>> =A0drivers/tty/serial/samsung.c | =A0 24 ++++++++++++++++++++----
>> =A0drivers/tty/serial/samsung.h | =A0 =A04 +++-
>> =A03 files changed, 33 insertions(+), 7 deletions(-)
>
> Hi Thomas.
>
> Don't forget you need to cc Alan Cox and the linux-serial mailing lis=
t
> for tty driver patches.

Ok. I will do that when I submit the next version of the patch.

>
> Comments below...
>
>>
>> diff --git a/drivers/tty/serial/s5pv210.c b/drivers/tty/serial/s5pv2=
10.c
>> index d6b2423..3b2021a 100644
>> --- a/drivers/tty/serial/s5pv210.c
>> +++ b/drivers/tty/serial/s5pv210.c
>> @@ -27,9 +27,13 @@

<snip>

>> + =A0 =A0 =A0 if (cfg) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy((void *)&info->cfg, cfg, sizeof=
(struct s3c2410_uartcfg));
>
> "info->cfg =3D *cfg;" should be sufficient.
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->cfg.clocks =3D kzalloc(sizeof(st=
ruct s3c24xx_uart_clksrc) *
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 cfg->clocks_size, GFP_KERNEL);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!info->cfg.clocks)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy(info->cfg.clocks, cfg->clocks,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sizeof(struct s3c24xx_=
uart_clksrc) * cfg->clocks_size);
>> + =A0 =A0 =A0 }
>
> ewwh. There has to be a better way to do this. =A0Part of the point o=
f
> putting a copy of pdata into the private data structure is to simplif=
y
> the driver so that kzallocing wouldn't be necessary. =A0With that clo=
ck
> table, the driver actually gets more complex because both DT and
> non-DT paths now need to kzalloc a clock array.
>
> From what I can tell, the list of clocks on all mainlined platforms i=
s
> a static array of one or two entries; min & max baud are always set t=
o
> 0, and names are one of:
> - uclk & pclk
> - uclk
> - uclk1
> - fclk (with divisor either 10 or 0)
> - pclk_low & uclk1
>
> You could also make the clock structure a static array of 2 elements
> in the private data structure. =A0That would simplify both this code =
and
> the followon DT patch.
>
> Also, peaking forward at what the 2nd patch does, I think that it
> might just be a little premature to try and decode the clock info fro=
m
> the DT. =A0But I'll address that issue when replying to the second
> patch.

Thanks for the suggestion. I had not thought about these issues. One
possible option in this case is using Sylwester's suggestion of
changing exynos4 clkdev support to be similar to the omap clkdev
support. That way, an additional level of indirection is possible. The
uart driver could than be modified to lookup clock with generic names
like "uart_clksrc0", "uart_clksrc1" and "uart_clksrc2". With this,
there will be no need to pass clock names to the uart driver. I will
check if this can be done.

>
>> +
>> + =A0 =A0 =A0 cfg =3D &info->cfg;
>> =A0 =A0 =A0 =A0if (cfg->hwport > CONFIG_SERIAL_SAMSUNG_UARTS) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "%s: port %d bigger t=
han %d\n", __func__,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->hwport, CONFIG_SERI=
AL_SAMSUNG_UARTS);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(info->cfg.clocks);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ERANGE;
>> =A0 =A0 =A0 =A0}
>>
>> @@ -1181,11 +1195,13 @@ EXPORT_SYMBOL_GPL(s3c24xx_serial_probe);
>> =A0int __devexit s3c24xx_serial_remove(struct platform_device *dev)
>> =A0{
>> =A0 =A0 =A0 =A0struct uart_port *port =3D s3c24xx_dev_to_port(&dev->=
dev);
>> + =A0 =A0 =A0 struct s3c24xx_uart_info *info =3D s3c24xx_port_to_inf=
o(port);
>>
>> =A0 =A0 =A0 =A0if (port) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c24xx_serial_cpufreq_deregister(to_=
ourport(port));
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0device_remove_file(&dev->dev, &dev_at=
tr_clock_source);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uart_remove_one_port(&s3c24xx_uart_dr=
v, port);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(info->cfg.clocks);
>> =A0 =A0 =A0 =A0}
>>
>> =A0 =A0 =A0 =A0return 0;
>> diff --git a/drivers/tty/serial/samsung.h b/drivers/tty/serial/samsu=
ng.h
>> index a69d9a5..4f2f6f5 100644
>> --- a/drivers/tty/serial/samsung.h
>> +++ b/drivers/tty/serial/samsung.h
>> @@ -24,6 +24,9 @@ struct s3c24xx_uart_info {
>>
>> =A0 =A0 =A0 =A0unsigned int =A0 =A0 =A0 =A0 =A0 =A0has_divslot:1;
>>
>> + =A0 =A0 =A0 /* copy of platform data */
>
> I'd change this to "copy of /configuration/ data" since the data
> doesn't necessarily come from the platform_data pointer anymore.

Ok. I will change this. Thanks for reviewing the patches.

Thomas.
