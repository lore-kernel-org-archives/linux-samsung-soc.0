From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Consolidate Kconfig entries
Date: Thu, 6 Feb 2014 10:59:04 -0800
Message-ID: <CAOesGMhGTVQex7vu49QnHv2HsdE7S8jz7oKY04FsT4Hg1VR7sA@mail.gmail.com>
References: <1391687996-26011-1-git-send-email-sachin.kamat@linaro.org>
	<5101685.tPb8PWOH5Q@amdc1032>
	<CAOesGMi8SUXzxJSW4yoywLQn0C7HmPL81iCQqxg9uZp_jN7yPQ@mail.gmail.com>
	<7214831.iPsDTEq8CU@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f48.google.com ([209.85.216.48]:36020 "EHLO
	mail-qa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753686AbaBFS7Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Feb 2014 13:59:16 -0500
Received: by mail-qa0-f48.google.com with SMTP id f11so3497065qae.35
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Feb 2014 10:59:13 -0800 (PST)
In-Reply-To: <7214831.iPsDTEq8CU@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

On Thu, Feb 6, 2014 at 10:43 AM, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:

>> > Well, once again, seeing some numbers would be good. :)
>>
>> What numbers do you want? Size comparisons with all SoC options on vs only one?
>
> Yes, size comparisions with all SoCs (for given family) turned on vs
> only one turned on (done on kernel without this patch applied).
>
> Also size comparisons for ARCH_EXYNOS4 and ARCH_EXYNOS5 both turned
> on vs only ARCH_EXYNOS4 or ARCH_EXYNOS5 turned on (with this patch
> applied).

exynos_defconfig-based build data below.

   text    data     bss     dec     hex filename
5109986  319952  270196 5700134  56fa26 obj-tmp/vmlinux   # all 4+5 SoCs enabled
5088312  296912  270196 5655420  564b7c obj-tmp/vmlinux  # EXYNOS5
off, all EXYNOS4 SoCs enabled
5088032  296896  270196 5655124  564a54 obj-tmp/vmlinux  # Only 4210 enabled
5079205  299928  270068 5649201  563331 obj-tmp/vmlinux  # EXYNOS4
off, all EXYNOS5 SoCs enabled
5063355  286792  270068 5620215  55c1f7 obj-tmp/vmlinux   # Only 5250 enabled
5067815  298152  270068 5636035  55ffc3 obj-tmp/vmlinux    # Only
5250+5420 enabled
5053357  278480  269364 5601201  5577b1 obj-tmp/vmlinux  # Only 5440 enabled

The main difference of disabling 5440 is that it removed the PCI
support, which explains that reduction in size.

So, I would argue that theere might be some value in disabling whole
families (since it saves about 20k of text and the same of data), but
that there's less gain per SoC member. 5440 is an oddball in this
setup so it might make sense to treat it differently due to the PCI
aspect.


-Olof
