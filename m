From: Jungseok Lee <jays.lee@samsung.com>
Subject: Re: [PATCH v4 4/7] arm64: Add a description on 48-bit address space
 with 4KB pages
Date: Wed, 30 Apr 2014 15:41:40 +0900
Message-ID: <008e01cf643f$3e67eff0$bb37cfd0$@samsung.com>
References: <000401cf6367$cc461500$64d23f00$@samsung.com>
 <20140429144759.GL17007@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:15404 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754021AbaD3Glo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Apr 2014 02:41:44 -0400
In-reply-to: <20140429144759.GL17007@arm.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Catalin Marinas' <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 'Marc Zyngier' <Marc.Zyngier@arm.com>, 'Christoffer Dall' <christoffer.dall@linaro.org>, linux-kernel@vger.kernel.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, steve.capper@linaro.org, sungjinn.chung@samsung.com, 'Arnd Bergmann' <arnd@arndb.de>, kgene.kim@samsung.com, ilho215.lee@samsung.com

On Tuesday, April 29, 2014 11:48 PM, Catalin Marinas wrote:
> On Tue, Apr 29, 2014 at 05:59:27AM +0100, Jungseok Lee wrote:
> > --- a/Documentation/arm64/memory.txt
> > +++ b/Documentation/arm64/memory.txt
> > @@ -8,10 +8,11 @@ This document describes the virtual memory layout
> > used by the AArch64  Linux kernel. The architecture allows up to 4
> > levels of translation  tables with a 4KB page size and up to 3 levels with a 64KB page size.
> >
> > -AArch64 Linux uses 3 levels of translation tables with the 4KB page
> > -configuration, allowing 39-bit (512GB) virtual addresses for both
> > user -and kernel. With 64KB pages, only 2 levels of translation tables
> > are -used but the memory layout is the same.
> > +AArch64 Linux uses 3 levels and 4 levels of translation tables with
> > +the 4KB page configuration, allowing 39-bit (512GB) and 48-bit
> > +(256TB) virtual addresses, respectively, for both user and kernel.
> > +With 64KB pages, only 2 levels of translation tables are used but the
> > +memory layout is the same.
> 
> Any reason why we couldn't use 48-bit address space with 64K pages (implying 3 levels)?

No technical reason.
Since 64K+3levels is not implemented in this set, I didn't add it.

Should 64K+3levels be prepared in this patchset?

> > -AArch64 Linux memory layout with 64KB pages:
> > +AArch64 Linux memory layout with 4KB pages + 4 levels:
> > +
> > +Start			End			Size		Use
> > +-----------------------------------------------------------------------
> > +0000000000000000	0000ffffffffffff	 256TB		user
> > +
> > +ffff000000000000	ffff7bfffffeffff	~124TB		vmalloc
> 
> BTW, maybe as a separate patch we should change the "end" to be exclusive. It becomes harder to modify
> (I've been through this a few times already ;)) and even follow the changes.

Does "exclusive" mean that 0000ffffffffffff is changed to 0001000000000000?
Or Does it mean that "End" column is dropped?

If you are okay, I will make it as a separate patch.

Best Regards
Jungseok Lee
