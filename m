From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: sec: Add register cache for interrupt mask registers
Date: Thu, 11 Jul 2013 12:19:20 +0100
Message-ID: <20130711111920.GI25601@gmail.com>
References: <1372787476-10145-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:56017 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932309Ab3GKLT1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jul 2013 07:19:27 -0400
Received: by mail-we0-f176.google.com with SMTP id t56so6704946wes.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jul 2013 04:19:25 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1372787476-10145-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

On Tue, 02 Jul 2013, Mark Brown wrote:

> From: Mark Brown <broonie@linaro.org>
>=20
> The performance of regmap-irq is improved if the interrupt mask regis=
ters
> can be cached since it does read/modify/update cycles so start using =
the
> register cache infrastructure for those registers. We should use this=
 more
> widely but I don't have a datasheet and this is a nice, conservative
> starting point.
>=20
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>  drivers/mfd/sec-core.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

Applied, thanks.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
