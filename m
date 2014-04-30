From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v3 08/16] clk: exynos5420: update clocks for PERIS and GEN blocks
Date: Wed, 30 Apr 2014 21:11:47 +0530
Message-ID: <CAK9yfHx4AsW9_wgkoY+7NnY6iHMURSc=hS3_g+tSfWZgWUA8oA@mail.gmail.com>
References: <1398344632-18623-1-git-send-email-shaik.ameer@samsung.com>
	<1398344632-18623-9-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:39041 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758979AbaD3Plr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Apr 2014 11:41:47 -0400
Received: by mail-ob0-f180.google.com with SMTP id wm4so2136936obc.25
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Apr 2014 08:41:47 -0700 (PDT)
In-Reply-To: <1398344632-18623-9-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shaik Ameer Basha <shaik.ameer@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, shaik.samsung@gmail.com, Rahul Sharma <r.sh.open@gmail.com>, Rahul Sharma <rahul.sharma@samsung.com>

Hi Shaik,

On 24 April 2014 18:33, Shaik Ameer Basha <shaik.ameer@samsung.com> wrote:
> This patch fixes some parent-child relationships according
> to the latest datasheet and adds more clocks related to
> PERIS and GEN blocks.

Again, it is better to split up the fixes from other stuff so that it
can go in the -rc
and can be back ported to stable if needed.

-- 
With warm regards,
Sachin
