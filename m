From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2] cpufreq: Add S3C2416/S3C2450 cpufreq driver
Date: Thu, 16 Feb 2012 21:08:57 +0900
Message-ID: <4F3CF1D9.5030109@samsung.com>
References: <201202161142.32485.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201202161142.32485.heiko@sntech.de>
Sender: cpufreq-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Dave Jones <davej@redhat.com>, Kukjin Kim <kgene.kim@samsung.com>, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Andrey Gusakov <dron0gus@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 02/16/12 19:42, Heiko St=FCbner wrote:
> The S3C2416/S3C2450 SoCs support two sources for the armclk.
>
> The first source is the so called armdiv which divides the msysclk do=
wn
> to provide necessary cpu rates. In this mode the core voltage must be
> always at 1.3V. The frequency from the armdiv is not allowed to be
> lower than the hclk frequency.
>
> In the second mode the armclk can be sourced directly from the hclk i=
n
> the so called "dynamic voltags scaling" (dvs) mode. Here the armdiv
> isn't used at all. Also in this mode the core voltage may be lowered.
> Existing hardware and tests with it suggest 1.0V as sufficient.
>
> When changing the clock source to the armdiv from the hclk, the SoC
> shows stability issues if the new frequency is higher than the curren=
t
> hclk frequency. Hence the driver always forces the armdiv to the hclk
> frequency before the source change and lets the cpufreq issue another
> set_target call for higher frequencies.
>
> To mark the hclk frequency as lower as the corresponding armdiv
> frequency it is set 1MHz below the real frequency. This lets the cpuf=
req
> framework change between 133MHz based on hclk and 133MHz based on arm=
div
> at will.
>
> Signed-off-by: Heiko Stuebner<heiko@sntech.de>
> Tested-by: Andrey Gusakov<dron0gus@gmail.com>
> ---
> changes since v1: correct the frequencies of the S3C2450 variant
> changes since RFC: reboot-notifier to leave dvs mode on reboot
> and a lot of cleanups
>
>   drivers/cpufreq/Kconfig.arm       |   22 ++
>   drivers/cpufreq/Makefile          |    1 +
>   drivers/cpufreq/s3c2416-cpufreq.c |  542 ++++++++++++++++++++++++++=
+++++++++++
>   3 files changed, 565 insertions(+), 0 deletions(-)
>   create mode 100644 drivers/cpufreq/s3c2416-cpufreq.c
>
Hi Heiko,

As you know, I'm working on move cpufreq drivers of s3c2410, s3c2412 an=
d=20
s3c2440 into drivers/cpufreq/.

Now I'm not sure some common function can be used for them and this as=20
well. But I think, if so, would be better to us.

So please wait for some time to finish my working. Maybe next week?

Then, let me back on this.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
