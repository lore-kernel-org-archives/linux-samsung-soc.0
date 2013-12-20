From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL 4/7] Samsung dev for v3.14
Date: Sat, 21 Dec 2013 07:53:57 +0900
Message-ID: <52B4CA85.2080106@samsung.com>
References: <52AE0F62.80409@samsung.com> <201312181120.44544.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:57573 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750954Ab3LTWyE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Dec 2013 17:54:04 -0500
Received: by mail-pd0-f173.google.com with SMTP id p10so3071185pdj.18
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2013 14:54:03 -0800 (PST)
In-Reply-To: <201312181120.44544.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 12/18/13 19:20, Heiko St=FCbner wrote:
> Hi Kukjin,
>
> Am Sonntag, 15. Dezember 2013, 21:21:54 schrieb Kukjin Kim:
>> The following changes since commit
>> 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:
>>
>>     Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)
>>
>> are available in the git repository at:
>>
>>     git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsun=
g.git
>> tags/samsung-dev
>>
>> for you to fetch changes up to 70bacadbd07248576290de40cc217c06f0f2d=
3c3:
>>
>>     ARM: S3C64XX: Select CPU_V6K instead of CPU_V6 (2013-12-16 04:08=
:51
>> +0900)
>>
>> ----------------------------------------------------------------
>> Samsung updates for v3.14
>> - Skip eint_init() for pinctrl-exynos because of re-executing
>> - Use CPU_V6K for S3C64XX(ARM1176JZF-s) instead of CPU_V6
>>
>> ----------------------------------------------------------------
>> Mateusz Krawczuk (1):
>>         ARM: SAMSUNG: if detected device tree skip irq init for S5P
>>
>> Tomasz Figa (1):
>>         ARM: S3C64XX: Select CPU_V6K instead of CPU_V6
>>
>>    arch/arm/Kconfig                     | 2 +-
>>    arch/arm/plat-samsung/s5p-irq-eint.c | 4 ++++
>>    2 files changed, 5 insertions(+), 1 deletion(-)
>
> do you also have time for a look at at least the s3c2416/s3c2443 comm=
on clock
> patches for your second round you wrote about yesterday? :-)
>
>
Hi Heiko,

I couldn't yet but I will do...

Thanks for your gentle reminder :-)

- Kukjin
