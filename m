From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 3/3] drm/exynos: mixer: add 2x scaling to mixer_graph_buffer
Date: Mon, 06 Apr 2015 19:39:00 +0200
Message-ID: <5522C4B4.6050309@math.uni-bielefeld.de>
References: <1427894943-9010-1-git-send-email-tjakobi@math.uni-bielefeld.de>	<1427894943-9010-3-git-send-email-tjakobi@math.uni-bielefeld.de> <CACvgo50N_LGyA9rx-9y3dUQzu3cx0HhEaZjij=AWVsCf5-ZA2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:57254 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750891AbbDFRjL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Apr 2015 13:39:11 -0400
In-Reply-To: <CACvgo50N_LGyA9rx-9y3dUQzu3cx0HhEaZjij=AWVsCf5-ZA2Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, ML dri-devel <dri-devel@lists.freedesktop.org>

Hello Emil,

Emil Velikov wrote:
> Hi Tobias,
> 
> On 1 April 2015 at 14:29, Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
>> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
>> index 5ab0e32..6822b36 100644
>> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
>> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> 
>> @@ -528,9 +552,8 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
>>                 fmt = ARGB8888;
>>         }
>>
>> -       /* 2x scaling feature */
>> -       x_ratio = 0;
>> -       y_ratio = 0;
>> +       /* check if mixer supports requested scaling setup */
>> +       if (mixer_setup_scale(plane, &x_ratio, &y_ratio)) return;
>>
> Having return on the same line as the if statement will make
> checkpatch.pl unhappy :-(
right, I'm going to fix this and resend the series.

With best wishes,
Tobias
