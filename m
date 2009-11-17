From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH v3] Update Samsung S5PC100 SoC support
Date: Tue, 17 Nov 2009 23:53:11 +0000
Message-ID: <20091117235311.GZ23772@trinity.fluff.org>
References: <1258443684-19525-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:38483 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750772AbZKQXxJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Nov 2009 18:53:09 -0500
Content-Disposition: inline
In-Reply-To: <1258443684-19525-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, ben-linux@fluff.org, bhmin@samsung.com

On Tue, Nov 17, 2009 at 08:41:10AM +0100, Marek Szyprowski wrote:
> Hello,
> 
> This patch series updates Samsung S5PC100 SoC support. S5PC100 platform
> core has been extended with new clocks hierarchy implementation, gpio lib,
> support for external and gpio interrupts and some basics of power
> management (cpu idle and system reset). Also platform helpers for
> s3c framebuffer, i2c and hsmmc drivers has been added.
> 
> All these patches has been tested on SMDKC100 board.

Hi, next time, --no-chain-reply-to please so that we don't end up
with messages wandering off the edge of the screen.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
