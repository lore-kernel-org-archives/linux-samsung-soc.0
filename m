From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v2 2/2] tty: serial: samsung: Clean-up selection of number
 of available UARTs
Date: Mon, 10 Nov 2014 13:44:41 +0530
Message-ID: <CAM4voa=vTtVG0CJNLs1PGVRpCixTJQ5UMdLXBVg99jxFDUTa2g@mail.gmail.com>
References: <1412181777-6388-1-git-send-email-a.kesavan@samsung.com>
	<1412181777-6388-2-git-send-email-a.kesavan@samsung.com>
	<041301cff29a$5c9a5fa0$15cf1ee0$@kernel.org>
	<CAM4voakzWhfMc1SyTXs1eOxuvEp_U3qfRLxPAzWzeX54jwadvA@mail.gmail.com>
	<CAM4voa=0i6WsYn1z9AdeCSPFqdOS35-LX=b-Rc+Npr9dVFD_-w@mail.gmail.com>
	<CAM4voamvxxdfXApgUL6xB_8VDwFoFqz5hXKtu4W6aYCmCbs0kg@mail.gmail.com>
	<CAM4voa=TTFfuKqih2jDk6FV4K56T1Fj5sitnei2JAxdG9BwGwQ@mail.gmail.com>
	<008101cffbd7$16c03770$4440a650$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f48.google.com ([209.85.216.48]:52328 "EHLO
	mail-qa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751442AbaKJIOm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Nov 2014 03:14:42 -0500
Received: by mail-qa0-f48.google.com with SMTP id x12so4962385qac.21
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2014 00:14:42 -0800 (PST)
In-Reply-To: <008101cffbd7$16c03770$4440a650$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kukjin Kim <kgene.kim@gmail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Arnd Bergmann <arnd@arndb.de>

Hi Kukjin,

On Sun, Nov 9, 2014 at 10:09 AM, Kukjin Kim <kgene@kernel.org> wrote:
> Abhilash Kesavan wrote:
>>
>> On Mon, Nov 3, 2014 at 1:51 PM, Abhilash Kesavan
>> <kesavan.abhilash@gmail.com> wrote:
>> > Hello Kukjin,
>> >
>> > On Fri, Oct 31, 2014 at 8:06 AM, Abhilash Kesavan
>> > <kesavan.abhilash@gmail.com> wrote:
>> >> Hi Kukjin,
>> >>
>> >> On Tue, Oct 28, 2014 at 5:56 PM, Abhilash Kesavan
>> >> <kesavan.abhilash@gmail.com> wrote:
>> >>> Hi Kukjin
>> >>>
>> >>> On Tue, Oct 28, 2014 at 4:01 PM, Kukjin Kim <kgene@kernel.org> wrote:
>> >>>> Abhilash Kesavan wrote:
>> >>>>>
>> >>>> Hi,
>> >>>>
>> >>>> Sorry for late response.
>> >>>>
>> >>>>> Remove symbols SERIAL_SAMSUNG_UARTS_4 and SERIAL_SAMSUNG_UARTS which
>> >>>>> select the number of UART ports available on the SoC. Replace the usage
>> >>>>> of SERIAL_SAMSUNG_UARTS in the serial driver with the maximum number of
>> >>>>
>> >>>> Well, as you know the number of uart ports are different on each Samsung SoCs
>> >>>> so I don't think just using maximum number of uart ports are possible for new
>> >>>> exynos7 SoC at this moment.
>> >>>
>> >>> Thanks for the review.
>> >>> The main reason for me sending this patch was so that we may be able
>> >>> to re-use the serial driver on arm64 based Exynos7 too. The two
>> >>> symbols mentioned above which depend on PLAT_SAMSUNG prevent this. I
>> >>> initially sent a patch which changed the dependency to SERIAL_SAMSUNG
>> >>> for these 2 symbols. However, Tomasz suggested that a clean-up of
>> >>> these two symbols would be a better option.
>> >>>
>> >>> Please see the discussion of the previous version here:
>> >>> https://lkml.org/lkml/2014/9/29/702
>> >>>
>> >>> Can you please let me know if the previous version is acceptable ?
>> >>
>> >> Kukjin, can you please indicate the approach you would like me to
>> >> take. Without this serial support is blocked on Exynos7.
>> >
>> > Gentle reminder on this.
>>
>> Hi Kukjin,
>>
> Hi Abhilash,
>
>> I don't mean to nag, but this another reminder to review this.
>
> Yeah, it's no problem for me ;)
>
>> Please let me know if you are too busy to have a look at this or
>> require some more inputs from me.
>>
> Since I'm still having some objection on 2nd version, how about keeping current
> config options for serial for now and changing the dependency to SERIAL_SAMSUNG?
> And if required later, we can look into removal these config options later.

OK, thanks. My earlier patch [1] which does this still applies cleanly
on linux-next. I will request Greg to review the patch.

I had a question regarding the merging of pending exynos7 patches.

The clock exynos7 support will go through your tree (according to [2])
and so must the exynos7 arch/dts support [3] due to the related
dependencies. As part of the arch/dts support we are enabling the
samsung serial driver in arm64 defconfig. This will cause build
breakages without [1] being applied. So, I assume all 3 patch-sets
will go through your tree once they have been ack'ed or is there some
other way ?

[1] serial: samsung: Fix serial config dependencies for exynos7
https://patchwork.kernel.org/patch/4993521/

[2] GIT PULL] Samsung clock changes for 3.19
http://www.spinics.net/lists/arm-kernel/msg373962.html

[3] [PATCH v7 0/7] Enable support for Samsung Exynos7 SoC
http://www.spinics.net/lists/arm-kernel/msg375961.html
>
> Thanks,
> Kukjin
>
