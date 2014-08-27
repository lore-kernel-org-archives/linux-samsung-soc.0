From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 00/14] Support 64bit Cortex A57 based Exynos7 SoC
Date: Wed, 27 Aug 2014 13:34:50 +0200
Message-ID: <53FDC25A.2010806@samsung.com>
References: <1409132660-1898-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:10699 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756061AbaH0Ley (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 07:34:54 -0400
In-reply-to: <1409132660-1898-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, catalin.marinas@arm.com
Cc: naveenkrishna.ch@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, cpgs@samsung.com

Hi Naveen,

On 27.08.2014 11:44, Naveen Krishna Chatradhi wrote:
> This patchset supports new Exynos7 Samsung SoC based on Cortex-A57.
> Exynos7 is a System-On-Chip (SoC) that is based on 64-bit
> ARMv8 RISC processor.

A general issue with this series is that it introduces a very generic
name for a very specific single SoC. We remember exactly the same cases
for Exynos4 (original name used for Exynos5250) and Exynos5 (Exynos5250)
and we should have learned that it is better to use a specific name
first and only then try to make things common if it turns out to be
appropriate.

Best regards,
Tomasz
