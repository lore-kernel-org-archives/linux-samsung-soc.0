From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [GIT PULL 04/10] clk-exynos for v3.10
Date: Wed, 10 Apr 2013 09:18:42 +0530
Message-ID: <CAK9yfHzMOmrRMKdc2fUJHnbrOC_-=AR3BnHBDjtvPeinvxOcLg@mail.gmail.com>
References: <51630A02.4080905@samsung.com>
	<201304092231.18314.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:41323 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750713Ab3DJDsp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 23:48:45 -0400
Received: by mail-oa0-f41.google.com with SMTP id f4so32609oah.14
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Apr 2013 20:48:45 -0700 (PDT)
In-Reply-To: <201304092231.18314.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 10 April 2013 02:01, Arnd Bergmann <arnd@arndb.de> wrote:
> On Monday 08 April 2013, Kukjin Kim wrote:
>> The following changes since commit 07961ac7c0ee8b546658717034fe692fd12eefa9:
>>
>>    Linux 3.9-rc5 (2013-03-31 15:12:43 -0700)
>>
>> are available in the git repository at:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>> tags/clk-exynos-for-v3.10
>>
>> for you to fetch changes up to da821eb7d42935b0f7056d98c75fd1150f6636f4:
>>
>>    Merge commit 'v3.9-rc5' into next/clk-exynos (2013-04-09 01:10:13 +0900)
>>
>> ----------------------------------------------------------------
>>
>> add suppport common clock framework for exynos
>
> I got a build warning, probably because of this patch:


IIRC, the patch at [1] was supposed to fix the build warning. Kukjin
had mentioned it was applied [1].

[1] https://patchwork.kernel.org/patch/2010691/


-- 
With warm regards,
Sachin
