From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 0/2] ARM: dts: add device data for exynos4412-trats2
Date: Wed, 21 May 2014 00:45:33 +0200
Message-ID: <537BDB0D.6060804@gmail.com>
References: <537B32E5.2070606@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f54.google.com ([74.125.83.54]:64558 "EHLO
	mail-ee0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750747AbaETWpm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 May 2014 18:45:42 -0400
In-Reply-To: <537B32E5.2070606@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Beomho Seo <beomho.seo@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Myungjoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>

On 20.05.2014 12:48, Beomho Seo wrote:
> This patchset add some device node for exynos4412-trats2.
> It is based on v3.15-next/dt-samsung-2 branch.
> 
> exynos4412-trats2.dts
> - Fix incorrect compatible. Compatible of AK8975 are "ak8975" or "asahi-kasei,ak8975".
> - Add cm36651 light/proximity sensor device node.
> - Change gpio-key device node. fix incorrect gpio property, and then add "ok-key" node.
> 
> Changes in v3:
> - Patch set based on v3.16-next/dt-samsung
> - ARM: dts: fix incorrect compatible for exynos4412 patch is applied.
> - Remove device node property; status, interrupt-parent, interrupt
> - Changes gpio/interrupt specified index.
> 
> Changes in v2:
> 
> - Change ak8975 magnetic sensor compatible according to binding document.
> - Change cm36651 light/proximity sensor compatible according to binding document and driver.
> 
> Beomho Seo (2):
>   ARM: dts: add cm36651 light/proximity sensor node
>   ARM: dts: fixed gpio key node for exynos4412
> 
>  arch/arm/boot/dts/exynos4412-trats2.dts |   46 +++++++++++++++++++++++++------
>  1 file changed, 38 insertions(+), 8 deletions(-)
> 

For the whole series:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
