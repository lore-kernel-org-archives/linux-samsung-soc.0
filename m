From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/3] mfd: tps65090: Allow charger module to be used when
 no irq
Date: Wed, 16 Apr 2014 10:52:29 +0100
Message-ID: <20140416095229.GF4754@lee--X1>
References: <1397592876-5741-1-git-send-email-dianders@chromium.org>
 <1397592876-5741-2-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:53708 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751258AbaDPJwf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 05:52:35 -0400
Received: by mail-wg0-f44.google.com with SMTP id m15so10572655wgh.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Apr 2014 02:52:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1397592876-5741-2-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Anton Vorontsov <anton@enomsg.org>, Olof Johansson <olof@lixom.net>, Sachin Kamat <sachin.kamat@linaro.org>, ajaykumar.rs@samsung.com, linux-samsung-soc@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org

> On the ARM Chromebook tps65090 has two masters: the AP (the main
> processor running linux) and the EC (the embedded controller).  The A=
P
> is allowed to mess with FETs but the EC is in charge of charge contro=
l.
>=20
> The tps65090 interupt line is routed to both the AP and the EC, which
> can cause quite a headache.  Having two people adjusting masks and
> acking interrupts is a recipe for disaster.
>=20
> In the shipping kernel we had a hack to have the AP pay attention to
> the IRQ but not to ack it.  It also wasn't supposed to configure the
> IRQ in any way.  That hack allowed us to detect when the device was
> charging without messing with the EC's state.
>=20
> The current tps65090 infrastructure makes the above difficult, and it
> was a bit of a hack to begin with.  Rather than uglify the driver to
> support it, just extend the driver's existing notion of "no irq" to
> the charger.  This makes the charger code poll every 2 seconds for AC
> detect, which is sufficient.
>=20
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
>  drivers/mfd/tps65090.c           | 14 ++++++--
>  drivers/power/tps65090-charger.c | 76 ++++++++++++++++++++++++++++++=
+---------
>  2 files changed, 70 insertions(+), 20 deletions(-)

=46or the MFD part:
  Acked-by: Lee Jones <lee.jones@linaro.org>

Anton,
  If you are okay with this patch I'd be happy to create an immutable
branch for you to pull from?

Doug,
  What is the relationship (dependencies) between this and the other
patches in the set?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
