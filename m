From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v7 1/2] drivers: base: add support for registering
 notifier about deferred probe
Date: Thu, 14 Apr 2016 14:51:39 -0700
Message-ID: <20160414215139.GA11535@kroah.com>
References: <1460540160-18762-1-git-send-email-m.szyprowski@samsung.com>
 <1460540160-18762-2-git-send-email-m.szyprowski@samsung.com>
 <20160413141254.GB12749@kroah.com>
 <570F4886.20203@samsung.com>
 <20160414211745.GA27692@kroah.com>
 <20160414213322.GW19428@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:41633 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751500AbcDNVvk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Apr 2016 17:51:40 -0400
Content-Disposition: inline
In-Reply-To: <20160414213322.GW19428@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Thu, Apr 14, 2016 at 10:33:22PM +0100, Russell King - ARM Linux wrote:
> The problem that's being addressed here is that there's no way at the
> moment to know when the drivers on a different bus (namely the platform
> bus) have probed and are providing the clock and power domain resources
> necessary to be able to read these identifying values.
> 
> I guess if you don't like a notifier, the other alternative is to
> setup a delayed workqueue and have the workqueue repeatedly attempt
> to register the devices until they all succeed.  That's not
> particularly nice, because we'd be wasting CPU cycles running
> that workqueue for no reason until all the devices get registered.

I like that idea, it handles the issue of this crazy hardware where it
belongs, in that bus subsystem :)

thanks,

greg k-h
