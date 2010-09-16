From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 0/5] ARM: S5PV210: Add support CPUFREQ for S5PV210/S5PC110
Date: Thu, 16 Sep 2010 09:33:18 +0900
Message-ID: <AANLkTikB288=Y8_jMXCwfsEBqwRdOTKyjMJag=SCKYdP@mail.gmail.com>
References: <1284537162-3129-1-git-send-email-jc.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:40674 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752085Ab0IPAdT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Sep 2010 20:33:19 -0400
Received: by wwb31 with SMTP id 31so122887wwb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2010 17:33:18 -0700 (PDT)
In-Reply-To: <1284537162-3129-1-git-send-email-jc.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaecheol Lee <jc.lee@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, kgene.kim@samsung.com, =?UTF-8?B?7ZWo66qF7KO8?= <myungjoo.ham@samsung.com>, Andrew Morton <akpm@linux-foundation.org>

=46irst thank you for posting the patches.
but I'm worry about sending the same feature patches from different div=
isions.

I'm not sure you're talking with kgene. but there are some codes
posted by Mr. Ham and get feedback and reviewed with kgene.
http://git.infradead.org/users/kmpark/linux-2.6-samsung/shortlog/refs/h=
eads/cpufreq

To kgene,
One code from DMC(me), another code from System LSI(you). then which
codes do you pick up and apply to mainline?
and what's rules or principles?

Thank you,
Kyungmin Park

On Wed, Sep 15, 2010 at 4:52 PM, Jaecheol Lee <jc.lee@samsung.com> wrot=
e:
> This patch adds CPUFREQ for S5PV210/S5PC110.
>
> [PATCH 1/5] ARM: S5PV210: Add support DMC map_desc table
> [PATCH 2/5] ARM: S5PV210: Add struct clk_ops for clk_fout_apll
> [PATCH 3/5] ARM: S5PV210: Add Register definition for CMU
> [PATCH 4/5] ARM: S5PV210: Add support CPUFREQ
> [PATCH 5/5] ARM: S5PV210: Update Kconfig and Makefile for supporting =
CPUFREQ driver
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
