From: Kyoungil Kim <ki0351.kim@samsung.com>
Subject: RE: [PATCH] serial: samsung: Add support 4M baudrate for samsung serial
Date: Mon, 14 May 2012 19:30:31 +0900
Message-ID: <002f01cd31bc$96e9cd90$c4bd68b0$%kim@samsung.com>
References: <001b01cce24a$b01cb370$10561a50$%kim@samsung.com>
 <4FAEF910.902@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50736 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753072Ab2ENKad convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 May 2012 06:30:33 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M40003FGD6WXSQ0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 May 2012 19:30:32 +0900 (KST)
Received: from DOKI0351KIM04 ([12.23.119.96])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4000GB0D6V3R40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 May 2012 19:30:32 +0900 (KST)
In-reply-to: <4FAEF910.902@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Kukjin Kim wrote:
> On 02/03/12 17:06, =B1=E8=B0=E6=C0=CF wrote:
> > At getting the baudrate, the max baudrate parameter value
> > is changed to 4M.
> > So samsung serial can support upto 4M baudrate.
> >
> > Signed-off-by: Kyoungil Kim<ki0351.kim@samsung.com>
> > ---
> >   drivers/tty/serial/samsung.c |    2 +-
> >   1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/sams=
ung.c
> > index a6abe0c..513096d 100644
> > --- a/drivers/tty/serial/samsung.c
> > +++ b/drivers/tty/serial/samsung.c
> > @@ -701,7 +701,7 @@ static void s3c24xx_serial_set_termios(struct u=
art_port *port,
> >   	 * Ask the core to calculate the divisor for us.
> >   	 */
> >
> > -	baud =3D uart_get_baud_rate(port, termios, old, 0, 115200*8);
> > +	baud =3D uart_get_baud_rate(port, termios, old, 0, 4000000);
> >   	quot =3D s3c24xx_serial_getclk(ourport, baud,&clk,&clk_sel);
> >   	if (baud =3D=3D 38400&&  (port->flags&  UPF_SPD_MASK) =3D=3D UPF=
_SPD_CUST)
> >   		quot =3D port->custom_divisor;
>=20
> Kyoungil,
>=20
> Is this available on all of Samsung serial?

I'm not sure about that, but it just indicates the max baudrate.

Thank you.
Best Regards.
