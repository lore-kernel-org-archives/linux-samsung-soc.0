From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH 3/4] clk: samsung: always allocate the clk_table
Date: Wed, 13 Mar 2013 08:30:01 +0530
Message-ID: <CAGOxZ50ONw82_6=noLLLg=bFdr-kmOQ8+RZP3MsGEixE1eG-GA@mail.gmail.com>
References: <201303120042.09633.heiko@sntech.de> <201303120044.29499.heiko@sntech.de>
 <CAJuYYwT183EcZZ20P8D7AP34CwXfKYLzsmZdoJz1ny7XznzyAg@mail.gmail.com>
 <513F1037.3080107@samsung.com> <CAJuYYwRDv4ULqXQOXmTsGfqVopt6XPR+XXb-pPZ35+pC7kUN3A@mail.gmail.com>
 <513F321E.1020703@samsung.com> <CAJuYYwSiQs0JC7esh-urmSUUsxhfP8bsGisdkvxHs8DFvLAS6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f170.google.com ([209.85.220.170]:49670 "EHLO
	mail-vc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755587Ab3CMDAn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Mar 2013 23:00:43 -0400
Received: by mail-vc0-f170.google.com with SMTP id p16so289300vcq.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2013 20:00:42 -0700 (PDT)
In-Reply-To: <CAJuYYwSiQs0JC7esh-urmSUUsxhfP8bsGisdkvxHs8DFvLAS6Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>

Hi All

On Tue, Mar 12, 2013 at 7:54 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> On 12 March 2013 19:18, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>> On 03/12/2013 12:46 PM, Thomas Abraham wrote:
>>> And, you mentioned Exynos4 will be dt-only from 3.10. Does that mean
>>> we just drop support for universal and nuri non-dt board support? Or,
>>> will there be a equivalent dt support added for these boards?
>>
>> I think Tomasz has some initial dts files for Universal_c210 ready, and
>> Nuri could probably just be dropped. But we need Kyungmin's opinion on
>> that.
>>
>> I'm not sure about other boards, they look pretty basic though.
>> So it shouldn't be difficult to replace them with corresponding dts
>> files. Currently there are:
>>
>> arch/arm/mach-exynos/mach-smdk4x12.c
>> arch/arm/mach-exynos/mach-origen.c
>> arch/arm/mach-exynos/mach-nuri.c
>> arch/arm/mach-exynos/mach-universal_c210.c
>> arch/arm/mach-exynos/mach-armlex4210.c
>> arch/arm/mach-exynos/mach-smdkv310.c
>>
>> And there are dts files for:
>>
>> arch/arm/boot/dts/exynos4210-smdkv310.dts
>> arch/arm/boot/dts/exynos4210-origen.dts
>> arch/arm/boot/dts/exynos5250-smdk5250.dts
>> arch/arm/boot/dts/exynos5250-snow.dts
>> arch/arm/boot/dts/exynos4210-trats.dts
>> arch/arm/boot/dts/exynos5440-ssdk5440.dts
>> arch/arm/boot/dts/exynos4412-smdk4412.dts
>>
>> So except Universal_c210 and Nuri the only ones not supporting booting
>> from DT are these two simple boards, which seem to be maintained by
>> Samsung:
>>
>> arch/arm/mach-exynos/mach-smdk4x12.c
>> arch/arm/mach-exynos/mach-armlex4210.c
>
> There has not been much board support development for these boards for
> couple of kernel releases now.
>

Right, Armlex4210 can be removed as there is no much development
happening. And I do not think any one else using it now.

I do not know about smdk4x12.c though,

>>
>> It would be nice to make Exynos DT only in this kernel release.
>> I guess there was enough time to get all boards converted to DT
>> already.
>
> Thanks for sharing your thoughts on this.
>
> Regards,
> Thomas.
>
>>
>> --
>>
>> Regards,
>> Sylwester
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Regards,
Alim
