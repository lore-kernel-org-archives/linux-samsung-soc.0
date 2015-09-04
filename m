From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCHv7] ARM: exynos_defconfig: Enable LEDS for Odroid-XU3/XU4
Date: Fri, 4 Sep 2015 02:26:28 +0200
Message-ID: <55E8E534.1040204@osg.samsung.com>
References: <1441303910-3266-1-git-send-email-linux.amoon@gmail.com>
 <55E8DDDD.80106@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:34083 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752269AbbIDA0f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Sep 2015 20:26:35 -0400
In-Reply-To: <55E8DDDD.80106@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Andreas Faerber <afaerber@suse.de>, Lukasz Majewski <l.majewski@samsung.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Krzysztof,

On 09/04/2015 01:55 AM, Krzysztof Kozlowski wrote:
> On 04.09.2015 03:11, Anand Moon wrote:
>> Earlier design of the LED for Odroid XU3 was using gpio-leds
>> Now It was change to using both pwm-leds and gpio-leds.
> 
> It is still not a reason for this change. gpio-leds were not enabled
> before. This could be a valid reason of adding LEDS_PWM to existing
> config LEDS_GPIO. But LEDS_GPIO were not enabled... so why the change on
> the board from gpio->(gpio+pwm) means that we have to enable LEDS_GPIO?
>

Agreed, also the commit message doesn't explain why the heartbeat
LED trigger is enabled as I mentioned in the previous version.

> Actually I gave up on this and I wanted to change the commit message on
> myself when applying. But discussion was brought up again so... clearly
> we have different understanding of the meaning of "WHY". :)
>
> Best regards,
> Krzysztof
> 
 
Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
