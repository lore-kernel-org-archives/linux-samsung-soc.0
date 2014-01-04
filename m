From: kgene@kernel.org
Subject: RE: [PATCH 1/1] ARM: SAMSUNG: Remove unused HDMI code
Date: Sat, 04 Jan 2014 10:54:55 +0900
Message-ID: <22ee01cf08ef$f7292af0$e57b80d0$@kernel.org>
References: <1388473030-31577-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:61342 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753967AbaADBy4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jan 2014 20:54:56 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYU0056ATBJ0U50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 04 Jan 2014 10:54:55 +0900 (KST)
In-reply-to: <1388473030-31577-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> There seems to be no users of this code in the tree for now.
> Hence remove it.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> S5P_DEV_I2C_HDMIPHY config entry is not selected by any machine.
> Please check if this code is required for S5PV210 HDMI support.
> Untested on that platform.

As I know, this can be used until moving DT for all S5P SoCs, so I'll drop
this one. In my opinion, maybe we could cleanup whole S5P_DEV_XXX after
moving DT for all S5P SoCs.

Anyway thanks,
Kukjin
