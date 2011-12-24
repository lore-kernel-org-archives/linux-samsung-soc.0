From: Angus Gratton <gus@projectgus.com>
Subject: Re: PATCH: ARM: S5PV210: Add USB EHCI support for SMDKV210 board
Date: Sat, 24 Dec 2011 17:08:47 +1100
Message-ID: <1324706927.26918.33.camel@gorgon.lan>
References: <1324693303.26918.27.camel@gorgon.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caiajhbdcbef.dreamhost.com ([208.97.132.145]:53634 "EHLO
	homiemail-a29.g.dreamhost.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752277Ab1LXGI6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 Dec 2011 01:08:58 -0500
Received: from homiemail-a29.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a29.g.dreamhost.com (Postfix) with ESMTP id C3122674058
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Dec 2011 22:08:55 -0800 (PST)
Received: from [192.168.9.58] (ppp121-45-209-218.lns20.cbr1.internode.on.net [121.45.209.218])
	(using SSLv3 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: gus@projectgus.com)
	by homiemail-a29.g.dreamhost.com (Postfix) with ESMTPSA id 3278E674057
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Dec 2011 22:08:55 -0800 (PST)
In-Reply-To: <1324693303.26918.27.camel@gorgon.lan>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

On Sat, 2011-12-24 at 13:21 +1100, Angus Gratton wrote:
> Signed-off-by: Angus Gratton <gus@projectgus.com>
> 
> ---
> (This is my first kernel patch submission, so apologies in advance for
> any mistakes.)
> 
> Support is adapted from in EHCI in an older kernel & from the current
> mach-exynos EHCI support. I've tried to duplicate the mach-exynos code
> layout.
> 
> I don't actually have an SMDKV210 board to test on, this is tested on a
> SMDKV210-derived product called a Flexiview FV-1. I believe this should
> work on SMDKV210, and probably other S5PV210 boards, though.

Eck, sorry I might have sent this patch a bit early. Please disregard
for now.

On my hardware USB devices initially come up happily, but sustained
reads or writes eventually cause unexpected device resets and errors.

This doesn't happen with $vendorblobkernel so I must be doing something
wrong. Will keep trying.

Sorry again,

Angus
