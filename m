From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 1/6] mfd: max8997: Initialize max8997 register map
Date: Mon, 7 Nov 2016 11:22:42 -0300
Message-ID: <1b150578-b766-3470-475c-fe494bcc8c54@osg.samsung.com>
References: <1478513376-14307-1-git-send-email-pankaj.dubey@samsung.com>
 <1478513376-14307-2-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:59536
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752364AbcKGOWv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 09:22:51 -0500
In-Reply-To: <1478513376-14307-2-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, kgene@kernel.org, thomas.ab@samsung.com, myungjoo.ham@samsung.com, Lee Jones <lee.jones@linaro.org>

Hello Pankaj,

On 11/07/2016 07:09 AM, Pankaj Dubey wrote:
> This patch add regmap initialization to use register map
> in max8997-clk device driver
> 
> CC: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---

Patch looks good to me. Now that the driver uses regmap, I think you should
be able to get rid of drivers/mfd/max8997-irq.c and use the regmap IRQ chip
like is done in most Maxim PMIC MFD drivers.

That can be done as a follow-up of this series though.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
