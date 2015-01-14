From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: power: reset: add driver for Hardkernel's Odroid boards
Date: Wed, 14 Jan 2015 16:17:01 +0100
Message-ID: <54B6886D.4070105@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:57319 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753248AbbANPXP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 10:23:15 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hello,

I've applied the two patches of this set onto torvalds/master (together
with some other patches), but I now encounter an 'internal error' when
doing a system reboot.

Here's the corresponding part of the kernel log:
http://www.math.uni-bielefeld.de/~tjakobi/archive/odroid_power_reset.txt

With best wishes,
Tobias
