From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v5] ARM: EXYNOS: Add MFC device tree support
Date: Fri, 19 Oct 2012 10:39:25 +0900
Message-ID: <5080AF4D.4070402@samsung.com>
References: <1348765784-7508-1-git-send-email-arun.kk@samsung.com>	<1348765784-7508-2-git-send-email-arun.kk@samsung.com>	<50864174.3020508@samsung.com> <CALt3h79k5XsAGM21oOOy0jDh47N8is7LF-bAGcH-PtjK6ekhUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:34908 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754218Ab2JWVyJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Oct 2012 17:54:09 -0400
Received: by mail-pa0-f46.google.com with SMTP id hz1so3068066pad.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Oct 2012 14:54:08 -0700 (PDT)
In-Reply-To: <CALt3h79k5XsAGM21oOOy0jDh47N8is7LF-bAGcH-PtjK6ekhUw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arunkk.samsung@gmail.com>
Cc: sw0312.kim@samsung.com, Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, k.debski@samsung.com, jtp.park@samsung.com, thomas.abraham@linaro.org, k.lewandowsk@samsung.com, s.nawrocki@samsung.com, ch.naveen@samsung.com, joshi@samsung.com

On 10/23/12 19:12, Arun Kumar K wrote:
> Hi Seungwoo Kim,
>
> Thank you for the review.
>
>>> +
>>> +     /* Reserve memory for MFC only if it's available */
>>> +     mfc_mem.compatible = "samsung,mfc-v6";
>>> +     if (of_scan_flat_dt(s5p_fdt_find_mfc_mem,&mfc_mem))
>>
>> of_scan_flat_dt() is called but it does not have __init on its
>> definition. So this causes section mismatch.
>>
>
> The function of_scan_flat_dt is having __init in its definition.

Yes.

> I hope you meant the function s5p_fdt_find_mfc_mem which is not
> defined with __init and causing section mismatch.

I think so.

> I will correct this and post an updated patch.

I fixed when I applied.

Seung-Woo, thanks for your reporting.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
