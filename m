From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
Subject: Re: [PATCH v2 3/9] ARM: SAMSUNG: Implements cfg_gpio function for
	Samsung touchscreen
Date: Tue, 18 May 2010 10:13:31 +0200
Message-ID: <87r5l96310.fsf@lechat.rtp-net.org>
References: <1273756032-3098-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1273756032-3098-1-git-send-email-kgene.kim@samsung.com> (Kukjin
	Kim's message of "Thu\, 13 May 2010 22\:07\:12 +0900")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Naveen Krishna <ch.naveen@samsung.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Kukjin Kim <kgene.kim@samsung.com> writes:

Hi,

[...]

> +
> +/**
> + * s3c24xx_ts_cfg_gpio - configure gpio for s3c2410 systems
> + *
> + * Configure the GPIO for the S3C2410 system, where we have external FETs
> + * connected to the device (later systems such as the S3C2440 integrate
> + * these into the device).
> + */
> +void s3c24xx_ts_cfg_gpio(struct platform_device *dev)
> +{
> +	s3c2410_gpio_cfgpin(S3C2410_GPG(12), S3C2410_GPG12_XMON);
> +	s3c2410_gpio_cfgpin(S3C2410_GPG(13), S3C2410_GPG13_nXPON);
> +	s3c2410_gpio_cfgpin(S3C2410_GPG(14), S3C2410_GPG14_YMON);
> +	s3c2410_gpio_cfgpin(S3C2410_GPG(15), S3C2410_GPG15_nYPON);
> +}

hmm... thinking more about this, why don't you put that in the
arch/arm/plat-s3c24xx/devs.c file and then set the cfg_gpio hook in
s3c24xx_ts_set_platdata() for 2410 platforms ? 
This should be smaller change and will set it for all s3c2410 platforms
using the touchscreen once for all and "hide" it  instead of having to
set it in all machine files using the touchscreen.

Arnaud
