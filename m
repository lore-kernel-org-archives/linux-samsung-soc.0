From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 01/10] Input: s3c2410_ts: fix S3C_ADC dependency
Date: Tue, 01 Dec 2015 08:48:32 +0900
Message-ID: <565CE050.3030706@samsung.com>
References: <1448467615-447097-1-git-send-email-arnd@arndb.de>
 <1448467615-447097-2-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1448467615-447097-2-git-send-email-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Mark Brown <broonie@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Tomasz Figa <tfiga@chromium.org>, Ben Dooks <ben.dooks@codethink.co.uk>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 26.11.2015 01:06, Arnd Bergmann wrote:
> S3C_ADC is only available on machines that don't do ARCH_MULTIPLATFORM,
> so changing the 'select' into 'depends on' here helps us move to
> ARCH_MULTIPLATFORM without introducing regressions.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/touchscreen/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
