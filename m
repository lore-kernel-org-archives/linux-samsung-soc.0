From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv5 5/5] ARM: dts: Enable thermal_zone for exynos5422-odroidxu3
Date: Wed, 13 May 2015 16:40:36 +0900
Message-ID: <CAJKOXPeNB=BXoY6CAxE8MNZ90cchhbdbUg3Xgef3qAgBR2UWJA@mail.gmail.com>
References: <1431499020-3912-1-git-send-email-linux.amoon@gmail.com>
	<1431499020-3912-6-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f53.google.com ([209.85.216.53]:36894 "EHLO
	mail-vn0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753325AbbEMHkh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 03:40:37 -0400
In-Reply-To: <1431499020-3912-6-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Lukasz Majewski <l.majewski@samsung.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Markus Reichl <m.reichl@fivetechno.de>, Eduardo Valentin <edubezval@gmail.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

2015-05-13 15:37 GMT+09:00 Anand Moon <linux.amoon@gmail.com>:
> Include exynos5-cpu-thermal.dtsi to enable thermal_zone support.

I am a little confused because you named this file as
exynos5-cpu-thermal, meaning it is common for all Exynos5 boards. But:
1. It references some specific phandles like &fan0 (cooling-device =
<&fan0 2 3>).
2. You include it only here.

So the question: is "exynos5-cpu-thermal.dtsi" a generic thermal DTSI?
What is your intention?

Lukasz, you acked the patchset, is it fine?

Best regards,
Krzysztof
