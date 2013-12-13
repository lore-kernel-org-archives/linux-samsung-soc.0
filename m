From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH v2 1/7] usb: dwc3: keystone: add basic PM support
Date: Thu, 12 Dec 2013 19:29:24 -0500
Message-ID: <52AA54E4.5000606@ti.com>
References: <20131212214306.GS1939@saruman.home> <1386884755-12366-1-git-send-email-balbi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:35556 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751606Ab3LMA3u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Dec 2013 19:29:50 -0500
In-Reply-To: <1386884755-12366-1-git-send-email-balbi@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>, kgene.kim@samsung.com, Linux ARM Kernel Mailing List <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, Linux OMAP Mailing List <linux-omap@vger.kernel.org>, w-kwok2@ti.com

On Thursday 12 December 2013 04:45 PM, Felipe Balbi wrote:
> A bare-minimum PM implementation which will
> server as building block for more complex
s/server/serve ;-)
> PM implementation in the future.
> 
> At the least will not leave clocks on unnecessarily
> when e.g.  a user write mem to /sys/power/state.
> 
> Signed-off-by: Felipe Balbi <balbi@ti.com>
> ---
> 
> improve error path a little bit.
> 
We will test this out. Thanks for the
patch Felipe.

Regards,
Santosh
