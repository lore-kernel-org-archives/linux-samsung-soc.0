From: Shubhrajyoti Datta <omaplinuxkernel@gmail.com>
Subject: Re: [PATCH 2/2] i2c-s3c2410: Convert to devm_request_and_ioremap()
Date: Tue, 6 Nov 2012 13:42:31 +0530
Message-ID: <CAM=Q2cuYJ8QVcEL0G06SXORs_UFZvkzXx-y295wB5JUKfcTjWw@mail.gmail.com>
References: <1352104419-31630-1-git-send-email-broonie@opensource.wolfsonmicro.com>
	<1352104419-31630-2-git-send-email-broonie@opensource.wolfsonmicro.com>
	<CAM=Q2cuV5V4db8TU-mz+htqnL9MLPB0q-uwxSKFgV6BUB2866A@mail.gmail.com>
	<20121106081003.GA3283@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:36737 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754002Ab2KFIMd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Nov 2012 03:12:33 -0500
In-Reply-To: <20121106081003.GA3283@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Wolfram Sang <w.sang@pengutronix.de>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On Tue, Nov 6, 2012 at 1:40 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Mon, Nov 05, 2012 at 05:21:03PM +0530, Shubhrajyoti Datta wrote:
>> On Mon, Nov 5, 2012 at 2:03 PM, Mark Brown
>> <broonie@opensource.wolfsonmicro.com> wrote:
>> > A small code saving and less error handling to worry about.
>
>> Looks good.
>
>> request irq could be devm_* also. Not an objection though.
>
> devm_ is a much worse idea for IRQs than for other resource types since
> interrupts are delivered asynchronously.  Using it safely requires that
> we do the analysis required to make sure that the hardware is totally
> idle and can't interrupt.

hmm  thats true.
thanks,
