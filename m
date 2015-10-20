From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH v5 6/8] drivers: soc: add support for exynos SROM driver
Date: Tue, 20 Oct 2015 20:14:46 +0900
Message-ID: <20151020111446.GB923@samsunx.samsung>
References: <1445332540-12814-1-git-send-email-pankaj.dubey@samsung.com>
 <1445332540-12814-7-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52784 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751404AbbJTLOy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Oct 2015 07:14:54 -0400
Content-disposition: inline
In-reply-to: <1445332540-12814-7-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, k.kozlowski@samsung.com, p.fedin@samsung.com, thomas.ab@samsung.com

On Tue, Oct 20, 2015 at 02:45:37PM +0530, Pankaj Dubey wrote:
> This patch adds Exynos SROM controller driver which will handle
> save restore of SROM registers during S2R.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>

...

> +config EXYNOS_SROM
> +	bool
> +	depends on ARM && ARCH_EXYNOS && PM

Cool, thanks! If you want you can add my review.

Andi
