From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 0/2] ARM: EXYNOS4: Enhancement of System MMU
Date: Tue, 15 Mar 2011 23:48:08 +0900
Message-ID: <AANLkTin7w=KYuLYS=vtcQo3nbLAxJPxLTQCTRGt9x6VL@mail.gmail.com>
References: <1299460768-4077-1-git-send-email-pullip.cho@samsung.com>
	<011701cbe315$e9677140$bc3653c0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:32962 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757848Ab1COOsT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Mar 2011 10:48:19 -0400
Received: by wwa36 with SMTP id 36so821399wwa.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Mar 2011 07:48:18 -0700 (PDT)
In-Reply-To: <011701cbe315$e9677140$bc3653c0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: KyongHo Cho <pullip.cho@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Marek Szyprowski <m.szyprowski@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>

On Tue, Mar 15, 2011 at 10:35 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> KyongHo Cho wrote:
>>
>> This patch includes the following enhancements for System MMU:
>> - Enhanced readability
>> - Removal of unused data structures or their members
>> - Simplified function definitions
>> - Corrections of some logical errors
>> - Full compliance with Linux coding style
>> - Simpler way of registering callback functions of System MMU faults
>> - Add clock gating for System MMU
>>
>> [PATCH 1/2] ARM: EXYNOS4: Enhancement of System MMU driver
>> [PATCH 2/2] ARM: EXYNOS4: Implement Clock gating for System MMU
>
> Cc'ed Marek.
>
> As I said before, Marek's SystemMMU driver has some problems.
>
> One is that it allocates 4MB virtual memory at once. It is really a p=
roblem
> because, the device memory manager must knows the peculiarity and han=
dles
> it. Otherwise, page tables can be overwritten...

Are there device drivers using system MMU at mainline? or example codes=
?
In case of Marek's patches, he posted drivers codes and tested at
multimedia stack.

Another one is what's the difference between MFC drivers case and Syste=
mMMU one?

and I hope you read this mail thread.
http://www.mentby.com/Group/linux-kernel/patch-maintainers-update-msm-m=
aintainers.html

Cite from Linus words.
Actually, "the community" (not that there really is any such cohesive
thing) generally asks that vendors be "involved". Not that vendors be
"exclusively in control". There's a big difference.

I feel you control the s5p codes for vendor purpose.

Thank you,
Kyungmin Park

>
> Anyway, I think Marek's initial idea is good esp., clock handling.
> But now, this looks better for its enhancement and as we know if requ=
ired,
> we can improve this later.
>
> Applied, thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
