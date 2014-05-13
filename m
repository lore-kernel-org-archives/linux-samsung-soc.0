From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH V3 1/3] ARM: EXYNOS5: PMU support for 5420
Date: Tue, 13 May 2014 15:43:28 +0530
Message-ID: <CAM4voanLYuWDw4pwwEcafy-WJ2vAY9m704cWBU+XF8rgpuCE+Q@mail.gmail.com>
References: <1399546342-30494-1-git-send-email-vikas.sajjan@samsung.com>
	<CAGOxZ52Vnvmu71qH7oJFiuRqbHdtMWYgjjBsPOPf+K52o9tb7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f169.google.com ([209.85.216.169]:39216 "EHLO
	mail-qc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760762AbaEMKN2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 May 2014 06:13:28 -0400
Received: by mail-qc0-f169.google.com with SMTP id e16so116823qcx.28
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2014 03:13:28 -0700 (PDT)
In-Reply-To: <CAGOxZ52Vnvmu71qH7oJFiuRqbHdtMWYgjjBsPOPf+K52o9tb7Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@gmail.com>
Cc: Vikas Sajjan <vikas.sajjan@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, pankaj.dubey@samsung.com, sunil joshi <joshi@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <thomas.ab@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Alim,

[...]
>> +       /* Time taken to stabilized XXTI clock */
>> +       regmap_write(pmu_context->pmu_regmap, EXYNOS5_XXTI_DURATION3, 0x005dc);
>> +
> There is no good reason why XXTI_DURATION3 need to be set here. This
> is something that iROM sets, please remove this.
Will remove.

Regards,
Abhilash
