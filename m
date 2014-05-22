From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V5 00/20] ARM: exynos: cpuidle: Move the driver to drivers/cpuidle
Date: Thu, 22 May 2014 20:57:43 +0200
Message-ID: <537E48A7.1060904@linaro.org>
References: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org> <534BA3CF.6030701@linaro.org> <535943B2.8030308@samsung.com> <0b4201cf613f$80c91750$825b45f0$@samsung.com> <537E438C.8060600@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:49491 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751210AbaEVS5b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 14:57:31 -0400
Received: by mail-wg0-f47.google.com with SMTP id x12so3830992wgg.30
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 May 2014 11:57:30 -0700 (PDT)
In-Reply-To: <537E438C.8060600@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, rjw@rjwysocki.net, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org

On 05/22/2014 08:35 PM, Kukjin Kim wrote:
> On 04/26/14 20:05, Kukjin Kim wrote:
>> Tomasz Figa wrote:
>>>
>>> On 14.04.2014 11:01, Daniel Lezcano wrote:
>>>>
>>>> Hi Kukjin,
>>>>
>>>> I believe I addressed all the comments. Is it possible to take thi=
s
>>>> patchset for next ?
>>>
>> Sure ;-)
>>
>>> +1.
>>>
>>> Also when applying you might add
>>>
>>> Reviewed-by: Tomasz Figa<t.figa@samsung.com>
>>>
>>> to any patches that don't have it yet.
>>>
>> Tomasz, thanks for your review.
>>
>> I will take this series, "moving exynos-cpuidle into drivers/cpuidle=
"
>> into samsung tree if Rafael is OK on that.
>>
> Daniel,
>
> Can you please check/test the functionality your series with using my
> for-next because there were merge conflicts with mcpm-exynos stuff...=
?

Sure, will do that tomorrow.


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
