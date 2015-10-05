From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH v2 0/7] Add support for Exynos SROM Controller driver
Date: Mon, 05 Oct 2015 14:36:32 +0300
Message-ID: <018501d0ff62$1650b410$42f21c30$@samsung.com>
References: <1440403348-8974-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:22144 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750781AbbJELgh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Oct 2015 07:36:37 -0400
In-reply-to: <1440403348-8974-1-git-send-email-pankaj.dubey@samsung.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Pankaj Dubey' <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: thomas.ab@samsung.com, k.kozlowski@samsung.com, kgene@kernel.org, heiko@sntech.de

 Hello!

> This patch set adds support for Exynos SROM controller DT based driver.
> Currently SROM register sets are used only during S2R, so driver
> basically added for taking care of S2R. It will help us in removing
> static mapping from exynos.c and other extra code handline during S2R.

 Very good news, but, your driver seems not to do anything except suspend/resume. But how do i add
some device plugged into it? In order to be operational, its outputs have to be configured. But how
do i do it with your driver? For example, on SMDK boards SROM controller is used to connect SMSC9111
etherner chip.
 Currently i use hardcoded initialization based on of_machine_is_compatible(), but i believe this
would be considered a hack and such a thing cannot be pushed upstream. I guess i have to put all
needed configuration into device tree somehow. But how? Are there any recommentations?

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
