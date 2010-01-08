From: Eric Miao <eric.y.miao@gmail.com>
Subject: Re: [PATCH] gpiolib: add gpio_lookup_chip() to get chip information
	for gpio
Date: Fri, 8 Jan 2010 15:30:36 +0800
Message-ID: <f17812d71001072330t7a9f7607v8b55b2fc346745e5@mail.gmail.com>
References: <1262932348-2888-1-git-send-email-ben-linux@fluff.org>
	<1262932348-2888-2-git-send-email-ben-linux@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from qw-out-2122.google.com ([74.125.92.27]:62292 "EHLO
	qw-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750799Ab0AHHa5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Jan 2010 02:30:57 -0500
In-Reply-To: <1262932348-2888-2-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 8, 2010 at 2:32 PM, Ben Dooks <ben-linux@fluff.org> wrote:
> Add a call to get the 'struct gpio_chip' pointer for a given gpio, so
> that core implementations which want to use gpiolib gpio numbering for
> things like mux configuration can get back to the gpio_chip that they
> registered without having to have their own list of gpio.
>
> This is especially useful for the Samsung S3C64XX series where the GPIO
> bank sizes can vary from 32 down to 3, making it difficult to store an
> array to convert a number to chip.
>

I think this is generally a good idea. Will most likely be useful to
pxa platforms as well. Not sure though if you want to export this
symbol as well since we do allow gpio chip drivers to be modules.
