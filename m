From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH v2 0/3] Some cleanup for samsung clock
Date: Wed, 22 Oct 2014 16:04:12 +0530
Message-ID: <001201cfede3$c462eb90$4d28c2b0$@samsung.com>
References: <1411976868-22209-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54262 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932402AbaJVKeQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Oct 2014 06:34:16 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NDU00DI9DD2JE80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Oct 2014 19:34:14 +0900 (KST)
In-reply-to: <1411976868-22209-1-git-send-email-pankaj.dubey@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, tomasz.figa@gmail.com
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, naushad@samsung.com

Hi Tomasz,

On Monday, September 29, 2014 1:18 PM, Pankaj Dubey wrote,
> To: linux-arm-kernel@lists.infradead.org;
linux-samsung-soc@vger.kernel.org
> Cc: kgene.kim@samsung.com; tomasz.figa@gmail.com; s.nawrocki@samsung.com;
> mturquette@linaro.org; naushad@samsung.com; Pankaj Dubey
> Subject: [PATCH v2 0/3] Some cleanup for samsung clock
> 
> This patch series does some cleanup of samsung clock files and fixes one
typo in clk.h
> 
> Changes since v1:
>  - Added patch commit message description to patch 1/3 and 2/3.
> 
> Pankaj Dubey (3):
>   clk: samsung: Spelling s/bwtween/between/
>   clk: samsung: remove unnecessary CONFIG_OF from clk.c
>   clk: samsung: remove unnecessary inclusion of header files from clk.h
> 
>  drivers/clk/samsung/clk.c |    5 ++---
>  drivers/clk/samsung/clk.h |    6 +-----
>  2 files changed, 3 insertions(+), 8 deletions(-)
> 

It there are no comments will you please pick up this patch series.

Thanks,
Pankaj Dubey
> --
> 1.7.9.5
