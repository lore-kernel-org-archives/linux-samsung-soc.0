From: xf liu <7inchpalace@gmail.com>
Subject: Re: kgdb on S5PV210
Date: Wed, 31 Aug 2011 11:27:11 +0800
Message-ID: <CAK6dbMSEVKQ+PTK449QKRSGnY5oixKn4GHA1UVvrGSoAiyEz0g@mail.gmail.com>
References: <CAK6dbMS6DXxez6ehAGZgi5yu9kgjg5QQr-UGYmxNR4frPGGe+A@mail.gmail.com>
	<CAJuYYwTrQdLYAPa1Uf9aFWHyNHfufff35-_unRNJ3mVmYdZ3BA@mail.gmail.com>
	<CAK6dbMT0H9p3qpFhmUkRNeZXreuBFuW-86ar9aVqvQ-DAHTCFw@mail.gmail.com>
	<CAK6dbMR+u3Fa4zucf7mxF_YcBU-RN1HroD9KnOS+PnAj3ggqEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:46543 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751217Ab1HaD1M convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Aug 2011 23:27:12 -0400
Received: by pzk37 with SMTP id 37so578062pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Aug 2011 20:27:11 -0700 (PDT)
In-Reply-To: <CAK6dbMR+u3Fa4zucf7mxF_YcBU-RN1HroD9KnOS+PnAj3ggqEA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org

Hi,

After retrying several times, remote GDB can sometimes attach my
device, and sometimes meet problems.
Some info listed below:

$ sudo gdb new_vmlinux
GNU gdb (GDB) 7.2-ubuntu
Copyright (C) 2010 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl=
=2Ehtml>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copyi=
ng"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
=46or bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /media/disk-1/ryan/download/gdb-7.3/gdb/new_vmlinu=
x...done.
warning: not using untrusted file ".gdbinit"
(gdb) target remote /dev/ttyS0
Remote debugging using /dev/ttyS0
0x00000000 in ?? ()
(gdb) b bq27200_read
Ignoring packet error, continuing...
Reply contains invalid hex digit 116
(gdb) b bq27200_read
Ignoring packet error, continuing...
Reply contains invalid hex digit 116
(gdb) b bq27200_read
Breakpoint 1 at 0xc0274884: file drivers/power/bq27x00_battery.c, line =
1207.
(gdb) continue
Continuing.

Program received signal SIGTRAP, Trace/breakpoint trap.
0xc06e3824 in power_supply_attrs ()
(gdb) continue
Continuing.
Ignoring packet error, continuing...
Reply contains invalid hex digit 116
(gdb) continue
Continuing.

Program received signal SIGTRAP, Trace/breakpoint trap.
0x00000000 in ?? ()
(gdb) continue
Continuing.
Ignoring packet error, continuing...
Reply contains invalid hex digit 32
(gdb) continue
Continuing.

It seems that there's some problem within my modified poll_get_char
and poll_put_char functions.
Here are my modified functions(seems ugly), can anyone help to figure
out what problems may be?
BTW, I also disable the default IRQ handlers for UART0 TX and RX.

static void ryan_wait_for_tx_empty(struct uart_port *port)
{
	//unsigned int tmout =3D 100000;
	while (true) {
		unsigned long stat =3D readl(port->membase + S3C2410_UFSTAT);
		if (!(stat & (S5PV210_UFSTAT_TXMASK | S5PV210_UFSTAT_TXFULL)))
			break;
		//if (--tmout =3D=3D 0)
			//break;
		udelay(1);
	}
}

static void ryan_poll_put_char (struct uart_port *port, unsigned char c=
h)
{
	ryan_wait_for_tx_empty(port);
	writeb(ch, port->membase + S3C2410_UTXH);
	ryan_wait_for_tx_empty(port);
}

static int ryan_poll_get_char(struct uart_port * port)
{
	unsigned int stat;
	int ch;
	stat =3D readl(port->membase + S3C2410_UFSTAT);
	if (!(stat & (S5PV210_UFSTAT_RXMASK | S5PV210_UFSTAT_RXFULL)))
		return NO_POLL_CHAR;
	 ch =3D readb(port->membase + S3C2410_URXH);
	return ch;
}

Thanks for any suggestions and comments.

Regards,
Ryan

