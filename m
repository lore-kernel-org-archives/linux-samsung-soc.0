From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH Resend 3/3] ARM: EXYNOS: Map SYSRAM address through DT
Date: Wed, 16 Apr 2014 17:22:55 +0530
Message-ID: <CAK9yfHw3vrZKHNzXtRfiG0cZkOwKyco2j4y69njdjMbYj3xiDA@mail.gmail.com>
References: <1395224705-2935-1-git-send-email-sachin.kamat@linaro.org>
	<1395224705-2935-3-git-send-email-sachin.kamat@linaro.org>
	<534E642E.7010507@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:41796 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755604AbaDPLwz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 07:52:55 -0400
Received: by mail-oa0-f42.google.com with SMTP id i4so12390515oah.29
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Apr 2014 04:52:55 -0700 (PDT)
In-Reply-To: <534E642E.7010507@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Mark Rutland <mark.rutland@arm.com>

Hi Chanwoo,

On 16 April 2014 16:36, Chanwoo Choi <cw00.choi@samsung.com> wrote:
> Hi Sachin,
>
> I want to use this patch to remove static SYSRAM memory mapping for Exynos3250.
> But this patch has conflict on 3.15-rc1 base.
> Do you have a plan to resend this patch?

Rebased and resent (CC'd you). Please let me have your tested-by on it.

---
With warm regards,
Sachin
