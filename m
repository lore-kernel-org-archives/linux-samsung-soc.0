From: Shaik Ameer Basha <shaik.samsung@gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: EXYNOS: Add Gscaler device from DT
Date: Mon, 6 Aug 2012 11:57:11 +0530
Message-ID: <CAOD6ATomKE3WYtGrBTSyjfkNr5ZK+3=NRrZLX0p5pOzPykOikQ@mail.gmail.com>
References: <1342789723-3949-1-git-send-email-shaik.ameer@samsung.com>
	<1342789723-3949-3-git-send-email-shaik.ameer@samsung.com>
	<033301cd6fb0$7ac4af90$704e0eb0$%kim@samsung.com>
	<CAJuYYwTy5zkeM_cJO7HMm+=v=ORPHD26nQYZwXK6v1noWm1EuA@mail.gmail.com>
	<5018E656.3070803@samsung.com>
	<036f01cd6fc4$120a9910$361fcb30$%kim@samsung.com>
	<50197D66.1050108@gmail.com>
	<CAOesGMiZMrv4GY=v1WPn_qGZgg=vduO2TbsUOQ6sCah-ZvOg_A@mail.gmail.com>
	<501B1003.1090003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:57393 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750953Ab2HFG1M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Aug 2012 02:27:12 -0400
Received: by vbbff1 with SMTP id ff1so2266707vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Aug 2012 23:27:11 -0700 (PDT)
In-Reply-To: <501B1003.1090003@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Shaik Ameer Basha <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, sy0816.kang@samsung.com, olofj@google.com, thomas.ab@samsung.com, sachin.kamat@linaro.org, joshi@samsung.com, sungchun.kang@samsung.com, Rob Herring <rob.herring@calxeda.com>

Hi Sylwester,

On Fri, Aug 3, 2012 at 5:10 AM, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:
> On 08/02/2012 06:33 PM, Olof Johansson wrote:
>> On Wed, Aug 1, 2012 at 12:03 PM, Sylwester Nawrocki
>> <sylvester.nawrocki@gmail.com>  wrote:
>>
>>> It wouldn't be clear what specific SoCs the "samsung,exynos5-gsc" compatible
>>> string applies to, would it ? I believe there are already minor differences
>>> in GScaler parameters on currently available exynos5 SoC. The variant data
>>> structures are used to handle this and the compatible string determines which
>>> variant data structure is selected during driver's initialization.
>>> If you use a wildcard 'compatible' string this won't be possible any more.
>>>
>>> Also it would look odd IMO to have two compatible strings like:
>>> compatible = "samsung,exynos5-gsc", "samsung,exynos5400-gsc";
>>
>> In this particular case, since you're saying that there are subtle
>> differences between different part numbers, I'm guessing there's good
>> reason to go specific, but in general there's no need to avoid
>> exynos5-gsc.

After all this discussion, I can see two possibilities here.
1] If Kukjin Kim is sure about G-Scaler remains unchanged, across all
the exynos5 series SoCs,
        It is fine to go with the compatible string  "samsung,exynos5-gsc".
2] Otherwise in case of any doubts about G-Scaler is going to change,
        It is safe to go with the compatible string specific to
current SoC i.e., "samsung,exynos5250-gsc".

If we all can agree on this, lets Kukjin Kim decide which string to
use as he has good knowledge about upcoming exynos5 series SoCs.

Regards,
Shaik Ameer Basha

>>
>> Your example is also false, since the strings would be in reverse
>> order (from specific to generic). That would look perfectly normal.
>
> You're right, but my intention was more to say that there would have been
> two entries in the driver's of_match_table, where "samsung,exynos5-gsc"
> wouldn't have obvious meaning. Devices within these SoCs tend to differ
> across part numbers and usually there is one common driver handling them.
>
> I can't tell for sure now there are differences, but I would have been
> surprised if there wouldn't.
>
>> So, bottom line: I agree in this particular instance, but I disagree
>> that it's a hard generic rule.
>
> Thanks, sorry if it sounded like I'm advocating it as a general rule.
> I'm no DT expert whatsoever, but in this particular case it just sounded
> messy to use only exynos5-gsc.
>
> --
> Regards,
> Sylwester
