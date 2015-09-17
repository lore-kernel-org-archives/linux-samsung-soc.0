From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 6/6] pinctrl: samsung: Remove unneded semicolon
Date: Thu, 17 Sep 2015 16:55:21 +0900
Message-ID: <55FA71E9.4010402@samsung.com>
References: <1442392111-8448-1-git-send-email-javier@osg.samsung.com>
 <1442392111-8448-7-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1442392111-8448-7-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 16.09.2015 17:28, Javier Martinez Canillas wrote:
> It's not needed an is just creating a null statement, so remove it.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
>  drivers/pinctrl/samsung/pinctrl-exynos5440.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Quite obvious and pointed out by coccicheck, so:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
