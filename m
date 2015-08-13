From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH RESEND v6 1/3] Documentation: dts: Documentation entry to
 explain how to use PWM FAN as a cooling device
Date: Thu, 13 Aug 2015 09:17:36 +0900
Message-ID: <55CBE220.1010301@samsung.com>
References: <1425470624-25793-1-git-send-email-l.majewski@samsung.com>
 <1439298440-15882-1-git-send-email-l.majewski@samsung.com>
 <1439298440-15882-2-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:14392 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751866AbbHMARj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Aug 2015 20:17:39 -0400
In-reply-to: <1439298440-15882-2-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>, Eduardo Valentin <edubezval@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: Linux PM list <linux-pm@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, Lukasz Majewski <l.majewski@majess.pl>

On 11.08.2015 22:07, Lukasz Majewski wrote:
> Explanation of several properties, which allow PWM fan working as a cooling
> device, have been embraced in this commit.
> 
> Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
> Acked-by: Eduardo Valentin <edubezval@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/pwm-fan.txt          | 29 ++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 

Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

I'll take care of it and send it to Kukjin for v4.4.

Best regards,
Krzysztof
