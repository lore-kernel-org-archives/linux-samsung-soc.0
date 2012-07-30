From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/3] Move FIMD register headers to include/video/
Date: Mon, 30 Jul 2012 11:09:34 +0200
Message-ID: <50164F4E.1030508@samsung.com>
References: <1343637905-17764-1-git-send-email-l.krishna@samsung.com>
 <1343637905-17764-2-git-send-email-l.krishna@samsung.com>
 <000001cd6e30$da849520$8f8dbf60$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:14067 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751693Ab2G3JJi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jul 2012 05:09:38 -0400
In-reply-to: <000001cd6e30$da849520$8f8dbf60$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Leela Krishna Amudala' <l.krishna@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, ben-linux@fluff.org, inki.dae@samsung.com, kgene.kim@samsung.com, joshi@samsung.com, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Hi,

On 07/30/2012 10:53 AM, Jingoo Han wrote:
>> +/*FIMD V8 REG OFFSET */
>> +#define FIMD_V8_VIDTCON0	(0x20010)
>> +#define FIMD_V8_VIDTCON1	(0x20014)
>> +#define FIMD_V8_VIDTCON2	(0x20018)
>> +#define FIMD_V8_VIDTCON3	(0x2001C)
>> +#define FIMD_V8_VIDCON1		(0x20004)
> 
> 
> CC'ed Marek.
> 
> To Leela Krishna Amudala,
> 
> Don't add these definitions for FIMD_V8_xxx registers, which are 
> not related to current "regs-fb-v4.h and regs-fb.h".
> Just "move" and "merge" regs-fb-v4.h and regs-fb.h to one header 
> file, not "add" new definitions.
> If you want to add these definitions, please make new patch for this.

Good point.

> Also, "#define FIMD_V8_xxx" is ugly.
> I think that there is better way.
> Please, find other way.

Instead of just telling that something is wrong and you don't like it, 
perhaps it would be kind to give at least a slight suggestion of what 
would have been good enough to your taste...respecting someone else's
time and effort.

So what would you like to see there instead, EXYNOS5_FIMD_* ?

BTW, your e-mails are badly word wrapped, I had to manually correct it.

-- 

Regards,
Sylwester
