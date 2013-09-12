From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: Correct typo in use of samsung,pin-drv for
 exynos5250
Date: Thu, 12 Sep 2013 13:18:50 +0200
Message-ID: <2142402.fOjkrj57SH@amdc1227>
References: <1378498192-5163-1-git-send-email-al.stone@linaro.org>
 <6027618.yAIjZoXqyG@amdc1227> <522DE50F.7030602@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:35958 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751533Ab3ILLS5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 07:18:57 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MT0003OJFFDQ480@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Sep 2013 12:18:56 +0100 (BST)
In-reply-to: <522DE50F.7030602@redhat.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Al Stone <ahs3@redhat.com>
Cc: al.stone@linaro.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, linaro-acpi@lists.linaro.org

On Monday 09 of September 2013 09:11:11 Al Stone wrote:
> On 09/09/2013 03:00 AM, Tomasz Figa wrote:
> > Hi Al,
> > 
> > On Friday 06 of September 2013 14:09:52 al.stone@linaro.org wrote:
> >> From: Al Stone <ahs3@redhat.com>
> >> 
> >>     Corrects an obvious typo in the Arndale pinctrl descriptions in
> >>     DT.
> >>     The samsung-pinctrl driver uses the correct name.
> > 
> > Thanks for spotting this. The patch looks good to me, but is it tested
> > on some Exynos 5250 based board?
> 
> Only with a simple boot test on an Arndale, and making sure that dtc
> could actually build the dtb.  I did not test the driver code.  I did
> read through the code and it appeared to be doing the right things,
> based on the content of the DT, but I did not do an active test of that.

OK. I'm able to do exactly the same testing as you did, so let's say I'm 
fine with this patch.

Acked-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
