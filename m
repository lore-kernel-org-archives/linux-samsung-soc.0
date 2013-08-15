From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 2/3] ARM: dts: Update the status of RTC DT node of Exynos5250 SoC to "okay"
Date: Thu, 15 Aug 2013 10:59:02 +0200
Message-ID: <2856422.z0LmRpN0Wg@flatron>
References: <1376488710-12124-1-git-send-email-vikas.sajjan@linaro.org> <1376488710-12124-3-git-send-email-vikas.sajjan@linaro.org> <CAHbNUh3LG4coLDfGZ5b=agaJ0PhhAR0A3Nhq-tPyL78KekhFOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1625710.leRtQWpTrn"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f45.google.com ([209.85.214.45]:64205 "EHLO
	mail-bk0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751101Ab3HOI7N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Aug 2013 04:59:13 -0400
Received: by mail-bk0-f45.google.com with SMTP id mx11so142735bkb.32
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Aug 2013 01:59:11 -0700 (PDT)
In-Reply-To: <CAHbNUh3LG4coLDfGZ5b=agaJ0PhhAR0A3Nhq-tPyL78KekhFOw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: Vikas Sajjan <vikas.sajjan@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org, Doug Anderson <dianders@chromium.org>


--nextPart1625710.leRtQWpTrn
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Tushar,

On Thursday 15 of August 2013 10:02:43 Tushar Behera wrote:
> On 14 August 2013 19:28, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> > Updates the RTC DT node's status to "okay", since the bindings in
> > exynos5250.dtsi depicts the RTC h/w completely.
> > 
> > Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> > ---
> > 
> >  arch/arm/boot/dts/exynos5250.dtsi |    1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> > b/arch/arm/boot/dts/exynos5250.dtsi index f426ce6..c82137b 100644
> > --- a/arch/arm/boot/dts/exynos5250.dtsi
> > +++ b/arch/arm/boot/dts/exynos5250.dtsi
> > @@ -181,6 +181,7 @@
> > 
> >         rtc@101E0000 {
> >         
> >                 clocks = <&clock 337>;
> >                 clock-names = "rtc";
> > 
> > +               status = "okay";
> > 
> >         };
> 
> Sometime back we had a discussion on this, the decision was to enable
> it in respective boards.

This is not entirely true.

According to ePAPR, chapter 2.3.4, the status property has a well defined 
meaning and it should be set to "disabled" when "the device is not 
presently operational, but it might become operational in the future (for 
example, something is not plugged in, or switched off)".

This means that unless setup of the device is missing something (e.g. 
board-specific properties, like regulators or pin config) or there is a 
valid technical reason for disabling the device by default (e.g. it needs 
certain SoC pins to be properly connected to something), then such device 
should be "okay", because it is operational.

> Also if we are going ahead with this, we would need to remove the
> corresponding status statements from board files.

Yes, this is true.

Best regards,
Tomasz

--nextPart1625710.leRtQWpTrn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAABAgAGBQJSDJhaAAoJEIv3Hb8G/XrurCsP/2xvajTdnsEF5s3IgJdx3NCF
aSsT5JSO7QUvpyBFO4aAWQyIJJ2Jngl4pJVcneI8aDFpIuhuXjN5alICUChpd3Vf
1oZAwJrejmdOtkAYj445MmLej/d4yMuw94ij9daLzWX2XJwJLuG+o+tXmsBGGrfM
JA1tFW+mNKENqz9GpFUIQkJVGWub3NvHzKvIWeIuli8pjy5OrByRw4TGdBGwD2qW
KxRp3Hk3uG4Oe8+JYzcwnp4bE5KxsOMtExb8tR5U2gA0n8cbcJFa9RUwprKIYAC4
Vyvh5HAa0OVK91mUpSBmjzsOJ+h3pLu/y7jJo+swljPqZbJHhFrsgghz9N2EWjXx
V6Mgevnj0NRdzK8p11pGBdXrNQ9kc0Yl4XuzDvjciNvJmKO813aPhKNyj/QcDC4W
15HhAipA0wiKhAo7nCjOKiPTnuhY/qGtx9aOxPeTJofzQdKAziWAI2fk6YgjDElI
nv/jytHjMdwLyrWAB/cZpfks0zhfv5ISiFdIXA4fIrqvrxfaCTxIvjMGq8OCvh/x
M0NN7YiaBMm0HrvCUtCQI9PtDvEC3yoA/Q08H8uULOeUED7PQ9T++H5Hzva7YMzT
t45l6Mh6HSaM0+G/0yeEmTW0S9jcpyAw11WzGkQNGNrVkBqGeO/VV+gVpp8BRqZj
O5x8KXTk33chB6UC+G+A
=1V2M
-----END PGP SIGNATURE-----

--nextPart1625710.leRtQWpTrn--
