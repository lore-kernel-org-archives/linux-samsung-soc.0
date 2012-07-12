From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [PATCH 3/3] ARM: S5PV210: Add audio platform device in Goni board
Date: Thu, 12 Jul 2012 17:40:58 +0900
Message-ID: <018901cd600a$0f657820$2e306860$@com>
References: <1341304444-11188-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:11038 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752989Ab2GLIlB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jul 2012 04:41:01 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7100HGVHFFCT60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 17:41:00 +0900 (KST)
Received: from DOSBKIM7302 ([12.23.118.225])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M71001TGHGBEH20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 17:41:00 +0900 (KST)
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

On Thu, Jul 05, 2012 at 09:01:58, Sachin Kamat wrote:
> After using snd_soc_register_card() in smdk_wm8994.c, the sound
> card is registered as a platform driver and it needs related platform
> device entry in machine file.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Acked-by: Sangbeom Kim <sbkim73@samsung.com>

Thanks,
Sangbeom.
