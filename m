From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 2/2] h1940-leds: Fix compile issue introduced by latch-related changes
Date: Wed, 17 Nov 2010 08:55:47 +0200
Message-ID: <201011170855.47991.anarsoul@gmail.com>
References: <1289248308-21272-1-git-send-email-anarsoul@gmail.com> <1289248308-21272-2-git-send-email-anarsoul@gmail.com> <4CE30FFA.7000204@fluff.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:40439 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759671Ab0KQG4l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Nov 2010 01:56:41 -0500
Received: by ewy8 with SMTP id 8so942822ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Nov 2010 22:56:40 -0800 (PST)
In-Reply-To: <4CE30FFA.7000204@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>

On Wednesday 17 November 2010 01:12:58 Ben Dooks wrote:

> it's a pitty we can't remove the driver totally and use the
> gpio leds.

Why? It's possible to use leds-gpio driver. Additional gpios (blink, etc) can 
be handled via platform_gpio_blink_set callback.

Regards
Vasily
