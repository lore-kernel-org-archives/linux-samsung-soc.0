From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: EXYNOS: Set 64-bit DMA mask for EXYNOS5250
Date: Fri, 9 Aug 2013 11:27:52 +0100
Message-ID: <20130809102752.GP23006@n2100.arm.linux.org.uk>
References: <1376042714-26513-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:40864 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966467Ab3HIK2u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Aug 2013 06:28:50 -0400
Content-Disposition: inline
In-Reply-To: <1376042714-26513-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

On Fri, Aug 09, 2013 at 03:35:14PM +0530, Tushar Behera wrote:
> When LPAE is enabled, we need to set 64bit DMA mask bits.

*Please* check the list archives.  I sent during the last 7 days a patch
series which should address this problem.  Unfortunately, it seems almost
no one has looked at it.
