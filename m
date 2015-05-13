From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH 1/3] ARM: exynos_defconfig: Enable CONFIG_SENSORS_PWM_FAN
 for odroidxu3 pmw-fan
Date: Wed, 13 May 2015 07:17:25 +0530
Message-ID: <CANAwSgSasMN-mgZWRg_FvnHL1AWf=wFRkUG4MP3JzieFF4NisQ@mail.gmail.com>
References: <linux.amoon@gmail.com> <1431444262-29531-1-git-send-email-linux.amoon@gmail.com>
 <1431444262-29531-2-git-send-email-linux.amoon@gmail.com> <CAJKOXPcXRWm7T29LCYMMkW0FDF8LXEsAoMjwrTqBvSiQ+q5czg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f54.google.com ([74.125.82.54]:33867 "EHLO
	mail-wg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964912AbbEMBrr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 May 2015 21:47:47 -0400
Received: by wgic8 with SMTP id c8so28341400wgi.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 May 2015 18:47:45 -0700 (PDT)
In-Reply-To: <CAJKOXPcXRWm7T29LCYMMkW0FDF8LXEsAoMjwrTqBvSiQ+q5czg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Lukasz Majewski <l.majewski@samsung.com>, Andreas Faerber <afaerber@suse.de>, Sachin Kamat <sachin.kamat@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org

Hi Krzysztof,

Actually It's my mistake. This patch had double signed-off. So I
removed one from the patch.
Do I need to resend this.

-Anand Moon

On 13 May 2015 at 05:16, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
> 2015-05-13 0:24 GMT+09:00 Anand Moon <linux.amoon@gmail.com>:
>> Enable CONFIG_SENSORS_PWM_FAN on exynos_defconfig to control fan power on Odroidxu3.
>>
>> ---
>> Depends on http://www.spinics.net/lists/arm-kernel/msg412031.html
>> Tested on OdroidXU3 Board.
>> ---
>>
>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>
> This is mixed up. Try it yourself:
> 1. Save the email as mbox.
> 2. Apply with "git am" to a vanilla tree.
> Do you see the Signed-off-by in commit?
>
> Best regards,
> Krzysztof
