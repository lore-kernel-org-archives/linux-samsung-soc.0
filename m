From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv2 2/2] ARM: exynos_defconfig: Enable CONFIG_LEDS_PWM for
 Odroid-XU3
Date: Tue, 09 Jun 2015 08:56:08 +0900
Message-ID: <55762B98.1080409@samsung.com>
References: <1433696621-4763-1-git-send-email-linux.amoon@gmail.com>
 <1433696621-4763-2-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:19424 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752408AbbFHX4Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Jun 2015 19:56:16 -0400
In-reply-to: <1433696621-4763-2-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Lukasz Majewski <l.majewski@samsung.com>, Andreas Faerber <afaerber@suse.de>, Sachin Kamat <sachin.kamat@samsung.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 08.06.2015 02:03, Anand Moon wrote:
> Enable CONFIG_LEDS_PWM amd CONFIG_LEDS_TRIGGER_HEARTBEAT for
> Odroid-XU3 board.

I am a little confused.

This is v2.

I found version 3, a little different:
http://www.spinics.net/lists/linux-samsung-soc/msg44406.html
(which

Where is the changelog? Which one is newer? Should we drop the v3?
While at it, can you add information WHY do you want to enable LEDS?

Best regards,
Krzysztof
