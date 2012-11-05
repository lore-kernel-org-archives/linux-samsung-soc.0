From: Shubhrajyoti Datta <omaplinuxkernel@gmail.com>
Subject: Re: [PATCH 2/2] i2c-s3c2410: Convert to devm_request_and_ioremap()
Date: Mon, 5 Nov 2012 17:21:03 +0530
Message-ID: <CAM=Q2cuV5V4db8TU-mz+htqnL9MLPB0q-uwxSKFgV6BUB2866A@mail.gmail.com>
References: <1352104419-31630-1-git-send-email-broonie@opensource.wolfsonmicro.com>
	<1352104419-31630-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:54333 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753479Ab2KELvF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Nov 2012 06:51:05 -0500
In-Reply-To: <1352104419-31630-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Wolfram Sang <w.sang@pengutronix.de>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On Mon, Nov 5, 2012 at 2:03 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> A small code saving and less error handling to worry about.
>
Looks good.

request irq could be devm_* also. Not an objection though.
