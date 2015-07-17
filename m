From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: add Device Tree binding doc for max77686 regulator
Date: Fri, 17 Jul 2015 19:00:18 +0900
Message-ID: <CAJKOXPdQ9cH2NesrxOheA1bDMd1T0VvOGkFoosfMKWKxXLDdMw@mail.gmail.com>
References: <1437121078-26409-1-git-send-email-javier@osg.samsung.com>
	<1437121078-26409-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:36366 "EHLO
	mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752542AbbGQKAT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Jul 2015 06:00:19 -0400
In-Reply-To: <1437121078-26409-2-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org

2015-07-17 17:17 GMT+09:00 Javier Martinez Canillas <javier@osg.samsung.com>:
> The Device Tree binding documentation for the Maxim max77686 regulators
> has been moved from the Multi-Function Device DT binding section to its
> own Documentation/devicetree/bindings/regulator/max77686.txt file.
>
> Use a wilcard so both the mfd and regulator DT bindings are resolved.
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
>
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for updating this.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
