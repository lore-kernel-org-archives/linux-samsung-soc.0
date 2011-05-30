From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: EXYNOS4: Fix secondary CPU boot after wake-up
Date: Mon, 30 May 2011 22:54:04 +0100
Message-ID: <20110530215404.GB21382@n2100.arm.linux.org.uk>
References: <1306746781-21511-1-git-send-email-inderpal.s@samsung.com> <4DE36589.4080709@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:51271 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752655Ab1E3VyT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 May 2011 17:54:19 -0400
Content-Disposition: inline
In-Reply-To: <4DE36589.4080709@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: Inderpal Singh <inderpal.singh@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Inderpal Singh <inderpal.s@samsung.com>, kgene.kim@samsung.com, samsung@lists.linaro.org, patches@linaro.org

On Mon, May 30, 2011 at 03:08:17PM +0530, Santosh Shilimkar wrote:
> When do you plan to fix the SGI usage as discussed
> in above thread. I thought SGI1 usage was ok for OMAP,
> realview/versatile and MSM.

I'd like the use of the arbitary SGI1 to fade away, to be replaced with
something a little saner (eg, SGI0 being the first SGI).  That just
means you'll end up with a warning about SGI0 instead.  Let's just
ignore them for the time being (but please change to SGI0 anyway.)
