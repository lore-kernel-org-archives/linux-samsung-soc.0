From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 0/3] regulator: max8997: minor updates and device tree
 support
Date: Fri, 23 Nov 2012 16:35:41 +0100
Message-ID: <2301414.MvZtGCMDhm@amdc1227>
References: <1353657795-1725-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36684 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752747Ab2KWPfr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 10:35:47 -0500
In-reply-to: <1353657795-1725-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, myungjoo.ham@samsung.com, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On Friday 23 of November 2012 13:33:12 Thomas Abraham wrote:
> This patch series includes two minor updates to the gpio dvs code in
> max8997 regulator driver and adds device tree support for the same
> driver.
> 
> Thomas Abraham (3):
>   regulator: max8997: reorder buck1/2/5 dvs setup code
>   regulator: max8997: limit the number of dvs registers programmed in
> non-dvs mode regulator: add device tree support for max8997
> 
>  .../bindings/regulator/max8997-regulator.txt       |  146
> ++++++++++++++++ drivers/mfd/max8997.c                              |  
> 73 ++++++++- drivers/regulator/max8997.c                        |  181
> ++++++++++++++++++-- include/linux/mfd/max8997-private.h               
> |    1 +
>  include/linux/mfd/max8997.h                        |    1 +
>  5 files changed, 384 insertions(+), 18 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/regulator/max8997-regulator.txt
> 
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in the body of a message to
> majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

For whole series:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
