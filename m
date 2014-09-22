From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v4 6/8] arm64: exynos7: Enable ARMv8 based Exynos7 (SoC) support
Date: Mon, 22 Sep 2014 09:57:34 +0530
Message-ID: <CAM4voame4yE0AOxqWOr+9pXVKUZkk84qEkHKU81zKvFjNXr8fg@mail.gmail.com>
References: <1410535592-5782-1-git-send-email-ch.naveen@samsung.com>
	<1410535592-5782-8-git-send-email-ch.naveen@samsung.com>
	<20140918161832.GD25330@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f53.google.com ([209.85.192.53]:53304 "EHLO
	mail-qg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750723AbaIVE1f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 00:27:35 -0400
In-Reply-To: <20140918161832.GD25330@e104818-lin.cambridge.arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, "naveenkrishna.ch@gmail.com" <naveenkrishna.ch@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Catalin,

On Thu, Sep 18, 2014 at 9:48 PM, Catalin Marinas
<catalin.marinas@arm.com> wrote:
> On Fri, Sep 12, 2014 at 04:26:30PM +0100, Naveen Krishna Chatradhi wrote:
>> From: Alim Akhtar <alim.akhtar@samsung.com>
>>
>> This patch adds the necessary Kconfig entries to enable
>> support for the ARMv8 based Exynos7 SoC.
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> ---
>>  arch/arm64/Kconfig |   12 ++++++++++++
>
> Please update the defconfig as well as we want the default image build
> to contain all the available platforms.
Will update the defconfig in the next version.

Regards,
Abhilash
>
> --
> Catalin
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
