From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND v2 5/7] mfd: cros_ec: Instantiate ChromeOS EC
 character device
Date: Tue, 20 Jan 2015 16:29:52 +0000
Message-ID: <20150120162952.GB30656@x1>
References: <1420205572-2640-1-git-send-email-javier.martinez@collabora.co.uk>
 <1420205572-2640-6-git-send-email-javier.martinez@collabora.co.uk>
 <20150120082013.GU21886@x1>
 <54BE7C53.8070605@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:36320 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751356AbbATQ37 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jan 2015 11:29:59 -0500
Received: by mail-ig0-f175.google.com with SMTP id hn18so4211555igb.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Jan 2015 08:29:59 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <54BE7C53.8070605@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Jonathan Corbet <corbet@lwn.net>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 20 Jan 2015, Javier Martinez Canillas wrote:

> Hello Lee,
>=20
> Thanks a lot for your feedback.
>=20
> On 01/20/2015 09:20 AM, Lee Jones wrote:
> > On Fri, 02 Jan 2015, Javier Martinez Canillas wrote:
> >=20
> >> The ChromeOS EC character device is an user-space interface to
> >> allow applications to access the Embedded Controller.
> >>=20
> >> Add a cell for this device so it's spawned from the mfd driver.
> >>=20
> >> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora=
=2Eco.uk>
> >> ---
> >>=20
> >> Changes since v1: None, new patch.
> >>=20
> >>  drivers/mfd/cros_ec.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>=20
> >> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> >> index c872e1b..70f9ed5 100644
> >> --- a/drivers/mfd/cros_ec.c
> >> +++ b/drivers/mfd/cros_ec.c
> >> @@ -118,6 +118,10 @@ static const struct mfd_cell cros_devs[] =3D =
{
> >>  		.id =3D 2,
> >>  		.of_compatible =3D "google,cros-ec-i2c-tunnel",
> >>  	},
> >> +	{
> >> +		.name =3D "cros-ec-dev",
> >=20
> > *-dev is seldom suitable for naming things.
> >=20
> > Please be more imaginative/descriptive in your naming.
> >
>=20
> You know this is one of the two hard problems in CS ;-)
>=20
> But seriously, this is the name used in the downstream ChromiumsOS ke=
rnel
> and tbh I don't think is that bad since after all is a character devi=
ce
> interface to access the Embedded Controller from user-space. So in th=
at
> sense is not worse than the i2c-dev or spidev names but I can try to =
come
> up with something more creative if that will block the patch to be me=
rged.

It's not a blocker, but it is a ridiculous name to use inside the
driver/ directory 'cos almost everything is a dev(ice) here.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
