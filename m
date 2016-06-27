From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/2] ARM: multi_v7_defconfig: Enable vivid driver as a
 module
Date: Mon, 27 Jun 2016 08:20:05 +0200
Message-ID: <5770C595.3030202@samsung.com>
References: <1466773813-14647-1-git-send-email-javier@osg.samsung.com>
 <1466773813-14647-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1466773813-14647-2-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuahkh@osg.samsung.com>, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Mauro Carvalho Chehab <mchehab@s-opensource.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 06/24/2016 03:10 PM, Javier Martinez Canillas wrote:
> The Virtual Video Test Driver can be used to emulate video capture and
> output devices so it's very useful for testing. Since is not necessary
> to boot, can be enabled as module to avoid increasing the kernel size.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
>  arch/arm/configs/multi_v7_defconfig | 2 ++
>  1 file changed, 2 insertions(+)

Thanks, applied both for v4.8.

Best regards,
Krzysztof
