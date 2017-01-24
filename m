From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: fix a timeout loop
Date: Tue, 24 Jan 2017 09:07:17 +0900
Message-ID: <58869AB5.9080808@samsung.com>
References: <CGME20170120165445epcas5p1a5fd54c6617006d8b4922d2c0269b17a@epcas5p1.samsung.com>
 <1484931272-20113-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <5885CDA0.40700@samsung.com> <20170123094101.GL17136@nuc-i3427.alporthouse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:53653 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751113AbdAXBRW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 20:17:22 -0500
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OK9008VSCC7JAB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 Jan 2017 09:07:19 +0900 (KST)
In-reply-to: <20170123094101.GL17136@nuc-i3427.alporthouse.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chris Wilson <chris@chris-wilson.co.uk>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, dri-devel@lists.freedesktop.org



2017년 01월 23일 18:41에 Chris Wilson 이(가) 쓴 글:
> On Mon, Jan 23, 2017 at 06:32:16PM +0900, Inki Dae wrote:
>>
>>
>> 2017년 01월 21일 01:54에 Tobias Jakobi 이(가) 쓴 글:
>>> From: Dan Carpenter <dan.carpenter@oracle.com>
>>>
>>> We were trying to print an error message if we timed out here, but the
>>> loop actually ends with "tries" set to UINT_MAX and not zero.  Fix this
>>> by changing from tries-- to --tries.
>>
>> Sorry but I already know this patch from long ago but I'm not clear yet.
>> How the variable, tries, could have UNIT_MAX?
> 
> The value of tries after the final loop is -1u. The WARN fires on a
> succesful read on the final loop, instead of the complete failure.

Ah, right. thanks.

> -Chris
> 
