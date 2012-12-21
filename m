From: Cho KyongHo <pullip.cho@samsung.com>
Subject: RE: [PATCH] ARM: dts: fix split memory bank for SSDK5440
Date: Fri, 21 Dec 2012 09:56:57 +0900
Message-ID: <000a01cddf16$13a027b0$3ae07710$%cho@samsung.com>
References: <1356030217-5472-1-git-send-email-kgene.kim@samsung.com>
 <CAOesGMg03Yn=fDr1XqmbBUs=eZO0_8=iti1LUiJ6CX5n1Bm45g@mail.gmail.com>
 <1464138.NEt7mMkYJc@flatron> <20121220234146.GF14363@n2100.arm.linux.org.uk>
 <01f801cddf12$9f95c350$dec149f0$@samsung.com>
 <CAOesGMhVxidvs6Ywxzb=aK0GB0=bJMVfC7BWhXUQiPgeCpndbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:50846 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751484Ab2LUA47 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Dec 2012 19:56:59 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFC00JJNVYGA1A0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Dec 2012 09:56:57 +0900 (KST)
Received: from DOPULLIPCHO06 ([12.23.118.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFC00N8LVYX2S90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Dec 2012 09:56:57 +0900 (KST)
In-reply-to: <CAOesGMhVxidvs6Ywxzb=aK0GB0=bJMVfC7BWhXUQiPgeCpndbA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

> From: Olof Johansson [mailto:olof@lixom.net]
> Sent: Friday, December 21, 2012 9:36 AM
> 
> On Thu, Dec 20, 2012 at 4:32 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Russell King - ARM Linux wrote:
> >>
> >
> > [...]
> >
> >> >
> >> > > What's the actual bug caused by this? The description is vague.
> >> >
> >> > The kernel panics early on NULL pointer dereference in memory
> >> > initialization.
> >>
> >
> > (Cc'ed KyongHo Cho)
> >
> > Yeah, correct. The size of memory bank should be under section size and
> > current section size is 256MiB on EXYNOS. So if we don't change the section
> > size, each memory bank should be under 256MiB. If not, as Tomasz said,
> > kernel panic happens in mem_init().
> 
> That's a bug somewhere, the device tree should describe the hardware,
> and not necessarily the massaged format that the kernel wants it in to
> not trigger a bug.
> 
> So I don't want to see this patch merged, I want to see a proper fix
> instead, please.
> 
> There are also already other exynos platforms and device trees with
> more than 256MB in the memory node. Changing all of them this way
> seems unreasonable.
> 
As Kukjin said earlier, the kernel panic may happen while gathering
memory statistics in mem_init()(arch/arm/mm/init.c). Russell King does not
agreed to modify mem_init() instead he told that a memory bank must not cross
section boundaries.
