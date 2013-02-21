From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH V2] ARM: dts: exynos5250-arndale: Add PMIC node entry
Date: Thu, 21 Feb 2013 14:45:50 +0530
Message-ID: <5125E5C6.9020906@linaro.org>
References: <1360542984-31552-1-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:33672 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752359Ab3BUJP4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Feb 2013 04:15:56 -0500
Received: by mail-pa0-f47.google.com with SMTP id bj3so4567879pad.20
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Feb 2013 01:15:55 -0800 (PST)
In-Reply-To: <1360542984-31552-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Daniel Kachhap <amit.daniel@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, amit.kachhap@gmail.com, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org

On 02/11/2013 06:06 AM, Amit Daniel Kachhap wrote:
> Added S5M8767 PMIC DT nodes for Arndale board. Only the used
> LDO's/BUCK are defined here. Also the nodes describe the default/reset
> state LDO's and no power mangement tuning is implemented. The usage
> desription can be found in s5m8767 device tree binding documentation.
> 
> Cc: Tushar Behera <tushar.behera@linaro.org>

Tested-by: Tushar Behera <tushar.behera@linaro.org>

> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>

-- 
Tushar Behera
