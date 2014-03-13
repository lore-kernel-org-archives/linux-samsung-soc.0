From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v5 2/3] ARM: dts: add dts files for exynos5260 SoC
Date: Thu, 13 Mar 2014 16:33:57 +0100
Message-ID: <5321CFE5.2000907@samsung.com>
References: <1394637394-3960-1-git-send-email-rahul.sharma@samsung.com>
 <1394637394-3960-3-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:64762 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753180AbaCMPeB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Mar 2014 11:34:01 -0400
In-reply-to: <1394637394-3960-3-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, pankaj.dubey@samsung.com, Arun Kumar K <arun.kk@samsung.com>

Hi,

On 12.03.2014 16:16, Rahul Sharma wrote:
> The patch adds the dts files for exynos5260.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> ---
>   arch/arm/boot/dts/exynos5260-pinctrl.dtsi |  574 +++++++++++++++++++++++++++++
>   arch/arm/boot/dts/exynos5260.dtsi         |  400 ++++++++++++++++++++
>   2 files changed, 974 insertions(+)
>   create mode 100644 arch/arm/boot/dts/exynos5260-pinctrl.dtsi
>   create mode 100644 arch/arm/boot/dts/exynos5260.dtsi
>

[snip]


> +		mmc_0: mmc0@12140000 {

Node names should specify type of the device, so unit-specific IDs 
should be avoided. Please simply use mmc@12140000. The same comment for 
remaining MMC nodes below.

Best regards,
Tomasz
