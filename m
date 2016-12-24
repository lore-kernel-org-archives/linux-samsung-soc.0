From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/4] PCI: exynos: replace to one register accessor from
 each accessors
Date: Sat, 24 Dec 2016 11:27:04 +0200
Message-ID: <20161224092704.GB4858@kozik-lap>
References: <20161219081740.5457-1-jh80.chung@samsung.com>
 <20161219081740.5457-2-jh80.chung@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wj0-f196.google.com ([209.85.210.196]:32804 "EHLO
        mail-wj0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753300AbcLXJ1N (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 24 Dec 2016 04:27:13 -0500
Content-Disposition: inline
In-Reply-To: <20161219081740.5457-2-jh80.chung@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-pci@vger.kernel.org, helgaas@google.com, krzk@kernel.org, linux-kernel@vger.kernel.org, jingoohan1@gmail.com, javier@osg.samsung.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, cpgs@samsung.com

On Mon, Dec 19, 2016 at 05:17:37PM +0900, Jaehoon Chung wrote:
> There is no reason to maintain *_blk/phy/elbi_* as register accessors.
> It can be replaced to one register accessor.
> 
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
> ---
>  drivers/pci/host/pci-exynos.c | 214 +++++++++++++++++++-----------------------
>  1 file changed, 97 insertions(+), 117 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
