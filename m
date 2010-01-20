From: Barry Song <21cnbao@gmail.com>
Subject: Re: s3c-hsotg driver problem
Date: Wed, 20 Jan 2010 16:13:16 +0800
Message-ID: <3c17e3571001200013pfd622f6g8593b21a10649487@mail.gmail.com>
References: <4B51B36C.6040308@gmail.com> <3c17e3571001161800m14ca30cas1cca155f9880513d@mail.gmail.com>
	<4B530920.5020901@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f182.google.com ([209.85.211.182]:48835 "EHLO
	mail-yw0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751969Ab0ATINh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2010 03:13:37 -0500
Received: by ywh12 with SMTP id 12so3330854ywh.21
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jan 2010 00:13:36 -0800 (PST)
In-Reply-To: <4B530920.5020901@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maurus Cuelenaere <mcuelenaere@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>

On Sun, Jan 17, 2010 at 8:57 PM, Maurus Cuelenaere
<mcuelenaere@gmail.com> wrote:
> Op 17-01-10 03:00, Barry Song schreef:
>>
>> In fact, I once used 12Mhz =C2=A0external crystal, after setting PHY=
CLK
>> right, =C2=A0both USB 1.1 as host and 2.0 as gadget can work. The ke=
rnel
>> version I used is 2.6.28.
>>
>
> You say the kernel version you used is 2.6.28, I'm betting you weren'=
t using
> Ben Dooks' driver then and this was Samsung's tree?
Yes.
> The kernel that is currently shipped with the device I'm porting for =
(SmartQ
> 7) is using 2.6.24, which also has Samsung's patches applied (and use=
s other
> drivers than in mainline).
Yes.
>
> AFAIK there are 2 (?) 'main' trees floating around with Samsung patch=
es:
> 2.6.24 and 2.6.28, then there are 2.6.29 and 2.6.31 (and newer) trees=
 which
> contain patches from a mix of both and mainline.
>
> What I'm looking for is getting everything to work with *mainline* dr=
ivers,
> so in the end I can push the SmartQ boards to mainline.
That needs many merge.
>
> Regards,
> Maurus Cuelenaere
>
