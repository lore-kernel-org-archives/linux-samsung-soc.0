From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 2/6] serial: samsung: Add device tree support for s5pv210
 uart driver
Date: Mon, 20 Jun 2011 10:43:50 -0600
Message-ID: <BANLkTi=+FKz-uPtSv572y5ORorMeGR8Anw@mail.gmail.com>
References: <1308567752-13451-1-git-send-email-thomas.abraham@linaro.org> <1308567752-13451-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:39839 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750803Ab1FTQoM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Jun 2011 12:44:12 -0400
Received: by yxi11 with SMTP id 11so2152710yxi.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2011 09:44:12 -0700 (PDT)
In-Reply-To: <1308567752-13451-3-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On Mon, Jun 20, 2011 at 5:02 AM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> For device tree based probe, the dependecy on pdev->id to attach a
> corresponding default port info to the driver's private data is
> removed. The fifosize parameter is obtained from the device tree
> node and the next available instance of port info is updated
> with the fifosize value and attached to the driver's private data.
>
> The samsung uart core driver is also modified to parse the device
> tree node and pick up the platform data from the node.
>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
> =A0.../bindings/tty/serial/samsung_uart.txt =A0 =A0 =A0 =A0 =A0 | =A0=
 50 +++++++++++
> =A0drivers/tty/serial/s5pv210.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 27 ++++++-
> =A0drivers/tty/serial/samsung.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 90 ++++++++++++++++++++
> =A03 files changed, 166 insertions(+), 1 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/tty/serial/sa=
msung_uart.txt
>
> diff --git a/Documentation/devicetree/bindings/tty/serial/samsung_uar=
t.txt b/Documentation/devicetree/bindings/tty/serial/samsung_uart.txt
> new file mode 100644
> index 0000000..4c0783d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/tty/serial/samsung_uart.txt
> @@ -0,0 +1,50 @@
> +* Samsung's UART Controller
> +
> +The Samsung's UART controller is used for serial communications on a=
ll of
> +Samsung's s3c24xx, s3c64xx and s5p series application processors.
> +
> +Required properties:
> +- compatible : should be specific to the application processor
> + =A0 =A0 =A0 - "samsung,s5pv210-uart" , for s5pc110, s5pv210 and Exy=
nos4 family.
> + =A0 =A0 =A0 - "samsung,s3c6400-uart", for s3c64xx, s5p64xx and s5pc=
100.
> + =A0 =A0 =A0 - "samsung,s3c2410-uart", for s3c2410.
> + =A0 =A0 =A0 - "samsung,s3c2412-uart", for s3c2412.
> + =A0 =A0 =A0 - "samsung,s3c2440-uart", for s3c244x.
> +
> +- reg : =A0 =A0 =A0 =A0base physical address of the controller and l=
ength of memory mapped
> + =A0 =A0 =A0 region.
> +
> +- interrupts : Three interrupt numbers should be specified in the fo=
llowing
> + =A0 =A0 =A0 order - TX interrupt, RX interrupt, Error Interrupt.
> +
> +- hwport : Instance number of the UART controller in the processor.
> + =A0 =A0 =A0 (ToDo: Remove this from the driver).
> +
> +- flags : Not used, but set value as 0. (ToDo: Remove this flag from=
 driver).

If they are to be removed, then you should drop them from the documenta=
tion.

> +
> +- uart_flags : Additional serial core flags to passed to the serial =
core
> + =A0 =A0 =A0 when the driver is registred. For example: UPF_CONS_FLO=
W.

Underscores are discouraged in property and node names.  Use '-' instea=
d.

=46or custom properties, you should prefix the property name with 'sams=
ung,'.

This looks very much like directly encoding the Linux flags into the
device tree.  The binding should be completely contained within
itself, and not refer to OS implementation details.  It is fine to use
the same values that Linux happens to use, but they need to still be
explicitly documented as to what they mean.  Also, a 'flags' property
usually isn't very friendly to mere-mortals when the explicit
behaviour can be enabled with the presence of a named property.  For
example; something like a "samsung,uart-has-rtscts" to enable rts/cts.

> +
> +- has_fracval : Set to 1, if the controller supports fractional part=
 of
> + =A0 =A0 =A0 for the baud divisor, otherwise, set to 0.

Boolean stuff often doesn't need a value.  If the property is present,
it is a '1'.  If it isn't, then it is a '0'.

> +
> +- ucon_default : Default board specific setting of UCON register.
> +
> +- ulcon_default : Default board specific setting of ULCON register.
> +
> +- ufcon_default : Default board specific setting of UFCON register.

I think I've commented on this before, but I do try to avoid direct
coding registers into the DT.  That said, sometimes there really isn't
a nice human-friendly way of encoding things and direct register
values is the best approach.

