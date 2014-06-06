From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Problems booting exynos5420 with >1 CPU
Date: Fri, 6 Jun 2014 22:01:51 +0100
Message-ID: <20140606210151.GK23430@n2100.arm.linux.org.uk>
References: <539145B4.5000200@gmail.com> <CAD=FV=XqwEQNJmij-4Gh62OY+B66AjdQjZC0=f_6tbot3UfQaA@mail.gmail.com> <CAM4voaknx3+X4O8MUwaruUFPyquY8Opq61ucKX08xTrv8PqfLg@mail.gmail.com> <CAD=FV=Vo1JR6n496Q3FqXjRBkbTBRg89_fJQNsqeRx8WQW_a9w@mail.gmail.com> <CAM4voakAMN4jdAZDPz55tnc3woZDieZ5aL3TVU2kYsNHT+AMqg@mail.gmail.com> <CAD=FV=UjmN5AwWMPy7mQt-J4A_niO8Ug4r15Ez2ZWPT1g3L=VA@mail.gmail.com> <CAM4voa=1FY5bfk095BU=3X=vzqjnCSfdLoXpCix5tOwDgOoioQ@mail.gmail.com> <CAD=FV=UwgPQVm_KvHbpoJNs-5EtpyaYJ2rp2f-466uhnob=ixA@mail.gmail.com> <CAM4voa=cTbobQHi+sBOCy_CDYAnQ6CsvvuoE7XwqFZV_E3gEbQ@mail.gmail.com> <CAD=FV=U6HuQj3MxZ-yF-MYdjzqjT5bu=K26JuHZP1hjJzkSqbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:49265 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751635AbaFFVDf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Jun 2014 17:03:35 -0400
Content-Disposition: inline
In-Reply-To: <CAD=FV=U6HuQj3MxZ-yF-MYdjzqjT5bu=K26JuHZP1hjJzkSqbg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@google.com>
Cc: Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Turquette, Mike" <mturquette@linaro.org>, Kevin Hilman <khilman@linaro.org>, Andrew Bresticker <abrestic@chromium.org>, Tushar Behera <trblinux@gmail.com>, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>, Sonny Rao <sonnyrao@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Arun Kumar <arun.kk@samsung.com>

On Fri, Jun 06, 2014 at 01:49:11PM -0700, Doug Anderson wrote:
> This works and IMHO is much cleaner because it totally removes the
> U-Boot dependency.  I'll cleanup to not be so insane and post:
> 
> diff --git a/arch/arm/mach-exynos/mcpm-exynos.c
> b/arch/arm/mach-exynos/mcpm-exynos.c
> index 0498d0b..9c5df7b 100644
> --- a/arch/arm/mach-exynos/mcpm-exynos.c
> +++ b/arch/arm/mach-exynos/mcpm-exynos.c
> @@ -290,6 +290,14 @@ static void __naked
> exynos_pm_power_up_setup(unsigned int affinity_level)
>         "b      cci_enable_port_for_self");
>  }
> 
> +static void __naked exynos_mcpm_secondary_cpu_start(void)
> +{
> +       asm volatile ("\n"
> +       "ldr    r0, [pc, #0]\n"
> +       "bx     r0\n"
> +       ".word  0" );
> +}
> +

So does it matter whether the above code gets assembled as thumb or
ARM?  How does your caller know which ISA mode to enter this fragment
in?

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
