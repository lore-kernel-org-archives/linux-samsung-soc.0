From: Rahul Sharma <r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/7] ARM: EXYNOS: initial board support for exynos5260 SoC
Date: Mon, 23 Dec 2013 10:09:17 +0530
Message-ID: <CAPdUM4PfrVyz+TpEPt-0xnhrjNwp_qbk_PkBtZGu15pfNSMqkA@mail.gmail.com>
References: <1386345391-23482-1-git-send-email-rahul.sharma@samsung.com>
	<1386345391-23482-2-git-send-email-rahul.sharma@samsung.com>
	<CAK9yfHzX1+Rp3DCZiJSjE7VO6+TaDW7iqUZVpgRNkjVJofWauA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK9yfHzX1+Rp3DCZiJSjE7VO6+TaDW7iqUZVpgRNkjVJofWauA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, sunil joshi <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, PANKAJ KUMAR DUBEY <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Young-Gun Jang <yg1004.jang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arun Kumar <arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Thanks Sachin,

On 9 December 2013 11:53, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Hi Rahul,
>
> On 6 December 2013 21:26, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> From: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>
>> This patch add basic arch side support for exynos5260 SoC.
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Arun Kumar K <arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> Since you are posting the patch, your signed off is also required.

Right. I will add my Sign off.

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

ok.
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

I will remove this.

Regards,
Rahul Sharma.

>
>
> --
> With warm regards,
> Sachin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
