From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 08/15] pwm: Add new pwm-samsung driver
Date: Mon, 17 Jun 2013 05:45:49 +0900
Message-ID: <51BE23FD.8030403@samsung.com>
References: <1370467100-10820-1-git-send-email-tomasz.figa@gmail.com> <1370467100-10820-9-git-send-email-tomasz.figa@gmail.com> <1395589.x1LsEiFKi9@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:63931 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754207Ab3FPUpy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Jun 2013 16:45:54 -0400
In-Reply-To: <1395589.x1LsEiFKi9@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-pwm@vger.kernel.org, thierry.reding@gmail.com, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Mark Brown <broonie@kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>

On 06/17/13 02:19, Tomasz Figa wrote:
> Hi Kukjin,
>
> On Wednesday 05 of June 2013 23:18:13 Tomasz Figa wrote:
>> This patch introduces new Samsung PWM driver, which uses Samsung
>> PWM/timer master driver to control shared parts of the hardware.
>>
>> Signed-off-by: Tomasz Figa<tomasz.figa@gmail.com>
>> ---
>>   drivers/pwm/Makefile      |   1 +
>>   drivers/pwm/pwm-samsung.c | 528
>> ++++++++++++++++++++++++++++++++++++++++++++++ 2 files changed, 529
>> insertions(+)
>>   create mode 100644 drivers/pwm/pwm-samsung.c
>
> I you haven't yet merged this patch, please let me send v2 of this series,
> addressing Heiko's comments and adjustments to my understanding of the PWM
> hardware after getting access to SMDK6410 board, which uses PWM to control
> LCD backlight.
>
Sure, let me hold on until getting your updated series.

Thanks,
- Kukjin
