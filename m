From: Arun Kumar K <arun.kk@samsung.com>
Subject: Re: [PATCH 1/2] s5p-mfc: Update mfc-v6 firmware
Date: Mon, 19 May 2014 15:12:44 +0530
Message-ID: <CALt3h7_gxaUdmzao1pQw6xTTu+u2YR7_hdP1eb-wrLhum1Td_g@mail.gmail.com>
References: <1400233490-5677-1-git-send-email-arun.kk@samsung.com>
	<04be01cf70ec$d5f37a10$81da6e30$%debski@samsung.com>
	<CALt3h7_A2TmyoXFBjr7Ncy8560oBT6EOD7nq9qdRtD34O56FdQ@mail.gmail.com>
	<04bf01cf70ee$f2184d40$d648e7c0$%debski@samsung.com>
	<5375E6DB.70303@samsung.com>
	<06bd01cf733d$bc903380$35b09a80$%debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f173.google.com ([209.85.216.173]:37233 "EHLO
	mail-qc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753333AbaESJmp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 05:42:45 -0400
Received: by mail-qc0-f173.google.com with SMTP id i8so8486030qcq.18
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2014 02:42:44 -0700 (PDT)
In-Reply-To: <06bd01cf733d$bc903380$35b09a80$%debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>, dwmw2 <dwmw2@infradead.org>, ben <ben@decadent.org.uk>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi Kamil, Tomasz,

On Mon, May 19, 2014 at 2:08 PM, Kamil Debski <k.debski@samsung.com> wrote:
> Hi Tomasz, Arun,
>
>> From: Tomasz Figa [mailto:t.figa@samsung.com]
>> Sent: Friday, May 16, 2014 12:22 PM
>>
>> Hi Kamil, Arun,
>>
>> On 16.05.2014 12:09, Kamil Debski wrote:
>> > Hi,
>> >
>> > ----Original Message-----
>> >> From: arunkk.samsung@gmail.com [mailto:arunkk.samsung@gmail.com] On
>> >> Behalf Of Arun Kumar K
>> >> Sent: Friday, May 16, 2014 12:00 PM
>> >>
>> >> Hi Kamil,
>> >>
>> >> On Fri, May 16, 2014 at 3:24 PM, Kamil Debski <k.debski@samsung.com>
>> >> wrote:
>> >>> Hi Arun,
>> >>>
>> >>> I asked you to put old and new v6 firmware in separate files.
>> >>
>> >> But wont that require a different filename other than s5p-mfc-v6.fw?
>> >
>> > Yes.
>> >
>> >> But the driver still expects the same file name.
>> >> Can I put the new filename as s5p-mfc-v6-v2.fw and mention in the
>> >> README that the file has to be renamed to s5p-mfc-v6.fw to be used?
>> >
>> > I think this is the way to go, because the new driver (with the patch)
>> > will work with old firmware, while old driver (without the patch)
>> will
>> > not work with the new firmware.
>> >
>> >>
>> >>> You should also mention in the commit message that this new
>> firmware
>> >>> will not work with the s5p-mfc driver without the patch you
>> recently
>> >>> submitted to linux-media mailing list. Please also add a link to
>> the
>> >>> thread with the necessary patch.
>> >>
>> >> Ok will do that.
>> >>
>> >>>
>> >>> In addition to the above I think a readme/description file should
>> be
>> >>> added to the s5p-mfc folder. The issue of firmware for v6 should be
>> >>> explained, so that no one is surprised that something does not work.
>> >>>
>>
>> May I suggest a little different solution?
>>
>> Since to not break compatibility, support for both firmware versions is
>> needed in the driver anyway, why not simply make the new, incompatible
>> firmware always use a different filename.
>>
>> Then let the driver try to load the new one first and if it fails then
>> load the old one? This would also let you get rid of that version check
>> by hardcoded date, as you would know which firmware type was found.
>>
>
> Tomasz, I really like your idea. I find it both simple and elegant.
> This way there will be no need to rename the firmware file in the repo or
> by the user, if the user wishes to use the new version.
>
> Arun, what is your opinion?
>

Yes this seems like a better approach to me too.
With this the new FW used in older kernel issue is also resolved as the new
fw file will have a different name and is not accepted in old kernel.

Regards
Arun

>> Best regards,
>> Tomasz
>
> Best wishes,
> --
> Kamil Debski
> Samsung R&D Institute Poland
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
