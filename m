From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS4: Fix soft reboot hang after suspend/resume
Date: Mon, 14 May 2012 22:43:10 +0900
Message-ID: <4FB10BEE.1010302@samsung.com>
References: <1332929866-31489-1-git-send-email-inderpal.singh@linaro.org>	<065f01cd31a9$c5f38f80$51daae80$%kim@samsung.com> <CAG17yqQ8o3mDCP2k0OE5PG2SXWTyWDh+_xbvKjnvmrgkxqKgZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:55927 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754905Ab2ENNnQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 May 2012 09:43:16 -0400
Received: by dady13 with SMTP id y13so5932272dad.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 May 2012 06:43:16 -0700 (PDT)
In-Reply-To: <CAG17yqQ8o3mDCP2k0OE5PG2SXWTyWDh+_xbvKjnvmrgkxqKgZg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inderpal Singh <inderpal.singh@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, samsung@lists.linaro.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org

On 05/14/12 17:42, Inderpal Singh wrote:
> Hi Kukjin,
>
> On 14 May 2012 13:45, Kukjin Kim<kgene.kim@samsung.com>  wrote:
>> Inderpal Singh wrote:
>>>
>>> Upon wake-up, clear the sleep mode set in INFORM1 register.
>>>
>> Is this for wake-up or _really_ software reset? And is this available on all
>> of EXYNOS4 SoCs?
>
> This is for soft reboot hang after one cycle of suspend/resume is complete.
> And yes this is applicable for all exynos SOCs.
>
Hi,

As I know, we don't need it for all of EXYNOS SoCs but let me check 
about the situation you said with hardware engineer tomorrow. If any 
updates, let you know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
