From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [PATCH RESEND 3/4] ARM: EXYNOS: Add s3c-hsotg device support for
 NURI board
Date: Mon, 14 May 2012 10:48:45 +0200
Message-ID: <20120514104845.43ce9dea@lmajewski.digital.local>
References: <1336655818-15136-1-git-send-email-l.majewski@samsung.com>
 <1336655818-15136-4-git-send-email-l.majewski@samsung.com>
 <4FAF0964.9030704@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:64746 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754489Ab2ENIsy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 May 2012 04:48:54 -0400
Received: from euspt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M4000BBC8HSA230@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 May 2012 09:49:04 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M400059F8HFCV@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 May 2012 09:48:51 +0100 (BST)
In-reply-to: <4FAF0964.9030704@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>

Hi Kukjin,

> Oops, happens build error...
> 
> arch/arm/mach-s5pv210/mach-goni.c: In function 'goni_machine_init':
> arch/arm/mach-s5pv210/mach-goni.c:947: error: implicit declaration of 
> function 's3c_hsotg_set_platdata'

Thanks for applying patches.

Regarding the build error:

After applying following patches on top of yours for next
(linux-samsung/for-next) the problem with build error doesn't appear
anymore.

Link to USB HSOTG patch series:

http://permalink.gmane.org/gmane.linux.usb.general/62101
"usb:hsotg:samsung USB S3C-HSOTG driver fixes and code cleanup"

Moreover those patches have been already applied to Greg-KH's usb-next
branch an will be released with 3.5 kernel.

-- 
Best regards,

Lukasz Majewski

Samsung Poland R&D Center | Linux Platform Group
