From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [PATCH 2/3] ARM: S5PV210: Add audio platform device in Aquila board
Date: Thu, 12 Jul 2012 17:39:34 +0900
Message-ID: <018801cd6009$dd1b79f0$97526dd0$@com>
References: <1341304444-11188-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:13058 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752989Ab2GLIjh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jul 2012 04:39:37 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7100H16HDX6IV0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 17:39:35 +0900 (KST)
Received: from DOSBKIM7302 ([12.23.118.225])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M710016XHDZEH20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 17:39:35 +0900 (KST)
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Hi!
On Thu, Jul 05, 2012 at 09:01:57, Sachin Kamat wrote:
> After using snd_soc_register_card() in smdk_wm8994.c, the sound
> card is registered as a platform driver and it needs related platform
> device entry in machine file.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Acked-by: Sangbeom Kim <sbkim73@samsung.com>

Thanks,
Sangbeom.
