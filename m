From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH] arm/mach-exynos: suspend: Don't try to initializesuspend/suspend
 on old DT
Date: Sat, 16 May 2015 12:45:30 +0900
Message-ID: <5556BD5A.5010701@kernel.org>
References: <1431438307-25410-1-git-send-email-julien.grall@citrix.com> <555235FB.3040804@kernel.org> <1431593413.13579.9.camel@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:40538 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S2992648AbbEPDpi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 May 2015 23:45:38 -0400
In-Reply-To: <1431593413.13579.9.camel@citrix.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ian Campbell <ian.campbell@citrix.com>
Cc: Kukjin Kim <kgene@kernel.org>, Julien Grall <julien.grall@citrix.com>, marc.zyngier@arm.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 05/14/15 17:50, Ian Campbell wrote:
> On Wed, 2015-05-13 at 02:18 +0900, Kukjin Kim wrote:
>> On 05/12/15 22:45, Julien Grall wrote:
>>> Since commit 8b283c0 "ARM: exynos4/5: convert pmu wakeup to stacked domains",
>>> a suspend/resume is not supported on old DT.
> [...]
>> I'm fine on this, applied.
> 
> Thanks. Do you also plan to send it to Linus (or to whomeever you feed
> things through) for 4.1-rc$NEXT?
> 
Already it has been sent to Linus via arm-soc. I think, it should be
fine after v4.1-rc4?

- Kukjin
