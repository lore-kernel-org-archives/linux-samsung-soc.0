From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 0/2] ARM: dts: add pmu syscon handle to exynos hdmi nodes
Date: Fri, 23 May 2014 03:37:27 +0900
Message-ID: <537E43E7.407@samsung.com>
References: <1400593129-21170-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:35876 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750890AbaEVShc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 14:37:32 -0400
In-Reply-To: <1400593129-21170-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com

On 05/20/14 22:38, Rahul Sharma wrote:
> Add PMU syscon handle to HDMI dt node for controlling PHY
> Enable/Disable bit.
>
> Patch is dependent for following patch for approval on DT
> Bindings:
> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg31106.html
>
Yeah, I checked above.

Applied this series.

Thanks,
Kukjin

> It is based on Kukjin's "for-next" branch.
>
> Rahul Sharma (2):
>    ARM: dts: add pmu syscon handle to exynos5250 hdmi
>    ARM: dts: add pmu syscon handle to exynos5420 hdmi
>
>   arch/arm/boot/dts/exynos5250.dtsi |    1 +
>   arch/arm/boot/dts/exynos5420.dtsi |    1 +
>   2 files changed, 2 insertions(+)
