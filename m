From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: Add level for cpu dt node for exynos7
Date: Sat, 12 Nov 2016 11:24:20 -0300
Message-ID: <8a63bfe0-b23c-3583-6e5e-c17fe412e34d@osg.samsung.com>
References: <1478945832-1826-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:55278
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S964786AbcKLOY3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 12 Nov 2016 09:24:29 -0500
In-Reply-To: <1478945832-1826-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: krzk@kernel.org, will.deacon@arm.com, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, robin.murphy@arm.com

Hello Alim,

On 11/12/2016 07:17 AM, Alim Akhtar wrote:
> This patch adds level for cpu dt node, so that these levels can be used

Do you mean s/level/label here? I'm asking because you are using level
consistently in the subject line and commit message but I'm not sure
what it means in this context.

> as a phandle whenever required. For example, adding a "interrupt-affinity"
> for arm pmu node.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

The change looks good to me though.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
