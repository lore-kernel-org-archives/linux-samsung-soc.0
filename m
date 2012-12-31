From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v5 00/12] clk: exynos4: migrate to common clock framework
Date: Sun, 30 Dec 2012 21:35:16 -0800
Message-ID: <CAJuYYwTbdEDkt41FsJUOt3wq7rq9XHDhMari56GG5T8S1dF7=A@mail.gmail.com>
References: <1356827621-27617-1-git-send-email-thomas.abraham@linaro.org>
	<20121230052953.GB20903@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:57654 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751120Ab2LaFfR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 Dec 2012 00:35:17 -0500
Received: by mail-ie0-f170.google.com with SMTP id k10so15092061iea.29
        for <linux-samsung-soc@vger.kernel.org>; Sun, 30 Dec 2012 21:35:16 -0800 (PST)
In-Reply-To: <20121230052953.GB20903@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, mturquette@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com

On 29 December 2012 21:29, Olof Johansson <olof@lixom.net> wrote:
> On Sat, Dec 29, 2012 at 04:33:29PM -0800, Thomas Abraham wrote:
>> Changes since v4:
>> - Rebased to linux-3.8-rc1.
>>
>> Changes since v3:
>> - Includes changes suggested by Tomasz Figa <tomasz.figa@gmail.com>
>>
>> This patch series migrates the Samsung Exynos4 SoC clock code to adopt the
>> common clock framework. The use of Samsung specific clock structures has
>> been removed and all board support code has been updated. imx-style of
>> clock registration and lookup has been adopted for device tree based
>> exynos4 platforms.
>
> I'd prefer to see if exynos4 and 5 were kept common here, and both transitioned
> at the same time. Especially since there are no legacy boards for exynos5, it
> would mean you could have a very clean transition there. What's the plan to
> follow up with 5?

Ok. I have been looking into Exynos4 since Mr. Kim was already onto
Exynos5 common clock. Sure, we could do a cleaner Exynos4/5 common
clock series for v3.9. That would let both exynos4/5 to be built
together which otherwise this patch series would not allow.

>
> What are the plans to remove legacy board files on exynos4 at this time
> and switch them to DT-only? You could do it gradually like Stephen Warren
> did on Tegra, with hooks that call out to some of the legacy code, but
> configure the board through device tree and do away with the classic
> machine descriptors, etc.

I did try this sometime back for exynos4210 based origen board. But
did not make much progress since certain portions require the older
samsung gpiolib support and exynos4210 mainline device tree support
has migrated to newer pinctrl framework. There is some work here to do
and I will work with Mr. Kim on this.

Thanks,
Thomas.

>
>
>
> -Olof
