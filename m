From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH V4] ARM: EXYNOS4: Implement kernel timers using MCT
Date: Wed, 2 Mar 2011 16:39:32 +0900
Message-ID: <AANLkTi=Fe14x9jCH0sLtDLF4rpPSVdhwVUNJ9fWwmRs=@mail.gmail.com>
References: <1298870207-1850-1-git-send-email-kgene.kim@samsung.com>
	<1298870207-1850-3-git-send-email-kgene.kim@samsung.com>
	<AANLkTim9XMD=x5dbm0vOcrCcrL0TRKvdb7CuXBv3r_qX@mail.gmail.com>
	<010b01cbd8ab$8d575830$a8060890$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gw0-f51.google.com ([74.125.83.51]:59077 "EHLO
	mail-gw0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881Ab1CBHjd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Mar 2011 02:39:33 -0500
Received: by gwb15 with SMTP id 15so3477467gwb.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Mar 2011 23:39:32 -0800 (PST)
In-Reply-To: <010b01cbd8ab$8d575830$a8060890$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Changhwan Youn <chaos.youn@samsung.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>

On Wed, Mar 2, 2011 at 4:29 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Kyungmin Park wrote:
>>
>> Hi,
>>
>> MCT is only possible from EVT1.0 or later. The current universal_c210
>> used the EVT0 version.
>> So can you remove the ifdef and board can select which timer is used?
>> Please refer the omap implementation and how to use it.
>>
> Basically, "CONFIG_EXYNOS4_MCT" can be selected in kernel menuconfig.
> It means default one is using local timer which is included in every
> Exynos4210.
>
>> If we use the same configuration, It will be boot failed at
>> universal_c210 board.
>>
> No, see as above.
>
> One more basically, each machine specific CONFIGs should be selected in
> kernel menuconfig after "make exynos4_defconfig". Because each machine
> supports different components on each one now.
>
> As a note, however, I don't want to add each machine's defconfig. Maybe
> Russell also.

I agree, but there are better way, make it compile both and select
timer for each board.
Of course no need to add any statement if default timer is used.

BTW, What's the purpose of exynos4_defconfig? as you said, If I want
to use the MCT for EVT1 board,
then make defconfig and select it again? why do the these job?

Thank you,
Kyungmin Park
