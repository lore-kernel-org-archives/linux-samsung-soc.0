From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/3] sysfs: Fix is_visible() support for binary attributes
Date: Wed, 09 Sep 2015 06:30:42 -0700
Message-ID: <55F03482.4030104@roeck-us.net>
References: <1441714066-5599-1-git-send-email-emilio.lopez@collabora.co.uk> <1441714066-5599-2-git-send-email-emilio.lopez@collabora.co.uk> <20150908153013.GA6758@roeck-us.net> <20150908191002.GB10156@kroah.com> <20150908193052.GA11106@roeck-us.net> <55EF82A4.5000502@collabora.co.uk> <55EF86F8.3060406@roeck-us.net> <20150909035850.GA5497@kroah.com> <55EFB1B5.1060703@roeck-us.net> <55F030C6.80504@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:44499 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753989AbbIINau (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Sep 2015 09:30:50 -0400
In-Reply-To: <55F030C6.80504@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?windows-1252?Q?Emilio_L=F3pez?= <emilio.lopez@collabora.co.uk>, Greg KH <gregkh@linuxfoundation.org>
Cc: olof@lixom.net, kgene@kernel.org, k.kozlowski@samsung.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 09/09/2015 06:14 AM, Emilio L=F3pez wrote:
> On 09/09/15 01:12, Guenter Roeck wrote:
>> On 09/08/2015 08:58 PM, Greg KH wrote:
>>> On Tue, Sep 08, 2015 at 06:10:16PM -0700, Guenter Roeck wrote:
>>>> Hi Emilio,
>>>>
>>>> On 09/08/2015 05:51 PM, Emilio L=F3pez wrote:
>>>>> Hi Greg & Guenter,
>>>>>
>>>> [ ... ]
>>>>>>>>
>>>>>>>> Unless I am missing something, this is not explained anywhere,
>>>>>>>> but it is
>>>>>>>> not entirely trivial to understand. I think it should be docum=
ented.
>>>>>
>>>>> I agree. I couldn't find any mention of what this int was suppose=
d
>>>>> to be by looking at Documentation/ (is_visible is not even mentio=
ned
>>>>> :/) or include/linux/sysfs.h. Once we settle on something I'll
>>>>> document it before sending a v2.
>>>>>
>>>> In the include file ? No strong preference, though.
>>>>
>>>>> By the way, I wrote a quick coccinelle script to match is_visible=
()
>>>>> users which reference the index (included below), and it found
>>>>> references to drivers which do not seem to use any binary
>>>>> attributes, so I believe changing the index meaning shouldn't be =
an
>>>>> issue.
>>>>>
>>>> Good.
>>>>
>>>>>>> I agree, make i the number of the bin attribute and that should=
 solve
>>>>>>> this issue.
>>>>>>>
>>>>>> No, that would conflict with the "normal" use of is_visible for
>>>>>> non-binary
>>>>>> attributes, and make the index all but useless, since the
>>>>>> is_visible function
>>>>>> would have to search through all the attributes anyway to figure
>>>>>> out which one
>>>>>> is being checked.
>>>>>
>>>>> Yeah, using the same indexes would be somewhat pointless, althoug=
h
>>>>> not many seem to be using it anyway (only 14 files matched). Othe=
rs
>>>>> seem to be comparing the attr* instead. An alternative would be t=
o
>>>>> use negative indexes for binary attributes and positive indexes f=
or
>>>>> normal attributes.
>>>>>
>>>> ... and I probably wrote or reviewed a significant percentage of
>>>> those ;-).
>>>>
>>>> Using negative numbers for binary attributes is an interesting ide=
a.
>>>> Kind of unusual, though. Greg, any thoughts on that ?
>>>
>>> Ick, no, that's a mess, maybe we just could drop the index alltoget=
her?
>>>
>>
>> No, please don't. Having to manually compare dozens of index pointer=
s
>> would be
>> even more of a mess.
>
> So, what about keeping it the way it is in the patch, and documenting=
 it thoroughly? Otherwise, we could introduce another "is_bin_visible" =
function to do this same thing but just on binary attributes, but I'd r=
ather not add a new function pointer if possible.
>

I would prefer to keep and document it.

Guenter
