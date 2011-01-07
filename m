From: Will Newton <will.newton@gmail.com>
Subject: Re: [PATCH] mmc: mshci: Add support Mobile Storage Host Controller Interface
Date: Fri, 7 Jan 2011 16:03:48 +0000
Message-ID: <AANLkTimQSQ2GViH3VFj6Z+beuwRStPGJqzqMpxZkYjMo@mail.gmail.com>
References: <1294399237-5716-1-git-send-email-kgene.kim@samsung.com>
	<20110107115123.GD32436@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:60100 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753270Ab1AGQDs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Jan 2011 11:03:48 -0500
In-Reply-To: <20110107115123.GD32436@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-mmc@vger.kernel.org, ben-linux@fluff.org, akpm@linux-foundation.org, cjb@laptop.org, Hyunsung Jang <hs79.jang@samsung.com>, Hyuk Lee <hyuk1.lee@samsung.com>

On Fri, Jan 7, 2011 at 11:51 AM, Wolfram Sang <w.sang@pengutronix.de> wrote:
>
>> The 'mshci.c' is based on 'linux/drivers/mmc/host/sdhci.c' and
>> the role is exactly same with that.
>
> Can you sum up the differences why you cannot sdhci.c directly, please?

The driver looks like it is for the same block (or very close) to the
Synopsys DesignWare IP driver I submitted last month called dw_mmc. It
would be interesting to see if that driver might be a suitable
replacement.
