From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] Update Samsung S5PC100 SoC support
Date: Sat, 14 Nov 2009 08:21:48 +0000
Message-ID: <20091114082148.GA18513@n2100.arm.linux.org.uk>
References: <1258014122-18185-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:40091 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753693AbZKNIV7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 14 Nov 2009 03:21:59 -0500
Content-Disposition: inline
In-Reply-To: <1258014122-18185-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, laforge@gnumonks.org, kyungmin.park@samsung.com, bhmin@samsung.com, ben-linux@fluff.org

On Thu, Nov 12, 2009 at 09:21:44AM +0100, Marek Szyprowski wrote:
> This patch series updates Samsung S5PC100 SoC support.

Please go through all patches in this series looking for mach/gpio.h,
asm/io.h, asm/gpio.h include statements, and change them to their linux/
equivalents.  There's a number of such things in this patch set.
