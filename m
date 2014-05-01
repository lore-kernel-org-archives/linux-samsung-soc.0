From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH v3 01/16] clk: exynos5420: rename parent clocks
Date: Thu, 01 May 2014 12:45:56 +0530
Message-ID: <5361F4AC.2060106@linaro.org>
References: <1398344632-18623-1-git-send-email-shaik.ameer@samsung.com> <1398344632-18623-2-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:59913 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752106AbaEAHQE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 May 2014 03:16:04 -0400
Received: by mail-ie0-f175.google.com with SMTP id rl12so3150663iec.34
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 May 2014 00:16:02 -0700 (PDT)
In-Reply-To: <1398344632-18623-2-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shaik Ameer Basha <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, shaik.samsung@gmail.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

On 04/24/2014 06:33 PM, Shaik Ameer Basha wrote:
> This patch modifies the defined parent clock names as per the
> exynos5420 datasheet.
> 
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c |  359 ++++++++++++++++++----------------
>  1 file changed, 187 insertions(+), 172 deletions(-)
>  mode change 100644 => 100755 drivers/clk/samsung/clk-exynos5420.c
> 

File mode should not be changed.

-- 
Tushar Behera
