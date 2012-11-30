From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 2/2] i2c-s3c2410: Add bus arbitration implementation
Date: Thu, 29 Nov 2012 18:13:01 -0800
Message-ID: <CAPnjgZ0atD3k=gT0vjgkLO_SA8DMak6SiT6nZ_2T6WFqtK0szQ@mail.gmail.com>
References: <1354165536-18529-1-git-send-email-ch.naveen@samsung.com>
	<1354165536-18529-3-git-send-email-ch.naveen@samsung.com>
	<20121129163448.GA3761@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:49920 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755268Ab2K3CNC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Nov 2012 21:13:02 -0500
Received: by mail-ob0-f174.google.com with SMTP id wc20so13765823obb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Nov 2012 18:13:02 -0800 (PST)
In-Reply-To: <20121129163448.GA3761@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, grundler@chromium.org, naveen@chromium.org, w.sang@pengutronix.de, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>

+Olof

On Thu, Nov 29, 2012 at 8:34 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Thu, Nov 29, 2012 at 10:35:35AM +0530, Naveen Krishna Chatradhi wrote:
>
>> The arbitrator is a general purpose function which uses two GPIOs to
>> communicate with another device to claim/release a bus. We use it to
>> arbitrate an i2c port between the AP and the EC.
>
> Should this not be layerd on top of the I2C controller rather than part
> of the controller driver?  It doesn't seem terribly controller specific.

It was originally done separately but I think it was felt that this
was overly complex. Olof can you please comment on this?

Regards,
Simon
