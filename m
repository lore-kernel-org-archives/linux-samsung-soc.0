From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 0/6] Switch to generic syscon regmap based drivers
Date: Tue, 20 Oct 2015 12:29:12 +0200
Message-ID: <56261778.8060400@osg.samsung.com>
References: <1445333085-22837-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:38013 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751100AbbJTK3R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Oct 2015 06:29:17 -0400
In-Reply-To: <1445333085-22837-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, k.kozlowski@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hello Alim,

On 10/20/2015 11:24 AM, Alim Akhtar wrote:
> Now we have a nice way to reboot/poweroff system using a generic
> syscon regmap based drivers, this series moves exynos SoCs to
> make use of the same.
> 

I tested this series on an Exynos5800 Peach Pi and an Exynos5422 Odroid XU.
Reboot and poweroff are working correctly on both boards with these patches.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
