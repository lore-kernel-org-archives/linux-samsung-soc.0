From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] ARM: S5PV210: Fix compilation error in mach-goni.c
Date: Mon, 25 Feb 2013 15:41:32 +0530
Message-ID: <CAK9yfHwNnadfVEco5ORn4fCK=myazmVnUCMec_xJa2_tzLzvbQ@mail.gmail.com>
References: <1361779938-30023-1-git-send-email-sachin.kamat@linaro.org>
	<512B3723.8070801@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:33277 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932469Ab3BYKLc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Feb 2013 05:11:32 -0500
Received: by mail-ob0-f181.google.com with SMTP id ni5so2642332obc.26
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Feb 2013 02:11:32 -0800 (PST)
In-Reply-To: <512B3723.8070801@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Hi Sylwester,

On 25 February 2013 15:34, Sylwester Nawrocki <s.nawrocki@samsung.com> =
wrote:
> Hi Sachin,
>
> On 02/25/2013 09:12 AM, Sachin Kamat wrote:
>> Commit 56bc91 ("[media] s5p-fimc: Redefine platform data structure f=
or fimc-is")
>> split bus_type into fimc_bus_type and sensor_bus_type and converted =
all
>> instances of it. This file however escaped the change.
>>
>> Without this patch we get the following build error:
>> arch/arm/mach-s5pv210/mach-goni.c:848:3: error:
>> unknown field =91bus_type=92 specified in initializer
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
>
> Thanks for the patch. My apologies for this omission, there is alread=
y
> similar patch from Arnd [1], [2].

Yes, they fix the same issue. I had not noticed them earlier.

--=20
With warm regards,
Sachin
