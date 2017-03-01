From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH V3] ARM: dts: exynos5440: support the phy-pcie node for
 pcie
Date: Wed, 1 Mar 2017 19:24:07 +0200
Message-ID: <20170301172407.zuugioa7yjwbjl6r@kozik-lap>
References: <CGME20170228070028epcas1p1dba363a5f02d2a6fd412679190f17139@epcas1p1.samsung.com>
 <20170228070026.8725-1-jh80.chung@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:35400 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751673AbdCARYa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Mar 2017 12:24:30 -0500
Content-Disposition: inline
In-Reply-To: <20170228070026.8725-1-jh80.chung@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene@kernel.org, robh+dt@kernel.org, javier@osg.samsung.com, niyas.ahmed@samsung.com, alim.akhtar@samsung.com, pankaj.dubey@samsung.com

On Tue, Feb 28, 2017 at 04:00:26PM +0900, Jaehoon Chung wrote:
> Add pcie-phy node for using phy-exynos-pcie.
> 
> There are some modifications.
> 1. Remove the configuration space values in "ranges" property.
> - The getting configuration space from ranges is old way.
> - Instead, It can be got from "config"
> 
> 2. Use the reg-names as "elbi", "config".
> - Can know the purpose of use with reg-names.
> 
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
> Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
> Changelog on V3:
> - Split from the patches relevant to pcie
> - Modify the commit-message
> - Keep the original comment in dt-file
> - Send this patch after applying the other patches
> 
> Changelog on V2:
> - Removes the child-node
> - Fixes the typo
> - Removes the unnecessary comments
> 
>  arch/arm/boot/dts/exynos5440.dtsi | 30 ++++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
>

Looks okay. I'll apply it after merge window.

Best regards,
Krzysztof
