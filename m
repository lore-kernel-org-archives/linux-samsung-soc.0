From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH v11 0/3] Exynos 5410 support
Date: Tue, 27 May 2014 10:44:40 -0700
Message-ID: <7hd2ez9kvr.fsf@paris.lan>
References: <1401074613-29227-1-git-send-email-t.dakhran@samsung.com>
	<7hr43f9mmn.fsf@paris.lan>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:55884 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752733AbaE0Roo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 May 2014 13:44:44 -0400
Received: by mail-pa0-f49.google.com with SMTP id lj1so9504876pab.36
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 May 2014 10:44:44 -0700 (PDT)
In-Reply-To: <7hr43f9mmn.fsf@paris.lan> (Kevin Hilman's message of "Tue, 27
	May 2014 10:06:56 -0700")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tarek Dakhran <t.dakhran@samsung.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Romain Naour <romain.naour@openwide.fr>, Chander Kashyap <chander.kashyap@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Tarek Dakhran <t.dakhran@gmail.com>

Kevin Hilman <khilman@linaro.org> writes:

> Tarek Dakhran <t.dakhran@samsung.com> writes:
>
>> The series of patches represent support of Exynos 5410 SoC
>>
>> The Exynos 5410 is the first Samsung SoC based on big.LITTLE architecture
>>
>> Patches add new platform description, support of clock controller and device
>> tree for Exynos 5410.
>>
>> Has been build on Samsung Linux Kernel
>>   (branch: for-next, commit: 97eae6c Merge branch 'v3.16-next/multiplatform' into for-next)
>>
>> Has been tested on: 1) Exynos 5410 reference board (exynos_defconfig)
>> 		    2) Exynos 5410 reference board (multi_v7_defconfig)
>> 		    3) Odroid-XU board (exynos_defconfig)
>> 		    4) Odroid-XU board (multi_v7_defconfig)
>
> Tested-by: Kevin Hilman <khilman@linaro.org>
>
> FYI, I boot tested this on an odroid-xu (exynos_defconfig and
> multi_v7_defconfig.)

Oops, I may have spoke to soon.  There seem to be some problems with
multi_v7_defconfig.

Applying this series directly on the commit mentioned above and testing,
it works just fine using multi_v7_defconfig.

However, if I directly test the current contents of the samsung for-next
branch (where this series has been merged) it no longer boots on the
odroid-xu.

A quick diff shows that there are some other changes to
multi_v7_defconfig in the samsung/for-next branch that may be causing
problems here.

Kevin
