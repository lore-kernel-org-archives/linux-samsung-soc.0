From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] soc/samsung: use kbasename instead of open coding
Date: Mon, 24 Jul 2017 06:49:25 +0200
Message-ID: <20170724044925.GA20898@kozik-book>
References: <20170718214339.7774-50-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f182.google.com ([209.85.192.182]:32919 "EHLO
        mail-pf0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750822AbdGXEtw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Jul 2017 00:49:52 -0400
Content-Disposition: inline
In-Reply-To: <20170718214339.7774-50-robh@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Tue, Jul 18, 2017 at 04:43:30PM -0500, Rob Herring wrote:
> In preparation to not store the full path of nodes in full_name, use
> kbasename instead as it will work either with the full path or not.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Javier Martinez Canillas <javier@osg.samsung.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> ---
>  drivers/soc/samsung/pm_domains.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Thanks, applied, with slightly changed title.

Best regards,
Krzysztof
