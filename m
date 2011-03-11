From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C64XX: Fix section mismatch from cpufreq init
Date: Fri, 11 Mar 2011 16:51:01 +0900
Message-ID: <010c01cbdfc1$143c2800$3cb47800$%kim@samsung.com>
References: <1299769093-14516-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1299769093-14516-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Mark Brown wrote:
> 
> The cpufreq init function is referenced from the driver structure and
> we don't appear to have annotations which allow us to mark that it'll
> never be called after system init, causing the linker consistency
> infrastructure to complain. Just remove the __init annotation to avoid
> noise from the build.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mach-s3c64xx/cpufreq.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/cpufreq.c b/arch/arm/mach-
> s3c64xx/cpufreq.c
> index 74c0e83..4375b97 100644
> --- a/arch/arm/mach-s3c64xx/cpufreq.c
> +++ b/arch/arm/mach-s3c64xx/cpufreq.c
> @@ -181,7 +181,7 @@ static void __init
s3c64xx_cpufreq_config_regulator(void)
>  }
>  #endif
> 
> -static int __init s3c64xx_cpufreq_driver_init(struct cpufreq_policy
*policy)
> +static int s3c64xx_cpufreq_driver_init(struct cpufreq_policy *policy)
>  {
>  	int ret;
>  	struct cpufreq_frequency_table *freq;
> --

Looks ok, applied into s5p-fixes-for-linus for 38 :)
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
