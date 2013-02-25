From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: S5PV210: Fix compilation error in mach-goni.c
Date: Mon, 25 Feb 2013 11:04:19 +0100
Message-ID: <512B3723.8070801@samsung.com>
References: <1361779938-30023-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:59702 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932353Ab3BYKEY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Feb 2013 05:04:24 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MIR000EHT8K2670@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Feb 2013 10:04:22 +0000 (GMT)
Received: from [106.116.147.32] by eusync3.samsung.com
 (Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit (built Aug
 10 2011)) with ESMTPA id <0MIR004ZITB9FK10@eusync3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Feb 2013 10:04:21 +0000 (GMT)
In-reply-to: <1361779938-30023-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Hi Sachin,

On 02/25/2013 09:12 AM, Sachin Kamat wrote:
> Commit 56bc91 ("[media] s5p-fimc: Redefine platform data structure fo=
r fimc-is")
> split bus_type into fimc_bus_type and sensor_bus_type and converted a=
ll
> instances of it. This file however escaped the change.
>=20
> Without this patch we get the following build error:
> arch/arm/mach-s5pv210/mach-goni.c:848:3: error:
> unknown field =E2=80=98bus_type=E2=80=99 specified in initializer
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>

Thanks for the patch. My apologies for this omission, there is already
similar patch from Arnd [1], [2]. I've asked Mauro to add it to his
tree before the merge window has opened but the media tree was finally
sent without this fixup patch.

[1] https://patchwork.kernel.org/patch/2143211
[2] http://patchwork.linuxtv.org/patch/16892


Thanks,
Sylwester
