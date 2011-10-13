From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] gpio: exynos4: Add device tree support
Date: Wed, 12 Oct 2011 18:58:55 -0600
Message-ID: <20111013005855.GJ14042@ponder.secretlab.ca>
References: <1318320974-9879-1-git-send-email-thomas.abraham@linaro.org>
 <069c01cc88e3$92f86d90$b8e948b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:37575 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752400Ab1JMCZb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Oct 2011 22:25:31 -0400
Received: by ggnv2 with SMTP id v2so1322035ggn.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Oct 2011 19:25:31 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <069c01cc88e3$92f86d90$b8e948b0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Wed, Oct 12, 2011 at 10:33:48PM +0900, Kukjin Kim wrote:
> Thomas Abraham wrote:
> > 
> > As gpio chips get registered, a device tree node which represents the
> > gpio chip is searched and attached to it. A translate function is also
> > provided to convert the gpio specifier into actual platform settings
> > for pin function selection, pull up/down and driver strength settings.
> > 
> > Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> 
> Hi Thomas,
> 
> You got some comments from Rob, so could you please address from him?
> Others, looks ok to me.
> 
> And I need to get the ack from Grant to upstream via Samsung tree for
> upcoming merge window.
> Grant, is this ok for you?

Yes, go ahead and merge it with my:

Acked-by: Grant Likely <grant.likely@secretlab.ca>

g.
