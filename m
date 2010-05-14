From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2] ARM: S5P: Add System Timer
Date: Fri, 14 May 2010 10:06:36 +0100
Message-ID: <20100514090636.GA10339@n2100.arm.linux.org.uk>
References: <1273827090-26635-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:40163 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751499Ab0ENJGu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 May 2010 05:06:50 -0400
Content-Disposition: inline
In-Reply-To: <1273827090-26635-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Jongpill Lee <boyko@samsung.com>, Jongpill Lee <boyko.lee@samsung.com>, ben-linux@fluff.org

On Fri, May 14, 2010 at 05:51:30PM +0900, Kukjin Kim wrote:
> From: Jongpill Lee <boyko@samsung.com>
> 
> This patch addes system timer for Samsung S5P series SoCs

You really should be using the clockevents/clocksource code rather
than trying to implement the old gettimeoffset stuff.
