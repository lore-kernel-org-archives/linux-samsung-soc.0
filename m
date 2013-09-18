From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2] serial: samsung: add support for manual RTS setting
Date: Wed, 18 Sep 2013 19:17:30 +0200
Message-ID: <1396773.mUrBgMlKxN@flatron>
References: <1379519569-7266-1-git-send-email-jose.goncalves@inov.pt>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <1379519569-7266-1-git-send-email-jose.goncalves@inov.pt>
Sender: linux-serial-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Jos=E9_Miguel_Gon=E7alves?= <jose.goncalves@inov.pt>
Cc: t.figa@samsung.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, heiko@sntech.de, s.nawrocki@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Jos=E9,

On Wednesday 18 of September 2013 16:52:49 Jos=E9 Miguel Gon=E7alves wr=
ote:
> The Samsung serial driver currently does not support setting the
> RTS pin with an ioctl(TIOCMSET) call. This patch adds this support.
>=20
> Changes in v2:
>  - Preserve the RTS pin's manual setting  in set_termios() also when
>    enabling CRTSCTS.
>=20
> Signed-off-by: Jos=E9 Miguel Gon=E7alves <jose.goncalves@inov.pt>
> ---
>  drivers/tty/serial/samsung.c |   20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)

Looks good.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe linux-serial"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
