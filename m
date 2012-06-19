From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: SAMSUNG: Remove description corresponding to a
 deleted element
Date: Tue, 19 Jun 2012 17:51:48 +0900
Message-ID: <01a101cd4df8$c329ff30$497dfd90$%kim@samsung.com>
References: <1339479059-18527-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:9742 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753611Ab2FSIwp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jun 2012 04:52:45 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5U004DNWELQO60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:51:49 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5U00H39WMCVE10@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:51:49 +0900 (KST)
In-reply-to: <1339479059-18527-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: thomas.abraham@linaro.org, patches@linaro.org

Sachin Kamat wrote:
> 
> Commit 3c582647a9f84affd5c86e89d548157c62f8d9ca removed the default_win

In this case, 8 or 12 digits commit id is enough and please explain the
subject like following next time.

Commit 3c582647a9f8 ("video: s3c-fb: remove 'default_win' element from
platform data")...

> element from the structure, but the description was not removed.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/plat-samsung/include/plat/fb.h |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/include/plat/fb.h b/arch/arm/plat-
> samsung/include/plat/fb.h
> index 536002f..b885322 100644
> --- a/arch/arm/plat-samsung/include/plat/fb.h
> +++ b/arch/arm/plat-samsung/include/plat/fb.h
> @@ -43,7 +43,6 @@ struct s3c_fb_pd_win {
>   * @setup_gpio: Setup the external GPIO pins to the right state to
> transfer
>   *		the data from the display system to the connected display
>   *		device.
> - * @default_win: default window layer number to be used for UI layer.
>   * @vidcon0: The base vidcon0 values to control the panel data format.
>   * @vidcon1: The base vidcon1 values to control the panel data output.
>   * @vtiming: Video timing when connected to a RGB type panel.
> --
> 1.7.4.1

Will apply after updating commit log I said.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
