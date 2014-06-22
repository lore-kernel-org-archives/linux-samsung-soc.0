From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: Enabling 8 cores on 5420
Date: Mon, 23 Jun 2014 03:00:35 +0530
Message-ID: <CAGOxZ51ZXbKHmj=DvGZXmOLoXKeigwKmjgwxO1rj01b6yxqRuw@mail.gmail.com>
References: <53884E88.2090408@linaro.org> <53A74459.3000100@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f53.google.com ([209.85.213.53]:33004 "EHLO
	mail-yh0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752142AbaFVVbQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Jun 2014 17:31:16 -0400
Received: by mail-yh0-f53.google.com with SMTP id b6so4435077yha.40
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Jun 2014 14:31:15 -0700 (PDT)
In-Reply-To: <53A74459.3000100@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>

Hi
PTAL https://patchwork.kernel.org/patch/4315711/
I hope your tree already includes
http://www.gossamer-threads.com/lists/linux/kernel/1940123

Regards,
Alim

On Mon, Jun 23, 2014 at 2:32 AM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
> Am 30.05.2014 11:25, schrieb Daniel Lezcano:
>>
>> Hi all,
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
> Ping? Confirmed still present on Arndale Octa with kgene's for-next +
> patch to get 2-4 up.
>
> Andreas
>
> --
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=
=C3=BCrnberg
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Regards,
Alim
