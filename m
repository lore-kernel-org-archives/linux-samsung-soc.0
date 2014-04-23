From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 3/5] mfd: tps65090: Stop caching most registers
Date: Wed, 23 Apr 2014 12:50:17 +0100
Message-ID: <20140423115017.GN21613@lee--X1>
References: <1397689950-1568-1-git-send-email-dianders@chromium.org>
 <1397689950-1568-4-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:59033 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751965AbaDWLuX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Apr 2014 07:50:23 -0400
Received: by mail-we0-f173.google.com with SMTP id w61so728805wes.18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2014 04:50:22 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1397689950-1568-4-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Anton Vorontsov <anton@enomsg.org>, Olof Johansson <olof@lixom.net>, Sachin Kamat <sachin.kamat@linaro.org>, ajaykumar.rs@samsung.com, linux-samsung-soc@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org

> Nearly all of the registers in tps65090 combine control bits and
> status bits.  Turn off caching of all registers except the select few
> that can be cached.
>=20
> In order to avoid adding more duplicate #defines, we also move some
> register offset definitions to the mfd driver (and resolve
> inconsistent names).
>=20
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
> Changes in v3: None
> Changes in v2:
> - Leave cache on for the registers that can be cached.
> - Move register offsets to mfd header file.
>=20
>  drivers/mfd/tps65090.c           | 27 ++++++++++++++-------------
>  drivers/power/tps65090-charger.c | 11 -----------
>  include/linux/mfd/tps65090.h     | 14 ++++++++++++++
>  3 files changed, 28 insertions(+), 24 deletions(-)

Applied now, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
