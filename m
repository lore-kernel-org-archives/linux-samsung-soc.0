From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv2 2/3] ARM: exynos_defconfig: Enable CONFIG_SENSORS_INA2XX
 for odroidxu3.
Date: Wed, 13 May 2015 13:10:28 +0900
Message-ID: <5552CEB4.1050302@samsung.com>
References: <1431489174-4479-1-git-send-email-linux.amoon@gmail.com>
 <1431489174-4479-3-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:38503 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753413AbbEMEKd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 00:10:33 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NO9003DWSXJV330@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 May 2015 05:10:31 +0100 (BST)
In-reply-to: <1431489174-4479-3-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Lukasz Majewski <l.majewski@samsung.com>, Andreas Faerber <afaerber@suse.de>, Sachin Kamat <sachin.kamat@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 13.05.2015 12:52, Anand Moon wrote:
> Odroidxu3 board support power monitor sensor.

1. s/Odroidxu3/Odroid XU3/ (or Odroid-XU3, just capitalize the symbol).
2. Remove the trailing stop (dot) from commit title.

With these changes you can add my tag:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
