From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] clk: exynos5250: Fix divider values for sclk_mmc{0,1,2,3}
Date: Mon, 08 Apr 2013 16:22:58 +0900
Message-ID: <2c9001ce3429$e5989a50$b0c9cef0$%kim@samsung.com>
References: <1364890840-20052-1-git-send-email-tushar.behera@linaro.org>
 <20130404213331.8665.7028@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:34202 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934379Ab3DHHXF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 03:23:05 -0400
In-reply-to: <20130404213331.8665.7028@quantum>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mike Turquette' <mturquette@linaro.org>, 'Tushar Behera' <tushar.behera@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org, 'Thomas Abraham' <thomas.abraham@linaro.org>

Mike Turquette wrote:
> 
> Quoting Tushar Behera (2013-04-02 01:20:40)
> > In legacy setup, sclk_mmc{0,1,2,3} used PRE_RATIO bit-field (8-bit wide)
> > instead of RATIO bit-field (4-bit wide) for dividing clock rate.
> >
> > With current common clock setup, we are using RATIO bit-field which
> > is creating FIFO read errors while accessing eMMC. Changing over to
> > use PRE_RATIO bit-field fixes this issue.
> >
> > dwmmc_exynos 12200000.dwmmc0: data FIFO error (status=00008020)
> > mmcblk0: error -5 transferring data, sector 1, nr 7, cmd response 0x900,
> card status 0x0
> > end_request: I/O error, dev mmcblk0, sector 1
> >
> > Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> > CC: Thomas Abraham <thomas.abraham@linaro.org>
> 
> I guess this will be applied through the samsung tree, so:
> 
> Acked-by: Mike Turquette <mturquette@linaro.org>
> 
Thanks, applied.

- Kukjin
