From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 2/2] ARM: S5P: Add 64bit PWM timer counter for
	sched_clock
Date: Sat, 28 May 2011 08:17:10 +0100
Message-ID: <20110528071710.GU24876@n2100.arm.linux.org.uk>
References: <1306534210-32659-1-git-send-email-kgene.kim@samsung.com> <1306534210-32659-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:33461 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752021Ab1E1HR0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 28 May 2011 03:17:26 -0400
Content-Disposition: inline
In-Reply-To: <1306534210-32659-2-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>

On Fri, May 27, 2011 at 03:10:10PM -0700, Kukjin Kim wrote:
> From: Sangbeom Kim <sbkim73@samsung.com>
> 
> Basically, PWM timer works with 33Mhz on S5P SoCs and counter
> overflow every 128 secs. So it is needed 64-bit counter for
> supporting proper sched_clock() by 32-bit timer. This patch
> handle overflow control and can solve the problem of suspend
> to resume

NAK.

This patch is a backwards step, and adds a hell of a lot of complexity
which should already be dealt with in generic code.

What is "problem of suspend to resume" exactly?
