From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 9/9] ARM: EXYNOS: temporary fixup regarding get_core_count()
Date: Fri, 10 Feb 2012 19:16:17 +0900
Message-ID: <010001cce7dd$071e59c0$155b0d40$%kim@samsung.com>
References: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com>
 <1328024354-4277-10-git-send-email-kgene.kim@samsung.com>
 <CAH9JG2Us-Edqjq2FryX_wdHOkutdGdTzeCWMD2RjqNFCn=P9hA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:21786 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754173Ab2BJKQW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 05:16:22 -0500
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ600AAP9ULY4T0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 19:16:20 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ600FUP9V5IZ30@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 19:16:20 +0900 (KST)
In-reply-to: <CAH9JG2Us-Edqjq2FryX_wdHOkutdGdTzeCWMD2RjqNFCn=P9hA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net

Kyungmin Park wrote:
> 
> On 2/1/12, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---

[...]

> > -	ncores = scu_base ? scu_get_core_count(scu_base) : 1;
> > +	if (soc_is_exynos5250())
> > +		ncores = 2;
> I saw the related mail thread, I wonder then how to handle this at
> other A15 board? Device Tree?

Well, as you know, the EXYNOS5250 has two A15 cores :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
