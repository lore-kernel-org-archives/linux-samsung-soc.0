From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] I2C: EXYNOS: High speed mode clock setting for HSI2C
Date: Fri, 19 Apr 2013 20:35:08 +0200
Message-ID: <20130419183508.GC3702@the-dreams.de>
References: <1366372583-7584-1-git-send-email-yuvaraj.cd@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:33151 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753203Ab3DSSfK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Apr 2013 14:35:10 -0400
Content-Disposition: inline
In-Reply-To: <1366372583-7584-1-git-send-email-yuvaraj.cd@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ch.naveen@samsung.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

On Fri, Apr 19, 2013 at 05:26:23PM +0530, Yuvaraj Kumar C D wrote:
> This patch configure the High speed mode timing register using the
> clock speed mentioned in the dts file.Also it configure the MASTER_ID
> for High speed i2c transfer.
> For i2c high speed transaction, tarnsaction initially starts with the
> fast mode i,e 400Kbits/sec and then switches to high speed mode.For this
> purpose it requires to set up timing value for fast mode and high speed
> mode.
> 
> Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

Since the exynos5 driver needs to be resent anyhow, I assume this will
be included in the next version? Please note that I had comments
regarding the bindings of the bus speed. We have a generic binding for
that already.

Thanks,

   Wolfram
