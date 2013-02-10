From: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [RFC] i2c: Providing hooks for i2c multimaster bus arbitration.
Date: Sun, 10 Feb 2013 19:17:10 +0100
Message-ID: <20130210181710.GB12760@nekote.pengutronix.de>
References: <1359968595-21291-1-git-send-email-yuvaraj.cd@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:43710 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756365Ab3BJSRN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Feb 2013 13:17:13 -0500
Content-Disposition: inline
In-Reply-To: <1359968595-21291-1-git-send-email-yuvaraj.cd@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, broonie@opensource.wolfsonmicro.com, ch.naveen@samsung.com, sjg@chromium.org, grundler@chromium.org, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

On Mon, Feb 04, 2013 at 02:33:15PM +0530, Yuvaraj Kumar C D wrote:
> This RFC patch is w.r.t multimaster bus arbitration which is already
> being discussing in the mainline.
> This patch provides hooks for the i2c multimaster bus arbitration
> and to have the arbitration parameters.

I still haven't understood why the arbitration specified in the I2C
standard is not enough for you. Or what you would need to make use of
it.

Thanks,

   Wolfram
