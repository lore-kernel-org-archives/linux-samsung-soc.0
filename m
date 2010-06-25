From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: clock updates
Date: Fri, 25 Jun 2010 17:38:20 +0900
Message-ID: <AANLkTikIOfUS-hOs8ea3cqBntYJEFTD4pEFgte8qbMTH@mail.gmail.com>
References: <20100623232422.GB16584@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:51359 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752051Ab0FYIiW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jun 2010 04:38:22 -0400
Received: by wyb38 with SMTP id 38so3507wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jun 2010 01:38:21 -0700 (PDT)
In-Reply-To: <20100623232422.GB16584@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org

Hello,

On Thu, Jun 24, 2010 at 8:24 AM, Ben Dooks <ben-linux@fluff.org> wrote:
> I've been looking into updating the current samsung socs to use
> clkdev to lookup clocks. Currently we have a few issues that we
> could do with sorting before running the conversion to clkdev.
>
> Firstly, the s5pc100 has some clocks that could be merged into
> common s5p, and a few which don't seem to match the others in
> the s5p series.
>
> The i2s clocks which we should look at mergining are:
>
> i2s_cdclk<0..2>
> pcm_cdclk<0..l>
>
> also, clocks that have may need changing:
>
> rotator =C2=A0 =C2=A0 =C2=A0=3D> rot
> keyif =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D> keypad
>
> this isn't an complete list, still working on the changes.
>
> The big changes with respect to drivers is that we will now be using
> clk_get(dev, NULL) to get the clock names, and any bus clocks such
> as the sdhci bus clock will be updated.
>
> The intention with both the SDHCI and the SPI is to change the clock
> lookups to reflect the mux positions, so the sdhci clocks on the
> s3c64xx would be changed to use the following lookups:
>
> hsmmc =C2=A0 =3D> mux0
> mmc_bus =3D> mux2
> 48m =C2=A0 =C2=A0 =3D> mux3
>
> This would avoid passing the clock names through the platform data, i=
f
> the boards or the arch needs to avoid a clock, an array of clock enab=
le
> or disable bits. Any unimplemented clocks will return NULL to ensure
> that they can be distinguished from a clock that isn't available.
>
> The changes would be to remove the .name field from all the s3c struc=
t clk,
> and replace it with a pointer to a lookup (so that if the clock does =
not
> need a name then it doesn't need a lookup).

I also like the idea using clk_get based on the name of struct device
and getting rid of name field from clk.

However, what about devices and clocks with the same name and
different id numbers (i.e., platform_device.id)? Are you going to add
=2Eid lookup to clkdev's clk_find? There are multiple clocks with the
same name and different id number.


>
> There are also a number of clocks that probably don't need a name as =
they
> are part of the clock heirarchy, it would be useful to have a call th=
at
> returns all possible parents of a given clock.
>
> I'll post the script whcih runs the changes once i've finished the la=
st
> few details to show what happens.
>
> With resepect to the clkdev clk_get() function, we may need to do a c=
ouple of
> updates (ie, override it for ourselves) due to the following two prob=
lems:
>
> 1) The s3c/s5p devices change name depending on the soc they are atta=
ched
> =C2=A0 to, which means we may need to cut the s3cxxxx- part of the de=
vice name
> =C2=A0 off before running the lookup
>
> 2) Some of the lookups are done early for the serial driver, which me=
ans
> =C2=A0 that the platform devices's name has not been setup, so someth=
ing needs
> =C2=A0 to be done about this.
>
> --
> Ben
>
>
>
>
>
>
>
>
>
>
> --
> Ben
>
> Q: =C2=A0 =C2=A0 =C2=A0What's a light-year?
> A: =C2=A0 =C2=A0 =C2=A0One-third less calories than a regular year.
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>


Cheers!

--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
