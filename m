From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2] ARM: S5PV210: Add GONI board setup for CIF camera
	support
Date: Tue, 15 Feb 2011 16:31:28 +0100
Message-ID: <4D5A9C50.4080408@samsung.com>
References: <1297445273-3829-1-git-send-email-s.nawrocki@samsung.com>
 <008d01cbccd4$3897da00$a9c78e00$%kim@samsung.com>
 <4D5A3F31.1070106@samsung.com>
 <00a801cbccfa$df478e10$9dd6aa30$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:25643 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751198Ab1BOPbb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Feb 2011 10:31:31 -0500
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LGO001HI0GHJ630@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Feb 2011 15:31:29 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LGO0099N0GG2F@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Feb 2011 15:31:29 +0000 (GMT)
In-reply-to: <00a801cbccfa$df478e10$9dd6aa30$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com

Hi Kukjin,

On 02/15/2011 11:26 AM, Kukjin Kim wrote:
> Sylwester Nawrocki wrote:
>>
...
> 
> As a note, I received request about common phy control from Marek. So I will
> re-think with your mipi phy patches, then let you know about that soon.
> 

OK, thanks. It looks like treating PHYs as clocks would cause least trouble.
Some of PHYs are really not much different than clocks, they generate a carrier
of some frequency, like for example HDMI PHY. Some even have their own divider.

We thought about creating an API for PHYs, similar to clock API. There is
quite many PHYs in S5P SoCs - SATA, USB, MIPI, HDMI devices have them.
Such a PHY API would be mostly doubling the clock API functionality though.

We also cannot easily create common helpers in plat-s5p for mipi because
of the different headers issue. 

So we have 3 options if it comes to mipi:
1. create helper functions in relevant mach-s5p* directories 
2. register special clocks with own enable/disable functions
3. create separate API to manage all PHY's in the SoC series

MIPI PHY issue is a blocking point for a mipi-csi driver inclusion.
It has been ready for quite some time yet and I would appreciate
if we could take time to finally work out compromise.


Regards,
-- 
Sylwester Nawrocki
Samsung Poland R&D Center