2011/8/31 xf liu <7inchpalace@gmail.com>:
> Hi Thomas and All,
>
> I modified the poll_get_char and poll_put_char function and retried.
> I got the result of
> "+$S05#b8+$OK#9a+$QC0000000000000001#95+$000000000100000054c87fc0b8c9=
7fc00100000"
> when connecting .
> I don't know the details about the RSP but the 1st step seems OK whil=
e
> connecting.
> Can anyone help to figure out what problem may happened while
> connecting GDB with the remote device?
> Thanks.
>
> Ryan
>
> 2011/8/30 xf liu <7inchpalace@gmail.com>:
>> Hi Thomas,
>>
>> Thanks for your reply.
>> I tried this patch, but the result is the same. :(
>> I use minicom in host PC as console terminal to display the kernel t=
race.
>> Is there still anything wrong?
>> Thanks.
>>
>> Regards,
>> Ryan
>>
>> 2011/8/30 Thomas Abraham <thomas.abraham@linaro.org>:
>>> Hi Ryan,
>>>
>>> On 29 August 2011 12:33, xf liu <7inchpalace@gmail.com> wrote:
>>>>
>>>> Hi list,
>>>>
>>>>
>>>> I try to enable kgdb on S5PV210 using the same serial port (UART 0=
)
>>>> with the console, but after adding "kgdboc=3DttySAC0,115200 kgdbwa=
it" I
>>>> found tty_find_polling_driver returns NULL.
>>>> The cause is that the poll_get_char and poll_put_char handlers are=
 not
>>>> set in static struct uart_ops s3c24xx_serial_ops.
>>>>
>>>> I tried google but do net found any patch for this, but maybe I lo=
st
>>>> something.
>>>> Is there any patch I can get from anywhere or should I implement t=
he
>>>> functions by myself?
>>>
>>> This has not been supported in the mainline yet. Following diff can=
 be used
>>> for this but please note that this is not been compile and run test=
ed.
>>>
>>> diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/sams=
ung.c
>>> index ae7a302..5664ec0 100644
>>> --- a/drivers/tty/serial/samsung.c
>>> +++ b/drivers/tty/serial/samsung.c
>>> @@ -66,6 +66,9 @@
>>> =C2=A0/* flag to ignore all characters coming in */
>>> =C2=A0#define RXSTAT_DUMMY_READ (0x10000000)
>>>
>>> +static char s3c24xx_serial_console_putchar(struct uart_port *port)=
;
>>> +static char s3c24xx_serial_console_getchar(struct uart_port *port)=
;
>>> +
>>> =C2=A0static inline struct s3c24xx_uart_port *to_ourport(struct uar=
t_port *port)
>>> =C2=A0{
>>> =C2=A0=C2=A0=C2=A0=C2=A0 return container_of(port, struct s3c24xx_u=
art_port, port);
>>> @@ -957,6 +960,10 @@ static struct uart_ops s3c24xx_serial_ops =3D =
{
>>> =C2=A0=C2=A0=C2=A0=C2=A0 .request_port=C2=A0=C2=A0=C2=A0 =3D s3c24x=
x_serial_request_port,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 .config_port=C2=A0=C2=A0=C2=A0 =3D s3c24xx=
_serial_config_port,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 .verify_port=C2=A0=C2=A0=C2=A0 =3D s3c24xx=
_serial_verify_port,
>>> +#ifdef CONFIG_CONSOLE_POLL
>>> +=C2=A0=C2=A0=C2=A0 .poll_put_char=C2=A0=C2=A0=C2=A0 =3D s3c24xx_se=
rial_console_putchar,
>>> +=C2=A0=C2=A0=C2=A0 .poll_get_char=C2=A0=C2=A0=C2=A0 =3D s3c24xx_se=
rial_console_getchar,
>>> +#endif
>>> =C2=A0};
>>>
>>> =C2=A0static struct uart_driver s3c24xx_uart_drv =3D {
>>> @@ -1382,6 +1389,25 @@ s3c24xx_serial_console_txrdy(struct uart_por=
t *port,
>>> unsigned int ufcon)
>>> =C2=A0=C2=A0=C2=A0=C2=A0 return (utrstat & S3C2410_UTRSTAT_TXE) ? 1=
 : 0;
>>> =C2=A0}
>>>
>>> +static int
>>> +s3c24xx_serial_console_rxrdy(struct uart_port *port, unsigned int =
ufcon)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct s3c24xx_uart_info *info =3D s3c24xx_port=
_to_info(port);
>>> +=C2=A0=C2=A0=C2=A0 unsigned long ufstat, utrstat;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (ufcon & S3C2410_UFCON_FIFOMODE) {
>>> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* fifo mode - check amount =
of data in fifo registers... */
>>> +
>>> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ufstat =3D rd_regl(port, S3C=
2410_UFSTAT);
>>> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return (ufstat & info->rx_fi=
fofull) ? 1 : 0;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* in non-fifo mode, we go and use the rx buffe=
r full */
>>> +
>>> +=C2=A0=C2=A0=C2=A0 utrstat =3D rd_regl(port, S3C2410_UTRSTAT);
>>> +=C2=A0=C2=A0=C2=A0 return (utrstat & S3C2410_UTRSTAT_RXDR) ? 1 : 0=
;
>>> +}
>>> +
>>> =C2=A0static void
>>> =C2=A0s3c24xx_serial_console_putchar(struct uart_port *port, int ch=
)
>>> =C2=A0{
>>> @@ -1391,6 +1417,15 @@ s3c24xx_serial_console_putchar(struct uart_p=
ort
>>> *port, int ch)
>>> =C2=A0=C2=A0=C2=A0=C2=A0 wr_regb(cons_uart, S3C2410_UTXH, ch);
>>> =C2=A0}
>>>
>>> +static char
>>> +s3c24xx_serial_console_getchar(struct uart_port *port)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 unsigned int ufcon =3D rd_regl(cons_uart, S3C24=
10_UFCON);
>>> +=C2=A0=C2=A0=C2=A0 while (!s3c24xx_serial_console_rxrdy(port, ufco=
n))
>>> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 barrier();
>>> +=C2=A0=C2=A0=C2=A0 rd_regb(cons_uart, S3C2410_URXH);
>>> +}
>>> +
>>> =C2=A0static void
>>> =C2=A0s3c24xx_serial_console_write(struct console *co, const char *=
s,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0=C2=A0 unsigned int count)
>>>
>>> Regards,
>>> Thomas.
>>>
>>>
>>>>
>>>> Thanks in advance.
>>>>
>>>> Regards,
>>>> Ryan
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe
>>>> linux-samsung-soc" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info=
=2Ehtml
>>>
>>>
>>
>
