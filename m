From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 2/2] i2c: s3c2410: Check clk_prepare_enable() return
 value
Date: Thu, 21 Apr 2016 09:19:39 +0200
Message-ID: <57187F0B.3000002@samsung.com>
References: <1461163076-5959-1-git-send-email-javier@osg.samsung.com>
 <1461163076-5959-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-reply-to: <1461163076-5959-2-git-send-email-javier@osg.samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Kukjin Kim <kgene@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 04/20/2016 04:37 PM, Javier Martinez Canillas wrote:
> The clk_prepare_enable() function can fail so check the return
> value and propagate the error in case of a failure.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
> Changes in v2:
> - Don't print the errno code since that's already printed by the
>   core when probe fails. Suggested by Krzysztof Kozlowski.
> 
>  drivers/i2c/busses/i2c-s3c2410.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)


Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Tested on Trats2 (Exynos4412, samsung,s3c2440-i2c)
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
