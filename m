From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: Ask for help on SPI slave side driver support
Date: Mon, 30 Sep 2013 01:20:42 +0200
Message-ID: <4025277.bhF6fFGQqq@flatron>
References: <23ff6b10.bf1d.1416a88321f.Coremail.youshenghui0322@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f43.google.com ([74.125.83.43]:41048 "EHLO
	mail-ee0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753012Ab3I2XUp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 29 Sep 2013 19:20:45 -0400
In-Reply-To: <23ff6b10.bf1d.1416a88321f.Coremail.youshenghui0322@163.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YouShenghui <youshenghui0322@163.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org

Hi,

[Ccing Mark Brown, maintainer of Linux SPI subsystem]

On Monday 30 of September 2013 00:23:32 YouShenghui wrote:
> Hi Samsung expert,
> I am working a project that need spi slave side driver support in
> smdk6410 in linux. I am connecting two 6410 board with spi bus, one
> side as master, the other as slave. Data is passed from one side to the
> other. I looked over spi related code in kernel and only find spi
> master support. I see
> http://www.spinics.net/lists/arm-kernel/msg73403.html that said there
> was already spi slave support in Samsungs current code. Could you give
> me a suggestion where I could find that code? I would like to port
> slave side support code to my code though it's not upstream yet.

Mark will probably know better, but AFAIK there is no API for slave mode 
SPI available in Linux kernel. Please correct me if I'm wrong.

The code mentioned in the post from your link was some internal vendor 
code, which is unlikely to be available publicly. However support for 
slave mode from hardware side seems more or less similar to master mode, 
which means that assuming you can add some kernel API for it, the 
modification to the spi-s3c64xx wouldn't be too big.

Best regards,
Tomasz
