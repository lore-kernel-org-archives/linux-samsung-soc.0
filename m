From: Ben Dooks <ben@simtec.co.uk>
Subject: Re: [PATCH v3 1/7] ARM: S5PV210: Add a Kconfig entry	"S5PC110_EVT0_WORKAROUND"
Date: Wed, 21 Jul 2010 01:36:55 +0100
Message-ID: <4C464127.5040405@simtec.co.uk>
References: <1279517483-22751-1-git-send-email-myungjoo.ham@samsung.com> <1279517483-22751-2-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from dsl78-143-211-26.in-addr.fast.co.uk ([78.143.211.26]:36415 "EHLO
	kira.home.fluff.org" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754110Ab0GUBT5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jul 2010 21:19:57 -0400
In-Reply-To: <1279517483-22751-2-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org

On 07/19/10 06:31, MyungJoo Ham wrote:
> Early S5PC110 (EVT0) chip had some issues required workaround from a
> kernel. We can add such workaround codes with this Kconfig entry.
>
> Signed-off-by: MyungJoo Ham<myungjoo.ham@samsung.com>
> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> ---
>   arch/arm/mach-s5pv210/Kconfig |    7 +++++++
>   1 files changed, 7 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
> index 631019a..18802e7 100644
> --- a/arch/arm/mach-s5pv210/Kconfig
> +++ b/arch/arm/mach-s5pv210/Kconfig
> @@ -101,4 +101,11 @@ config MACH_SMDKC110
>   	  Machine support for Samsung SMDKC110
>   	  S5PC110(MCP) is one of package option of S5PV210
>
> +config S5PC110_EVT0_WORKAROUND
> +	bool "S5PC110 Early Chip Workaround (EVT0)"
> +	help
> +	  Early S5PC110 (so called EVT0) has errata items that should be
> +	  addressed; otherwise the kernel may panic or be locked up. Enable
> +	  this option to execute workaround instructions.
> +
>   endif

What happens for non EVT0, is the a performance issue or is it exclusive?

-- 
Ben Dooks, Design & Software Engineer, Simtec Electronics

http://www.simtec.co.uk/
