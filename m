From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3 1/2] ARM: dts: Fix sysreg node name in exynos4.dtsi
Date: Tue, 05 Nov 2013 10:40:33 +0100
Message-ID: <5278BD11.3070803@samsung.com>
References: <1383632302-23535-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:64049 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751675Ab3KEJkl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Nov 2013 04:40:41 -0500
In-reply-to: <1383632302-23535-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com

On 05/11/13 07:18, Sachin Kamat wrote:
> Fix the name as per DT node naming convention.
> - rename the node to syscon which is a more generic name.
> - append the register value to the node name.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Thanks Sachin.

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
