From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos5260: fix typo in clock name
Date: Mon, 22 Sep 2014 10:38:11 +0200
Message-ID: <541FDFF3.2000006@gmail.com>
References: <1410328565-25122-1-git-send-email-pankaj.dubey@samsung.com> <54122962.5020903@gmail.com> <001b01cfd621$738ed8c0$5aac8a40$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:46075 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750763AbaIVIiP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 04:38:15 -0400
In-Reply-To: <001b01cfd621$738ed8c0$5aac8a40$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, 'Chander Kashyap' <k.chander@samsung.com>, 'Abhilash Kesavan' <a.kesavan@samsung.com>

On 22.09.2014 06:55, Pankaj Dubey wrote:
> Hi Tomasz,
> 
> Will you please take this patch and following three Exynos3250 clock fixes
> in your tree.
> 
> 1: clk: samsung: exynos3250: fix width field of mout_mmc0/1
>    https://lkml.org/lkml/2014/9/5/265
> 2: clk: samsung: exynos3250: fix width and shift of div_spi0_isp clock
>    https://lkml.org/lkml/2014/9/9/364
> 3: clk: samsung: exynos3250: fix mout_cam_blk parent list
>   https://lkml.org/lkml/2014/9/6/41

Applied all four patches for next.

Best regards,
Tomasz
