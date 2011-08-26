From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH 2/5] ARM: SAMSUNG: Make the sleep code common for S3C64XX
 and newer SoCs
Date: Fri, 26 Aug 2011 07:40:31 +0530
Message-ID: <CAM4voak5ArO4YW-bfLDoUFtMndV58thnr2Z4oCbPhD3fRPS1Cw@mail.gmail.com>
References: <1313144787-30666-1-git-send-email-a.kesavan@samsung.com>
	<1313144787-30666-3-git-send-email-a.kesavan@samsung.com>
	<073501cc6391$31569f70$9403de50$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:40451 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754452Ab1HZCKc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Aug 2011 22:10:32 -0400
Received: by ywf7 with SMTP id 7so2321929ywf.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Aug 2011 19:10:31 -0700 (PDT)
In-Reply-To: <073501cc6391$31569f70$9403de50$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Mr Kim,

Thanks for your comments. Please find my reply below:

Regards,
Abhilash

On Fri, Aug 26, 2011 at 7:10 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Abhilash Kesavan wrote:
>>
>> The sleep code for S5PV210 and EXYNOS4 is identical; moreover it is =
quite
>> similar
>> to that for S3C64XX except for some SoC specific debug logic. S5P64X=
0 and
>> S5PC100,
>> for which support will be added soon, can also use the same procedur=
e.
> Create a
>> common sleep code in the plat-samsung directory so that it can be re=
-used.
>>
>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>> ---
>> =A0arch/arm/mach-exynos4/Kconfig =A0| =A0 =A01 +
>> =A0arch/arm/mach-exynos4/Makefile | =A0 =A02 +-
>> =A0arch/arm/mach-exynos4/sleep.S =A0| =A0 54 -----------------------=
----
>> =A0arch/arm/mach-s3c64xx/Kconfig =A0| =A0 =A01 +
>> =A0arch/arm/mach-s3c64xx/Makefile | =A0 =A01 -
>> =A0arch/arm/mach-s3c64xx/sleep.S =A0| =A0 72
> ------------------------------------
>> =A0arch/arm/mach-s5pv210/Kconfig =A0| =A0 =A01 +
>> =A0arch/arm/mach-s5pv210/Makefile | =A0 =A02 +-
>> =A0arch/arm/mach-s5pv210/sleep.S =A0| =A0 52 -----------------------=
---
>> =A0arch/arm/plat-samsung/Kconfig =A0| =A0 =A07 +++
>> =A0arch/arm/plat-samsung/Makefile | =A0 =A01 +
>> =A0arch/arm/plat-samsung/sleep.S =A0| =A0 80
>> ++++++++++++++++++++++++++++++++++++++++
>> =A012 files changed, 93 insertions(+), 181 deletions(-)
>> =A0delete mode 100644 arch/arm/mach-exynos4/sleep.S
>> =A0delete mode 100644 arch/arm/mach-s3c64xx/sleep.S
>> =A0delete mode 100644 arch/arm/mach-s5pv210/sleep.S
>> =A0create mode 100644 arch/arm/plat-samsung/sleep.S
>>
>
> (snip)
>
>> +ENTRY(s3c_cpu_resume)
>> +#if defined(CONFIG_S3C_PM_DEBUG_LED_SMDK)
>> +
>
> Hi Abhilash,
>
> Yes, would be nice if each sleep.S can be handled in plat-samsung for
> Samsung SoCs.
>
> Hmm...but the CONFIG_S3C_PM_DEBUG_LED_SMDK can be used on other SoCs =
for
> same reason even though it is available only on S3C64XX now. I think,=
 we
> need to add SoC detecting here.
Quite right, it is possible to use this for other SoCs. But as of now,
my patch just intends
to move all the sleep code to a common place. The S3C64XX sleep code
has this feature
and I didn't want to disturb it in anyway, hence it has been added to
the common file.
Perhaps, generalizing it for other SoCs can be done later on top of thi=
s
>
>> +#undef S3C64XX_VA_GPIO
>> +#define S3C64XX_VA_GPIO (0x0)
>
> Please let me know why this is needed here.
The code is trying to access the registers at a stage where the MMU is
not enabled.
Hence, the VA_GPIO is being re-defined as 0 reducing S3C64XX_GPIOREG(re=
g)  to
reg.
It has been moved as is from the existing s3c64xx sleep code.
>
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
