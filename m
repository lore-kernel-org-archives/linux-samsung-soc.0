From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 0/5] ARM: dts: exynos5420: add support for hdmi subsystem
Date: Thu, 20 Jun 2013 12:15:28 +0530
Message-ID: <CAPdUM4OQ_Ua_sK7iOyz_ojstnPmT0acp8wUFwLm12zJ5bZs+Tg@mail.gmail.com>
References: <1371706911-27016-1-git-send-email-rahul.sharma@samsung.com>
	<CANuQgHF6yGTprgxdL=qp6EoUVeSzP39NnFciix23W7n-J5EVjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f171.google.com ([209.85.216.171]:57762 "EHLO
	mail-qc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752800Ab3FTGp3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 02:45:29 -0400
Received: by mail-qc0-f171.google.com with SMTP id n1so3518680qcw.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2013 23:45:28 -0700 (PDT)
In-Reply-To: <CANuQgHF6yGTprgxdL=qp6EoUVeSzP39NnFciix23W7n-J5EVjA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <chander.kashyap@linaro.org>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, Tomasz Figa <tomasz.figa@gmail.com>, Rob Herring <rob.herring@calxeda.com>, "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>, Grant Likely <grant.likely@linaro.org>, joshi@samsung.com

Thanks Chander,

I am posting v2 with the suggested changes.

regards,
Rahul Sharma.

On Thu, Jun 20, 2013 at 11:45 AM, Chander Kashyap
<chander.kashyap@linaro.org> wrote:
> On 20 June 2013 11:11, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>> Add dt nodes and clocks for hdmi subsystem. It also add pinctrl
>> node for hdmi hpd gpio and update binding documents.
>>
>> This patch is based on v3.11-next/soc-exynos5420-pinctrl branch
>> at http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git
>>
>> device tree binding document for hdmi compatible type is update at
>> http://www.spinics.net/lists/dri-devel/msg39987.html
>>
>> Andrew Bresticker (1):
>>   ARM: dts: exynos5420: add i2c device nodes
>>
>> Rahul Sharma (4):
>>   ARM: dts: exynos5420: add dt nodes for hdmi subsystem
>>   ARM: dts: exynos5420: add clocks for hdmi subsystem
>>   ARM: dts: exynos5420: add hdmi hpd gpio pinctrl node
>>   ARM: dts: update binding documentation for hdmi subsystem
> While populating exnos5420.dtsi, move nodes with common properties
> across exynos5420 and exynos5420 to exynos5.dtsi
>>
>>  .../devicetree/bindings/video/exynos_hdmi.txt      |   17 ++++-
>>  .../devicetree/bindings/video/exynos_mixer.txt     |    4 ++
>>  arch/arm/boot/dts/exynos5420-pinctrl.dtsi          |    7 ++
>>  arch/arm/boot/dts/exynos5420-smdk5420.dts          |   17 +++++
>>  arch/arm/boot/dts/exynos5420.dtsi                  |   74 ++++++++++++++++++++
>>  5 files changed, 116 insertions(+), 3 deletions(-)
>>
>> --
>> 1.7.10.4
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> with warm regards,
> Chander Kashyap
