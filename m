From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH] phy: phy-samsung-usb2: Change phy power on/power off
 sequence
Date: Tue, 1 Jul 2014 15:29:21 +0530
Message-ID: <53B28679.1000509@ti.com>
References: <1403614495-9291-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:51832 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751273AbaGAJ7m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jul 2014 05:59:42 -0400
In-Reply-To: <1403614495-9291-1-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org
Cc: t.figa@samsung.com, m.szyprowski@samsung.com, gautam.vivek@samsung.com

Hi Kamil,

On Tuesday 24 June 2014 06:24 PM, Kamil Debski wrote:
> The Exynos4412 USB 2.0 PHY hardware differs from the description provided
> in the documentation. Some register bits have different function. This
> patch fixes the defines of register bits and changes the way how phys are
> powered on and off.
> 
> Signed-off-by: Kamil Debski <k.debski@samsung.com>

Can you fix these checkpatch warnings?

WARNING: space prohibited before semicolon
#149: FILE: drivers/phy/phy-exynos4x12-usb2.c:227:
+				EXYNOS_4x12_URSTCON_HOST_LINK_P1 ;

WARNING: line over 80 characters
#200: FILE: drivers/phy/phy-exynos4x12-usb2.c:278:
+		exynos4x12_power_on_internal(&drv->instances[EXYNOS4x12_DEVICE]);

WARNING: line over 80 characters
#210: FILE: drivers/phy/phy-exynos4x12-usb2.c:288:
+		exynos4x12_power_on_internal(&drv->instances[EXYNOS4x12_DEVICE]);

WARNING: line over 80 characters
#220: FILE: drivers/phy/phy-exynos4x12-usb2.c:297:
+static void exynos4x12_power_off_internal(struct samsung_usb2_phy_instance *inst)

WARNING: line over 80 characters
#249: FILE: drivers/phy/phy-exynos4x12-usb2.c:319:
+		exynos4x12_power_off_internal(&drv->instances[EXYNOS4x12_DEVICE]);

WARNING: line over 80 characters
#253: FILE: drivers/phy/phy-exynos4x12-usb2.c:323:
+		exynos4x12_power_off_internal(&drv->instances[EXYNOS4x12_DEVICE]);

total: 0 errors, 6 warnings, 182 lines checked

Thanks
Kishon
