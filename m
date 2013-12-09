From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 1/7] ARM: EXYNOS: initial board support for exynos5260 SoC
Date: Mon, 9 Dec 2013 12:03:52 +0530
Message-ID: <CAPdUM4OWQqDSbhfNiYW12FaWNS3jz=3ScY+XvKoL9zGs1eO_fQ@mail.gmail.com>
References: <1386345391-23482-1-git-send-email-rahul.sharma@samsung.com>
	<1386345391-23482-2-git-send-email-rahul.sharma@samsung.com>
	<CAK9yfHzX1+Rp3DCZiJSjE7VO6+TaDW7iqUZVpgRNkjVJofWauA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:40849 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760649Ab3LIGdx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 01:33:53 -0500
In-Reply-To: <CAK9yfHzX1+Rp3DCZiJSjE7VO6+TaDW7iqUZVpgRNkjVJofWauA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, PANKAJ KUMAR DUBEY <pankaj.dubey@samsung.com>, Young-Gun Jang <yg1004.jang@samsung.com>, Arun Kumar <arun.kk@samsung.com>

Thanks Sachin,

On 9 December 2013 11:53, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Hi Rahul,
>
> On 6 December 2013 21:26, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>> From: Pankaj Dubey <pankaj.dubey@samsung.com>
>>
>> This patch add basic arch side support for exynos5260 SoC.
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>
> Since you are posting the patch, your signed off is also required.
>
> [snip]
>
>>  void exynos4_restart(enum reboot_mode mode, const char *cmd)
>>  {
>>         __raw_writel(0x1, S5P_SWRESET);
>> @@ -371,7 +387,8 @@ static void __init exynos4_map_io(void)
>>  static void __init exynos5_map_io(void)
>>  {
>>         iotable_init(exynos5_iodesc, ARRAY_SIZE(exynos5_iodesc));
>> -
>> +       if (soc_is_exynos5260())
>> +               iotable_init(exynos5260_iodesc, ARRAY_SIZE(exynos5260_iodesc));
>
> Add this after 5250 to maintain numerical order.
>
>>         if (soc_is_exynos5250())
>>                 iotable_init(exynos5250_iodesc, ARRAY_SIZE(exynos5250_iodesc));
>>  }
>
> [snip]
>>
>>  #define S5P_VA_SYSRAM          S3C_ADDR(0x02400000)
>>  #define S5P_VA_SYSRAM_NS       S3C_ADDR(0x02410000)
>> +
> Unnecessary blank line addition.
>

I will correct all these in next version.

Regards,
Rahul Sharma

>
> --
> With warm regards,
> Sachin
