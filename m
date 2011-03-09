From: Giridhar Bachalli Maruthy <giridhar.maruthy@linaro.org>
Subject: Re: [PATCH] SAMSUNG: S5PV310: Add I2S playback support
Date: Wed, 9 Mar 2011 15:50:18 +0530
Message-ID: <AANLkTimYv-F-0VXzy9=Cb9GoSQzWs0RMd4y5rbpP+fCw@mail.gmail.com>
References: <1299580852-20959-1-git-send-email-giridhar.maruthy@linaro.org>
	<20110308113752.GA5892@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:57719 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932175Ab1CIKUT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Mar 2011 05:20:19 -0500
Received: by iyb26 with SMTP id 26so348510iyb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Mar 2011 02:20:18 -0800 (PST)
In-Reply-To: <20110308113752.GA5892@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Hi Mark,

Thanks for your comments.

On 8 March 2011 17:07, Mark Brown <broonie@opensource.wolfsonmicro.com>=
 wrote:
>
> On Tue, Mar 08, 2011 at 04:10:52PM +0530, Giridhar Maruthy wrote:
>
> > +#ifdef CONFIG_REGULATOR_WM8994
> > +static struct regulator_consumer_supply wm8994_fixed_voltage0_supp=
lies[] =3D {
> > + =A0 =A0 {
> > + =A0 =A0 =A0 =A0 =A0 =A0 .dev_name =A0 =A0 =A0 =3D "1-001a",
> > + =A0 =A0 =A0 =A0 =A0 =A0 .supply =A0 =A0 =A0 =A0 =3D "AVDD2",
>
> This ifdef looks wrong - you're testing for the WM8994 regulators but
> the things inside the define are fixed voltage regulators. =A0Probabl=
y
> best to just make the whole lot depend on CONFIG_REGULATOR and then
> select the regulator drivers if that's enabled:
>
> =A0 =A0 =A0 =A0select REGULATOR_WM8994 if REGULATOR
> =A0 =A0 =A0 =A0select REGULATOR_FIXED if REGULATOR
>
> (just doing Kconfig symbols from memory, I might be misremembering.)
>
Ok. I will move these configs to the Kconfig file[1] where we select
WM8994 codec.

Since WM8994 codec requires CONFIG_REGULATOR to be defined, would it
be appropriate to select REGULATOR also in [1] and remove the ifdef
CONFIG_REGULATOR?

[1] sound/soc/samsung/Kconfig

> > +#ifdef CONFIG_I2C_S3C2410
> > +#ifdef CONFIG_S3C_DEV_I2C1
>
> The above will break if someone builds I2C modular - there's a separa=
te
> _MODULE define for that. =A0Though TBH I'm not sure all this ifdefery=
 is
> really buying much.
Yes, you are right. I will get rid of this ifdef.

Regards,
Giridhar
