From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND PATCH 1/8] mfd: cros ec: Remove parent field
Date: Tue, 5 May 2015 11:54:39 +0100
Message-ID: <20150505105439.GB4047@x1>
References: <1428336906-14906-1-git-send-email-javier.martinez@collabora.co.uk>
 <1428336906-14906-2-git-send-email-javier.martinez@collabora.co.uk>
 <CAMHSBOV3PxRqeHtMsDvqOaCLX7QpJ-ncvrfES_oixWAG1ZkDQg@mail.gmail.com>
 <20150429103734.GU9169@x1>
 <5548882A.50400@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:35225 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757987AbbEEKyo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 May 2015 06:54:44 -0400
Received: by wgyo15 with SMTP id o15so178384655wgy.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 May 2015 03:54:43 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5548882A.50400@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Gwendal Grignou <gwendal@chromium.org>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>

On Tue, 05 May 2015, Javier Martinez Canillas wrote:
> On 04/29/2015 12:37 PM, Lee Jones wrote:
> > On Thu, 23 Apr 2015, Gwendal Grignou wrote:
> >=20
> >> Be consistent, use cros_ec instead of "cros ec" or "cros-ec".
> >=20
> > What is this in reference to?
> >
>=20
> I think Gwendal meant that I should be consistent in general and was =
not
> referring to this patch particular.

Better to quote one of the offending occurrences than to randomly
top-post helpful comments.

> >> Otherwise:
> >>=20
> >> Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
> >> Tested-by: Gwendal Grignou <gwendal@chromium.org>
> >>=20
> >> On Mon, Apr 6, 2015 at 9:14 AM, Javier Martinez Canillas
> >> <javier.martinez@collabora.co.uk> wrote:
> >> > From: Gwendal Grignou <gwendal@chromium.org>
> >> >
> >> > parent and dev were pointing to the same device structure.
> >> > parent is unused, removed.
> >> >
> >> > Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
> >> > Reviewed-by: Stephen Barber <smbarber@chromium.org>
> >> > Tested-by: Stephen Barber <smbarber@chromium.org>
> >> > Reviewed-by: Puthikorn Voravootivat <puthik@chromium.org>
> >> > Signed-off-by: Javier Martinez Canillas <javier.martinez@collabo=
ra.co.uk>
> >> > ---
> >> >  drivers/mfd/cros_ec_i2c.c             | 1 -
> >> >  drivers/mfd/cros_ec_spi.c             | 1 -
> >> >  drivers/platform/chrome/cros_ec_lpc.c | 1 -
> >> >  include/linux/mfd/cros_ec.h           | 2 --
> >> >  4 files changed, 5 deletions(-)
> >=20
> > For when you re-submit:
> >=20
> > Acked-by: Lee Jones <lee.jones@linaro.org>
> >=20
>=20
> Thanks a lot for your ack.
>=20
> Best regards,
> Javier

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
