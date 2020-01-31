Return-Path: <SRS0=nK2D=3U=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76A8C33CB2
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 31 Jan 2020 11:50:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C686E206F0
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 31 Jan 2020 11:50:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbgAaLuX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 31 Jan 2020 06:50:23 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55694 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728535AbgAaLuW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 31 Jan 2020 06:50:22 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 9992D28A964
Subject: Re: [PATCH] ARM: dts: exynos: Fix broken reboot on some Odroid
 U2/X2/U3 boards
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
References: <CGME20200131103734eucas1p2ee9005c0d984a40a158367786ad457bb@eucas1p2.samsung.com>
 <20200131103709.15763-1-m.szyprowski@samsung.com>
 <CAJKOXPc9mWcwmD_zF5t3Lz5c5-pexnQZV2H7ohnwg9NnYkm45A@mail.gmail.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <dd2417a5-400a-cfd5-8f55-bd83d9590deb@collabora.com>
Date:   Fri, 31 Jan 2020 12:50:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAJKOXPc9mWcwmD_zF5t3Lz5c5-pexnQZV2H7ohnwg9NnYkm45A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

Thank you for the patch,

W dniu 31.01.2020 o 12:20, Krzysztof Kozlowski pisze:
> On Fri, 31 Jan 2020 at 11:37, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>
>> The bootloader on Odroid U2/X2/U3 boards configures main ARM clock to
>> 1GHz. During the system shutdown procedure Linux kernel selects so called
>> 'suspend-opp' for the CPU cores, what means that ARM clock is set to
>> 800MHz and the CPU supply voltage is adjusted to that value. PMIC
>> configuration is preserved during the board reboot. Later when the
>> bootloader tries to enter the 1GHz mode, the voltage value configured by
>> the kernel might be not high enough for the CPU to operate stable. This
>> depends on the individual physical properties of each SoC (usually it is
>> related to the production series) and varies between the boards.
>> Typically most of the Odroid U3 boards work fine, while most of the U2
>> and X2 hangs during the reboot.
>>
>> This commit switches suspend-opp to 1GHz for the Odroid U2/X2/U3 boards,
>> what finally fixes this issue.
>>

I added a "reboot" command to my bashrc and tested on v5.5
on an Odroid U2. Without the patch applied it hangs on the first or the
second reboot. With the patch applied it has been continuously running
without problems for over an hour, with each cycle taking ~30s, so it's
been well over 100 reboot cycles and still no problem. With that
in mind you can add my

Tested-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>> index ea55f377d17c..0126587c7fab 100644
>> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>> @@ -534,6 +534,15 @@
>>          cap-mmc-highspeed;
>>   };
>>
>> +&cpu0_opp_table {
>> +       opp-1000000000 {
>> +               opp-suspend;
>> +       };
>> +       opp-800000000 {
>> +               /delete-property/opp-suspend;
>> +       };
>> +};
> 
> Looks good, thanks! I'll take it after merge window.
> However if there is a resend, please put it after &cpu0 label.
> Otherwise, I'll reshuffle it while applying.
> 
> Best regards,
> Krzysztof
> 

