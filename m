From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/3] ARM: SAMSUNG: Let s3c_pm_do_restore_*() take const
 sleep_save
Date: Mon, 09 Dec 2013 14:27:30 +0100
Message-ID: <1388884.PZXKrtOKJT@amdc1227>
References: <1384971686-7208-1-git-send-email-djkurtz@chromium.org>
 <1384971686-7208-2-git-send-email-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:19221 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933351Ab3LIN1n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 08:27:43 -0500
In-reply-to: <1384971686-7208-2-git-send-email-djkurtz@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Heiko Stuebner <heiko@sntech.de>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Abhilash Kesavan <a.kesavan@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Doug Andersen <dianders@chromium.org>

Hi Daniel,

On Thursday 21 of November 2013 02:21:25 Daniel Kurtz wrote:
> The restore functions do not modify the passed in struct sleep_save,
> so that parameter can be const.
> 
> This allows us to pass in const struct.  This allows us to use const
> structs sleep_save to define system registers that will always be
> restored to a constant value.
> 
> Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
> ---
>  arch/arm/plat-samsung/include/plat/pm.h | 4 ++--
>  arch/arm/plat-samsung/pm.c              | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
