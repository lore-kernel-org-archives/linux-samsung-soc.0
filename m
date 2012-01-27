From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 0/6] ARM: SAMSUNG: Board updates and minor fixes
Date: Fri, 27 Jan 2012 10:25:18 +0100
Message-ID: <4F226D7E.1090408@samsung.com>
References: <1327501407-1927-1-git-send-email-s.nawrocki@samsung.com>
 <016901ccdc93$c79a8e80$56cfab80$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:44836 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751517Ab2A0JZW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jan 2012 04:25:22 -0500
Received: from euspt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LYG00ATIA677X20@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 09:25:19 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LYG0067ZA67MN@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 09:25:19 +0000 (GMT)
In-reply-to: <016901ccdc93$c79a8e80$56cfab80$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, riverful.kim@samsung.com, sw0312.kim@samsung.com

On 01/27/2012 02:34 AM, Kukjin Kim wrote:
> OK, looks good to me, will apply in my v3.3-samsung-fixes-2 for 6/6 and
> next/board-samsung for others.

Thank you, it would be good to also get patches 4/6, 5/6,

ARM: SAMSUNG: Correct M-5MOLS sensor clock frequency on Nuri board
ARM: SAMSUNG: Correct framebuffer window size on Nuri board

in for 3.3 as well. But if it's too much trouble please just queue them
for 3.4.

> And I'm not sure some board updates are for fix now so if required, please
> let me know.
> 
> Plus, I looked at some wrong alignment(tab and white space?) in your
> patches, so if you don't mind, let me fix it when I apply.

Hmm, I thought I've double checked those things, but anyway sorry
for overlooking. And please feel free correct if required.

--
Thanks!
Sylwester
