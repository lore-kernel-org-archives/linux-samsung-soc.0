From: Thomas Abraham <thomas.ab@samsung.com>
Subject: Re: [RFC][PATCH 0/7] ARM: Add clkdev support for Samsung's platforms
Date: Thu, 26 May 2011 08:41:59 +0530
Message-ID: <BANLkTimdPYj-1_EoOfHST3xEJPwj0oRSTw@mail.gmail.com>
References: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com>
	<4DDD7A32.80309@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:35597 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755567Ab1EZDL7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2011 23:11:59 -0400
Received: by ywe9 with SMTP id 9so152709ywe.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 May 2011 20:11:59 -0700 (PDT)
In-Reply-To: <4DDD7A32.80309@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Hi Mr. Kukjin Kim,

On Thu, May 26, 2011 at 3:22 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> On 05/19/11 14:18, Thomas Abraham wrote:
>>
>> Thomas Abraham (7):
>> =A0 ARM: SAMSUNG: Add clkdev infrastructure
>> =A0 ARM: S3C24XX: Add clkdev support
>> =A0 ARM: S3C64XX: Add clkdev support
>> =A0 ARM: S5P64X0: Add clkdev support
>> =A0 ARM: S5PC100: Add clkdev support
>> =A0 ARM: S5PV210: Add clkdev support
>> =A0 ARM: Exynos4: Add clkdev support
>>
>> =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A06 ++
>> =A0arch/arm/mach-exynos4/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 6=
3 +++++++++++++++++++-
>> =A0arch/arm/mach-exynos4/include/mach/clkdev.h | =A0 =A07 ++
>> =A0arch/arm/mach-exynos4/time.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +
>> =A0arch/arm/mach-s3c2412/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
3 +
>> =A0arch/arm/mach-s3c2416/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
5 ++
>> =A0arch/arm/mach-s3c2443/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
4 +
>> =A0arch/arm/mach-s3c64xx/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 2=
5 ++++++++
>> =A0arch/arm/mach-s3c64xx/include/mach/clkdev.h | =A0 =A07 ++
>> =A0arch/arm/mach-s5p64x0/clock-s5p6440.c =A0 =A0 =A0 | =A0 20 ++++++=
+
>> =A0arch/arm/mach-s5p64x0/clock-s5p6450.c =A0 =A0 =A0 | =A0 19 ++++++
>> =A0arch/arm/mach-s5p64x0/include/mach/clkdev.h | =A0 =A07 ++
>> =A0arch/arm/mach-s5pc100/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 4=
2 +++++++++++++-
>> =A0arch/arm/mach-s5pc100/include/mach/clkdev.h | =A0 =A07 ++
>> =A0arch/arm/mach-s5pv210/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 4=
2 +++++++++++++-
>> =A0arch/arm/mach-s5pv210/include/mach/clkdev.h | =A0 =A07 ++
>> =A0arch/arm/plat-s3c24xx/include/mach/clkdev.h | =A0 =A07 ++
>> =A0arch/arm/plat-s3c24xx/s3c2410-clock.c =A0 =A0 =A0 | =A0 =A03 +
>> =A0arch/arm/plat-s3c24xx/s3c2443-clock.c =A0 =A0 =A0 | =A0 =A04 +
>> =A0arch/arm/plat-s5p/s5p-time.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A09 +++
>> =A0arch/arm/plat-samsung/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 8=
3
>> ++-------------------------
>> =A0arch/arm/plat-samsung/include/plat/clock.h =A0| =A0 =A03 +
>> =A0arch/arm/plat-samsung/pwm-clock.c =A0 =A0 =A0 =A0 =A0 | =A0 10 ++=
+
>> =A0arch/arm/plat-samsung/time.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +
>> =A024 files changed, 303 insertions(+), 84 deletions(-)
>> =A0create mode 100644 arch/arm/mach-exynos4/include/mach/clkdev.h
>> =A0create mode 100644 arch/arm/mach-s3c64xx/include/mach/clkdev.h
>> =A0create mode 100644 arch/arm/mach-s5p64x0/include/mach/clkdev.h
>> =A0create mode 100644 arch/arm/mach-s5pc100/include/mach/clkdev.h
>> =A0create mode 100644 arch/arm/mach-s5pv210/include/mach/clkdev.h
>> =A0create mode 100644 arch/arm/plat-s3c24xx/include/mach/clkdev.h
>>
> Hi Thomas,
>
> Thanks for this patches :)
>
> There are some comments in each patches and I need to check again abo=
ut the
> devname like following.
>
> s5p-fimc vs. s5pv210-fimc
> sdhci-s3c vs. s3c-sdhci
> and so on...
>
> Since I'm out of office now, don't have all regarding materials. I wi=
ll back
> this soon.

Thanks for reviewing the patches. I will rework the patches as per
your comments and submit again.

Thanks,
Thomas.

>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
