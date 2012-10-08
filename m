From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/2] ARM: Exynos4: Register clocks via common clock
 framework
Date: Mon, 08 Oct 2012 09:31:16 +0200
Message-ID: <1888016.dshEnlClG6@amdc1227>
References: <1349093361-18820-1-git-send-email-thomas.abraham@linaro.org>
 <2552746.GKROWAIKW8@amdc1227>
 <CAJuYYwQCPOFMnQrA-n42hQFtK3TXQtJSjkQZmVgh_4pqnMi8iw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36063 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753750Ab2JHHbW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Oct 2012 03:31:22 -0400
In-reply-to: <CAJuYYwQCPOFMnQrA-n42hQFtK3TXQtJSjkQZmVgh_4pqnMi8iw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: chander.kashyap@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, mturquette@linaro.org, mturquette@ti.com, linux-kernel@vger.kernel.org

On Monday 08 of October 2012 12:04:18 Thomas Abraham wrote:
> Hi Tomasz,
> 
> On 3 October 2012 19:40, Tomasz Figa <t.figa@samsung.com> wrote:
> > Hi Chander, Thomas,
> > 
> > I can see one more problem here.
> > 
> > Based on the fact that sdhci-s3c driver receives only the endpoint gate
> > clock (hsmmc), doesn't the following setup make the driver unable to
> > change the frequency of this clock?
> 
> The driver never changes the clock frequency of the core system clocks
> nor of the endpoint. There are internal dividers inside the sdhci
> controller which are divide to acheive required clock speed.

What is the use of sdhci_cmu_set_clock (which calls clk_set_rate) in sdhci-
s3c, then?

I think you are missing CLK_SET_RATE_PARENT flags in clocks of which rate 
can be changed by the driver.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
