From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH 4/5] ARM: S5P64X0: Fix incorrect serial clock name
Date: Wed, 7 Sep 2011 12:01:36 +0530
Message-ID: <CAM4voamoMFp8VeRtWUU2KSJZTupV7xJMHSmTHUPKNd4sxieTrA@mail.gmail.com>
References: <1313144787-30666-1-git-send-email-a.kesavan@samsung.com>
	<1313144787-30666-5-git-send-email-a.kesavan@samsung.com>
	<000401cc6d23$a044d410$e0ce7c30$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:62758 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755548Ab1IGGbg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Sep 2011 02:31:36 -0400
Received: by ywf7 with SMTP id 7so4672173ywf.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Sep 2011 23:31:36 -0700 (PDT)
In-Reply-To: <000401cc6d23$a044d410$e0ce7c30$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Mr Kim,

On Wed, Sep 7, 2011 at 11:31 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Abhilash Kesavan wrote:
>>
>> The S3C6400 serial glue driver(used by S5P64X0) needs the clock name=
 to be
>> pclk or uclk1. Correct the clock name in init.c to pclk and source p=
clk
>> from pclk_low to get the correct rate.
>>
>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>> ---
>> =A0arch/arm/mach-s5p64x0/clock-s5p6440.c | =A0 =A02 +-
>> =A0arch/arm/mach-s5p64x0/clock-s5p6450.c | =A0 =A02 +-
>> =A0arch/arm/mach-s5p64x0/init.c =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
>> =A03 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5p64x0/clock-s5p6440.c b/arch/arm/mach-
>> s5p64x0/clock-s5p6440.c
>> index 0e9cd30..4b594a4 100644
>> --- a/arch/arm/mach-s5p64x0/clock-s5p6440.c
>> +++ b/arch/arm/mach-s5p64x0/clock-s5p6440.c
>> @@ -554,7 +554,7 @@ void __init_or_cpufreq s5p6440_setup_clocks(void=
)
>>
>> =A0 =A0 =A0 clk_f.rate =3D fclk;
>> =A0 =A0 =A0 clk_h.rate =3D hclk;
>> - =A0 =A0 clk_p.rate =3D pclk;
>> + =A0 =A0 clk_p.rate =3D pclk_low;
>
> As you know, HCLK and PCLK are connected to IPs which are included in=
 high
> frequency domain and HCLK_LOW and PCLK_LOW are connected to IPs which=
 are
> included in low frequency domain. I wonder what value is the ARM cloc=
k on
> your SMDK64X0? 533MHz or 667MHz?
Mine is at 533MHz
>
> Originally, the "struct clk clk_p" means PCLK not PCLK_LOW. So I thin=
k, the
> rate of clk_p should be pclk
OK
>
>>
>> =A0 =A0 =A0 for (ptr =3D 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_set_clksrc(&clksrcs[ptr], true);
>> diff --git a/arch/arm/mach-s5p64x0/clock-s5p6450.c b/arch/arm/mach-
>> s5p64x0/clock-s5p6450.c
>> index d9dc16c..eca9a57 100644
>> --- a/arch/arm/mach-s5p64x0/clock-s5p6450.c
>> +++ b/arch/arm/mach-s5p64x0/clock-s5p6450.c
>> @@ -613,7 +613,7 @@ void __init_or_cpufreq s5p6450_setup_clocks(void=
)
>>
>> =A0 =A0 =A0 clk_f.rate =3D fclk;
>> =A0 =A0 =A0 clk_h.rate =3D hclk;
>> - =A0 =A0 clk_p.rate =3D pclk;
>> + =A0 =A0 clk_p.rate =3D pclk_low;
>
> Same as above.
>
>>
>> =A0 =A0 =A0 for (ptr =3D 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_set_clksrc(&clksrcs[ptr], true);
>> diff --git a/arch/arm/mach-s5p64x0/init.c b/arch/arm/mach-s5p64x0/in=
it.c
>> index 79833ca..ee25e28 100644
>> --- a/arch/arm/mach-s5p64x0/init.c
>> +++ b/arch/arm/mach-s5p64x0/init.c
>> @@ -25,7 +25,7 @@
>>
>> =A0static struct s3c24xx_uart_clksrc s5p64x0_serial_clocks[] =3D {
>> =A0 =A0 =A0 [0] =3D {
>> - =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "pclk_low",
>> + =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "pclk",
>
> According to data sheet, should be pclk_low. Or if required for seria=
l
> driver, uclk1 can be used here.
The serial glue driver does a string comparison with either pclk or ucl=
k*;
You'd rather I add a uclk1 instance ?
Thanks for the review.
>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .divisor =A0 =A0 =A0 =A0=3D 1,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .min_baud =A0 =A0 =A0 =3D 0,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .max_baud =A0 =A0 =A0 =3D 0,
>> --
>> 1.7.4.1
>
>
>
> Thanks.
>
> Best regards,
> Kgene.
Abhilash
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
