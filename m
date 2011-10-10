From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH 2/3] ARM: plat-samsung: use Kconfig choice for debug UART
	selection
Date: Mon, 10 Oct 2011 13:23:19 +0100
Message-ID: <20111010122319.GE2451@mudshark.cambridge.arm.com>
References: <1313530873-24961-1-git-send-email-will.deacon@arm.com>
	<1313530873-24961-2-git-send-email-will.deacon@arm.com>
	<CAJuYYwRPwALAQcvsMPuz8XYsDicCmB52HzZehppUnKqv5itPEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAJuYYwRPwALAQcvsMPuz8XYsDicCmB52HzZehppUnKqv5itPEQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Oct 10, 2011 at 12:56:24PM +0100, Thomas Abraham wrote:
> Hi Will,

Hi Thomas,
> 
> What is your opinion about the following diff instead of the above one?
> 
> 
> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index 65cf8c6..035f5cd 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -120,6 +120,15 @@ choice
>  		  Say Y here if you want the debug print routines to direct
>  		  their output to the second serial port on these devices.
> 
> +	config DEBUG_SAMSUNG_UART
> +		bool "Kernel low-level debugging messages via samsung serial port"
> +		depends on PLAT_SAMSUNG
> +		help
> +		  Say Y here if you want the debug print routines to direct
> +		  their output to the serial port for Samsung platforms. Choose
> +		  the uart port with the "S3C UART to use for low-level debug"
> +		  config option.
> +
>  endchoice
> 
>  config EARLY_PRINTK
> @@ -139,7 +148,7 @@ config OC_ETM
>  	  kernel code.
> 
>  config DEBUG_S3C_UART
> -	depends on PLAT_SAMSUNG
> +	depends on DEBUG_SAMSUNG_UART
>  	int "S3C UART to use for low-level debug"
>  	default "0"
>  	help

Well, it's smaller so that's always a plus. However, I don't think the extra
level of indirection helps (that is, the "Kernel low-level debugging UART")
choice should be where the UART is specified, rather than pointing you at
another (platform-specific) option).

Did your suggestion come purely out of aesthetics or are you running into
difficulties with the original patch?

Will
