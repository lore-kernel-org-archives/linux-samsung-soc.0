From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RFC PATCH 02/15] clocksource: samsung_pwm_timer: fix endian
 accessors
Date: Fri, 10 Jun 2016 13:43:29 +0200
Message-ID: <575AA7E1.9030000@samsung.com>
References: <20160608183110.13851-1-matthew@mattleach.net>
 <20160608183110.13851-3-matthew@mattleach.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48690 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753335AbcFJLne (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jun 2016 07:43:34 -0400
In-reply-to: <20160608183110.13851-3-matthew@mattleach.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Matthew Leach <matthew@mattleach.net>, Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>

On 06/08/2016 08:30 PM, Matthew Leach wrote:
> Fix the Samsung pwm timer access code to deal with kernels built for big
> endian operation.
> 
> Signed-off-by: Matthew Leach <matthew@mattleach.net>
> ---
> CC: Daniel Lezcano <daniel.lezcano@linaro.org>
> CC: Thomas Gleixner <tglx@linutronix.de>
> CC: linux-kernel@vger.kernel.org
> ---
>  drivers/clocksource/samsung_pwm_timer.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
