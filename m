From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] drm/exynos: g2d: fix overflow of cmdlist size
Date: Mon, 23 Jan 2017 13:47:02 +0100
Message-ID: <5885FB46.4020300@math.uni-bielefeld.de>
References: <CGME20170117044134epcas5p2d0e67623efa7eb0b9a1ad6f8a593f0c4@epcas5p2.samsung.com>
 <1484628126-21671-1-git-send-email-jy0922.shim@samsung.com>
 <587E2922.10805@math.uni-bielefeld.de>
 <f0d1e14e-26b9-1f4f-6703-e0efe8ad9af4@samsung.com>
 <5880BC19.8080000@math.uni-bielefeld.de>
 <67df69b9-3231-efd3-8e28-d73ce00ebe41@samsung.com>
 <58823530.70107@math.uni-bielefeld.de>
 <fc4202a0-63aa-49b6-58c6-d0fbc470dad5@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:50605 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750703AbdAWMrE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 07:47:04 -0500
In-Reply-To: <fc4202a0-63aa-49b6-58c6-d0fbc470dad5@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, dri-devel@lists.freedesktop.org
Cc: inki.dae@samsung.com, sw0312.kim@samsung.com, linux-samsung-soc@vger.kernel.org

Joonyoung Shim wrote:
> Hi Tobias,
> 
> On 01/21/2017 01:05 AM, Tobias Jakobi wrote:
>> Hello Joonyoung,
>>
>>
>> Joonyoung Shim wrote:
>>> Hi Tobias,
>>>
>>> On 01/19/2017 10:16 PM, Tobias Jakobi wrote:
>>>> Hello Joonyoung,
>>>>
>>>> Joonyoung Shim wrote:
>>>>> Hi Tobias,
>>>>>
>>>>> On 01/17/2017 11:24 PM, Tobias Jakobi wrote:
>>>>>> Joonyoung Shim wrote:
>>>>>>> The size of cmdlist is integer type, so it can be overflowed by cmd and
>>>>>>> cmd_buf that has too big size. This patch will fix overflow issue as
>>>>>>> checking maximum size of cmd and cmd_buf.
>>>>>> I don't understand/see the issue here. Could you point out for which
>>>>>> input of the set_cmdlist ioctl you see this particular overflow?
>>>>>>
>>>>>> In particular it is not clear to me which size field you're talking
>>>>>> about. struct g2d_cmdlist does not have any field named 'size'.
>>>>>>
>>>>>
>>>>> I mean size of cmdlist is
>>>>> size = cmdlist->last + req->cmd_nr * 2 + req->cmd_buf_nr * 2 + 2;
>>>>> in exynos_g2d_set_cmdlist_ioctl().
>>>> ok, that makes things more clear. But then you need to fix the commit
>>>> message. The current message implies that this 'size' you're talking
>>>> about is some property of the cmdlist.
>>>>
>>>> Also the new comment is wrong.
>>>> /* Check size of cmd and cmdlist: last 2 is about G2D_BITBLT_START */
>>>>
>>>> What is cmd and cmdlist? You're mixing two different things here. We are
>>>> still checking the size of 'cmdlist' (which is a struct g2d_cmdlist) here.
>>>>
>>>> What you add is a check for the fields of 'req' (which is a struct
>>>> drm_exynos_g2d_set_cmdlist).
>>>>
>>>> With all that said, I don't like the changes. I see the issue, but the
>>>> current solution should be cleaner.
>>>>
>>>> I propose this. We just check req->cmd_buf_nr and req->cmd_nr against
>>>> G2D_CMDLIST_DATA_NUM. This leaves us enough headrom so that the later
>>>> computation (i.e. what is ending up in the local variable 'size') can
>>>> never overflow.
>>>>
>>>
>>> Agree, it's more clear to check req->cmd_buf_nr and req->cmd_nr against
>>> G2D_CMDLIST_DATA_NUM.
>>>
>>>> For a comment for the check I propose this:
>>>> "To avoid an integer overflow for the later size computations, we
>>>> enforce a maximum number of submitted commands here. This limit is
>>>> sufficient for all conceivable usage cases of the G2D."
>>>>
>>>
>>> Could you post your patch to ML about this if you want?
>> Sure, I've just send it together with two other small patches. Let me
>> know if the current version is OK with you. I hope I did the order of
>> SoB correctly (I know that Krzysztof has pointed this out lately).
>>
> 
> I don't know exactly about order of SoB but it's ok to me except
> WARNING: line over 80 characters from checkpatch.pl.
Thanks for checking! I guess I should accustom myself to using checkpath
more regularly.

- Tobias


> 
> Thanks for posting.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
