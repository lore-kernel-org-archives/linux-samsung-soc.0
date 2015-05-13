From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv2 3/3] ARM: exynos_defconfig: Enable LEDs for odroidxu3.
Date: Wed, 13 May 2015 13:13:01 +0900
Message-ID: <5552CF4D.1060007@samsung.com>
References: <1431489174-4479-1-git-send-email-linux.amoon@gmail.com>
 <1431489174-4479-4-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:33533 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932815AbbEMENI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 00:13:08 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NO9006CET1S4K30@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 May 2015 05:13:04 +0100 (BST)
In-reply-to: <1431489174-4479-4-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Lukasz Majewski <l.majewski@samsung.com>, Andreas Faerber <afaerber@suse.de>, Sachin Kamat <sachin.kamat@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 13.05.2015 12:52, Anand Moon wrote:
> Enable CONFIG_LEDS_GPIO, CONFIG_LEDS_TRIGGERS, CONFIG_LEDS_TRIGGER_HEARTBEAT.

1. Remove the trailing stop (dot) from commit title.
2. Please go back to default length of wrapping commit messages. This
one exceeds it. Default is 75 characters so git log or git show output
would fit in 80 characters terminal.
3. It would be nice to see here WHY you are enabling these configs (what
is the benefit). One sentence would be enough.

With these changes you can add my tag:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
