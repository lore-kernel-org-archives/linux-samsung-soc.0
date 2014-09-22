From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH] clk: samsung: exynos5260: fix typo in clock name
Date: Mon, 22 Sep 2014 10:25:28 +0530
Message-ID: <001b01cfd621$738ed8c0$5aac8a40$@samsung.com>
References: <1410328565-25122-1-git-send-email-pankaj.dubey@samsung.com>
 <54122962.5020903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63520 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750757AbaIVExX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 00:53:23 -0400
In-reply-to: 
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, 'Chander Kashyap' <k.chander@samsung.com>, 'Abhilash Kesavan' <a.kesavan@samsung.com>

Hi Tomasz,

Will you please take this patch and following three Exynos3250 clock fixes
in your tree.

1: clk: samsung: exynos3250: fix width field of mout_mmc0/1
   https://lkml.org/lkml/2014/9/5/265
2: clk: samsung: exynos3250: fix width and shift of div_spi0_isp clock
   https://lkml.org/lkml/2014/9/9/364
3: clk: samsung: exynos3250: fix mout_cam_blk parent list
  https://lkml.org/lkml/2014/9/6/41

Thanks,
Pankaj Dubey

> 
> Please add my sign-off as
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> 
> >
> > Missed your sign-off? You can reply with it inline and I will add it
> > when applying this weekend.
> >
> > P.S. Please keep me on CC when sending patches for Samsung clock
drivers.
> >
> > Best regards,
> > Tomasz