> +
> +- uart_clksrc : One or more child nodes representing the clock sourc=
es that
> + =A0 =A0 =A0 could be used to derive the buad rate. Each of these ch=
ild nodes
> + =A0 =A0 =A0 has four required properties.
> +
> + =A0 =A0 =A0 - name : Name of the parent clock.
> + =A0 =A0 =A0 - divisor : divisor from the clock to the uart controll=
er.
> + =A0 =A0 =A0 - min_baud : Minimum baud rate for which this clock can=
 be used.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Set to zero, if there i=
s no limitation.
> + =A0 =A0 =A0 - max_buad : Maximum baud rate for which this clock can=
 be used.

typo: s/buad/baud/

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Set to zero, if there i=
s no limitation.

This looks to be directly encoding the current Linux implementation
details into the device tree (it is a direct copy of the config
structure members), and it doesn't use the common clock binding.  It's
fine to use sub nodes for each clock attachment, particularly because
it looks like the uart is able to apply it's own divisor to the clock
input, but I would definitely encode the data using the existing
struct clock binding.

> +
> +Optional properties:
> +- fifosize: Size of the tx/rx fifo used in the controller. If not sp=
ecified,
> + =A0 =A0 =A0 the default value of the fifosize is 16.
> diff --git a/drivers/tty/serial/s5pv210.c b/drivers/tty/serial/s5pv21=
0.c
> index 3b2021a..9aacbda 100644
> --- a/drivers/tty/serial/s5pv210.c
> +++ b/drivers/tty/serial/s5pv210.c
> @@ -18,6 +18,7 @@
> =A0#include <linux/init.h>
> =A0#include <linux/serial_core.h>
> =A0#include <linux/serial.h>
> +#include <linux/of.h>
>
> =A0#include <asm/irq.h>
> =A0#include <mach/hardware.h>
> @@ -131,15 +132,39 @@ static struct s3c24xx_uart_info *s5p_uart_inf[]=
 =3D {
> =A0/* device management */
> =A0static int s5p_serial_probe(struct platform_device *pdev)
> =A0{
> - =A0 =A0 =A0 return s3c24xx_serial_probe(pdev, s5p_uart_inf[pdev->id=
]);
> + =A0 =A0 =A0 const void *prop;
> + =A0 =A0 =A0 unsigned int port =3D pdev->id;
> + =A0 =A0 =A0 unsigned int fifosize =3D 16;
> + =A0 =A0 =A0 static unsigned int probe_index;
> +
> + =A0 =A0 =A0 if (pdev->dev.of_node) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop =3D of_get_property(pdev->dev.of_n=
ode, "fifosize", NULL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (prop)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fifosize =3D be32_to_cp=
u(*(u32 *)prop);

Okay, this is getting ugly (not your fault, but this pattern has
become too common.  Can you craft and post a patch that adds the
following functions to drivers/of/base.c and include/linux/of.h

/* offset in cells, not bytes */
int dt_decode_u32(struct *property, int offset, u32 *out_val)
{
        if (!property || !property->value)
                return -EINVAL;
        if ((offset + 1) * 4 > property->length)
                return -EINVAL;
        *out_val =3D of_read_number(property->value + (offset * 4), 1);
        return 0;
}
int dt_decode_u64(struct *property, int offset, u64 *out_val)
{
=2E..
}
int dt_decode_string(struct *property, int index, char **out_string);
{
=2E..
}

Plus a set of companion functions:
int dt_getprop_u32(struct device_node *np, char *propname, int offset,
u32 *out_val)
{
        return dt_decode_u32(of_find_property(np, propname, NULL),
offset, out_val);
}
int dt_getprop_u64(struct *device_node, char *propname, int offset,
u64 *out_val);
{
=2E..
}
int dt_getprop_string(struct *device_node, char *propname, int index,
char **out_string);
{
=2E..
}

Then you'll be able to simply do the following to decode each
property, with fifosize being left alone if the property cannot be
found or decoded:

dt_getprop_u32(pdev->dev.of_node, "samsung,fifosize", &fifosize);

> +#ifdef CONFIG_OF
> +static const struct of_device_id s5pv210_uart_match[] =3D {
> + =A0 =A0 =A0 { .compatible =3D "samsung,s5pv210-uart" },
> + =A0 =A0 =A0 {},
> +};
> +MODULE_DEVICE_TABLE(of, s5pv210_uart_match);
> +#else
> +#define s5pv210_uart_match NULL
> +#endif
> +
> =A0static struct platform_driver s5p_serial_driver =3D {
> =A0 =A0 =A0 =A0.probe =A0 =A0 =A0 =A0 =A0=3D s5p_serial_probe,
> =A0 =A0 =A0 =A0.remove =A0 =A0 =A0 =A0 =3D __devexit_p(s3c24xx_serial=
_remove),
> =A0 =A0 =A0 =A0.driver =A0 =A0 =A0 =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s5pv210-uart",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.owner =A0=3D THIS_MODULE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D s5pv210_uart_match,
> =A0 =A0 =A0 =A0},
> =A0};
>
> diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsun=
g.c
> index 77d900f..1e58a7b 100644
> --- a/drivers/tty/serial/samsung.c
> +++ b/drivers/tty/serial/samsung.c
> @@ -43,6 +43,7 @@
> =A0#include <linux/clk.h>
> =A0#include <linux/cpufreq.h>
> =A0#include <linux/slab.h>
> +#include <linux/of.h>
>
> =A0#include <asm/irq.h>
>
> @@ -1047,6 +1048,91 @@ static inline void s3c24xx_serial_cpufreq_dere=
gister(struct s3c24xx_uart_port *p
> =A0}
> =A0#endif
>
> +/*
> + * s3c24xx_serial_parse_dt
> + *
> + * Parse the platform data from the device tree and keep a copy of i=
t.
> + */
> +
> +static int s3c24xx_serial_parse_dt(struct device_node *np,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct s3c2410_uartcfg *cfg)
> +{
> + =A0 =A0 =A0 struct s3c24xx_uart_clksrc *clksrc =3D NULL;
> + =A0 =A0 =A0 struct device_node *child =3D NULL;
> + =A0 =A0 =A0 unsigned int len;
> + =A0 =A0 =A0 const void *prop;
> +
> + =A0 =A0 =A0 if (!np)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> +
> + =A0 =A0 =A0 prop =3D of_get_property(np, "hwport", &len);
> + =A0 =A0 =A0 if (prop && len)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->hwport =3D be32_to_cpu(*(u32 *)pro=
p);
> +
> + =A0 =A0 =A0 prop =3D of_get_property(np, "flags", &len);
> + =A0 =A0 =A0 if (prop && len)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->flags =3D be32_to_cpu(*(u32 *)prop=
);
> +
> + =A0 =A0 =A0 prop =3D of_get_property(np, "uart_flags", &len);
> + =A0 =A0 =A0 if (prop && len)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->uart_flags =3D be32_to_cpu(*(u32 *=
)prop);
> +
> + =A0 =A0 =A0 prop =3D of_get_property(np, "has_fracval", &len);
> + =A0 =A0 =A0 if (prop && len)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->has_fracval =3D be32_to_cpu(*(u32 =
*)prop);
> +
> + =A0 =A0 =A0 prop =3D of_get_property(np, "ucon_default", &len);
> + =A0 =A0 =A0 if (prop && len)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->ucon =3D be32_to_cpu(*(u32 *)prop)=
;
> +
> + =A0 =A0 =A0 prop =3D of_get_property(np, "ulcon_default", &len);
> + =A0 =A0 =A0 if (prop && len)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->ulcon =3D be32_to_cpu(*(u32 *)prop=
);
> +
> + =A0 =A0 =A0 prop =3D of_get_property(np, "ufcon_default", &len);
> + =A0 =A0 =A0 if (prop && len)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->ufcon =3D be32_to_cpu(*(u32 *)prop=
);
> +
> + =A0 =A0 =A0 /* Count the number of clock source options available *=
/
> + =A0 =A0 =A0 len =3D 0;
> +
> + =A0 =A0 =A0 while ((child =3D of_get_next_child(np, child)))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 len++;
> +
> + =A0 =A0 =A0 if (len) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clksrc =3D kzalloc(sizeof(struct s3c24x=
x_uart_clksrc) * len,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 GFP_KERNEL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!clksrc)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 cfg->clocks =3D clksrc;
> + =A0 =A0 =A0 cfg->clocks_size =3D len;
> +
> + =A0 =A0 =A0 /* Read the information about all clock sources */
> + =A0 =A0 =A0 for_each_child_of_node(np, child) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop =3D of_get_property(child, "clk_na=
me", &len);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (prop && len)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clksrc->name =3D (const=
 char *)prop;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop =3D of_get_property(child, "diviso=
r", &len);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (prop && len)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clksrc->divisor =3D be3=
2_to_cpu(*(u32 *)prop);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop =3D of_get_property(child, "min_ba=
ud", &len);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (prop && len)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clksrc->min_baud =3D be=
32_to_cpu(*(u32 *)prop);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 prop =3D of_get_property(child, "max_ba=
ud", &len);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (prop && len)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clksrc->max_baud =3D be=
32_to_cpu(*(u32 *)prop);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clksrc++;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> =A0/* s3c24xx_serial_init_port
> =A0*
> =A0* initialise a single serial port from the platform device given
> @@ -1077,6 +1163,10 @@ static int s3c24xx_serial_init_port(struct s3c=
24xx_uart_port *ourport,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memcpy(info->cfg.clocks, cfg->clocks,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sizeof(struct s3c24xx_=
uart_clksrc) * cfg->clocks_size);
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D s3c24xx_serial_parse_dt(platdev=
->dev.of_node, &info->cfg);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0cfg =3D &info->cfg;
> --
> 1.6.6.rc2
>
>
> _______________________________________________
> linaro-dev mailing list
> linaro-dev@lists.linaro.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
