From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [RFC PATCH 02/15] clocksource: samsung_pwm_timer: fix endian
 accessors
Date: Thu, 16 Jun 2016 15:23:40 +0200
Message-ID: <5762A85C.6040700@linaro.org>
References: <20160608183110.13851-1-matthew@mattleach.net>
 <20160608183110.13851-3-matthew@mattleach.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:37657 "EHLO
	mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752339AbcFPNXn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 09:23:43 -0400
Received: by mail-wm0-f44.google.com with SMTP id a66so57940206wme.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jun 2016 06:23:43 -0700 (PDT)
In-Reply-To: <20160608183110.13851-3-matthew@mattleach.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Matthew Leach <matthew@mattleach.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

On 06/08/2016 08:30 PM, Matthew Leach wrote:
> Fix the Samsung pwm timer access code to deal with kernels built for =
big
> endian operation.
>
> Signed-off-by: Matthew Leach <matthew@mattleach.net>
> ---
> CC: Daniel Lezcano <daniel.lezcano@linaro.org>
> CC: Thomas Gleixner <tglx@linutronix.de>
> CC: linux-kernel@vger.kernel.org
> ---

I will pick this patch in my tree.

Thanks.

   -- Daniel

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
