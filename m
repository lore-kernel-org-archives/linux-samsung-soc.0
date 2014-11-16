From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: dts: Explicitly set dr_mode on exynos5250-snow
Date: Sun, 16 Nov 2014 10:17:14 +0900
Message-ID: <00ee01d0013b$0f4ac140$2de043c0$@kernel.org>
References: <1415994379-29165-1-git-send-email-sjoerd.simons@collabora.co.uk>
 <CABxcv=k6rkatN0NSq-gkGA+ZS1chS-bcXu=Nxk+Uf=WuPrKR5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63333 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754768AbaKPBRT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Nov 2014 20:17:19 -0500
In-reply-to: <CABxcv=k6rkatN0NSq-gkGA+ZS1chS-bcXu=Nxk+Uf=WuPrKR5w@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Javier Martinez Canillas' <javier@dowhile0.org>, 'Sjoerd Simons' <sjoerd.simons@collabora.co.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org

Javier Martinez Canillas wrote:
> 
> Hello Sjoerd,
> 
Hi,

> On Fri, Nov 14, 2014 at 8:46 PM, Sjoerd Simons
> <sjoerd.simons@collabora.co.uk> wrote:
> > Explicitly set the dr_mode for the dwc3 controller on the
> > Snow board to host mode. This is required to ensure the
> > controller is initialized in the right mode if the kernel is
> > build with USB gadget support.
> 
> The patch looks good to me.
> 
> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> 
> Kukjin,
> 
> I think $subject is -rc material since this issue is seen after commit
> 508423b ("ARM: exynos_defconfig: enable USB gadget support") which
> landed in 3.18.
> 
Yeah, you're right. I'll queue this into -fixes for 3.18.

Thanks,
Kukjin
