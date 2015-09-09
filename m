From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/3] sysfs: Fix is_visible() support for binary attributes
Date: Tue, 08 Sep 2015 21:12:37 -0700
Message-ID: <55EFB1B5.1060703@roeck-us.net>
References: <1441714066-5599-1-git-send-email-emilio.lopez@collabora.co.uk> <1441714066-5599-2-git-send-email-emilio.lopez@collabora.co.uk> <20150908153013.GA6758@roeck-us.net> <20150908191002.GB10156@kroah.com> <20150908193052.GA11106@roeck-us.net> <55EF82A4.5000502@collabora.co.uk> <55EF86F8.3060406@roeck-us.net> <20150909035850.GA5497@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56260 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750720AbbIIEMn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Sep 2015 00:12:43 -0400
In-Reply-To: <20150909035850.GA5497@kroah.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: =?windows-1252?Q?Emilio_L=F3pez?= <emilio.lopez@collabora.co.uk>, olof@lixom.net, kgene@kernel.org, k.kozlowski@samsung.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 09/08/2015 08:58 PM, Greg KH wrote:
> On Tue, Sep 08, 2015 at 06:10:16PM -0700, Guenter Roeck wrote:
>> Hi Emilio,
>>
>> On 09/08/2015 05:51 PM, Emilio L=F3pez wrote:
>>> Hi Greg & Guenter,
>>>
>> [ ... ]
>>>>>>
>>>>>> Unless I am missing something, this is not explained anywhere, b=
ut it is
>>>>>> not entirely trivial to understand. I think it should be documen=
ted.
>>>
>>> I agree. I couldn't find any mention of what this int was supposed =
to be by looking at Documentation/ (is_visible is not even mentioned :/=
) or include/linux/sysfs.h. Once we settle on something I'll document i=
t before sending a v2.
>>>
>> In the include file ? No strong preference, though.
>>
>>> By the way, I wrote a quick coccinelle script to match is_visible()=
 users which reference the index (included below), and it found referen=
ces to drivers which do not seem to use any binary attributes, so I bel=
ieve changing the index meaning shouldn't be an issue.
>>>
>> Good.
>>
>>>>> I agree, make i the number of the bin attribute and that should s=
olve
>>>>> this issue.
>>>>>
>>>> No, that would conflict with the "normal" use of is_visible for no=
n-binary
>>>> attributes, and make the index all but useless, since the is_visib=
le function
>>>> would have to search through all the attributes anyway to figure o=
ut which one
>>>> is being checked.
>>>
>>> Yeah, using the same indexes would be somewhat pointless, although =
not many seem to be using it anyway (only 14 files matched). Others see=
m to be comparing the attr* instead. An alternative would be to use neg=
ative indexes for binary attributes and positive indexes for normal att=
ributes.
>>>
>> ... and I probably wrote or reviewed a significant percentage of tho=
se ;-).
>>
>> Using negative numbers for binary attributes is an interesting idea.
>> Kind of unusual, though. Greg, any thoughts on that ?
>
> Ick, no, that's a mess, maybe we just could drop the index alltogethe=
r?
>

No, please don't. Having to manually compare dozens of index pointers w=
ould be
even more of a mess.

Guenter
