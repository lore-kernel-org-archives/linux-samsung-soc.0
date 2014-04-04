From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 00/17] ARM: exynos: cpuidle: Move the driver to drivers/cpuidle
Date: Fri, 04 Apr 2014 11:55:05 +0200
Message-ID: <533E8179.3090105@linaro.org>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org> <CAK9yfHyqysyXMWURUAScXWgVoXUYJqtYH2Z7_jkqYO4W0z+siw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f180.google.com ([74.125.82.180]:44279 "EHLO
	mail-we0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752099AbaDDJyu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 05:54:50 -0400
Received: by mail-we0-f180.google.com with SMTP id p61so3142486wes.39
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 02:54:49 -0700 (PDT)
In-Reply-To: <CAK9yfHyqysyXMWURUAScXWgVoXUYJqtYH2Z7_jkqYO4W0z+siw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>

On 04/04/2014 11:00 AM, Sachin Kamat wrote:
> Hi Daniel,
>
> On 4 April 2014 13:17, Daniel Lezcano <daniel.lezcano@linaro.org> wro=
te:
>> This patchset relies on the cpm_pm notifier to initiate the powerdow=
n sequence
>> operations from pm.c instead cpuidle.c. Thus the cpuidle driver is n=
o longer
>> dependent from arch specific code as everything is called from the p=
m.c file.
>>
>> The patchset applies on top of v3.14.
>
> It would be good to have this patch series based on Kukjin's for-next
> which has several
> changes like code refactoring and consolidation including Tomasz
> Figa's PM consolidation
> patches applied and would be merged in 3.15-rc1 release.

Ok, thanks for the heads up.

   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
