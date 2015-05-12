From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/3] ARM: exynos_defconfig: Enable CONFIG_SENSORS_PWM_FAN
 for odroidxu3 pmw-fan
Date: Wed, 13 May 2015 08:46:32 +0900
Message-ID: <CAJKOXPcXRWm7T29LCYMMkW0FDF8LXEsAoMjwrTqBvSiQ+q5czg@mail.gmail.com>
References: <linux.amoon@gmail.com>
	<1431444262-29531-1-git-send-email-linux.amoon@gmail.com>
	<1431444262-29531-2-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f46.google.com ([209.85.216.46]:42080 "EHLO
	mail-vn0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964862AbbELXqd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 May 2015 19:46:33 -0400
Received: by vnbf129 with SMTP id f129so1785727vnb.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 May 2015 16:46:33 -0700 (PDT)
In-Reply-To: <1431444262-29531-2-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Lukasz Majewski <l.majewski@samsung.com>, Andreas Faerber <afaerber@suse.de>, Sachin Kamat <sachin.kamat@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

2015-05-13 0:24 GMT+09:00 Anand Moon <linux.amoon@gmail.com>:
> Enable CONFIG_SENSORS_PWM_FAN on exynos_defconfig to control fan power on Odroidxu3.
>
> ---
> Depends on http://www.spinics.net/lists/arm-kernel/msg412031.html
> Tested on OdroidXU3 Board.
> ---
>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

This is mixed up. Try it yourself:
1. Save the email as mbox.
2. Apply with "git am" to a vanilla tree.
Do you see the Signed-off-by in commit?

Best regards,
Krzysztof
