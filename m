From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 4/4] mfd: max77686: Split out regulator part from the
 DT binding
Date: Fri, 17 Jul 2015 15:42:00 +0900
Message-ID: <CAJKOXPe8rDLCt+Za+Qzkkd4JnFoyKtsFTmMbJL6+3Ark8qFYiQ@mail.gmail.com>
References: <1437114567-17629-1-git-send-email-javier@osg.samsung.com>
	<1437114567-17629-5-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f174.google.com ([209.85.220.174]:35969 "EHLO
	mail-qk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754933AbbGQGmB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Jul 2015 02:42:01 -0400
In-Reply-To: <1437114567-17629-5-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org

2015-07-17 15:29 GMT+09:00 Javier Martinez Canillas <javier@osg.samsung.com>:
> The Maxim MAX77686 PMIC is a multi-function device with regulators,
> clocks and a RTC. The DT bindings for the clocks are in a separate
> file but the bindings for the regulators are inside the mfd part.
>
> To make it consistent with the clocks portion of the binding and
> because is more natural to look for regulator bindings under the
> bindings/regulator sub-directory, split the regulator portion of
> the DT binding and add it as a separate file.
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>
> ---
>
> Changes in v2:
> - Use a generic name for the max77686 node in the regulator example.
>
>  Documentation/devicetree/bindings/mfd/max77686.txt | 58 +-----------------
>  .../devicetree/bindings/regulator/max77686.txt     | 71 ++++++++++++++++++++++
>  2 files changed, 74 insertions(+), 55 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/regulator/max77686.txt

Putting regulator bindings under regulator directory seems logical so
I am fine with it.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
