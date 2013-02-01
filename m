From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: add support for hdmi to exynos4
Date: Fri, 1 Feb 2013 09:34:57 +0530
Message-ID: <CAPdUM4M1r9qd22BhikRcxsWZi99rWh-0wg+LkDtz9KxooGT=vw@mail.gmail.com>
References: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com>
	<1359110384-28402-2-git-send-email-rahul.sharma@samsung.com>
	<51059402.2030405@gmail.com>
	<CAPdUM4Py3dbV_tFnZ6GOxSm-6Sq8FBZu00JH3UDq_PV2U8yq_A@mail.gmail.com>
	<5108344D.4090202@gmail.com>
	<CAPdUM4NxRkE_g36yPPjhFO8jHYdBwQ6cNk+pndyO+h9fcwn-8w@mail.gmail.com>
	<0aff01ce0001$edc8f320$c95ad960$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:36942 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751582Ab3BAENS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jan 2013 23:13:18 -0500
Received: by mail-wi0-f176.google.com with SMTP id hm14so143631wib.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Jan 2013 20:13:17 -0800 (PST)
In-Reply-To: <0aff01ce0001$edc8f320$c95ad960$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, joshi@samsung.com, Tomasz Stanislawski <t.stanislaws@samsung.com>, Tomasz Figa <t.figa@samsung.com>, thomas.ab@samsung.com

On Fri, Feb 1, 2013 at 3:55 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Rahul Sharma wrote:
>
> [...]
>
>> >>>> +       hdmi {
>> >>>> +               compatible = "samsung,exynos4-hdmi14";
>> >>>
>> >>>
>> >>>
>> >>> What "-hdmi14" signifies here ? And to which Exynos4 SoC revisions
> this
>> >>> compatible property is supposed to apply ?
>> >>>
>> >>
>> >> -hdmi14 signifies 1.4 compliant Hdmi IP like in Exynos4412, while
>> >> Exynos4210 has 1.3
>> >> compliant HDMI block. I have done a mistake here. I should have kept
>> >> it in 4412.dtsi. OR
>> >> I can move it to 4x12.dtsi but not sure whether all 4x12 socs have 1.4
>> >> hdmi.
>> >
>> >
>> > Exynos4210 also have the HDMI IP. I'm not sure how much common those
>> IP's
>> > are
>> > among Exynos4 series SoCs. I suppose it makes sense to create a hdmi
>> node in
>> > exynos4.dtsi and override what's required either in exynos4x12.dtsi or
>> > exynos4412.dtsi file.
>> >
>> > What is worring me is that you're trying to just append the supported
>> > HDMI standard version to the string, and there might be more differences
>> > in the IPs across all Exynos4 SoC series. What if there are two
> different
>> > SoCs that support e.g. HDMI v1.4 but there are some differences in the
>> > HDMI IPs ? You would likely need to invent new properties and pass them
>> > to the driver. Appending specific SoC name to the compatible string
> looks
>> > like a better alternative to me.
>> >
>>
>> I agree to it. Putting compatible string with first soc having the IP,
>> is a better
>> approach altogether. I will incorporate the change in next version.
>>
> Well, in this case, why should we use the SoC name? If just we need specific
> name here. I think, putting SoC name in compatible is a way to identify and
> when the version of IP is available, we can the version instead...like
> following, as some guy said before.
>
> compatible = "samsung,hdmi-1.4"
>
> If there is for hdmi 1.4a,
>
> compatible = "samsung,hdmi-1.4a"
>
> Thanks.
>
> - Kukjin
>

Hi Mr. Kim,

Putting hdmi version in compatible string is safe only if we are
sure that there will not be any changes in HDMI IPs for a given
hdmi version number in all upcoming exynos family SoCs. But
it seems unlikely to happen.

This point is getting discussed in details in the following thread.
https://patchwork.kernel.org/patch/1948061/

-- 
Regards,
Rahul Sharma,
email to: rahul.sharma@samsung.com
Samsung India.
