From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/3] PM / devfreq: update the name of EXYNOS clock register
Date: Tue, 31 Jan 2012 15:15:03 +0900
Message-ID: <042001ccdfdf$ab7f75e0$027e61a0$%kim@samsung.com>
References: <1327985365-7070-1-git-send-email-kgene.kim@samsung.com>
 <1327985365-7070-4-git-send-email-kgene.kim@samsung.com>
 <CAJ0PZbTUL-PgRXJ1MBQG+n=G4Tc-bkhipOrD34WJHXfpv_ZLZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54941 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752050Ab2AaGPH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 01:15:07 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LYN005LOG0A3H80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 31 Jan 2012 15:15:05 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LYN000D2G1330T0@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 31 Jan 2012 15:15:05 +0900 (KST)
In-reply-to: <CAJ0PZbTUL-PgRXJ1MBQG+n=G4Tc-bkhipOrD34WJHXfpv_ZLZA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: myungjoo.ham@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>

MyungJoo Ham wrote:
> 
> On Tue, Jan 31, 2012 at 1:49 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > According to replacing the name of EXYNOS clock registers,
> > this patch updates exynos4_bus.c file where it is used.
> >
> > Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> 
Hi Myungjoo,

> Acked-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> 
Thanks.

> 
> Anyway, you are going to keep and apply this patch to your Samsung-SoC
> repository, right?
> 
If you don't mind, yes.

> I guess it'd be fine for me to apply this patch in PM/devfreq after
> this one's get merged as I'm revising a seperated part of this file.
> 
Yes I know, I will provide topic branch so that you can merge it in your
tree after getting ack from Dave Jones on CPUFREQ changes.

If any updates, let you know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
