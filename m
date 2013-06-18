From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 0/5] clk/exynos5250: add clocks for hdmi subsystem
Date: Tue, 18 Jun 2013 10:39:09 +0530
Message-ID: <CAPdUM4P8x+aeMwynE=rxfOD8L-fx1W8-C6=zqAnYO73ootX3hw@mail.gmail.com>
References: <1370862062-16680-1-git-send-email-rahul.sharma@samsung.com>
	<CALt3h7-9vMRx0XdxFvM4vkMOekbCwdaa_QP9Bj5Egk6vyZ5WYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:47397 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753973Ab3FRFJL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 01:09:11 -0400
Received: by mail-wi0-f170.google.com with SMTP id ey16so4761175wid.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2013 22:09:09 -0700 (PDT)
In-Reply-To: <CALt3h7-9vMRx0XdxFvM4vkMOekbCwdaa_QP9Bj5Egk6vyZ5WYg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arunkk.samsung@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, Kukjin Kim <kgene.kim@samsung.com>, sw0312.kim@samsung.com, inki.dae@samsung.com, sunil joshi <joshi@samsung.com>, Arun Kumar K <arun.kk@samsung.com>

Hi Mr. Kukjin,

Kindly consider the following patches for review and integration.

regards,
Rahul Sharma.

On Fri, Jun 14, 2013 at 3:39 PM, Arun Kumar K <arunkk.samsung@gmail.com> wrote:
> Hi,
> Tested this series on snow board and is working fine.
>
> Tested-by: Arun Kumar K <arun.kk@samsung.com>
>
> Regards
> Arun
>
> On Mon, Jun 10, 2013 at 4:30 PM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>> Add clock changes for hdmi subsystem for exynos5250 SoC. These
>> include addition of new clocks like mout_hdmi and smmu_tv, associating
>> ID to clk_hdmiphy and some essential corrections.
>>
>> This set is based on kukjin's for-next branch at
>> http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git.
>>
>> Arun Kumar K (1):
>>   clk/exynos5250: Fix HDMI clock number in documentation
>>
>> Rahul Sharma (4):
>>   clk/exynos5250: add mout_hdmi mux clock for hdmi
>>   clk/exynos5250: add sclk_hdmiphy in the list of special clocks
>>   clk/exynos5250: add clock for tv sysmmu
>>   clk/exynos5250: change parent to aclk200_disp1 for hdmi subsystem
>>
>>  .../devicetree/bindings/clock/exynos5250-clock.txt   |   12 +++++++++++-
>>  drivers/clk/samsung/clk-exynos5250.c                 |   18 +++++++++++++-----
>>  2 files changed, 24 insertions(+), 6 deletions(-)
>>
>> --
>> 1.7.10.4
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
