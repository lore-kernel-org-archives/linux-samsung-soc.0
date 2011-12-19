From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: restart: S3C64XX: use new restart hook
Date: Mon, 19 Dec 2011 23:37:59 +0900
Message-ID: <4EEF4C47.6040408@samsung.com>
References: <03dc01ccbe45$80633d30$8129b790$%kim@samsung.com> <20111219135530.GG14542@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:41163 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753249Ab1LSOiG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Dec 2011 09:38:06 -0500
Received: by iaeh11 with SMTP id h11so8630364iae.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Dec 2011 06:38:05 -0800 (PST)
In-Reply-To: <20111219135530.GG14542@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>

On 12/19/11 22:55, Russell King - ARM Linux wrote:
> On Mon, Dec 19, 2011 at 08:58:20PM +0900, Kukjin Kim wrote:
>> Hook these platforms restart code into the new restart hook rather
>> than using arch_reset().
>>
>> Cc: Ben Dooks<ben-linux@fluff.org>
>> Cc: Russell King<rmk+kernel@arm.linux.org.uk>
>> Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
>
> It would be _much_ better if you could prepare a set of patches against
> my devel-stable which adds this support (as has been done for others.)
>
OK, I will and other Samsung stuff such as s3c24xx, s5p and exynos will 
be implemented together against your devel-stable.

> I can merge it into my restart branch, and update the commit which removes
> arch_reset() itself, and the commit which adds the #error.  We can then
> avoid bisect breakage.
>
OK.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

>> ---
>>   arch/arm/mach-s3c64xx/common.c                     |   10 ++++++++++
>>   arch/arm/mach-s3c64xx/common.h                     |    2 ++
>>   arch/arm/mach-s3c64xx/include/mach/system.h        |   12 ------------
>>   arch/arm/mach-s3c64xx/mach-anw6410.c               |    1 +
>>   arch/arm/mach-s3c64xx/mach-crag6410.c              |    1 +
>>   arch/arm/mach-s3c64xx/mach-hmt.c                   |    1 +
>>   arch/arm/mach-s3c64xx/mach-mini6410.c              |    1 +
>>   arch/arm/mach-s3c64xx/mach-ncp.c                   |    1 +
>>   arch/arm/mach-s3c64xx/mach-real6410.c              |    1 +
>>   arch/arm/mach-s3c64xx/mach-smartq5.c               |    1 +
>>   arch/arm/mach-s3c64xx/mach-smartq7.c               |    1 +
>>   arch/arm/mach-s3c64xx/mach-smdk6400.c              |    1 +
>>   arch/arm/mach-s3c64xx/mach-smdk6410.c              |    1 +
>>   .../arm/plat-samsung/include/plat/watchdog-reset.h |    1 +
>>   14 files changed, 23 insertions(+), 12 deletions(-)
