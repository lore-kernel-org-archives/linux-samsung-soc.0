From: xf liu <7inchpalace@gmail.com>
Subject: Re: kgdb on S5PV210
Date: Wed, 31 Aug 2011 08:59:15 +0800
Message-ID: <CAK6dbMR+u3Fa4zucf7mxF_YcBU-RN1HroD9KnOS+PnAj3ggqEA@mail.gmail.com>
References: <CAK6dbMS6DXxez6ehAGZgi5yu9kgjg5QQr-UGYmxNR4frPGGe+A@mail.gmail.com>
	<CAJuYYwTrQdLYAPa1Uf9aFWHyNHfufff35-_unRNJ3mVmYdZ3BA@mail.gmail.com>
	<CAK6dbMT0H9p3qpFhmUkRNeZXreuBFuW-86ar9aVqvQ-DAHTCFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:38466 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754236Ab1HaA7P convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Aug 2011 20:59:15 -0400
Received: by pzk37 with SMTP id 37so395561pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Aug 2011 17:59:15 -0700 (PDT)
In-Reply-To: <CAK6dbMT0H9p3qpFhmUkRNeZXreuBFuW-86ar9aVqvQ-DAHTCFw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org

Hi Thomas and All,

I modified the poll_get_char and poll_put_char function and retried.
I got the result of
"+$S05#b8+$OK#9a+$QC0000000000000001#95+$000000000100000054c87fc0b8c97f=
c00100000"
when connecting .
I don't know the details about the RSP but the 1st step seems OK while
connecting.
Can anyone help to figure out what problem may happened while
connecting GDB with the remote device?
Thanks.

Ryan

2011/8/30 xf liu <7inchpalace@gmail.com>:
> Hi Thomas,
>
> Thanks for your reply.
> I tried this patch, but the result is the same. :(
> I use minicom in host PC as console terminal to display the kernel tr=
ace.
> Is there still anything wrong?
> Thanks.
>
> Regards,
> Ryan
>
> 2011/8/30 Thomas Abraham <thomas.abraham@linaro.org>:
>> Hi Ryan,
>>
>> On 29 August 2011 12:33, xf liu <7inchpalace@gmail.com> wrote:
>>>
>>> Hi list,
>>>
>>>
>>> I try to enable kgdb on S5PV210 using the same serial port (UART 0)
>>> with the console, but after adding "kgdboc=3DttySAC0,115200 kgdbwai=
t" I
>>> found tty_find_polling_driver returns NULL.
>>> The cause is that the poll_get_char and poll_put_char handlers are =
not
>>> set in static struct uart_ops s3c24xx_serial_ops.
>>>
>>> I tried google but do net found any patch for this, but maybe I los=
t
>>> something.
>>> Is there any patch I can get from anywhere or should I implement th=
e
>>> functions by myself?
>>
>> This has not been supported in the mainline yet. Following diff can =
be used
>> for this but please note that this is not been compile and run teste=
d.
>>
>> diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsu=
ng.c
>> index ae7a302..5664ec0 100644
>> --- a/drivers/tty/serial/samsung.c
>> +++ b/drivers/tty/serial/samsung.c
>> @@ -66,6 +66,9 @@
>> =C2=A0/* flag to ignore all characters coming in */
>> =C2=A0#define RXSTAT_DUMMY_READ (0x10000000)
>>
>> +static char s3c24xx_serial_console_putchar(struct uart_port *port);
>> +static char s3c24xx_serial_console_getchar(struct uart_port *port);
>> +
>> =C2=A0static inline struct s3c24xx_uart_port *to_ourport(struct uart=
_port *port)
>> =C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0 return container_of(port, struct s3c24xx_ua=
rt_port, port);
>> @@ -957,6 +960,10 @@ static struct uart_ops s3c24xx_serial_ops =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0 .request_port=C2=A0=C2=A0=C2=A0 =3D s3c24xx=
_serial_request_port,
>> =C2=A0=C2=A0=C2=A0=C2=A0 .config_port=C2=A0=C2=A0=C2=A0 =3D s3c24xx_=
serial_config_port,
>> =C2=A0=C2=A0=C2=A0=C2=A0 .verify_port=C2=A0=C2=A0=C2=A0 =3D s3c24xx_=
serial_verify_port,
>> +#ifdef CONFIG_CONSOLE_POLL
>> +=C2=A0=C2=A0=C2=A0 .poll_put_char=C2=A0=C2=A0=C2=A0 =3D s3c24xx_ser=
ial_console_putchar,
>> +=C2=A0=C2=A0=C2=A0 .poll_get_char=C2=A0=C2=A0=C2=A0 =3D s3c24xx_ser=
ial_console_getchar,
>> +#endif
>> =C2=A0};
>>
>> =C2=A0static struct uart_driver s3c24xx_uart_drv =3D {
>> @@ -1382,6 +1389,25 @@ s3c24xx_serial_console_txrdy(struct uart_port=
 *port,
>> unsigned int ufcon)
>> =C2=A0=C2=A0=C2=A0=C2=A0 return (utrstat & S3C2410_UTRSTAT_TXE) ? 1 =
: 0;
>> =C2=A0}
>>
>> +static int
>> +s3c24xx_serial_console_rxrdy(struct uart_port *port, unsigned int u=
fcon)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct s3c24xx_uart_info *info =3D s3c24xx_port_=
to_info(port);
>> +=C2=A0=C2=A0=C2=A0 unsigned long ufstat, utrstat;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (ufcon & S3C2410_UFCON_FIFOMODE) {
>> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* fifo mode - check amount o=
f data in fifo registers... */
>> +
>> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ufstat =3D rd_regl(port, S3C2=
410_UFSTAT);
>> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return (ufstat & info->rx_fif=
ofull) ? 1 : 0;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 /* in non-fifo mode, we go and use the rx buffer=
 full */
>> +
>> +=C2=A0=C2=A0=C2=A0 utrstat =3D rd_regl(port, S3C2410_UTRSTAT);
>> +=C2=A0=C2=A0=C2=A0 return (utrstat & S3C2410_UTRSTAT_RXDR) ? 1 : 0;
>> +}
>> +
>> =C2=A0static void
>> =C2=A0s3c24xx_serial_console_putchar(struct uart_port *port, int ch)
>> =C2=A0{
>> @@ -1391,6 +1417,15 @@ s3c24xx_serial_console_putchar(struct uart_po=
rt
>> *port, int ch)
>> =C2=A0=C2=A0=C2=A0=C2=A0 wr_regb(cons_uart, S3C2410_UTXH, ch);
>> =C2=A0}
>>
>> +static char
>> +s3c24xx_serial_console_getchar(struct uart_port *port)
>> +{
>> +=C2=A0=C2=A0=C2=A0 unsigned int ufcon =3D rd_regl(cons_uart, S3C241=
0_UFCON);
>> +=C2=A0=C2=A0=C2=A0 while (!s3c24xx_serial_console_rxrdy(port, ufcon=
))
>> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 barrier();
>> +=C2=A0=C2=A0=C2=A0 rd_regb(cons_uart, S3C2410_URXH);
>> +}
>> +
>> =C2=A0static void
>> =C2=A0s3c24xx_serial_console_write(struct console *co, const char *s=
,
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0=C2=A0 unsigned int count)
>>
>> Regards,
>> Thomas.
>>
>>
>>>
>>> Thanks in advance.
>>>
>>> Regards,
>>> Ryan
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe
>>> linux-samsung-soc" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.=
html
>>
>>
>
