From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 2/3] ARM: Exynos4: Add ioremap interceptor for statically
 remapped regions
Date: Wed, 12 Oct 2011 11:13:02 -0500
Message-ID: <4E95BC8E.8010105@gmail.com>
References: <1318234289-22041-1-git-send-email-thomas.abraham@linaro.org> <1318234289-22041-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:37957 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750832Ab1JLQNH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Oct 2011 12:13:07 -0400
Received: by ywb5 with SMTP id 5so181752ywb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Oct 2011 09:13:07 -0700 (PDT)
In-Reply-To: <1318234289-22041-3-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

On 10/10/2011 03:11 AM, Thomas Abraham wrote:
> ioremap() request for statically remapped regions are intercepted and the
> statically assigned virtual address is returned. For requests for which
> there are no statically remapped regions, the requests are let through.
> 
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  arch/arm/mach-exynos4/cpu.c             |   16 ++++++++++++++++
>  arch/arm/mach-exynos4/include/mach/io.h |    4 ++++
>  2 files changed, 20 insertions(+), 0 deletions(-)
> 

You won't need this with Nico's vmalloc.h clean-up series. It does
exactly this but generically for all platforms.

Rob
