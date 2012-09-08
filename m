From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos4: Enable serial controllers on Origen and SMDKV310
Date: Sat, 08 Sep 2012 10:07:01 +0200
Message-ID: <1448000.LeaitbqYWR@flatron>
References: <1346675674-16034-1-git-send-email-t.figa@samsung.com> <1808225.QZz0WEipT7@amdc1227> <24d901cd8d6a$c10c9710$4325c530$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:54169 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751955Ab2IHIHI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Sep 2012 04:07:08 -0400
Received: by wibhr14 with SMTP id hr14so291472wib.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 08 Sep 2012 01:07:06 -0700 (PDT)
In-Reply-To: <24d901cd8d6a$c10c9710$4325c530$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, jy0922.shim@samsung.com, thomas.abraham@linaro.org

Hi Kgene,

On Saturday 08 of September 2012 11:36:30 Kukjin Kim wrote:
> Tomasz Figa wrote:
> > This patch adds status override of serial nodes to enable used serial
> > ports
> > on Origen and SMDKV310 board.
> 
> Well...I'm not sure about the status of Origen serial, but all of the
> serials are enabled on SMDKV310, is it right?

According to arrays of struct s3c2410_uartcfg in mach-origen.c and mach-
smdkv310.c, all the four serial ports are enabled on both boards.

--
Best regards,
Tomasz Figa
