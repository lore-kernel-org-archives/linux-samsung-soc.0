From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: fix split memory bank for SSDK5440
Date: Thu, 20 Dec 2012 16:32:11 -0800
Message-ID: <01f801cddf12$9f95c350$dec149f0$@samsung.com>
References: <1356030217-5472-1-git-send-email-kgene.kim@samsung.com>
 <CAOesGMg03Yn=fDr1XqmbBUs=eZO0_8=iti1LUiJ6CX5n1Bm45g@mail.gmail.com>
 <1464138.NEt7mMkYJc@flatron> <20121220234146.GF14363@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59854 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751852Ab2LUAcS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Dec 2012 19:32:18 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFC006KZUTKVM80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Dec 2012 09:32:17 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFC00N0FUTQ2S20@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Dec 2012 09:32:17 +0900 (KST)
In-reply-to: <20121220234146.GF14363@n2100.arm.linux.org.uk>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'KyongHo Cho' <pullip.cho@samsung.com>

Russell King - ARM Linux wrote:
> 

[...]

> >
> > > What's the actual bug caused by this? The description is vague.
> >
> > The kernel panics early on NULL pointer dereference in memory
> > initialization.
> 

(Cc'ed KyongHo Cho)

Yeah, correct. The size of memory bank should be under section size and
current section size is 256MiB on EXYNOS. So if we don't change the section
size, each memory bank should be under 256MiB. If not, as Tomasz said,
kernel panic happens in mem_init().

> And of course the debugging information is included in the commit log so
> that others can see what problem you're experiencing and make a decision
> whether the proposed solution is the right one...

Yeah, why not, I will add it in next version.

Thanks.

- Kukjin
