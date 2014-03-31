From: armdev <armdev.ftm@gmail.com>
Subject: Re: Enabling uart 3 in arndale
Date: Mon, 31 Mar 2014 09:17:01 +0530
Message-ID: <F1F1B5E6-A1BC-497B-AB6C-5349FC57F02E@gmail.com>
References: <0259D8EA-B62C-4D07-8661-ED2CF6E53779@gmail.com>
	<53259EB5.8090202@gmail.com>
	<1F300D52-7D5A-47FA-B3B4-7254C5A409E8@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: multipart/mixed; boundary="===============1150823079=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1F300D52-7D5A-47FA-B3B4-7254C5A409E8@gmail.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: u-boot@lists.denx.de, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1150823079==
Content-Type: multipart/alternative; boundary="Apple-Mail=_02F4E6FC-7F48-4735-8657-E239D5FBB464"


--Apple-Mail=_02F4E6FC-7F48-4735-8657-E239D5FBB464
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252

Dear tomaz

Waiting for your reply...=20

On 28-Mar-2014, at 3:12 pm, armdev <armdev.ftm@gmail.com> wrote:

> Dear Tomasz,
>=20
> On 16-Mar-2014, at 6:23 pm, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>=20
>> Hi,
>>=20
>> On 14.03.2014 09:04, armdev wrote:
>>> Hi,
>>>=20
>>> We are trying to enable the UART3 on COM18 pins of arndale board. =
The UART3 RXD and TXD are on pins 2 and 4 which as per the base board =
specification is connected as
>>>=20
>>> XuRXD3 : UART_3_RXD/GPA1[4] : 2
>>> XuTXD3 : UART_3_TXD/GPA1[5] : 4
>>>=20
>>> As per the public reference manual of exynos 5250, there is a =
register GPACON (0x1140_0000)
>>> Setting GPACON |=3D 0x0010_0000 should enable the pins, but I am not =
able to see any output on UART3.
>>>=20
>>> Can you please suggest what is the right procedure
>>=20
>> The register is GPA1CON and its GPA1CON[4] and [5] bit fields need =
both to be set to 0x2 - see Pad Control chapter of Exynos5250 public =
datasheet. Also GPA1PUD should be reconfigured to disable default =
pull-down on both pins, again you can find details of the register in =
the datasheet.
>>=20
>> Best regards,
>> Tomasz
>=20
> Based on the steps provided, we are still not able to get some output =
on UART3 simultaneously with UART2.
> Can you please help us find out what we are missing.
>=20
> On the current u-boot, Following was the observation and steps to =
enable UART3 on arndale
>=20
> Observations / Questions
> =97=97=97=97=97=97=97=97=97=97=97=97=97=97
> a) The board has the default UART set to UART2 which is at 0x12c20000, =
while the include/configs/arndale.h has the UART_OFFSET set to 0x010000.
> Shouldn=92t it be set to 0x20000 ?
>=20
> b) board_uart_init in board/samsung/arndale/arndale.c is configuring =
all the uarts,=20
> Clocks would be set properly for all 4 uarts ?
>=20
> Steps / Code Modified
> =97=97=97=97=97=97=97=97=97=97=97=97=97=97
> a) GPAICON[4] and [5] set to 0x2 in board/samsung/arndale/arndale.c
> b) GPA1PUD [4] and [5] set to 0.
>=20
> diff --git a/board/samsung/arndale/arndale.c =
b/board/samsung/arndale/arndale.c
> index 9efc355..4fb291e 100644
> --- a/board/samsung/arndale/arndale.c
> +++ b/board/samsung/arndale/arndale.c
> @@ -102,12 +102,18 @@ static int board_uart_init(void)
> int board_early_init_f(void)
> {
>  	int err;
> -
> +	volatile unsigned int *gpa1con =3D (volatile unsigned int =
*)0x11400020;
> +	volatile unsigned int *gpa1pud =3D (volatile unsigned int =
*)0x11400028;
>  	err =3D board_uart_init();
>  	if (err) {
>  		debug("UART init failed\n");
>  		return err;
>  	}
> +	serial_init_dev(2);
> +	serial_setbrg_dev(2);
> +	*gpa1con |=3D 0x00220000;=09
> +	*gpa1pud &=3D 0xfffff0ff;=09
> +
>  	return err;
> }
> #endif
>=20


--Apple-Mail=_02F4E6FC-7F48-4735-8657-E239D5FBB464--

--===============1150823079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============1150823079==--
