From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH stable-4.0] ARM: EXYNOS: Fix failed second suspend on
 Exynos4
Date: Sat, 20 Jun 2015 07:45:10 -0700
Message-ID: <20150620144510.GB27844@kroah.com>
References: <1433315006-30129-1-git-send-email-k.kozlowski@samsung.com>
 <5585333E.8010001@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:59659 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754547AbbFTOpL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 20 Jun 2015 10:45:11 -0400
Content-Disposition: inline
In-Reply-To: <5585333E.8010001@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: stable@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, b.zolnierkie@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org

On Sat, Jun 20, 2015 at 06:32:46PM +0900, Krzysztof Kozlowski wrote:
> Hi Greg,
> 
> I backported the patch below for stable 4.0. It seems it was missed or
> maybe I sent it the wrong way? The backport was mailed to
> stable@vger.kernel.org
> 
> Is the patch queued for next 4.0 stable release? Should I resent it?

It's still in the to-apply queue, which is a few hundred patches long.
Don't worry, it's not lost, just in good company with other patches I'll
get to eventually.

thanks,

greg k-h
