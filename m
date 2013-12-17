From: Kamil Debski <k.debski@samsung.com>
Subject: RE: [PATCH v4 3/9] phy: Add new Exynos USB PHY driver
Date: Tue, 17 Dec 2013 14:26:37 +0100
Message-ID: <02d201cefb2b$9e04e710$da0eb530$%debski@samsung.com>
References: <1386246579-25141-1-git-send-email-k.debski@samsung.com>
 <1386246579-25141-4-git-send-email-k.debski@samsung.com>
 <006a01cef551$7fb4e240$7f1ea6c0$%tikhomirov@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:25250 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752162Ab3LQN0k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Dec 2013 08:26:40 -0500
In-reply-to: <006a01cef551$7fb4e240$7f1ea6c0$%tikhomirov@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Anton Tikhomirov' <av.tikhomirov@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: kyungmin.park@samsung.com, kishon@ti.com, Tomasz Figa <t.figa@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, jg1.han@samsung.com, galak@codeaurora.org, matt.porter@linaro.org

Hi Anton,

> From: Anton Tikhomirov [mailto:av.tikhomirov@samsung.com]
> Sent: Tuesday, December 10, 2013 3:43 AM
> 
> Hi Kamil,
> 
> Same USB2.0 PHY may be used by several HCDs, for example EHCI and OHCI.
> Consider the situation, when EHCI stops using the PHY and calls
> power_off, then OHCI becomes non-operational. In other words, PHY
> power_on and power_off calls must be balanced.
> 
> Shall we handle it in your driver? (usage count?)

Please look in the drivers/phy/phy-core.c file. Usage count is handled
there - see phy_power_on and phy_power_off functions. I understand that
after both EHCI and OHCI power on the phy, the usage count is 2. So
powering off one of them (EHCI for instance) the usage count is still
1, so the OHCI should still work properly.

[snip]

Best wishes,
-- 
Kamil Debski
Samsung R&D Institute Poland
