From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2 2/3] arm64: defconfig: Enable ARCH_GH7 by default
Date: Tue, 11 Mar 2014 12:01:45 +0000
Message-ID: <20140311120145.GE31104@arm.com>
References: <1394491879-5320-1-git-send-email-kgene.kim@samsung.com>
 <1394491879-5320-3-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fw-tnat.austin.arm.com ([217.140.110.23]:17633 "EHLO
	collaborate-mta1.arm.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752220AbaCKMCB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Mar 2014 08:02:01 -0400
Content-Disposition: inline
In-Reply-To: <1394491879-5320-3-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <thomas.ab@samsung.com>, Ilho Lee <ilho215.lee@samsung.com>

On Mon, Mar 10, 2014 at 10:51:18PM +0000, Kukjin Kim wrote:
> This patch adds support for Samsung GH7 SoC in arm64/Kconfig and
> enable Samsung GH7 based SSDK_GH7 in single defconfig for arm64.
> 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> ---
>  arch/arm64/Kconfig           | 3 +++
>  arch/arm64/boot/dts/Makefile | 1 +
>  arch/arm64/configs/defconfig | 1 +
>  3 files changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index dd4327f..f0f2bf2 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -111,6 +111,9 @@ source "kernel/Kconfig.freezer"
>  
>  menu "Platform selection"
>  
> +config ARCH_GH7
> +	bool

You should add some text here so that people can disable it. The aim is
single Image by default but I think we should let people disable certain
platforms for more targeted deployments.

-- 
Catalin
