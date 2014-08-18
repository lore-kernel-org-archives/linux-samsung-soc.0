From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: EXYNOS: Refactor the pm code to use DT based
 lookup
Date: Mon, 18 Aug 2014 14:14:18 +0200
Message-ID: <53F1EE1A.4000305@gmail.com>
References: <1407412789-1919-1-git-send-email-vikas.sajjan@samsung.com> <1407412789-1919-3-git-send-email-vikas.sajjan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f180.google.com ([74.125.82.180]:39841 "EHLO
	mail-we0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751258AbaHRMOY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Aug 2014 08:14:24 -0400
Received: by mail-we0-f180.google.com with SMTP id w61so4875742wes.39
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2014 05:14:22 -0700 (PDT)
In-Reply-To: <1407412789-1919-3-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, joshi@samsung.com, sajjan.linux@gmail.com, dianders@chromium.org, olof@lixom.net

Hi Vikas,

On 07.08.2014 13:59, Vikas Sajjan wrote:
> Refactoring the pm.c to avoid using "soc_is_exynos" checks,
> instead use the DT based lookup.
> 
> While at it, consolidate the common code across SoCs
> and create a static helper functions.
> 
> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
> ---
>  arch/arm/mach-exynos/pm.c       |  168 +++++++++++++++++++++++++++++----------
>  arch/arm/mach-exynos/regs-pmu.h |    1 +
>  2 files changed, 126 insertions(+), 43 deletions(-)
> 

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomas
