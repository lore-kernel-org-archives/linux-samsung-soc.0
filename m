From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: Enabling 8 cores on 5420
Date: Fri, 30 May 2014 16:56:37 +0200
Message-ID: <53889C25.3080706@linaro.org>
References: <53884E88.2090408@linaro.org> <538888B4.6070303@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:61427 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752856AbaE3O4V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 10:56:21 -0400
Received: by mail-wg0-f42.google.com with SMTP id y10so2074882wgg.25
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 May 2014 07:56:19 -0700 (PDT)
In-Reply-To: <538888B4.6070303@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 05/30/2014 03:33 PM, Andreas F=C3=A4rber wrote:
> Hi,
>
> Am 30.05.2014 11:25, schrieb Daniel Lezcano:
>>
>> I am trying an upstream kernel + some patches to enable ethernet on
>> arndale octa.
>>
>> Unfortunately, only 4 cores boot up. The other ones fail to boot.
>>
>> [12.179453] CPU6: failed to come online
>> [13.189479] CPU7: failed to come online
>> [14.199479] CPU4: failed to come online
>> [15.209743] CPU5: failed to come online
>>
>> What should I do to enable those 8 cores ? Is there a patchset somew=
here
>> to do so ?
>
> Yes, this is the reply I received just yesterday from Tushar Behera:
>> Can you check after applying following two patches for Arndale-Octa
>> ([1],[2])? In other words, a patch similar to [2] might be required
>> for this board too if it is booting under secure mode.
>>
>> [1] http://www.spinics.net/lists/linux-samsung-soc/msg31776.html
>>
>> [PATCH v2 Resend 1/2] ARM: EXYNOS: Update secondary boot addr for se=
cure mode
>>
>> [2] http://www.spinics.net/lists/linux-samsung-soc/msg31777.html
>>
>> [PATCH v2 Resend 2/2] ARM: dts: Add secure firmware support for Arnd=
ale-octa
>
> The first one I tested successfully on the 5410 already.

Hi Andreas,

thx for the pointers. I tested the patches but unfortunately they don't=
=20
enable the cpus.


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
