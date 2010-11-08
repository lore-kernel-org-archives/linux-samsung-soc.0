From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: Build error with s3c2410_defconfig
Date: Mon, 8 Nov 2010 10:59:02 +0200
Message-ID: <201011081059.03095.anarsoul@gmail.com>
References: <001001cb7f14$cace6af0$606b40d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:48365 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752224Ab0KHI7p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Nov 2010 03:59:45 -0500
Received: by eye27 with SMTP id 27so2623520eye.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Nov 2010 00:59:44 -0800 (PST)
In-Reply-To: <001001cb7f14$cace6af0$606b40d0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Monday 08 November 2010 09:15:55 Kukjin Kim wrote:
> Hi Vasily,
> 
> Now, happens following build error due to commit
> 14477095abc661a9f195ca4733bb739c54794b32 'ARM: h1940: Use gpiolib for latch
> access' with s3c2410_defconfig.
> 
> drivers/leds/leds-h1940.c: In function 'h1940_greenled_set':
> drivers/leds/leds-h1940.c:33: error: implicit declaration of function
> 'h1940_latch_control'
> 
> The h1940_greenled_set(), h1940_redled_set(), and h1940_blueled_set() in
> drivers/leds/leds-h1940.c call h1940_latch_control()...
> 
> Need to fix it up.
> 
> Thanks.

Hi, I'm aware of a problem, will fix and send patch tonight (however, 
h1940_leds driver should be marked as deprecated)
