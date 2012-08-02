From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: EXYNOS: Add Gscaler device from DT
Date: Fri, 03 Aug 2012 01:40:51 +0200
Message-ID: <501B1003.1090003@gmail.com>
References: <1342789723-3949-1-git-send-email-shaik.ameer@samsung.com> <1342789723-3949-3-git-send-email-shaik.ameer@samsung.com> <033301cd6fb0$7ac4af90$704e0eb0$%kim@samsung.com> <CAJuYYwTy5zkeM_cJO7HMm+=v=ORPHD26nQYZwXK6v1noWm1EuA@mail.gmail.com> <5018E656.3070803@samsung.com> <036f01cd6fc4$120a9910$361fcb30$%kim@samsung.com> <50197D66.1050108@gmail.com> <CAOesGMiZMrv4GY=v1WPn_qGZgg=vduO2TbsUOQ6sCah-ZvOg_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:48187 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750746Ab2HBXkz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Aug 2012 19:40:55 -0400
Received: by wgbdr13 with SMTP id dr13so80141wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Aug 2012 16:40:53 -0700 (PDT)
In-Reply-To: <CAOesGMiZMrv4GY=v1WPn_qGZgg=vduO2TbsUOQ6sCah-ZvOg_A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Shaik Ameer Basha <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, sy0816.kang@samsung.com, olofj@google.com, thomas.ab@samsung.com, sachin.kamat@linaro.org, joshi@samsung.com, shaik.samsung@gmail.com, sungchun.kang@samsung.com, Rob Herring <rob.herring@calxeda.com>

On 08/02/2012 06:33 PM, Olof Johansson wrote:
> On Wed, Aug 1, 2012 at 12:03 PM, Sylwester Nawrocki
> <sylvester.nawrocki@gmail.com>  wrote:
> 
>> It wouldn't be clear what specific SoCs the "samsung,exynos5-gsc" compatible
>> string applies to, would it ? I believe there are already minor differences
>> in GScaler parameters on currently available exynos5 SoC. The variant data
>> structures are used to handle this and the compatible string determines which
>> variant data structure is selected during driver's initialization.
>> If you use a wildcard 'compatible' string this won't be possible any more.
>>
>> Also it would look odd IMO to have two compatible strings like:
>> compatible = "samsung,exynos5-gsc", "samsung,exynos5400-gsc";
> 
> In this particular case, since you're saying that there are subtle
> differences between different part numbers, I'm guessing there's good
> reason to go specific, but in general there's no need to avoid
> exynos5-gsc.
> 
> Your example is also false, since the strings would be in reverse
> order (from specific to generic). That would look perfectly normal.

You're right, but my intention was more to say that there would have been 
two entries in the driver's of_match_table, where "samsung,exynos5-gsc"
wouldn't have obvious meaning. Devices within these SoCs tend to differ 
across part numbers and usually there is one common driver handling them.

I can't tell for sure now there are differences, but I would have been
surprised if there wouldn't.

> So, bottom line: I agree in this particular instance, but I disagree
> that it's a hard generic rule.

Thanks, sorry if it sounded like I'm advocating it as a general rule. 
I'm no DT expert whatsoever, but in this particular case it just sounded 
messy to use only exynos5-gsc.

--
Regards,
Sylwester
