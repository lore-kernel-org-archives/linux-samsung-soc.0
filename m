From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 5/9] ARM: EXYNOS: add board file for SMDK5250
Date: Thu, 09 Feb 2012 20:31:17 +0900
Message-ID: <069401cce71e$56bffe80$043ffb80$%kim@samsung.com>
References: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com>
 <1328024354-4277-6-git-send-email-kgene.kim@samsung.com>
 <CAH9JG2UZ9HxXsvmTh8Gqf5EpzS2sLSH_v8TWjKeBL8z7hR++Mg@mail.gmail.com>
 <CAOesGMgNdDdzsSBtopu7hu0xavFDSBnw0TW1MrN25C7FO+j8AQ@mail.gmail.com>
 <20120201093423.GA3002@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29522 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751144Ab2BILbS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Feb 2012 06:31:18 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ40059GIO5MN11@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 20:31:17 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ400CELIO3FT70@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 20:31:17 +0900 (KST)
In-reply-to: <20120201093423.GA3002@mudshark.cambridge.arm.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Will Deacon' <will.deacon@arm.com>, 'Olof Johansson' <olof@lixom.net>
Cc: 'Kyungmin Park' <kmpark@infradead.org>, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org, rmk+kernel@arm.linux.org.uk

Will Deacon wrote:
> 
> On Wed, Feb 01, 2012 at 08:50:23AM +0000, Olof Johansson wrote:
> > On Tue, Jan 31, 2012 at 8:20 PM, Kyungmin Park <kmpark@infradead.org>
> wrote:
> > > As I remember only DT based board file is acceptable for mainline?
> >
> > For a new SoC family like 5250 it would be much preferred to only add
> > device-tree enabled boards.
> 
As I commented, I'd like to support both dt and non-dt for EXYNOS5250 and
I'm saying EXYNOS5250 DT patches will be submitted next time again.

> As I mentioned in an earlier thread, it would also solve the problem of
> enumerating the CPU topology on A15 (without resorting to flaky hacks in
> core code).
> 
Will, yes I know that. But I think, seems A15 SMP (not MP) can be supported?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
