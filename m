From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] serial: samsung: Add support 4M baudrate for samsung
 serial
Date: Sun, 13 May 2012 08:58:08 +0900
Message-ID: <4FAEF910.902@samsung.com>
References: <001b01cce24a$b01cb370$10561a50$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:54143 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753063Ab2ELW6P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 May 2012 18:58:15 -0400
Received: by pbbrp8 with SMTP id rp8so4662303pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 May 2012 15:58:14 -0700 (PDT)
In-Reply-To: <001b01cce24a$b01cb370$10561a50$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?EUC-KR?B?seiw5sDP?= <ki0351.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>

On 02/03/12 17:06, =B1=E8=B0=E6=C0=CF wrote:
> At getting the baudrate, the max baudrate parameter value
> is changed to 4M.
> So samsung serial can support upto 4M baudrate.
>=20
> Signed-off-by: Kyoungil Kim<ki0351.kim@samsung.com>
> ---
>   drivers/tty/serial/samsung.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsun=
g.c
> index a6abe0c..513096d 100644
> --- a/drivers/tty/serial/samsung.c
> +++ b/drivers/tty/serial/samsung.c
> @@ -701,7 +701,7 @@ static void s3c24xx_serial_set_termios(struct uar=
t_port *port,
>   	 * Ask the core to calculate the divisor for us.
>   	 */
>=20
> -	baud =3D uart_get_baud_rate(port, termios, old, 0, 115200*8);
> +	baud =3D uart_get_baud_rate(port, termios, old, 0, 4000000);
>   	quot =3D s3c24xx_serial_getclk(ourport, baud,&clk,&clk_sel);
>   	if (baud =3D=3D 38400&&  (port->flags&  UPF_SPD_MASK) =3D=3D UPF_S=
PD_CUST)
>   		quot =3D port->custom_divisor;

Kyoungil,

Is this available on all of Samsung serial?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
