From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH v3] ARM: Samsung: fix watchdog reset issue with clk_get()
Date: Mon, 22 Aug 2011 12:27:19 +0530
Message-ID: <4E51FDCF.3070305@linaro.org>
References: <1313663117-29191-1-git-send-email-m.szyprowski@samsung.com>	<4E4E2EE6.70503@linaro.org>	<002601cc5e5a$5f3f3ff0$1dbdbfd0$%szyprowski@samsung.com> <CAH9JG2XW1OaK=_cYHsKpXBfFCpmGMAFg=pC5HsK=-z6D-W6bqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f170.google.com ([209.85.210.170]:47123 "EHLO
	mail-iy0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750806Ab1HVG5Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Aug 2011 02:57:16 -0400
Received: by iye16 with SMTP id 16so9807070iye.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Aug 2011 23:57:15 -0700 (PDT)
In-Reply-To: <CAH9JG2XW1OaK=_cYHsKpXBfFCpmGMAFg=pC5HsK=-z6D-W6bqg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Angus Ainslie <angus.ainslie@linaro.org>

Hi Kyungmin,

On Friday 19 August 2011 04:14 PM, Kyungmin Park wrote:
> Interesting. there's no s5p_reset_hook at exynos4.
> Anyway, after implement the s5p_reset_hook, it's working without
> hacking of v7-fin.
>
Thanks for the pointer. After adding s5p_reset_hook, tested soft-reboot 
successfully on ORIGEN.

> Send it another mail.
>
> Thank you,
> Kyungmin Park
>

-- 
Tushar Behera
