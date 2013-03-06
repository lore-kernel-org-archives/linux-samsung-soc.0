From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ASoC: samsung: let device core setup the default pin configuration
Date: Wed, 6 Mar 2013 12:42:09 +0100
Message-ID: <201303061242.09978.heiko@sntech.de>
References: <1362570951-14403-1-git-send-email-thomas.abraham@linaro.org> <20130306113741.GA19556@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:58291 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756214Ab3CFLmS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 06:42:18 -0500
In-Reply-To: <20130306113741.GA19556@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, alsa-devel@alsa-project.org, lrg@ti.com, jassisinghbrar@gmail.com, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, patches@linaro.org

Am Mittwoch, 6. M=E4rz 2013, 12:37:43 schrieb Mark Brown:
> On Wed, Mar 06, 2013 at 05:25:51PM +0530, Thomas Abraham wrote:
> > With device core now able to setup the default pin configuration,
> > the pin configuration code based on the deprecated Samsung specific
> > gpio bindings in i2s driver is removed.
>=20
> There's rather a lot of non-DT Samsung platforms...

I think the real non-dt platforms won't be affected.

+       if (i2s_pdata->cfg_gpio && i2s_pdata->cfg_gpio(pdev)) {
+               dev_err(&pdev->dev, "Unable to configure gpio\n");
+               ret =3D -EINVAL;
+               goto err;

is still there for them.

What is going away is the deprecated non-pinctrl way to setup the pins =
on dt=20
platforms.
