From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 4/7] clk: exynos5420: Rename clock names
Date: Tue, 15 Apr 2014 19:05:33 +0200
Message-ID: <534D66DD.30503@gmail.com>
References: <1395918470-16374-1-git-send-email-shaik.ameer@samsung.com> <1395918470-16374-5-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:64086 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751169AbaDORFh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Apr 2014 13:05:37 -0400
In-Reply-To: <1395918470-16374-5-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shaik Ameer Basha <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, joshi@samsung.com, shaik.samsung@gmail.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Hi Shaik,

On 27.03.2014 12:07, Shaik Ameer Basha wrote:
> From: Rahul Sharma <rahul.sharma@samsung.com>
>
> Maintain the mout_, dout_, sclk_ prefix to the clock names
> wherever applicable.

Looking at the patch, it does seem to do more than that. Considering my 
comments to patch 3/7, I would drop the renames simply adding *CLK_ 
prefix (except SCLK_, which is fine as it specifies clock type, just as 
MOUT_/DOUT_/etc.).

Best regards,
Tomasz
