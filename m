From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: odroidxu3: Enable USB3 regulators
Date: Fri, 29 May 2015 19:37:49 +0900
Message-ID: <5568417D.9020605@samsung.com>
References: <1432803494-3516-1-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:32871 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753839AbbE2KiH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 May 2015 06:38:07 -0400
In-Reply-To: <1432803494-3516-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

W dniu 28.05.2015 o 17:58, Anand Moon pisze:
> Enable regulator for usbdrd3_0 and usbdrd3_1
> From the schematic pin diagram USB3_0 and USB3_1
> is regulated by LDO9 and LD011.
> 
> Fix the boot message of failed.
> [    3.503539] exynos-dwc3 usb@12000000: Looking up vdd33-supply from device tree
> [    3.503556] exynos-dwc3 usb@12000000: Looking up vdd33-supply property in node /usb@12000000 failed
> [    3.503568] usb@12000000 supply vdd33 not found, using dummy regulator
> [    3.509154] exynos-dwc3 usb@12000000: Looking up vdd10-supply from device tree
> [    3.509170] exynos-dwc3 usb@12000000: Looking up vdd10-supply property in node /usb@12000000 failed
> [    3.509181] usb@12000000 supply vdd10 not found, using dummy regulator
> [    3.917548] exynos-dwc3 usb@12400000: Looking up vdd33-supply from device tree
> [    3.917565] exynos-dwc3 usb@12400000: Looking up vdd33-supply property in node /usb@12400000 failed
> [    3.917578] usb@12400000 supply vdd33 not found, using dummy regulator
> [    3.922731] exynos-dwc3 usb@12400000: Looking up vdd10-supply from device tree
> [    3.922747] exynos-dwc3 usb@12400000: Looking up vdd10-supply property in node /usb@12400000 failed
> 

Tested on Odroid XU3-Lite board:
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
