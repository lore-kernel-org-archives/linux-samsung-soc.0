From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 06/10] mfd: Add driver for Maxim 77802 Power
 Management IC
Date: Wed, 18 Jun 2014 09:32:04 +0100
Message-ID: <20140618083204.GP21030@lee--X1>
References: <1402941758-11216-1-git-send-email-javier.martinez@collabora.co.uk>
 <1402941758-11216-7-git-send-email-javier.martinez@collabora.co.uk>
 <20140616192720.GK5099@sirena.org.uk>
 <53A01F09.5070106@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53A01F09.5070106@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Daniel Stone <daniels@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

> >> +config MFD_MAX77802
> >> +	tristate "Maxim Integrated MAX77802 PMIC Support"
> >> +	depends on I2C=3Dy
> >> +	select MFD_CORE
> >> +	select REGMAP_I2C
> >> +	select REGMAP_IRQ
> >> +	select IRQ_DOMAIN
> >> +	help
> >> +	  Say yes here to support for Maxim Integrated MAX77802.
> >> +	  This is a Power Management IC with RTC on chip.
> >> +	  This driver provides common support for accessing the device;
> >> +	  additional drivers must be enabled in order to use the functio=
nality
> >> +	  of the device.
> >> +
> >=20
> > It is a bit unorthodox to put the build infrastructure in the same =
patch
> > as the DT binding...
> >=20
>=20
> I thought it was the opposite. That a DT binding document has to be a=
dded along
> with the first user of the binding but I'll separate the DT doc in an=
other patch
> then if that is the right thing to do.

This was the 'old' method, but changed a little over a year ago.

> Thanks a lot for all your suggestions, I'll wait a little to see if t=
here is
> more feedback and repost a v3 addressing all the issues you pointed o=
ut.

Just re-post it.  I'll review the next version.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
