From: Ian Campbell <ian.campbell@citrix.com>
Subject: Re: [PATCH] arm/mach-exynos: suspend: Don't try to initialize
 suspend/suspend on old DT
Date: Thu, 14 May 2015 09:50:13 +0100
Message-ID: <1431593413.13579.9.camel@citrix.com>
References: <1431438307-25410-1-git-send-email-julien.grall@citrix.com>
	 <555235FB.3040804@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.citrix.com ([66.165.176.89]:54352 "EHLO SMTP.CITRIX.COM"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752977AbbENIuQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 May 2015 04:50:16 -0400
In-Reply-To: <555235FB.3040804@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Julien Grall <julien.grall@citrix.com>, marc.zyngier@arm.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Wed, 2015-05-13 at 02:18 +0900, Kukjin Kim wrote:
> On 05/12/15 22:45, Julien Grall wrote:
> > Since commit 8b283c0 "ARM: exynos4/5: convert pmu wakeup to stacked domains",
> > a suspend/resume is not supported on old DT.
[...]
> I'm fine on this, applied.

Thanks. Do you also plan to send it to Linus (or to whomeever you feed
things through) for 4.1-rc$NEXT?

Cheers,
Ian.
