From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2] clk: samsung: exynos3250: Add driver for CMU_ISP clock
 domain
Date: Tue, 17 Mar 2015 11:52:18 +0100
Message-ID: <55080762.9080701@samsung.com>
References: <1425302250-13446-1-git-send-email-b.michalska@samsung.com>
 <1425302250-13446-2-git-send-email-b.michalska@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56204 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932425AbbCQKwX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Mar 2015 06:52:23 -0400
In-reply-to: <1425302250-13446-2-git-send-email-b.michalska@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Beata Michalska <b.michalska@samsung.com>
Cc: tomasz.figa@gmail.com, mturquette@linaro.org, kgene@kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, sw0312.kim@samsung.com

On 02/03/15 14:17, Beata Michalska wrote:
> From: Tomasz Figa <t.figa@samsung.com>
> 
> Add clock controller for CMU ISP clock domain on Exynos3250,
> providing clocks for FIMC-IS subsystem.
> 
> [b.michalska:use samsung_cmu_register_one to register
>  the provider; updated DT binding documentation]

Thanks for moving the initial clocks settings to dts, I've added this
patch to my tree.
In future please don't forget to add version information to subsequent
patch iterations, it helps to ensure the right patch version is being
applied.

-- 
Regards,
Sylwester
