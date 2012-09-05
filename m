From: Shaik Ameer Basha <shaik.samsung@gmail.com>
Subject: Re: [PATCH v4 0/2] Add device tree and clock support for G-Scaler
Date: Wed, 5 Sep 2012 09:09:57 +0530
Message-ID: <CAOD6ATrzuXqkpKYNE3mWxjekN41U32oF0Kx4zYVbwykMNd7ziw@mail.gmail.com>
References: <1344852144-25598-1-git-send-email-shaik.ameer@samsung.com>
	<227001cd8ae9$9b76ce40$d2646ac0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:59891 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752016Ab2IEDj6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Sep 2012 23:39:58 -0400
Received: by vcbfk26 with SMTP id fk26so76812vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Sep 2012 20:39:57 -0700 (PDT)
In-Reply-To: <227001cd8ae9$9b76ce40$d2646ac0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Shaik Ameer Basha <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, olofj@google.com, thomas.ab@samsung.com, sylvester.nawrocki@gmail.com, joshi@samsung.com

Hi Kukjin Kim,

On Wed, Sep 5, 2012 at 3:37 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Shaik Ameer Basha wrote:
>>
>> This patch series adds clock support for G-Scaler and device node
>>  entries for G-Scaler on exynos5.
>>
>> This patch is based on Kukjin Kim's (linux-samsung) for-next branch.
>>
> https://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>>
>> changes since v3:
>> - Addressed review comments from Kukjin Kim
>>     http://www.mail-archive.com/linux-samsung-
>> soc@vger.kernel.org/msg11658.html
>>     http://www.mail-archive.com/linux-samsung-
>> soc@vger.kernel.org/msg11659.html
>>
>> changes since v2:
>> - Addressed review comments from Sylwester Nawrocki
>>     http://www.mail-archive.com/linux-samsung-
>> soc@vger.kernel.org/msg11372.html
>> - Addressed review comments from Kukjin Kim and Sunyoung Kang
>>     http://www.mail-archive.com/linux-samsung-
>> soc@vger.kernel.org/msg11377.html
>>     http://www.mail-archive.com/linux-samsung-
>> soc@vger.kernel.org/msg11429.html
>>
>> changes since v1:
>> - Addressed review comments from Sylwester Nawrocki
>>     http://www.mail-archive.com/linux-samsung-
>> soc@vger.kernel.org/msg11177.html
>> - Addressed review comments from Sachin Kamat
>>     http://www.mail-archive.com/linux-samsung-
>> soc@vger.kernel.org/msg11176.html
>>     http://www.mail-archive.com/linux-samsung-
>> soc@vger.kernel.org/msg11178.html
>>
>> Shaik Ameer Basha (2):
>>   ARM: EXYNOS: Add clock support for G-Scaler
>>   ARM: EXYNOS: Adds G-Scaler device from Device Tree
>>
>>  .../devicetree/bindings/media/exynos5-gsc.txt      |   32 +++++++
>>  arch/arm/boot/dts/exynos5250.dtsi                  |   28 +++++++
>>  arch/arm/mach-exynos/clock-exynos5.c               |   86
>> ++++++++++++++++++++
>>  arch/arm/mach-exynos/include/mach/map.h            |    5 +
>>  arch/arm/mach-exynos/mach-exynos5-dt.c             |    8 ++
>>  5 files changed, 159 insertions(+), 0 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/media/exynos5-
>> gsc.txt
>
> Looks OK, will apply this series.
>
> BTW, just wondering...the sign-chain is right? Hoping you know, if sign-off
> has been added without their handling on the patches, it's wrong.
>

This sign-chain is fine. Please apply this series to your tree.

Thanks,
Shaik Ameer Basha

> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
