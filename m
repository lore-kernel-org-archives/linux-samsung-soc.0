From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 0/7] ARM: S5P: moving plat-s5p stuff into plat-samsung
Date: Tue, 24 Apr 2012 17:16:02 -0700
Message-ID: <4F974242.9000504@samsung.com>
References: <1334802036-16768-1-git-send-email-kgene.kim@samsung.com> <201204191323.32301.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:54603 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756950Ab2DYAQG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Apr 2012 20:16:06 -0400
Received: by dadz8 with SMTP id z8so1570324dad.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 17:16:05 -0700 (PDT)
In-Reply-To: <201204191323.32301.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

Arnd Bergmann wrote:
> On Thursday 19 April 2012, Kukjin Kim wrote:
>> This patches move plat-s5p stuff into plat-samsung for keep just one
>> plat directory, plat-samsung for Samsung stuff. Actually, it includes
>> small things for common s5p and there is no problem this moving.
>> Of course, I'm working on removing plat-s3c24xx and will be submitted
>> before v3.4 release.
>>
>> NOTE, now the plat-s5p directory which is including Kconfig and dummy
>> Makefile is not removed yet because need to cleanup CONFIG_PLAT_S5P
>> and will be removed soon.
>>
>
> Very nice!
>
Thanks :)

> Out of curiosity, how far are you planning to take the consolidation
> of the various directories in the end?

Yes, actually, I need more work for it.

> I assume all the s3c24* directories end up getting merged into
> s3c24xx, but what about s3c64xx, s5p64x0, s5pc100 and s5pcv210?

Yeah, remained mach-s3c24* directories are including just cpufreq stuff 
and will be cleaned out soon. Moreover, plat-s3c24xx will be merged into 
one mach-s3c24xx directory before v3.4 release means for v3.5.

But I think, other s5pxxxx are not for this turn probably next time? ;)

> Are they going to stay separate or do they get merged together
> or with exynos?
>
Actually, I have a plan to merge them.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
