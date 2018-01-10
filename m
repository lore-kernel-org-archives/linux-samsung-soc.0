From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [RFC PATCH 0/9] soc: samsung: Add support of suspend-to-RAM on
 Exynos5433
Date: Wed, 10 Jan 2018 18:19:50 +0900
Message-ID: <5A55DAB6.2020808@samsung.com>
References: <CGME20180109075904epcas2p302d58aacfbb2195e455a25c90a1c610b@epcas2p3.samsung.com>
        <1515484746-10656-1-git-send-email-cw00.choi@samsung.com>
        <CAJKOXPcJPbVR+WqAzhM8Tuud1Pd9W2p_23iTUveXc5aJtgTJCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:55668 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751827AbeAJJTy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 10 Jan 2018 04:19:54 -0500
In-reply-to: <CAJKOXPcJPbVR+WqAzhM8Tuud1Pd9W2p_23iTUveXc5aJtgTJCg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, kgene@kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, chanwoo@kernel.org, Jaehoon Chung <jh80.chung@samsung.com>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On 2018년 01월 09일 20:56, Krzysztof Kozlowski wrote:
> On Tue, Jan 9, 2018 at 8:58 AM, Chanwoo Choi <cw00.choi@samsung.com> wrote:
>> In the mainline, there is no case to support the suspend-to-RAM for Samsung
>> Exynos SoC. This patchset support the suspend-to-RAM for 64bit Exynos SoC.
>>
>> For 32bit, arch/arm/mach-exynos/* directoy contains the suspend-related
>> codes such as suspend.c/exynos.c. But, 64bit Exynos should contain
>> the suspend-related codes in the drivers/soc/samsung/*. So, this patchset
>> develop the patch4/5 for drivers/soc/samsung/exynos-pm.c. to support suspend
>> 64bit Exynos SoC.
>>
>> But, I'm not sure what is proper approach for both 32/64bit Exynos.
>> - Approach1 : Split out the supend-related codes between 32/64bit.
>>   : arch/arm/mach-exynos/* contains the suspend-related codes for 32bit.
>>   : drivers/soc/samsung/* contains the suspend-related codes for 64bit.
>> - Approach2 : Consolidate the all suspend-related codes to drivers/soc/samsung/.
> 
> I prefer approach #2 - consolidate the code... unless this creates
> some unmaintainable monster :)

I'll try to consolidate code.

[snip]

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
