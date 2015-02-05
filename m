From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [v2,2/3] ARM: EXYNOS: Constify exynos_pm_data and of_device_id
 array
Date: Thu, 05 Feb 2015 10:26:32 +0530
Message-ID: <54D2F800.3060806@samsung.com>
References: <1422961601-7087-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:32979 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751777AbbBEEzq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Feb 2015 23:55:46 -0500
In-reply-to: <1422961601-7087-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Krzysztof,

On Tuesday 03 February 2015 04:36 PM, Krzysztof Kozlowski wrote:
> The 'exynos5420_pm_data' and of_device_id array are not modified and can
> be made const.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>

Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>


Thanks,
Pankaj Dubey
