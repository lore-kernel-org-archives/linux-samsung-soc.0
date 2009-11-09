From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 01/17] ARM: MM: use 64bytes of L1 cache on plat S5PC1xx
Date: Mon, 9 Nov 2009 11:41:19 +0900
Message-ID: <9c9fda240911081841t978292ch52befaf0fd5e510f@mail.gmail.com>
References: <1255421482-26455-1-git-send-email-m.szyprowski@samsung.com>
	 <1255421482-26455-2-git-send-email-m.szyprowski@samsung.com>
	 <20091108235847.GE4808@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f192.google.com ([209.85.212.192]:41513 "EHLO
	mail-vw0-f192.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752779AbZKIClO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 8 Nov 2009 21:41:14 -0500
Received: by vws30 with SMTP id 30so770908vws.33
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Nov 2009 18:41:20 -0800 (PST)
In-Reply-To: <20091108235847.GE4808@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, bhmin@samsung.com

Hi,

It's missing of "From".

Actually I don't care who send and from. I just want to merge the
s5pc1xx series patches to mainline ASAP .

Thank you,
Kyungmin Park

On Mon, Nov 9, 2009 at 8:58 AM, Ben Dooks <ben-linux@fluff.org> wrote:
> On Tue, Oct 13, 2009 at 10:11:06AM +0200, Marek Szyprowski wrote:
>> Samsung S5PC1xx SoCs are Coretex8 based, so use 64 bytes of L1 cache
>> line instead of the default 32 bytes.
>>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> This worries me, either this patch was from 'Kyungmin Park' and thus
> should have either been sent by, or have an 'From:' line at the top
> of the description. If this has been appraised by Kyungmin then the
> signoff should either be after Marek's (as this is the sender) or be
> something other than a signed-off-by.
>
>> ---
>> =A0arch/arm/mm/Kconfig | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
>> index e993140..9cf7706 100644
>> --- a/arch/arm/mm/Kconfig
>> +++ b/arch/arm/mm/Kconfig
>> @@ -777,5 +777,5 @@ config CACHE_XSC3L2
>>
>> =A0config ARM_L1_CACHE_SHIFT
>> =A0 =A0 =A0 int
>> - =A0 =A0 default 6 if ARCH_OMAP3
>> + =A0 =A0 default 6 if ARCH_OMAP3 || ARCH_S5PC1XX
>> =A0 =A0 =A0 default 5
>> --
>> 1.6.4
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
> --
> --
> Ben
>
> Q: =A0 =A0 =A0What's a light-year?
> A: =A0 =A0 =A0One-third less calories than a regular year.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
