From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 1/3] clk: exynos5420: Add 5800 specific clocks
Date: Wed, 14 May 2014 22:46:00 +0200
Message-ID: <5373D608.5020404@gmail.com>
References: <1399638303-32600-1-git-send-email-arun.kk@samsung.com> <1399638303-32600-2-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f49.google.com ([74.125.83.49]:49498 "EHLO
	mail-ee0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751173AbaENUqN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 16:46:13 -0400
In-Reply-To: <1399638303-32600-2-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, alim.akhtar@samsung.com, olof@lixom.net, arunkk.samsung@gmail.com

Hi Arun, Alim,

On 09.05.2014 14:25, Arun Kumar K wrote:
> From: Alim Akhtar <alim.akhtar@samsung.com>
> 
> Exynos5800 clock structure is mostly similar to 5420 with only
> a small delta changes. So the 5420 clock file is re-used for
> 5800 also. The common clocks for both are seggreagated and few
> clocks which are different for both are separately initialized.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> ---
> Changes from v1
> ---------------
> - Rebased on clock cleanup by Shaik

This still isn't using correct base and won't compile with current
sources, even if it applies fine. This is partially my fault as we had a
lot of issues with cross-tree dependencies and it was not clear what to
base clock patches on, but I'll try to keep samsung-clk-next branch of
samsung-clk [1] tree up to date, so it should be safe to base on.

[1] git://git.kernel.org/pub/scm/linux/kernel/git/tfiga/samsung-clk.git

Best regards,
Tomasz
