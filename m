From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: S5P6440: Add External Interrupt support
Date: Tue, 25 May 2010 00:01:51 +0100
Message-ID: <20100524230151.GB27833@n2100.arm.linux.org.uk>
References: <1274687220-871-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:40994 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755806Ab0EXXCC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 May 2010 19:02:02 -0400
Content-Disposition: inline
In-Reply-To: <1274687220-871-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.ab@samsung.com>, ben-linux@fluff.org

On Mon, May 24, 2010 at 04:47:00PM +0900, Kukjin Kim wrote:
> +#include <asm/hardware/vic.h>

Doesn't seem to use this header.
