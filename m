From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2 0/3] pinctrl: exynos: add support for Samsung's Exynos5250
Date: Thu, 7 Mar 2013 08:52:46 +0530
Message-ID: <CAJuYYwS9+ZV43QaweUmqh_qFffT1fytM7G9WVbVWdi=hFjvpaw@mail.gmail.com>
References: <1362568712-13586-1-git-send-email-thomas.abraham@linaro.org>
	<014101ce1ac8$5a4e8600$0eeb9200$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:43337 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753273Ab3CGDWr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 22:22:47 -0500
Received: by mail-ie0-f175.google.com with SMTP id c12so11213ieb.34
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Mar 2013 19:22:47 -0800 (PST)
In-Reply-To: <014101ce1ac8$5a4e8600$0eeb9200$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linus.walleij@linaro.org, t.figa@samsung.com, patches@linaro.org

On 7 March 2013 05:41, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Thomas Abraham wrote:
>>
>> Changes since v1:
>> - Change the compatible string from "samsung,pinctrl-exynos5250" to
>>   "samsung,exynos5250-pinctrl".
>> - Rebased to v3.9-rc1
>>
>
> Thomas, this stuff is already in my tree for v3.10, and above changes
> included in there. Do you want to replace with this patches?

Dear Mr. Kim,

The v2 version includes one fix for the compatilble string. It changes
the compatible string from "samsung,pinctrl-exynos5250" to
"samsung,exynos5250-pinctrl". So could you pick this v2 series instead
of the series which you have already merged.

Thanks,
Thomas.

>
> - Kukjin
>
>> This patch series add pinctrl driver support for Samsung's Exynos5250 SoC.
>> The first patch adds the required Exynos5250 SoC specific data which is
>> used by the Samsung pinctrl driver to setup the pinctrl/pinmux/eint
>> controllers. The second and third patches skips the wakeup interrupt and
>> gpiolib registration if the pinctrl support is enabled for Exynos5250.
>>
>> Thomas Abraham (3):
>>   pinctrl: exynos: add exynos5250 SoC specific data
>>   gpio: samsung: skip gpiolib registration if pinctrl support is enabled
>> for exynos5250
>>   arm: exynos: skip wakeup interrupt registration for exynos5250 if
>> pinctrl is enabled
>>
>>  arch/arm/mach-exynos/common.c     |    1 +
>>  drivers/gpio/gpio-samsung.c       |    1 +
>>  drivers/pinctrl/pinctrl-exynos.c  |  108
>> +++++++++++++++++++++++++++++++++++++
>>  drivers/pinctrl/pinctrl-samsung.c |    2 +
>>  drivers/pinctrl/pinctrl-samsung.h |    1 +
>>  5 files changed, 113 insertions(+), 0 deletions(-)
>
