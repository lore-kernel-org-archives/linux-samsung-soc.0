From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 1/2] arm64: dts: exynos: Add USB 3.0 controller node for
 Exynos7
Date: Tue, 17 Jan 2017 10:37:14 -0300
Message-ID: <3a607d18-acf9-37f5-a6d4-7f8fe538d27f@osg.samsung.com>
References: <1484649143-19423-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20170117102939epcas5p1aa25d6d8d080c086fb237e645bedbd17@epcas5p1.samsung.com>
 <1484649143-19423-2-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:35159
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750787AbdAQNh1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Jan 2017 08:37:27 -0500
In-Reply-To: <1484649143-19423-2-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: krzk@kernel.org, kgene@kernel.org, robh+dt@kernel.org, sanath@samsung.com, gautamvivek1987@gmail.com

Hello Pankaj,

On 01/17/2017 07:32 AM, Pankaj Dubey wrote:
> Add USB 3.0 DRD controller device node, with its clock
> and phy information to enable the same on Exynos7.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Vivek Gautam <gautamvivek1987@gmail.com>

The S-o-B order isn't correct. You are the one posting the patch so
yours should be the last one.

Also, wasn't this patch originally from Vivek? If you didn't change
that much, I think that he should be listed as the patch author.

I don't have an Exynos7 manual to verify but the patch looks good.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
