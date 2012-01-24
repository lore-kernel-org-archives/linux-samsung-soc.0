From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 3/3] S3C2443: add power domain for usb phy
Date: Tue, 24 Jan 2012 10:50:14 +0100
Message-ID: <201201241050.14405.heiko@sntech.de>
References: <201201082156.44142.heiko@sntech.de> <201201082159.02368.heiko@sntech.de> <20120124093831.GT27414@legolas.emea.dhcp.ti.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120124093831.GT27414-UiBtZHVXSwEVvW8u9ZQWYwjfymiNCTlR@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Ben Dooks' <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Felipe,

Am Dienstag, 24. Januar 2012, 10:38:32 schrieb Felipe Balbi:
> Hi,
>=20
> On Sun, Jan 08, 2012 at 09:59:02PM +0100, Heiko St=FCbner wrote:
> > The phy-power-handling is common to S3C2443/2416/2450, so introduce=
 a
> > s3c2443-pm-common.c to handle this for all of them.
> >=20
> > This makes it possible to remove the raw write to the PWRCFG-regist=
er
> > from the s3c-hsudc driver.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>=20
> I believe this doesn't really depend on previous patches (??) In that
> case, it can be carried with s3c's tree:
it does depend on the previous patch [2/3], as the device power domain =
is=20
controlled through the runtime-pm subsystem whose calls were added in i=
t.

Heiko
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
