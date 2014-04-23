From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 1/5] mfd: tps65090: Don't tell child devices we have
 an IRQ if we don't
Date: Wed, 23 Apr 2014 12:49:38 +0100
Message-ID: <20140423114938.GM21613@lee--X1>
References: <1397689950-1568-1-git-send-email-dianders@chromium.org>
 <1397689950-1568-2-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:57466 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751655AbaDWLtp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Apr 2014 07:49:45 -0400
Received: by mail-we0-f174.google.com with SMTP id t60so742251wes.33
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2014 04:49:43 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1397689950-1568-2-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Anton Vorontsov <anton@enomsg.org>, Olof Johansson <olof@lixom.net>, Sachin Kamat <sachin.kamat@linaro.org>, ajaykumar.rs@samsung.com, linux-samsung-soc@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org

> If we weren't given an interrupt we shouldn't tell child devices (lik=
e
> the tps65090 charger) that they have an interrupt.  This is needed so
> that we can support polling mode in the tps65090 charger driver.
>=20
> See also (charger: tps65090: Allow charger module to be used when no
> irq).
>=20
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> ---
> Changes in v3: None
> Changes in v2:
> - Split noirq (polling mode) changes into MFD and charger
>=20
>  drivers/mfd/tps65090.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Applied, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
