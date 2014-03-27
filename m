From: Gerhard Sittig <gsi@denx.de>
Subject: Re: [PATCH v2 3/7] clk: exynos5420: Rename clock IDs
Date: Thu, 27 Mar 2014 20:49:59 +0100
Message-ID: <20140327194959.GY3998@book.gsilab.sittig.org>
References: <1395918470-16374-1-git-send-email-shaik.ameer@samsung.com>
 <1395918470-16374-4-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:47956 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755279AbaC0TuE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Mar 2014 15:50:04 -0400
Content-Disposition: inline
In-Reply-To: <1395918470-16374-4-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shaik Ameer Basha <shaik.ameer@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mturquette@linaro.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, shaik.samsung@gmail.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

On Thu, 2014-03-27 at 16:37 +0530, Shaik Ameer Basha wrote:
> 
> From: Rahul Sharma <rahul.sharma@samsung.com>
> 
> This patch renames the clock IDs used for the DT bindings as
> per Exynos5420 datasheet.
> 
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c   |  162 +++++++++++++++++---------------
>  include/dt-bindings/clock/exynos5420.h |  138 +++++++++++++--------------
>  2 files changed, 154 insertions(+), 146 deletions(-)

does this break bisection when you rename symbolic identifiers in
their declaration yet don't update references at the users?


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
