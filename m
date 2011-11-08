From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] ARM: S3C6410: Use device names for both I2C clocks
Date: Tue, 8 Nov 2011 21:57:56 +0530
Message-ID: <CAJuYYwTM4M-dt6mMgOH2TLEbBx7CgmiNVaB2VqYN-YMLYHqaZg@mail.gmail.com>
References: <1320768593-21010-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:35445 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750710Ab1KHQ15 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Nov 2011 11:27:57 -0500
Received: by faan17 with SMTP id n17so682861faa.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Nov 2011 08:27:56 -0800 (PST)
In-Reply-To: <1320768593-21010-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, patches@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 8 November 2011 21:39, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> When the S3C64xx CPUs were converted to clkdev mappings were added fo=
r the
> I2C controllers on them. On S3C6410 a device name is specified for I2=
C
> controller 1 but not for controller 0 which makes the code less robus=
t as
> we'll falsely return the clock for controller 0 if there's an error i=
n the
> request for controller 1.
>
> Improve things by registering a device name for controller 0 as well.=
 Due
> to the fact that we change the numbering for controller 0 depending o=
n if
> we've registered controller 1 this requires an ifdef to choose the na=
me.
>
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
> =A0arch/arm/mach-s3c64xx/clock.c | =A0 =A05 +++++
> =A01 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-s3c64xx/clock.c b/arch/arm/mach-s3c64xx/cl=
ock.c
> index 39c238d..52b264e 100644
> --- a/arch/arm/mach-s3c64xx/clock.c
> +++ b/arch/arm/mach-s3c64xx/clock.c
> @@ -138,6 +138,11 @@ static struct clk init_clocks_off[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ctrlbit =A0 =A0 =A0 =A0=3D S3C_CLKCON=
_PCLK_TSADC,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "i2c",
> +#ifdef CONFIG_S3C_DEV_I2C1
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D "s3c2440-i2=
c.0",
> +#else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D "s3c2440-i2=
c",
> +#endif
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.parent =A0 =A0 =A0 =A0 =3D &clk_p,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0 =3D s3c64xx_pc=
lk_ctrl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ctrlbit =A0 =A0 =A0 =A0=3D S3C_CLKCON=
_PCLK_IIC,


The #ifdef around the id of the s3c_device_i2c0 structure in
arch/arm/plat-samsung/devs.c file can be removed and id can be fixed
as 0. And devname "s3c2440-i2c.0" can be assigned above without the
#ifdef. Will there be any issues in using .id as 0 even if there is
only one instance of i2c?

Thanks,
Thomas.
