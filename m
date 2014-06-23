From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: Enabling 8 cores on 5420
Date: Mon, 23 Jun 2014 14:04:23 +0200
Message-ID: <53A817C7.20907@linaro.org>
References: <53884E88.2090408@linaro.org> <53A74459.3000100@suse.de> <CAGOxZ51ZXbKHmj=DvGZXmOLoXKeigwKmjgwxO1rj01b6yxqRuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f178.google.com ([74.125.82.178]:50822 "EHLO
	mail-we0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750820AbaFWME0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 08:04:26 -0400
Received: by mail-we0-f178.google.com with SMTP id x48so6768700wes.37
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jun 2014 05:04:23 -0700 (PDT)
In-Reply-To: <CAGOxZ51ZXbKHmj=DvGZXmOLoXKeigwKmjgwxO1rj01b6yxqRuw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@gmail.com>, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 06/22/2014 11:30 PM, Alim Akhtar wrote:
> Hi
> PTAL https://patchwork.kernel.org/patch/4315711/
> I hope your tree already includes
> http://www.gossamer-threads.com/lists/linux/kernel/1940123


Hi Alim,

I applied the patches above and set the configuration option for=20
EXYNOS_MCPM but I have:

[    7.769420] CPU1: failed to boot: -19
[    7.778360] CPU2: failed to boot: -19
[    7.806411] CPU4: failed to boot: -19
[    7.811294] CPU3: failed to boot: -19
[    7.815333] CPU7: failed to boot: -19
[    7.826401] CPU6: failed to boot: -19
[    7.829711] CPU5: failed to boot: -19

Is there something I missed ?

Thanks !

   -- Daniel

> On Mon, Jun 23, 2014 at 2:32 AM, Andreas F=C3=A4rber <afaerber@suse.d=
e> wrote:
>> Am 30.05.2014 11:25, schrieb Daniel Lezcano:
>>>
>>> Hi all,
>>>
>>> I am trying an upstream kernel + some patches to enable ethernet on
>>> arndale octa.
>>>
>>> Unfortunately, only 4 cores boot up. The other ones fail to boot.
>>>
>>> [12.179453] CPU6: failed to come online
>>> [13.189479] CPU7: failed to come online
>>> [14.199479] CPU4: failed to come online
>>> [15.209743] CPU5: failed to come online
>>>
>>> What should I do to enable those 8 cores ? Is there a patchset some=
where
>>> to do so ?
>>
>> Ping? Confirmed still present on Arndale Octa with kgene's for-next =
+
>> patch to get 2-4 up.
>>
>> Andreas
>>
>> --
>> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, German=
y
>> GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG =
N=C3=BCrnberg
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
