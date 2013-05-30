From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Update defconfig for Arndale and Origen board
Date: Thu, 30 May 2013 16:05:54 +0900
Message-ID: <000101ce5d04$20abb7a0$620326e0$@samsung.com>
References: <1368168599-28507-1-git-send-email-tushar.behera@linaro.org>
 <87sj1qzaov.fsf@linaro.org> <5191AA89.6010901@linaro.org>
 <20130528231740.GA28879@quad.lixom.net> <51A57D39.8030506@linaro.org>
 <CAOesGMh50Dzr_jczHZC5_txfW=6a+7EgFKvgZgj9MhUcVUTJ1Q@mail.gmail.com>
 <51A5C16D.20408@linaro.org> <000001ce5c4f$839f4cb0$8adde610$@samsung.com>
 <CAOesGMiYs6GfaWGWYB8cw_cJ6_RmmZTb4oPfXo1PYJT8-jdHzw@mail.gmail.com>
 <51A6C97A.6030306@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:37717 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S967670Ab3E3HF5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 May 2013 03:05:57 -0400
In-reply-to: <51A6C97A.6030306@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, 'Olof Johansson' <olof@lixom.net>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Doug Anderson' <dianders@chromium.org>, 'Patch Tracking' <patches@linaro.org>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Vivek Gautam' <gautam.vivek@samsung.com>, Jingoo Han <jg1.han@samsung.com>

On Thursday, May 30, 2013 12:38 PM, Tushar Behera wrote:
>On 05/30/2013 12:16 AM, Olof Johansson wrote:
>> On Wed, May 29, 2013 at 2:33 AM, Jingoo Han <jg1.han@samsung.com> wrote:
>>
>>> However, Olof Johansson mentioned, 'drivers/platform/arm/board_arndale.c'
>>> would be a good alternative.
>>
>>
>> Whoa. I didn't quite realize what I proposed, or rather, how what I
>> proposed could be perceived. I take it back. :)

My original message is as below.

"However, as Olof Johansson mentioned, 'drivers/platform/arm/'
would be a good alternative."

Also, 'board_arndale.c' should not be mentioned.
Sorry for making confusion. :)

>>
>> We must _not_ introduce something that will be abused as a new home
>> for board file junk. If we do introduce a platform glue directory it
>> would need to be very limited in scope. Compare to what's in
>> drivers/platform/x86 today.
>>
>>
>> -Olof
>>
>
>This was my proof-of-concept for moving USB hub reset code out of USB
>driver. Verified that it works.

Thank you for your additional comment.

>
>I would wait for your patches for wifi-reset sequence and then will add
>hub-reset code for Arndale.

Yes, this way looks good.

Best regards,
Jingoo Han

>
>
>--
>Tushar Behera
