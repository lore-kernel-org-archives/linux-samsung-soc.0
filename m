From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 2/4] ARM: dts: add support for mixer to exynos4
Date: Tue, 29 Jan 2013 21:15:56 +0100
Message-ID: <51082DFC.1020007@gmail.com>
References: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com> <5105965F.9050402@gmail.com> <CAPdUM4P_jf0w+B22p1hmso8uhmTXs=fLdF8WrzDWL8cPyLeTCw@mail.gmail.com> <1461207.5d9zQy0FHx@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f177.google.com ([209.85.215.177]:44110 "EHLO
	mail-ea0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751305Ab3A2UQF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 15:16:05 -0500
Received: by mail-ea0-f177.google.com with SMTP id n13so367324eaa.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Jan 2013 12:16:03 -0800 (PST)
In-Reply-To: <1461207.5d9zQy0FHx@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Rahul Sharma <r.sh.open@gmail.com>, Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, Tomasz Stanislawski <t.stanislaws@samsung.com>

Hi,

On 01/28/2013 09:38 AM, Tomasz Figa wrote:
>>>> +
>>>> +       mixer: mixer {
>>>> +               compatible = "samsung,exynos4-mixer";
>>>
>>> I'm afraid this compatible property it too generic. Is the video mixer
>>> IP really identical an all the Exynos4 series SoCs ?
>>
>> It is same in Exynos4210, 4212 and 4412.
>
> The convention is to use the name of SoC on which this IP version appeared
> first. In this case it would be samsung,exynos4210-mixer.

And I believe this is a good convention to stick with. I'm going to have
a look at the documentation, as it seems unlikely these IPs are exactly 
same
across those SoC revisions. I'm not saying this isn't possible though. :)

--

Thanks,
Sylwester
