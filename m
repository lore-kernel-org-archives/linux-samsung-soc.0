From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND PATCH v3 3/5] mfd: tps65090: Stop caching most registers
Date: Wed, 23 Apr 2014 11:55:40 +0100
Message-ID: <20140423105540.GJ21613@lee--X1>
References: <1398180298-2018-4-git-send-email-dianders@chromium.org>
 <20140422190754.GF12304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:36316 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751302AbaDWKzq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Apr 2014 06:55:46 -0400
Received: by mail-wg0-f43.google.com with SMTP id x13so687360wgg.14
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2014 03:55:44 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20140422190754.GF12304@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, Anton Vorontsov <anton@enomsg.org>, olof@lixom.net, Sachin Kamat <sachin.kamat@linaro.org>, ajaykumar.rs@samsung.com, linux-samsung-soc@vger.kernel.org, sameo@linux.intel.com, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, dwmw2@infradead.org, linux-kernel@vger.kernel.org

> > Nearly all of the registers in tps65090 combine control bits and
> > status bits.  Turn off caching of all registers except the select f=
ew
> > that can be cached.
>=20
> Lee, I don't mind if I apply this and send a pull request to you or I
> pull a tag from you with this in - what's easiest for you?

I'm happy to do it.

Doug,
  Can you send the patch-set again with all of the *-bys and ensure
  I'm on TO or CC please?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
