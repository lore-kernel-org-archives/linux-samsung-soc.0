From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/4] ARM: EXYNOS: Add __init attribute to
 universal_camera_init()
Date: Thu, 01 Mar 2012 10:33:47 +0100
Message-ID: <4F4F427B.3030502@samsung.com>
References: <1330593446-663-1-git-send-email-tushar.behera@linaro.org>
 <1330593446-663-3-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45109 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753955Ab2CAJdu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Mar 2012 04:33:50 -0500
Received: from euspt2 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M0700BMI98CBN@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 09:33:48 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M070074O98CHD@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 09:33:48 +0000 (GMT)
In-reply-to: <1330593446-663-3-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org, linux@arm.linux.org.uk, kgene.kim@samsung.com, kyungmin.park@samsung.com, patches@linaro.org

On 03/01/2012 10:17 AM, Tushar Behera wrote:
> s3c_set_platdata() is defined with __init attribute, hence all functions
> referencing this function should also be defined with __init attribute.
> 
> universal_camera_init() is referenced only in '__init universal_machine_init()',
> thus this change won't put any additional constraint on the usage of
> universal_camera_init().
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>

Thanks.

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
