From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 03/10] mfd: cros_ec: Allow static din/dout buffers with cros_ec_register()
Date: Wed, 18 Jun 2014 09:35:27 -0700
Message-ID: <CAD=FV=XmV-pA_qPuhZNKO5m+B04sJpzDukhp3rnwUzyfEaQQNA@mail.gmail.com>
References: <1402954800-28215-1-git-send-email-dianders@chromium.org>
	<1402954800-28215-4-git-send-email-dianders@chromium.org>
	<20140618075316.GI21030@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f172.google.com ([209.85.220.172]:52186 "EHLO
	mail-vc0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751719AbaFRQf2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Jun 2014 12:35:28 -0400
Received: by mail-vc0-f172.google.com with SMTP id hy10so1039827vcb.31
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2014 09:35:27 -0700 (PDT)
In-Reply-To: <20140618075316.GI21030@lee--X1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Andrew Bresticker <abrestic@chromium.org>, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>, Sonny Rao <sonnyrao@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@chromium.org>, Wolfram Sang <wsa@the-dreams.de>, "broonie@kernel.org" <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Lee,

On Wed, Jun 18, 2014 at 12:53 AM, Lee Jones <lee.jones@linaro.org> wrote:
> On Mon, 16 Jun 2014, Doug Anderson wrote:
>
>> From: Bill Richardson <wfrichar@chromium.org>
>>
>> The lower-level driver may want to provide its own buffers. If so,
>> there's no need to allocate new ones.  This already happens to work
>> just fine (since we check for size of 0 and use devm allocation), but
>> it's good to document it.
>>
>> [dianders: Resolved conflicts; documented that no code changes needed
>> on mainline]
>>
>> Signed-off-by: Bill Richardson <wfrichar@chromium.org>
>> Signed-off-by: Doug Anderson <dianders@chromium.org>
>> ---
>>  include/linux/mfd/cros_ec.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.h
>> index 7e9fe6e..2ee3190 100644
>> --- a/include/linux/mfd/cros_ec.h
>> +++ b/include/linux/mfd/cros_ec.h
>> @@ -68,8 +68,8 @@ struct cros_ec_msg {
>>   * We use this alignment to keep ARM and x86 happy. Probably word
>>   * alignment would be OK, there might be a small performance advantage
>>   * to using dword.
>> - * @din_size: size of din buffer
>> - * @dout_size: size of dout buffer
>> + * @din_size: size of din buffer to allocate (zero to use static din)
>> + * @dout_size: size of dout buffer to allocate (zero to use static dout)
>
> Why don't these use your new format i.e. doutsize, etc?

Ah, you mean like the new "struct cros_ec_command" that's switched to
in (mfd: cros_ec: Use struct cros_ec_command to communicate with the
EC)?  I don't know--it seems rather arbitrary.  Personally I like
having the underscore (thus if we have to change I'd advocate changing
"struct cros_ec_command").

The inconsistency doesn't bother me terribly and it will be more work
to cherry-pick future patches.  Since it didn't sound like you are
insisting then I won't change this, but if you say that you want me to
change it I'm more than happy to.

-Doug
