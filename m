From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 00/12] ARM: restart: SAMSUNG: use new restart hook
Date: Wed, 21 Dec 2011 10:37:17 +0900
Message-ID: <05db01ccbf81$130d58f0$39280ad0$%kim@samsung.com>
References: <1324385316-6052-1-git-send-email-kgene.kim@samsung.com>
 <20111220210022.GC2577@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:53803 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752931Ab1LUBhV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Dec 2011 20:37:21 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWJ00MR15TLO1H0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Dec 2011 10:37:19 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWJ00J6C5U5N520@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 21 Dec 2011 10:37:19 +0900 (KST)
In-reply-to: <20111220210022.GC2577@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Russell King - ARM Linux wrote:
> 
> On Tue, Dec 20, 2011 at 09:48:24PM +0900, Kukjin Kim wrote:
> > This patch introduces common.[ch] in each SAMSUNG mach- directories
> > and implements using new restart hook for Samsung stuff.
> >
> > This is against on rmk/devel-stable branch.
> >
> > [PATCH 01/12] ARM: S3C64XX: introduce arch/arm/mach-s3c64xx/common.[ch]
> > [PATCH 02/12] ARM: restart: S3C64XX: use new restart hook
> > [PATCH 03/12] ARM: S5P64X0: introduce arch/arm/mach-s5p64x0/common.[ch]
> > [PATCH 04/12] ARM: restart: S5P64X0: use new restart hook
> > [PATCH 05/12] ARM: S5PC100: introduce arch/arm/mach-s5pc100/common.[ch]
> > [PATCH 06/12] ARM: restart: S5PC100: use new restart hook
> > [PATCH 07/12] ARM: S5PV210: introduce arch/arm/mach-s5pv210/common.[ch]
> > [PATCH 08/12] ARM: restart: S5PV210: use new restart hook
> > [PATCH 09/12] ARM: EXYNOS: introduce arch/arm/mach-exynos/common.[ch]
> > [PATCH 10/12] ARM: restart: EXYNOS: use new restart hook
> > [PATCH 11/12] ARM: restart: S3C24XX: move SWRST based S3C platforms
> > [PATCH 12/12] ARM: restart: S3C24XX: use new restart hook
> 
> I think this series looks fine - I'd like the cleanups to be ordered
> before
> any of the other changes (so that the cleanups can be applied to the
> restart-cleanup branch and queued into devel-stable independently of the
> rest of the restart changes.)
> 
OK, let me re-ordered like following.

[PATCH 01/12] ARM: S3C64XX: introduce arch/arm/mach-s3c64xx/common.[ch]
[PATCH 03/12] ARM: S5P64X0: introduce arch/arm/mach-s5p64x0/common.[ch]
[PATCH 05/12] ARM: S5PC100: introduce arch/arm/mach-s5pc100/common.[ch]
[PATCH 07/12] ARM: S5PV210: introduce arch/arm/mach-s5pv210/common.[ch]
[PATCH 09/12] ARM: EXYNOS: introduce arch/arm/mach-exynos/common.[ch]

[PATCH 04/12] ARM: restart: S5P64X0: use new restart hook
[PATCH 06/12] ARM: restart: S5PC100: use new restart hook
[PATCH 08/12] ARM: restart: S5PV210: use new restart hook
[PATCH 10/12] ARM: restart: EXYNOS: use new restart hook
[PATCH 11/12] ARM: restart: S3C24XX: move SWRST based S3C platforms
[PATCH 12/12] ARM: restart: S3C24XX: use new restart hook
[PATCH 02/12] ARM: restart: S3C64XX: use new restart hook

> Please submit them to the patch system in a couple of days time (to give
> some time for anyone to ack them.)
> 
OK, this will be submitted to patch system on FRI and as a note, there were
mis-deleting so I fixed it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
