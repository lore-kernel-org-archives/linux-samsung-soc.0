From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH 2/2] ARM: dts: enable fimd for exynos5800 based peach-pi board
Date: Fri, 16 May 2014 16:19:24 +0530
Message-ID: <CAPdUM4O4bEHtSnmiFno1Lm-0rH9qFLJ6S=7THeywAUCFen_iNw@mail.gmail.com>
References: <1399877120-4634-1-git-send-email-rahul.sharma@samsung.com>
	<1399877120-4634-3-git-send-email-rahul.sharma@samsung.com>
	<004701cf6e48$b4578910$1d069b30$%han@samsung.com>
	<CAPdUM4Mfh-LnUX_fHi7BTJ1LcE+b4oHzjgWAJk+AWvV7UJbGnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:61002 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756788AbaEPKtZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 May 2014 06:49:25 -0400
In-Reply-To: <CAPdUM4Mfh-LnUX_fHi7BTJ1LcE+b4oHzjgWAJk+AWvV7UJbGnA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>

<Gentle Ping>

On 13 May 2014 08:53, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Thanks Jingoo Han.
>
> Hi Kukjin,
>
> Please consider both of these series for your tree.
>
> 1) http://www.spinics.net/lists/arm-kernel/msg329697.html
> 2) http://www.spinics.net/lists/arm-kernel/msg330291.html
>
> Regards,
> Rahul Sharma
>
> On 13 May 2014 06:44, Jingoo Han <jg1.han@samsung.com> wrote:
>> On Monday, May 12, 2014 3:45 PM, Rahul Sharma wrote:
>>>
>>> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>>>
>>> Enable FIMD for peach-pi board.
>>>
>>> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
>>
>> Reviewed-by: Jingoo Han <jg1.han@samsung.com>
>>
>> Best regards,
>> Jingoo Han
>>
>>> ---
>>>  arch/arm/boot/dts/exynos5800-peach-pi.dts |    5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>>> index 426705a..cccacdd 100644
>>> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
>>> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>>> @@ -157,6 +157,11 @@
>>>       };
>>>  };
>>>
>>> +&fimd {
>>> +     status = "okay";
>>> +     samsung,invert-vclk;
>>> +};
>>> +
>>>  &hsi2c_9 {
>>>       status = "okay";
>>>       clock-frequency = <400000>;
>>> --
>>> 1.7.9.5
>>
