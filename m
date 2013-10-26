From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 4/5] usb: ehci-s5p: Change to use phy provided by the
 generic phy framework
Date: Sat, 26 Oct 2013 10:27:23 +0900
Message-ID: <003101ced1ea$85f7e010$91e7a030$%han@samsung.com>
References: <1382710529-12082-1-git-send-email-k.debski@samsung.com>
 <1382710529-12082-5-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48901 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753222Ab3JZB1Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Oct 2013 21:27:25 -0400
In-reply-to: <1382710529-12082-5-git-send-email-k.debski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kamil Debski' <k.debski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Kishon Vijay Abraham I' <kishon@ti.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Vivek Gautam' <gautam.vivek@samsung.com>, 'Mateusz Krawczuk' <mat.krawczuk@gmail.com>, 'Jingoo Han' <jg1.han@samsung.com>

On Friday, October 25, 2013 11:15 PM, Kamil Debski wrote:
> 
> Change the phy provider used from the old usb phy specific to a new one
> using the generic phy framework.
> 
> Signed-off-by: Kamil Debski <k.debski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/usb/host/ehci-s5p.c |   21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)

Hi Kamil Debski,
It looks good. :-)

However, could you re-basing against Greg's 'usb-next' branch?
Now, the file name of 'ehci-s5p.c' is renamed to 'ehci-exynos.c'.
Also, 'Generic PHY Framework' was already merged to Greg's
'usb-next' branch.

Thank you.

Best regards,
Jingoo Han
