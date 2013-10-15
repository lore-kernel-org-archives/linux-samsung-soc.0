From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2] i2c: s3c2410: dont need CPU_FREQ transitions for
 exynos series
Date: Tue, 15 Oct 2013 08:38:32 -0700
Message-ID: <CAD=FV=XsZoGUeppkxMq9DnVsp761s6ckStsmUxR4aEL3U7JZ1A@mail.gmail.com>
References: <1381490814-20890-1-git-send-email-ch.naveen@samsung.com>
	<1381818232-12542-1-git-send-email-ch.naveen@samsung.com>
	<CAH9JG2Xo2UgbP+VA=s908FSusELERh8kvSVyiyMX1H1Ue8uPSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAH9JG2Xo2UgbP+VA=s908FSusELERh8kvSVyiyMX1H1Ue8uPSg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kyungmin Park <kmpark-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "cpgs ." <cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Mon, Oct 14, 2013 at 11:56 PM, Kyungmin Park <kmpark-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
> On Tue, Oct 15, 2013 at 3:23 PM, Naveen Krishna Chatradhi
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
> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>> Changes since v1:
>> Use CONFIG_CPU_FREQ_S3C24XX instead of (CONFIG_CPU_FREQ & !CONFIG_EXYNOS)
>> As commented by Tomasz
>>
>>  drivers/i2c/busses/i2c-s3c2410.c |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)

Looks great to me.  Thank you for the suggestions Tomasz, as always.

Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

We need to come up with a solution for the CPU_FREQ stuff in
s3c2410_wdt too.  We could use a similar solution but since the
CPU_FREQ stuff in s3c2410_wdt is more than just an optimization it
means that it's not good if S3C24XX is included in a multiplatform
kernel.  (For the watchdog it's more than just an optimization since
every frequency transition actually pets the watchdog, making it
useless when you transition several times per second).

-Doug
