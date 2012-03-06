From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [RESEND 0/4] onenand: OneNAND board dependent probe and fixes for
 Samsung targets
Date: Tue, 06 Mar 2012 07:48:20 +0100
Message-ID: <20120306074820.3494a776@lmajewski.digital.local>
References: <1320914477-27885-1-git-send-email-l.majewski@samsung.com>
 <1330965691-10301-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:51389 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752776Ab2CFGs3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Mar 2012 01:48:29 -0500
Received: from euspt2 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M0G00JZIAWRMC40@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Mar 2012 06:48:27 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0G00C2VAWRGC@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Mar 2012 06:48:27 +0000 (GMT)
Received: from lmajewski.digital.local (unknown [106.116.37.166])
	by linux.samsung.com (Postfix) with ESMTP id E0AE9270056	for
 <linux-samsung-soc@vger.kernel.org>; Tue, 06 Mar 2012 07:56:05 +0100 (CET)
In-reply-to: <1330965691-10301-1-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

On Mon, 05 Mar 2012 17:41:27 +0100
Lukasz Majewski <l.majewski@samsung.com> wrote:

> This patch sets add board dependent onenand probes.
> 
> Several fixes for GONI and Exynos4210 (C210_universal) targets have
> been added.
> 
> Tested at:
> 	Samsung S5PC110 GONI
>         Samsung Exynos4210 (S5PC210 Universal)
> 
> Lukasz Majewski (4):
>   onenand:samsung Target dependent OneNAND chip probe function
>   onenand:samsung OneNAND chip probe functions added for GONI and
>     Exynos4210
>   onenand: Replace ONENAND_IS_MLC() test with ONENAND_HAS_4KB()
>   onenand: samsung: Enable support OneNAND support at Samsung's
>     Exynos4210
> 
>  board/samsung/goni/onenand.c           |    1 +
>  board/samsung/universal_c210/onenand.c |    2 +
>  drivers/mtd/onenand/onenand_base.c     |   88
> +++++++++++++++++++++++--------
> drivers/mtd/onenand/samsung.c          |   10 ++++
> include/configs/s5pc210_universal.h    |    1 +
> include/linux/mtd/onenand.h            |    5 ++
> include/linux/mtd/samsung_onenand.h    |    2 + 7 files changed, 86
> insertions(+), 23 deletions(-)
> 

I'm very sorry, but this is a wrong mailing list.
It was meant to go to u-boot mailing list, not linux-samsung-soc :-)

-- 
Best regards,

Lukasz Majewski

Samsung Poland R&D Center
Platform Group
