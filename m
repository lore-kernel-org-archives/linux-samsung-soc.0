From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/2] i2c: s3c2410: Use SET_NOIRQ_SYSTEM_SLEEP_PM_OPS
 instead of open-coded
Date: Thu, 14 Apr 2016 15:27:07 +0200
Message-ID: <570F9AAB.4010301@samsung.com>
References: <1460596084.6630.1.camel@ingics.com>
 <1460596135.6630.2.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-reply-to: <1460596135.6630.2.camel@ingics.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Kukjin Kim <kgene@kernel.org>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 04/14/2016 03:08 AM, Axel Lin wrote:
> Use SET_NOIRQ_SYSTEM_SLEEP_PM_OPS to simplify the code.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
