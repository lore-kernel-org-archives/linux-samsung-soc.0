From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 0/2] ARM: Exynos: Add DT based I/O mapping for Chip-ID
 controller
Date: Tue, 23 Apr 2013 01:45:37 +0900
Message-ID: <51756931.9080506@samsung.com>
References: <1366630508-26101-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f49.google.com ([209.85.210.49]:38561 "EHLO
	mail-da0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753322Ab3DVQpm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 12:45:42 -0400
Received: by mail-da0-f49.google.com with SMTP id t11so3184488daj.22
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Apr 2013 09:45:42 -0700 (PDT)
In-Reply-To: <1366630508-26101-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, arnd@arndb.de

On 04/22/13 20:35, Thomas Abraham wrote:
> Changes since v1:
> - Rebased to v3.9-rc8
>
> This patch series allows device tree enabled platforms to setup a runtime
> I/O mapping for the chip-id controller. This helps to remove statically
> defined I/O mapping for the Chip-ID controller. This series is based on
> linux-next master branch and tested for Exynos4210, Exynos5250 and
> Exynos5440.
>
> Thomas Abraham (2):
>    ARM: Exynos: Create virtual I/O mapping for Chip-ID controller using device tree
>    ARM: dts: Add chip-id controller node on Exynos4/5 SoC
>
Looks good to me, applied.

Thanks.

- Kukjin
