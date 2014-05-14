From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: Add peach-pi board support
Date: Thu, 15 May 2014 05:28:17 +0900
Message-ID: <5373D1E1.4070407@samsung.com>
References: <1399638303-32600-1-git-send-email-arun.kk@samsung.com> <1399638303-32600-4-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f54.google.com ([209.85.160.54]:58558 "EHLO
	mail-pb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751378AbaENU2W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 16:28:22 -0400
In-Reply-To: <1399638303-32600-4-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, kgene.kim@samsung.com, dianders@chromium.org, alim.akhtar@samsung.com, tomasz.figa@gmail.com, olof@lixom.net, arunkk.samsung@gmail.com

On 05/09/14 21:25, Arun Kumar K wrote:
> Adds support for google peach-pi board having the
> Exynos5800 SoC.
>
> Signed-off-by: Arun Kumar K<arun.kk@samsung.com>
> Signed-off-by: Doug Anderson<dianders@chromium.org>
> Reviewed-by: Tomasz Figa<t.figa@samsung.com>
> ---
> Changes from v1
> - Updated memory node with a safe size of 2GB
> ---
>   arch/arm/boot/dts/Makefile                |    3 +-
>   arch/arm/boot/dts/exynos5800-peach-pi.dts |  144 +++++++++++++++++++++++++++++
>   2 files changed, 146 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm/boot/dts/exynos5800-peach-pi.dts
>
Applied, thanks.

- Kukjin
