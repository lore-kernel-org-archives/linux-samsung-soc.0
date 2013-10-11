From: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V2 4/5] USB: ohci-exynos: Add missing usb_put_hcd()
Date: Fri, 11 Oct 2013 16:55:44 -0700
Message-ID: <20131011235544.GA2627@kroah.com>
References: <000101cec58b$ee8bd2f0$cba378d0$%han@samsung.com>
 <000501cec58c$41590750$c40b15f0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:49469 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754358Ab3JKXzp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Oct 2013 19:55:45 -0400
Content-Disposition: inline
In-Reply-To: <000501cec58c$41590750$c40b15f0$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Alan Stern' <stern@rowland.harvard.edu>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>

On Thu, Oct 10, 2013 at 04:42:22PM +0900, Jingoo Han wrote:
> When devm_usb_get_phy() fails, usb_put_hcd() should be called
> to prevent memory leak.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Already applied this one, thanks.

greg k-h
