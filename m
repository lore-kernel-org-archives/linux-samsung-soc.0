From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: S3C6410: Use device names for both I2C clocks
Date: Tue, 8 Nov 2011 16:36:00 +0000
Message-ID: <20111108163600.GF5632@opensource.wolfsonmicro.com>
References: <1320768593-21010-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <CAJuYYwTM4M-dt6mMgOH2TLEbBx7CgmiNVaB2VqYN-YMLYHqaZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:41166 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754242Ab1KHQgD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Nov 2011 11:36:03 -0500
Content-Disposition: inline
In-Reply-To: <CAJuYYwTM4M-dt6mMgOH2TLEbBx7CgmiNVaB2VqYN-YMLYHqaZg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, patches@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Tue, Nov 08, 2011 at 09:57:56PM +0530, Thomas Abraham wrote:
> On 8 November 2011 21:39, Mark Brown

> > +#ifdef CONFIG_S3C_DEV_I2C1
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D "s3c2440-=
i2c.0",
> > +#else
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D "s3c2440-=
i2c",
> > +#endif

> The #ifdef around the id of the s3c_device_i2c0 structure in
> arch/arm/plat-samsung/devs.c file can be removed and id can be fixed
> as 0. And devname "s3c2440-i2c.0" can be assigned above without the
> #ifdef. Will there be any issues in using .id as 0 even if there is
> only one instance of i2c?

That would be much nicer from my point of view but it's much more
invasive as this device is used by a whole raft of other SoCs, not all
of which have more than one I2C controller and I don't really feel like
changing the idiom over the entire Samsung SoC family right now.
