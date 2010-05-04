From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: S3C6410 power management support status
Date: Tue, 4 May 2010 01:24:20 +0100
Message-ID: <20100504002420.GQ6684@trinity.fluff.org>
References: <20100429124509.GA11290@jeknote.loshitsa1.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:54973 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932283Ab0EDAY0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 May 2010 20:24:26 -0400
Content-Disposition: inline
In-Reply-To: <20100429124509.GA11290@jeknote.loshitsa1.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
Cc: linux-arm-kernel@lists.infradead.org, Vladimir Semyonov <vladimir.semyonov@promwad.com>, linux-samsung-soc@vger.kernel.org, Vladimir Davydov <vladimir.davydov@promwad.com>, Ben Dooks <ben-linux@fluff.org>

On Thu, Apr 29, 2010 at 03:45:09PM +0300, Yauhen Kharuzhy wrote:
> Hi.
> 
> Can anybody explain current status of S3C6410 power management support
> in mainline? Suspend-to-RAM looks completely broken in the current
> Linus's git tree.

I'd prefer if you didn't make sweeping accusations about the state of
a given piece of the kernel without having a good look first. From reading
your second post, it seems that what is actually the problem is that the
64XX support only currently handles wakeup configurations from the EINT
pins.


-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
