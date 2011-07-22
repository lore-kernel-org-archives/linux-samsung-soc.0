From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 2/2] arm: dt: Add device tree support for i2c instance
 1 on exynos4 dt machine
Date: Fri, 22 Jul 2011 00:12:49 -0700
Message-ID: <20110722071249.GK5783@atomide.com>
References: <1310950241-13602-1-git-send-email-thomas.abraham@linaro.org>
 <1310950241-13602-3-git-send-email-thomas.abraham@linaro.org>
 <CAP6yH7dUnqhvSA8AYx2R9ZZ1mBL=YMz6oMiJVpphA1FhgLHOvw@mail.gmail.com>
 <CACxGe6v+-H+W4H-5-gvEP+8j91NsGpVZkS595zSt8Lju74taWw@mail.gmail.com>
 <CAC63_iQcia64iBq653S+3_Yj8mgfbGSfHdGXevFe8urj9RpF-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mho-03-ewr.mailhop.org ([204.13.248.66]:16110 "EHLO
	mho-01-ewr.mailhop.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751418Ab1GVHM5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Jul 2011 03:12:57 -0400
Content-Disposition: inline
In-Reply-To: <CAC63_iQcia64iBq653S+3_Yj8mgfbGSfHdGXevFe8urj9RpF-w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "G, Manjunath Kondaiah" <manjugk@ti.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, "G, Manjunath Kondaiah" <manjugk@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, ben-linux@fluff.org, patches@linaro.org

* G, Manjunath Kondaiah <manjugk@ti.com> [110719 09:59]:
> On Tue, Jul 19, 2011 at 2:00 AM, Grant Likely <grant.likely@secretlab=
=2Eca> wrote:
> >
> > No, the i2c bus node should still appear in the SoC .dtsi file. =C2=
=A0If a
> > board doesn't use a particular i2c bus, then the board.dts file can
> > add a status =3D "disabled"; property to the i2c bus node to disabl=
e it.
>=20
> that's right. I am referring to I2C slave devices. For a given SoC,
> two different
> boards can have different i2c slave devices with different slave
> address. In that case,
> it is better to have i2c child/slave nodes in board .dts file.

This is OK for now, but from bus/hwmod point of view we need to reset a=
ll
the unused devices as otherwise PM will never work properly.

Disabling each device in the board .dts file will never be done correct=
ly
for most boards.. And on each board, probably 2/3 of the devices are un=
used
because of the pin limitations :)

So the disabling of unused devices should be done with a late_initcall =
and
controlled by kernel cmdline. We were thinking hwmod.disable=3D[0|1].

The late_initcall to disable unused device tree devices could also be
added later on to device tree core code.

Regards,

Tony
