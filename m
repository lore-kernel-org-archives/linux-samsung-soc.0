From: Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH 1/2] ARM: firmware: Introduce suspend and resume operations
Date: Thu, 26 Jun 2014 11:33:30 +0900
Message-ID: <53AB867A.901@nvidia.com>
References: <1403713114-18923-1-git-send-email-t.figa@samsung.com> <1403713114-18923-2-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:13993 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757262AbaFZCdf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 22:33:35 -0400
In-Reply-To: <1403713114-18923-2-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Stephen Warren <swarren@nvidia.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>

On 06/26/2014 01:18 AM, Tomasz Figa wrote:
> This patch extends the firmware_ops structure with two new callbacks:
> .suspend() and .resume(). The former is intended to ask the firmware to
> save all its volatile state and suspend the system, without returning
> back to the kernel in between. The latter is to be called early by
> very low level platform suspend code after waking up to restore low
> level hardware state, which can't be restored in non-secure mode.
>
> While at it, outdated version of the structure is removed from the
> documentation and replaced with a reference to the header file.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
