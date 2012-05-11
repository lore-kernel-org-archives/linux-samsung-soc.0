From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCHv2 0/3] Add support for DRM display subsystem
Date: Fri, 11 May 2012 19:37:56 +0900
Message-ID: <045401cd2f62$210f3e40$632dbac0$%kim@samsung.com>
References: <1331635180-7207-1-git-send-email-m.szyprowski@samsung.com>
 <037301cd2e90$529112e0$f7b338a0$%kim@samsung.com>
 <CAH9JG2V_9RVPvEHodDD422r=o4QxHcrMO-YXv2KUGYeys=ZjqA@mail.gmail.com>
 <201205101348.20870.arnd@arndb.de>
 <CAH9JG2U83+q9NKuvZV4s_iHvDTrQ-RCEqx=9L9uwqiMhYMSiHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:54855 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755542Ab2EKKiE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 May 2012 06:38:04 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3U00993TIC8WI0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 May 2012 19:38:02 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M3U00FF8TJ7F110@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 May 2012 19:38:02 +0900 (KST)
In-reply-to: <CAH9JG2U83+q9NKuvZV4s_iHvDTrQ-RCEqx=9L9uwqiMhYMSiHA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, 'Arnd Bergmann' <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Joonyoung Shim' <jy0922.shim@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>

OK, I thought again and talked to some guys. It's okay to add updated to the
non-dt board files on exynos4 for now. I know, until there is dt coverage
for more drivers, actually it will be difficult to build/support a complete
system with only dt support.

Note, we need to keep adding more and more support for dt for exynos4 and
exynos5. Then only we can stop the development of non-dt board files.

Thanks for many opinions about this and if any objections, feel free to
contact me.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
