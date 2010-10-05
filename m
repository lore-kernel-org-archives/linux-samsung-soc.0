From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 1/2] ARM: S3C64XX: Add suspend support
Date: Wed, 6 Oct 2010 08:23:30 +0900
Message-ID: <AANLkTi=CH6BJZDYsCHXmcYAVuu-LTsqjKXUVGnBAikiN@mail.gmail.com>
References: <cover.1286319272.git.mcuelenaere@gmail.com>
	<1fa4a7a39d9fd48b8329e1a1077a65adb96475b5.1286319272.git.mcuelenaere@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:46525 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757208Ab0JEXXb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Oct 2010 19:23:31 -0400
Received: by wyb28 with SMTP id 28so6619186wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Oct 2010 16:23:30 -0700 (PDT)
In-Reply-To: <1fa4a7a39d9fd48b8329e1a1077a65adb96475b5.1286319272.git.mcuelenaere@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maurus Cuelenaere <mcuelenaere@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hi,

I agree your approach, put the common features in common place.
but Samsung maintainers insist put these at each machine file at curren=
t time.

So move this to the each machines for their tastes.

Thank you,
Kyungmin Park

On Wed, Oct 6, 2010 at 8:09 AM, Maurus Cuelenaere <mcuelenaere@gmail.co=
m> wrote:
> The only missing thing for SoC-wide suspend support, is a call to s3c=
_pm_init,
> so add that. This was tested on a S3C6410 SmartQ 7.
>
> Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
> ---
> =A0arch/arm/mach-s3c64xx/pm.c | =A0 =A03 +++
> =A01 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-s3c64xx/pm.c b/arch/arm/mach-s3c64xx/pm.c
> index 79412f7..db292c9 100644
> --- a/arch/arm/mach-s3c64xx/pm.c
> +++ b/arch/arm/mach-s3c64xx/pm.c
> @@ -187,6 +187,9 @@ static int s3c64xx_pm_init(void)
> =A0 =A0 =A0 =A0pm_cpu_prep =3D s3c64xx_pm_prepare;
> =A0 =A0 =A0 =A0pm_cpu_sleep =3D s3c64xx_cpu_suspend;
> =A0 =A0 =A0 =A0pm_uart_udivslot =3D 1;
> +
> + =A0 =A0 =A0 s3c_pm_init();
> +
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> --
> 1.7.2.3
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
