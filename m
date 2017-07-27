From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] soc: Convert to using %pOF instead of full_name
Date: Thu, 27 Jul 2017 17:27:31 +0200
Message-ID: <20170727152730.GL16143@verge.net.au>
References: <20170718214339.7774-49-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54624 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750981AbdG0P1v (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Jul 2017 11:27:51 -0400
Content-Disposition: inline
In-Reply-To: <20170718214339.7774-49-robh@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: arm@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Scott Wood <oss@buserror.net>, Qiang Zhao <qiang.zhao@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On Tue, Jul 18, 2017 at 04:43:29PM -0500, Rob Herring wrote:
> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Scott Wood <oss@buserror.net>
> Cc: Qiang Zhao <qiang.zhao@nxp.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Simon Horman <horms@verge.net.au>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Javier Martinez Canillas <javier@osg.samsung.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-samsung-soc@vger.kernel.org
> ---
>  drivers/soc/fsl/qbman/bman_ccsr.c    | 10 +++++-----
>  drivers/soc/fsl/qbman/bman_portal.c  |  8 +++-----
>  drivers/soc/fsl/qbman/qman_ccsr.c    | 12 ++++++------
>  drivers/soc/fsl/qbman/qman_portal.c  | 11 ++++-------
>  drivers/soc/fsl/qe/gpio.c            |  4 ++--
>  drivers/soc/mediatek/mtk-pmic-wrap.c |  4 ++--
>  drivers/soc/renesas/rcar-rst.c       |  4 ++--
>  drivers/soc/renesas/rcar-sysc.c      |  6 +++---
>  drivers/soc/samsung/pm_domains.c     |  8 ++++----
>  9 files changed, 31 insertions(+), 36 deletions(-)

Renesas portions:

Acked-by: Simon Horman <horms+renesas@verge.net.au>
