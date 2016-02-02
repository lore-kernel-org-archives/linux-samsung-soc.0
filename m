From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] drivers: soc: samsung: Enable COMPILE_TEST
Date: Tue, 2 Feb 2016 15:56:09 -0300
Message-ID: <56B0FBC9.1020308@osg.samsung.com>
References: <1454396777-20034-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454396777-20034-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 02/02/2016 04:06 AM, Krzysztof Kozlowski wrote:
> Get some build coverage of Exynos SROM controller and PMU drivers. The
> PMU driver depends on asm/cputype.h so its compilation is limited to ARM
> architectures.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>

Patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
