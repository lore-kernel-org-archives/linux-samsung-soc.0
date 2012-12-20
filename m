From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: dts: fix split memory bank for SSDK5440
Date: Thu, 20 Dec 2012 22:14:26 +0100
Message-ID: <1464138.NEt7mMkYJc@flatron>
References: <1356030217-5472-1-git-send-email-kgene.kim@samsung.com> <CAOesGMg03Yn=fDr1XqmbBUs=eZO0_8=iti1LUiJ6CX5n1Bm45g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f49.google.com ([74.125.83.49]:39734 "EHLO
	mail-ee0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751168Ab2LTVOa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Dec 2012 16:14:30 -0500
Received: by mail-ee0-f49.google.com with SMTP id c4so1993847eek.22
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Dec 2012 13:14:28 -0800 (PST)
In-Reply-To: <CAOesGMg03Yn=fDr1XqmbBUs=eZO0_8=iti1LUiJ6CX5n1Bm45g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Olof,

On Thursday 20 of December 2012 11:56:59 Olof Johansson wrote:
> Hi,
> 
> On Thu, Dec 20, 2012 at 11:03 AM, Kukjin Kim <kgene.kim@samsung.com> 
wrote:
> > The size of memory bank should be under 256MB, because current
> > section size is 256MB on EXYNOS SoCs. This patch fixes it.
> 
> This makes no sense. You don't have to split up memory ranges, the
> code should be made to handle it instead.

It's not Exynos code which causes the problem. Sparsemem initialization 
relies on the fact that initial amount of structures to described memory 
equals to maximum section size which is defined per arch (e.g. 
ARCH_EXYNOS).

> What's the actual bug caused by this? The description is vague.

The kernel panics early on NULL pointer dereference in memory 
initialization.

Best regards,
Tomasz Figa
