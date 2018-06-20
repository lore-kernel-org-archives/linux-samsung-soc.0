From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: S3C24XX: fix typo in guard macro for s3c2412.h
Date: Wed, 20 Jun 2018 20:59:53 +0200
Message-ID: <20180620185953.cty5esnbfhawnbau@kozik-lap>
References: <20180617194617.15145-1-efremov@linux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180617194617.15145-1-efremov@linux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: efremov@linux.com
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Jun 17, 2018 at 10:46:17PM +0300, efremov@linux.com wrote:
> The guard macro __ARCH_ARM_REGS_S3C24XX_S3C2412_H in header s3c2412.h
> doesn't match the #ifndef macro __ARCH_ARM_MACH_S3C24XX_S3C2412_H.
> This patch defines the guard correctly.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
>  arch/arm/mach-s3c24xx/include/mach/s3c2412.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Thanks, applied.

Best regards,
Krzysztof
