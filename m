From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 0/5] ARM: S3C24XX: convert s3c2412 to common clock
 framework
Date: Sun, 23 Feb 2014 00:49:56 +0100
Message-ID: <530937A4.3010301@gmail.com>
References: <1835515.oOiOlPWUhB@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f50.google.com ([74.125.83.50]:39746 "EHLO
	mail-ee0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752591AbaBVXuJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 22 Feb 2014 18:50:09 -0500
Received: by mail-ee0-f50.google.com with SMTP id d17so2404820eek.9
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Feb 2014 15:50:07 -0800 (PST)
In-Reply-To: <1835515.oOiOlPWUhB@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>
Cc: t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org

Hi,

On 22.02.2014 23:45, Heiko St=FCbner wrote:
> Second incarnation of the series converting s3c2412/s3c2413 to the co=
mmon
> clock framework. As before the conversion is done by a mix of datashe=
et
> data and the pre-existing clock code and as this time I have no hardw=
are
> of this type, it is compile-tested only. So hopefully somebody with s=
3c2412
> hw will be able to test it for real.
>
> The conversion of s3c2412 now moved in front of the s3c2410/s3c2440/s=
3c2442
> one, as I'll need a bit more time for the clockout changes suggested =
by
> Tomasz Figa.
>
> This series builds on top of the previous submitted s3c2443/s3c2416 s=
eries.
>
>
> Changes since v1:
> - move in front of s3c2410 conversion, therefore move 2 necessary pat=
ches
>    that also got ACKs, from there into this series
> - adapt to Samsung clock pm rework from Tomasz Figa
> - apply some changes suggested by Tomasz Figa in the s3c2410 clock dr=
iver
>    that also apply to this driver.
>
> Heiko Stuebner (5):
>    ARM: S3C24XX: only store clock registers when old clock code is ac=
tive
>    clk: samsung: add plls used by the early s3c24xx cpus
>    dt-bindings: add documentation for s3c2412 clock controller
>    clk: samsung: add clock controller driver for s3c2412
>    ARM: S3C24XX: convert s3c2412 to common clock framework
>
>   .../bindings/clock/samsung,s3c2412-clock.txt       |  50 ++
>   arch/arm/mach-s3c24xx/Kconfig                      |   8 +-
>   arch/arm/mach-s3c24xx/Makefile                     |   2 +-
>   arch/arm/mach-s3c24xx/clock-s3c2412.c              | 761 ----------=
-----------
>   arch/arm/mach-s3c24xx/common.c                     |   9 +-
>   arch/arm/mach-s3c24xx/common.h                     |   4 +
>   arch/arm/mach-s3c24xx/mach-jive.c                  |   9 +-
>   arch/arm/mach-s3c24xx/mach-smdk2413.c              |   9 +-
>   arch/arm/mach-s3c24xx/mach-vstms.c                 |   9 +-
>   arch/arm/mach-s3c24xx/pm.c                         |  13 +-
>   arch/arm/mach-s3c24xx/s3c2412.c                    |  43 --
>   drivers/clk/samsung/Makefile                       |   1 +
>   drivers/clk/samsung/clk-pll.c                      | 182 +++++
>   drivers/clk/samsung/clk-pll.h                      |   3 +
>   drivers/clk/samsung/clk-s3c2412.c                  | 268 ++++++++
>   include/dt-bindings/clock/s3c2412.h                |  73 ++
>   16 files changed, 627 insertions(+), 817 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/clock/samsung,=
s3c2412-clock.txt
>   delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2412.c
>   create mode 100644 drivers/clk/samsung/clk-s3c2412.c
>   create mode 100644 include/dt-bindings/clock/s3c2412.h
>

=46or mach and DT patches:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Kukjin, I'll take binding and clock patches to Samsung clock tree as=20
soon as DT bindings get acked by one of DT maintainers. I will prepare =
a=20
branch for you to apply mach patches on top. Is it fine for you?

Best regards,
Tomasz
