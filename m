From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] rtc: rtc-s3c: Add device tree support
Date: Mon, 24 Oct 2011 14:54:34 +0200
Message-ID: <4EA5600A.3050801@samsung.com>
References: <1315064959-16930-1-git-send-email-thomas.abraham@linaro.org> <CAJuYYwQdeD=DEFSBqTTJM_EQcc517LPDy4w-N+mbHdH8Eqh=Dg@mail.gmail.com> <053801cc8803$43676230$ca362690$%kim@samsung.com> <20111013193455.GC18574@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:40263 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932298Ab1JXMyj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Oct 2011 08:54:39 -0400
Received: by bkbzt19 with SMTP id zt19so8157606bkb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2011 05:54:38 -0700 (PDT)
In-Reply-To: <20111013193455.GC18574@ponder.secretlab.ca>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, rtc-linux@googlegroups.com, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, a.zummo@towertech.it

On 10/13/11 21:34, Grant Likely wrote:
> On Tue, Oct 11, 2011 at 07:48:07PM +0900, Kukjin Kim wrote:
>> Thomas Abraham wrote:
>>>
>>> On 3 September 2011 21:19, Thomas Abraham<thomas.abraham@linaro.org>
>>> wrote:
>>>> Add device tree based discovery support for Samsung's rtc controller.
>>>>
>>>> Cc: Ben Dooks<ben-linux@fluff.org>
>>>> Signed-off-by: Thomas Abraham<thomas.abraham@linaro.org>
>>>> ---
>>>>   Documentation/devicetree/bindings/rtc/s3c-rtc.txt |   20
>>> ++++++++++++++++++++
>>>>   drivers/rtc/rtc-s3c.c                             |   21
>>> ++++++++++++++++++++-
>>>>   2 files changed, 40 insertions(+), 1 deletions(-)
>>>>   create mode 100644 Documentation/devicetree/bindings/rtc/s3c-rtc.txt
>>>
>>> Ping. Any comments for this patch? If this looks fine, can this be
>>> considered for 3.2 merge via the Samsung kernel tree.
>>>
>> (Cc'ed Alessandro Zummo who is RTC Subsystem maintainer)
>>
>> I'm ok with this, so if this can be got the ack from Grant and Alessandro,
>> will take this.
>
> Acked-by: Grant Likely<grant.likely@secretlab.ca>

Hi Alessandro,

Applied this in Samsung tree for supporting device tree for upcoming 3.2 
merge window.

If any problems, please let me know before sending to upstream.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
