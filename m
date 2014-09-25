From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 6/6] mfd: cros_ec: Instantiate sub-devices from device
 tree
Date: Thu, 25 Sep 2014 15:48:46 +0100
Message-ID: <20140925144846.GC21351@lee--X1>
References: <1410428289-18229-1-git-send-email-javier.martinez@collabora.co.uk>
 <1410428289-18229-7-git-send-email-javier.martinez@collabora.co.uk>
 <20140917163114.GL30918@lee--X1>
 <541A8E88.6050707@collabora.co.uk>
 <20140919001512.GA29852@lee--X1>
 <54241E74.9000403@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:61182 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752854AbaIYOsw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Sep 2014 10:48:52 -0400
Received: by mail-ig0-f175.google.com with SMTP id h18so8597416igc.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2014 07:48:52 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <54241E74.9000403@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Wolfram Sang <wsa@the-dreams.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Doug Anderson <dianders@chromium.org>, Simon Glass <sjg@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, Derek Basehore <dbasehore@chromium.org>, Todd Broch <tbroch@chromium.org>, Olof Johansson <olof@lixom.net>, Andreas Faerber <afaerber@suse.de>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On Thu, 25 Sep 2014, Javier Martinez Canillas wrote:

> Hello Lee,
>=20
> On 09/19/2014 02:15 AM, Lee Jones wrote:
> >>=20
> >> As explained above, DT, non-DT and x86 platforms instantiate the c=
ros-ec-dev
> >> cells but DT platforms can define other child nodes. But I can rem=
ove the
> >> conditional if you want and reintroduce it once cros-ec-dev suppor=
t is added.
> >=20
> > Yes, that makes sense.  I only care about doing what's right for
> > Mainline, so if it doesn't make sense here, then we shouldn't be do=
ing
> > it.
> >=20
>=20
> Understood, that's why I dropped this since as explained earlier, it =
makes more
> sense to include this change once the cros_ec_dev driver is pushed to=
 upstream.
>=20
> The last version of the series (v4) I posted a week ago [0], does not=
 include
> this patch so I hope the series can be picked for 3.18 since most of =
the patches
> were already acked by you.

Unfortunately this is going to have to wait until v3.19 now, as Linus
is closing the -rcs early.  I have subsequently applied my last
patch to the MFD tree for v3.18.  It will be good for these patches to
get some soak testing in -next anyway, rather than rush them in.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
