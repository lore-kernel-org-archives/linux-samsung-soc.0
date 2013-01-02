From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: enable 4 cores secondary cpu up for exynos5440
Date: Wed, 02 Jan 2013 14:44:15 -0800
Message-ID: <042701cde93a$b2671f10$17355d30$@samsung.com>
References: <1356980980-3387-1-git-send-email-kgene.kim@samsung.com>
 <CAOesGMjCzs6Uh8EEbrNcknGUezyVdbYBJ1M-vXgMYt1jxRPUKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42244 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752753Ab3ABWo3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jan 2013 17:44:29 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MG000DOOSI4N7K0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 07:44:28 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MG0002K9SI2XVC0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 07:44:27 +0900 (KST)
In-reply-to: <CAOesGMjCzs6Uh8EEbrNcknGUezyVdbYBJ1M-vXgMYt1jxRPUKQ@mail.gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> Hi,
> 
Hi,

[...]

> It seems better to create a helper function here instead and calling
> that, instead of switching to a conditional open-coded block to this
> function.
>
Yes, sounds good. I will.

> > @@ -178,6 +183,8 @@ static void __init exynos_smp_init_cpus(void)
> >
> >         if (soc_is_exynos5250())
> >                 ncores = 2;
> > +       else if (soc_is_exynos5440())
> > +               ncores = 4;
> 
> In the future it would make sense to get the core count from the
> device tree instead.
> 
Agreed.

Thanks.

- Kukjin
