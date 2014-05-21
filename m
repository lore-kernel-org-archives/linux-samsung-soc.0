From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 2/3] ARM: EXYNOS: Enable multi-platform build support
Date: Wed, 21 May 2014 16:44:04 +0530
Message-ID: <CAK9yfHxj-z1bWQqiaWVwvL2yRotqZn86ecjKcoHcyMQHZCrVcA@mail.gmail.com>
References: <1400655169-21683-1-git-send-email-sachin.kamat@linaro.org>
	<1400655169-21683-3-git-send-email-sachin.kamat@linaro.org>
	<1635304.bK37Q0Q4AO@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:42996 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751481AbaEULOG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 07:14:06 -0400
Received: by mail-ob0-f170.google.com with SMTP id uy5so1966774obc.29
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 04:14:04 -0700 (PDT)
In-Reply-To: <1635304.bK37Q0Q4AO@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>

Hi Bartlomiej,

On 21 May 2014 16:06, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
>
> Hi,
>
> On Wednesday, May 21, 2014 12:22:48 PM Sachin Kamat wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> This makes it possible to enable the exynos platform as part of a
>> multiplatform kernel, in addition to keeping the single-platform
>> Exynos support.
>
> The patch description is wrong.  After this patch single-platform Exynos
> support is no longer available

Forgot to update the message while rebasing. Thanks for noticing.

> and it adds at least one serious regression

I have mentioned about this in the cover letter.

> (cpufreq) which should be fixed before merging this patch.  Moreover it
> seems that this patch (#2) should be merged with patch #3 to preserve
> bisectability.

At this point exynos_defconfig works.

>Please also note that exynos_defconfig is no longer useful
> after these changes and can be be removed.

Yes.

---
With warm regards,
Sachin
