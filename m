From: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] i2c: s3c2410: dont need CPU_FREQ transitions for
 exynos series
Date: Tue, 26 Nov 2013 09:37:25 +0530
Message-ID: <CAHfPSqAT1XgA+3n_SG6R7OYPS1pruMkxE30KjCbbvR6YhDOQew@mail.gmail.com>
References: <1381490814-20890-1-git-send-email-ch.naveen@samsung.com>
 <1384841915-8264-1-git-send-email-ch.naveen@samsung.com> <CAD=FV=Wu13jiFggjp9FZrnB0ejODR7ix_jSby+waZwpcACLwXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=Wu13jiFggjp9FZrnB0ejODR7ix_jSby+waZwpcACLwXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "cpgs ." <cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Doug,

On 26 November 2013 05:11, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> Naveen,
>
> On Mon, Nov 18, 2013 at 10:18 PM, Naveen Krishna Chatradhi
> <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> For Exynos4 and Exynos5 SoCs from Samsung the i2c clock is based
>> on a fixed 66 MHz peripheral clock, and therefore is completely
>> independent of the cpu frequency.
>> Thus, registering for a CPU freq notifier is very wasteful.
>>
>> This patch modifes the code such that, i2c bus registers to
>> cpu_freq_transition only if CONFIG_CPU_FREQ_S3C24XX is enabled.
>>
>> This change should save a bunch of cpufreq transitions calls
>> which does not apply to exynos SoCs.
>>
>> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>> Changes since v2:
>> None, Rebased on for-next of linux-i2c git repo.
>>
>> Changes since v1:
>> Use CONFIG_CPU_FREQ_S3C24XX instead of (CONFIG_CPU_FREQ & !CONFIG_EXYNOS)
>> As commented by Tomasz
>>
>>  drivers/i2c/busses/i2c-s3c2410.c |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Can you please spin this with comments from
> <https://patchwork.kernel.org/patch/3235091/>?  Thanks!
Thanks for pointing out for me

To summarize, Post f023f8dd59 commit we should be using
ARM_S3C24XX_CPUFREQ instead of ARM_S3C24XX_CPUFREQ right.

Will re-spin with this changes.
>
> -Doug
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Thanks & Regards,
(: Nav :)
