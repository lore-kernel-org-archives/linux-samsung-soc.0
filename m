From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH V3] ARM: dts: exynos5440: support the phy-pcie node for
 pcie
Date: Tue, 7 Mar 2017 22:05:45 +0200
Message-ID: <20170307200545.oxibgmzx6wwc2fay@kozik-lap>
References: <CGME20170228070028epcas1p1dba363a5f02d2a6fd412679190f17139@epcas1p1.samsung.com>
 <20170228070026.8725-1-jh80.chung@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:34493 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756149AbdCGUkb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Mar 2017 15:40:31 -0500
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

Thanks, applied with changes:
1. Proper subject prefix. Please pay attention to that.
2. Re-write of commit message. There were language errors, mixed up
   prepositions. Also a "phy-pcie node" cannot be "supported". You can
   add a node. You cannot support a node.

The quality of commit message is important for maintainability of source
code because eventually it explains the logic behind the changes in the
code.

Best regards,
Krzysztof
