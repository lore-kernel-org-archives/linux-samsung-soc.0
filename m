From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 15/27] ARM: dts: exynos3250: Add uart dt node to support
 seiral ports
Date: Fri, 11 Apr 2014 09:33:28 +0530
Message-ID: <CAK9yfHxdeJarGCYgLADpxYS3BtxLt6hg0NJBrdYqrcKctFqU1g@mail.gmail.com>
References: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
	<1397124377-16969-7-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:36152 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751229AbaDKED3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Apr 2014 00:03:29 -0400
Received: by mail-lb0-f182.google.com with SMTP id n15so3112930lbi.27
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Apr 2014 21:03:28 -0700 (PDT)
In-Reply-To: <1397124377-16969-7-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, hyunhee.kim@samsung.com, yj44.cho@samsung.com, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On 10 April 2014 15:36, Chanwoo Choi <cw00.choi@samsung.com> wrote:
> This patch add UART dt node for Exynos3250. Exynos3250 uses same UART IP
> of Exynos4 SoC and has only two independent channels.
>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> [Fix incorrect clock id by Tomasz Figa]
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---

typo in patch subject: s/seiral/serial

-- 
With warm regards,
Sachin
