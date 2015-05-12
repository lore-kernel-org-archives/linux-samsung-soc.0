From: Kukjin Kim <kgene@kernel.org>
Subject: Re: exynos_defconfig: Enable SENSORS_PWM_FAN, SENSORS_INA2XX, LEDS
 for OdroidXU3
Date: Wed, 13 May 2015 03:01:26 +0900
Message-ID: <55523FF6.7020505@kernel.org>
References: <Anand Moon <linux.amoon@gmail.com> <1431444262-29531-1-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:54726 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932788AbbELSBg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 May 2015 14:01:36 -0400
In-Reply-To: <1431444262-29531-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Lukasz Majewski <l.majewski@samsung.com>, Andreas Faerber <afaerber@suse.de>, Sachin Kamat <sachin.kamat@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 05/13/15 00:24, Anand Moon wrote:
> Enable SENSORS_PWM_FAN, SENSORS_INA2XX, LEDS for OdroidXU3.
> 
Basically, I have no objection on this series so for the test on other
exynos boards. Of course, if any problems on other boards, need to fix
it maybe it will not be happened...anyway, I'll pick them in my tree
once the dependent patch you mentioned is ready.

Thanks,
Kukjin
