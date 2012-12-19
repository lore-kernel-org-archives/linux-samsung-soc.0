From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Fix compile error in dev-audio.c
Date: Tue, 18 Dec 2012 18:49:26 -0800
Message-ID: <001301cddd93$7956e000$6c04a000$@samsung.com>
References: <000701cdd9d3$3b6a6e10$b23f4a30$%choi@samsung.com>
 <CAOesGMhgvsM7Fk-YpihjYM6h+xqK-ejBzPKEDypfdKEmHp6ZJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:32936 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752924Ab2LSCte (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Dec 2012 21:49:34 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MF900I38BUL4FD0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Dec 2012 11:49:33 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MF900CKNBUI4P50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Dec 2012 11:49:33 +0900 (KST)
In-reply-to: <CAOesGMhgvsM7Fk-YpihjYM6h+xqK-ejBzPKEDypfdKEmHp6ZJg@mail.gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Jonghwan Choi' <jhbird.choi@samsung.com>, 'Padmavathi Venna' <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Russell King' <linux@arm.linux.org.uk>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, linux-arm-kernel@lists.infradead.org

Olof Johansson wrote:

[...]
 
> Looks like the breakage was caused by the following commit:
> 
> commit 1974a042dd15f1f007a3a1a2dd7a23ca0e42c01d
> Author:     Padmavathi Venna <padma.v@samsung.com>
> AuthorDate: Wed Nov 28 16:17:48 2012 +0530
> Commit:     Mark Brown <broonie@opensource.wolfsonmicro.com>
> CommitDate: Wed Nov 28 19:18:00 2012 +0000
> 
>     ASoC: Samsung: Get I2S src_clk from clock alias id.
> 
> Padmavathi, you can't send out code that breaks all Samsung platforms
> like this, even if there are patches out there that fixes it. Changes
> have to be bisectable, which means that you can't break and unbreak
> the build, least of all if you merge through different maintainers.
> And you need to tell the other maintainer that there are dependent
> patches, you just sent the above patch to Mark without any such
> information.
> 
Oops, I thought the 'src_clk'  should be restored with my drop the commit
48a2050d ("ARM: SAMSUNG: Delete the unnecessary variable"), however, seems
other patch has same changes...What's happening?

See below,
http://lists.infradead.org/pipermail/linux-arm-kernel/2012-November/134979.h
tml

> Kukjin, I see that Padmavathi has posted a V3 series of patches to
> remove all this from the dev-audio files on November 23. Are you ok
> with us picking them up and sending ASAP?
> 
Hmm, just Mark's following can fix it but I didn't look at it yet.

http://lists.infradead.org/pipermail/linux-arm-kernel/2012-November/134911.h
tml

- Kukjin
